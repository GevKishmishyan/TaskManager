package servlet;

import manager.CommentManager;
import manager.TaskManager;
import model.Comment;
import model.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

@WebServlet(urlPatterns = "/getTaskById")
public class GetTaskByIdServlet extends HttpServlet {

    private static final TaskManager taskManager = new TaskManager();
    private static final CommentManager commentManager = new CommentManager();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Task taskByID = taskManager.getTaskByID(id);
        req.setAttribute("taskById", taskByID);
        List<Comment> commentsByTaskId = null;
        try {
            commentsByTaskId = commentManager.getActiveCommentsByTaskId(id);
            req.setAttribute("taskComment", commentsByTaskId);
            req.getRequestDispatcher("/WEB-INF/task.jsp").forward(req, resp);
        } catch (SQLException | ParseException | ServletException | IOException e) {
//            req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
            e.printStackTrace();
        }
    }
}
