package servlet;

import manager.TaskManager;
import manager.UserManager;
import model.Task;
import model.TaskStatus;
import model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = "/updateTask")
public class UpdateTaskServlet extends HttpServlet {

    private static final TaskManager taskManager = new TaskManager();
    private static final UserManager userManager = new UserManager();
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String assignedUserEmail = req.getParameter("assignedUser");
        TaskStatus taskStatus = TaskStatus.valueOf(req.getParameter("taskStatus"));
        String deadlineStr = req.getParameter("deadline");
        String[] splitedDeadline = deadlineStr.split("T");
        try {
            Date deadline = sdf.parse(splitedDeadline[0] + " " + splitedDeadline[1]);

            User assignedUser = userManager.getUserByEmail(assignedUserEmail);
            User manager = (User) req.getSession().getAttribute("user");
            Task task = Task.builder()
                    .name(name)
                    .description(description)
                    .assignedUser(assignedUser)
                    .taskStatus(taskStatus)
                    .deadline(deadline)
                    .author(manager)
                    .build();
            taskManager.updateTask(task, id);
            resp.sendRedirect("/getTaskForUpdate?id=" + id);
        } catch (SQLException | ParseException | IOException e) {
            e.printStackTrace();
        }

    }
}
