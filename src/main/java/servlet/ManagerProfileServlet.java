package servlet;

import manager.NotificationManager;
import manager.TaskManager;
import manager.UserManager;
import model.Notification;
import model.Task;
import model.User;
import model.UserStatus;

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

@WebServlet(urlPatterns = "/managerProfile")
public class ManagerProfileServlet extends HttpServlet {

    private static final UserManager userManager = new UserManager();
    private static final TaskManager taskManager = new TaskManager();
    private static final NotificationManager notificationManager = new NotificationManager();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<User> allUsers = userManager.getAllUsers();
            List<Task> allTasks = taskManager.getAllTasks();
            List<User> allUsersByStatus = userManager.getAllUsersByStatus(UserStatus.USER);
            User user = (User) req.getSession().getAttribute("user");
            if (user.getUserStatus() != UserStatus.MANAGER) {
                req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
            }

            List<Notification> allNotsByUser = new ArrayList<>();
            for (Task task : allTasks) {
                List<Notification> notShowedNotsByTaskId = notificationManager.getAllNotShowedNotsByTaskId((int) task.getId());
                if (notShowedNotsByTaskId != null) {
                    allNotsByUser.addAll(notShowedNotsByTaskId);
                }
            }
            req.setAttribute("users", allUsers);
            req.setAttribute("tasks", allTasks);
            req.setAttribute("usersByStatus", allUsersByStatus);
            req.setAttribute("allNots", allNotsByUser);
            req.getRequestDispatcher("/WEB-INF/managerProfile.jsp").forward(req, resp);
        } catch (SQLException | ParseException | ServletException | IOException e) {
//            req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
            e.printStackTrace();
        }
    }
}
