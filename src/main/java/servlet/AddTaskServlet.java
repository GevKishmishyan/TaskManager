package servlet;

import exception.ExistingModelException;
import manager.NotificationManager;
import manager.TaskManager;
import manager.UserManager;
import model.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = "/addTask")
public class AddTaskServlet extends HttpServlet {
    private static final UserManager userManager = new UserManager();
    private static final TaskManager taskManager = new TaskManager();
    private static final NotificationManager notificationManager = new NotificationManager();
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String assignedUserEmail = req.getParameter("assignedUser");
        String taskStatus = req.getParameter("taskStatus");
        String deadlineStr = req.getParameter("deadline");
        StringBuilder msg = new StringBuilder();
        if (name == null || name.length() == 0) {
            msg.append("Name field is required.<br>");
        }
        if (description == null || description.length() == 0) {
            msg.append("Description field is required.<br>");
        }
        if (assignedUserEmail == null || assignedUserEmail.length() == 0) {
            msg.append("Assigned user field is required.<br>");
        }
        if (taskStatus == null || taskStatus.length() == 0) {
            msg.append("Task Status field is required.<br>");
        }
        if (deadlineStr == null || deadlineStr.length() == 0) {
            msg.append("Deadline field is required.<br>");
        }
        if (msg.toString().equals("")) {
            String[] splitedDeadline = deadlineStr.split("T");
            Date deadline = null;
            try {
                deadline = sdf.parse(splitedDeadline[0] + " " + splitedDeadline[1]);
                User assignedUser = userManager.getUserByEmail(assignedUserEmail);
                User manager = (User) req.getSession().getAttribute("user");

                Task task = Task.builder()
                        .name(name)
                        .description(description)
                        .assignedUser(assignedUser)
                        .taskStatus(TaskStatus.valueOf(taskStatus))
                        .deadline(deadline)
                        .author(manager)
                        .build();
                taskManager.addTask(task);
                Notification notification = Notification.builder()
                        .notType(NotType.NEW_TASK)
                        .task(task)
                        .author(manager)
                        .isShown(true)
                        .build();
                notificationManager.addNotification(notification);
                req.getSession().setAttribute("taskCreateMsg", "Task successfully created.");
                resp.sendRedirect("/managerHome");
            } catch (ParseException | IOException | SQLException | ExistingModelException e) {
//            req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
                e.printStackTrace();
            }
        } else {
            req.getSession().setAttribute("taskCreateMsg", msg.toString());
            try {
                resp.sendRedirect("/managerHome");
            } catch (IOException ex) {
//                req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
                ex.printStackTrace();
            }
        }
    }
}
