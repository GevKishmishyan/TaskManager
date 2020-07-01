package servlet;

import manager.NotificationManager;
import manager.TaskManager;
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

@WebServlet(urlPatterns = "/search")
public class SearchServletServlet extends HttpServlet {

    private static final TaskManager taskManager = new TaskManager();
    private static final NotificationManager notificationManager = new NotificationManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String search = req.getParameter("search");
        User user = (User) req.getSession().getAttribute("user");
        long id = user.getId();
        try {
            List<Task> allTasks = taskManager.getAllTasks();
            List<Task> allTasksByUser = taskManager.getAllTasksByUser(user);
            List<Task> tasksIfContains;
            if (user.getUserStatus() == UserStatus.MANAGER) {
                tasksIfContains = taskManager.getTasksIfContains(search);
                req.setAttribute("searchedList", tasksIfContains);
            } else {
                tasksIfContains = taskManager.getTasksByUserIfContains(search, id);
                req.setAttribute("searchedList", tasksIfContains);
            }

            List<Notification> allNotsByUser = new ArrayList<>();
            if (user.getUserStatus() == UserStatus.MANAGER) {
                for (Task task : allTasks) {
                    List<Notification> notShowedNotsByTaskId = notificationManager.getAllNotShowedNotsByTaskId((int) task.getId());
                    if (notShowedNotsByTaskId != null) {
                        allNotsByUser.addAll(notShowedNotsByTaskId);
                    }
                }
            } else {
                for (Task task : allTasksByUser) {
                    List<Notification> notShowedNotsByTaskId = notificationManager.getAllNotShowedNotsByTaskId((int) task.getId());
                    if (notShowedNotsByTaskId != null) {
                        allNotsByUser.addAll(notShowedNotsByTaskId);
                    }
                }
            }
            req.setAttribute("allNots", allNotsByUser);
            req.setAttribute("searchedWord", search);
            if (tasksIfContains != null) {
                req.getRequestDispatcher("/WEB-INF/search.jsp").forward(req, resp);
            } else {
                String refererStr = req.getHeader("Referer");
                String[] refSplit = refererStr.split("0/");
                String referer = "/" + refSplit[1];
                resp.sendRedirect(referer);
            }
        } catch (SQLException | ParseException | ServletException | IOException e) {
            e.printStackTrace();
        }

    }

}
