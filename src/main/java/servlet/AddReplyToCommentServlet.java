package servlet;

import exception.ExistingModelException;
import manager.CommentManager;
import manager.NotificationManager;
import model.Comment;
import model.NotType;
import model.Notification;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/replyComment")
public class AddReplyToCommentServlet extends HttpServlet {

    private static final CommentManager commentManager = new CommentManager();
    private static final NotificationManager notificationManager = new NotificationManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int commentId = Integer.parseInt(req.getParameter("hiddenCommentId"));
        String replyStr = req.getParameter("reply");

        User user = (User) req.getSession().getAttribute("user");
        Comment replyedComment = commentManager.getCommentById(commentId);

        try {
            Comment comment = Comment.builder()
                    .text(replyStr)
                    .author(user)
                    .task(replyedComment.getTask())
                    .parrentCommentId(replyedComment.getId())
                    .build();
            commentManager.reply(comment);
            Notification notification = Notification.builder()
                    .notType(NotType.REPLY)
                    .task(replyedComment.getTask())
                    .author(user)
                    .isShown(true)
                    .build();
            notificationManager.addNotification(notification);
            resp.sendRedirect("/getTaskById?id=" + replyedComment.getTask().getId());
        } catch (SQLException | ExistingModelException e) {
            e.printStackTrace();
        }
    }
}
