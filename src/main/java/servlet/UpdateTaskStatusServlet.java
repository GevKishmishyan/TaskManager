package servlet;

import manager.TaskManager;
import model.Task;
import model.TaskStatus;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/updateTaskStatus")
public class UpdateTaskStatusServlet extends HttpServlet {

    private static final TaskManager taskManager = new TaskManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

        TaskStatus taskStatus = TaskStatus.valueOf(req.getParameter("taskStatus"));
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            req.removeAttribute("taskById");
            Task taskByID = taskManager.getTaskByID(id);
            taskManager.updateTaskStatus(taskStatus, id);
            req.setAttribute("taskById", taskByID);
            resp.sendRedirect("/getTaskById?id=" + id);
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

}
