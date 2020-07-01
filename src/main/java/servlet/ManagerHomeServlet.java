package servlet;

import manager.CommentManager;
import manager.NotificationManager;
import manager.TaskManager;
import manager.UserManager;
import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/managerHome")
public class ManagerHomeServlet extends HttpServlet {

    private static final UserManager userManager = new UserManager();
    private static final TaskManager taskManager = new TaskManager();
    private static final CommentManager commentManager = new CommentManager();
    private static final NotificationManager notificationManager = new NotificationManager();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<User> allUsers = userManager.getAllUsers();
            List<Task> allTasks = taskManager.getAllTasks();
            List<User> allUsersByStatus = userManager.getAllUsersByStatus(UserStatus.USER);
            List<Task> allTasksByFinishedStatus = taskManager.getAllTasksByStatus(TaskStatus.FINISHED);
            List<Task> allTasksByToDoStatus = taskManager.getAllTasksByStatus(TaskStatus.TODO);
            List<Task> allTasksByInProgressStatus = taskManager.getAllTasksByStatus(TaskStatus.IN_PROGRESS);
            List<Comment> activeComments = commentManager.getActiveComments();
            List<Notification> allShowedNots = notificationManager.getAllShowedNots();
            List<Notification> newTaskNots = notificationManager.getAllShowedNotsByType(NotType.NEW_TASK);
            List<Notification> replyNots = notificationManager.getAllShowedNotsByType(NotType.REPLY);
            List<Notification> commentNots = notificationManager.getAllShowedNotsByType(NotType.COMMENT);
            User user = (User) req.getSession().getAttribute("user");

            List<Notification> allNotsByUser = new ArrayList<>();
            for (Task task : allTasks) {
                List<Notification> notShowedNotsByTaskId = notificationManager.getAllNotShowedNotsByTaskId((int) task.getId());
                if (notShowedNotsByTaskId != null) {
                    allNotsByUser.addAll(notShowedNotsByTaskId);
                }
            }

            req.setAttribute("finishedTasks", allTasksByFinishedStatus);
            req.setAttribute("toDoTasks", allTasksByToDoStatus);
            req.setAttribute("inProgressTasks", allTasksByInProgressStatus);
            req.setAttribute("activeComments", activeComments);
            req.setAttribute("allShowedNots", allShowedNots);
            req.setAttribute("newTaskNots", newTaskNots);
            req.setAttribute("replyNots", replyNots);
            req.setAttribute("commentNots", commentNots);
            req.setAttribute("users", allUsers);
            req.setAttribute("tasks", allTasks);
            req.setAttribute("usersByStatus", allUsersByStatus);
            req.setAttribute("allNots", allNotsByUser);
            req.getRequestDispatcher("/WEB-INF/manager.jsp").forward(req, resp);
        } catch (SQLException | ParseException | ServletException | IOException  e) {
            e.printStackTrace();
        }
    }
}
