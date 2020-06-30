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
public class CreateTaskServlet extends HttpServlet {
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
                req.getSession().setAttribute("message", "Task successfully created.");
                resp.sendRedirect("/addNewTask");
            } catch (ParseException | IOException | SQLException | ExistingModelException e) {
                e.printStackTrace();
            }
    }
}
