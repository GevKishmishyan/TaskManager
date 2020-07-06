package servlet;

import exception.ExistingModelException;
import manager.CommentManager;
import manager.NotificationManager;
import manager.TaskManager;
import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/addComment")
public class AddCommentServlet extends HttpServlet {

    //task manager
    private static final TaskManager taskManager = new TaskManager();
    private static final CommentManager commentManager = new CommentManager();
    private static final NotificationManager notificationManager = new NotificationManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        int taskID = Integer.parseInt(req.getParameter("hiddenId"));
        String commentStr = req.getParameter("comment");

        User user = (User) req.getSession().getAttribute("user");
        Task task = taskManager.getTaskByID(taskID);
        try {
            Comment comment = Comment.builder()
                    .text(commentStr)
                    .author(user)
                    .task(task)
                    .build();
            commentManager.comment(comment);
            Notification notification = Notification.builder()
                    .notType(NotType.COMMENT)
                    .task(task)
                    .author(user)
                    .isShown(true)
                    .build();
            notificationManager.addNotification(notification);
            resp.sendRedirect("/getTaskById?id=" + taskID);
        } catch (SQLException | ExistingModelException | IOException e) {
            e.printStackTrace();
        }
    }
}
