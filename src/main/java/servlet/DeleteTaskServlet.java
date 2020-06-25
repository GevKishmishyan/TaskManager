package servlet;

import manager.CommentManager;
import manager.NotificationManager;
import manager.TaskManager;
import model.Comment;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/deleteTask")
public class DeleteTaskServlet extends HttpServlet {

    private static final CommentManager commentManager = new CommentManager();
    private static final TaskManager taskManager = new TaskManager();
    private static final NotificationManager notificationManager = new NotificationManager();

    private static Map<String, String> getQueryMap(String query) {
        String[] params = query.split("&");
        Map<String, String> map = new HashMap<String, String>();
        for (String param : params) {
            String[] p = param.split("=");
            String name = p[0];
            if (p.length > 1) {
                String value = p[1];
                map.put(name, value);
            }
        }
        return map;
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        String queryString = req.getQueryString();
        Map<String, String> map = getQueryMap(queryString);
        String idStr = map.get("id");
        int id = Integer.parseInt(idStr);
        try {
            List<Comment> activeCommentsByTaskId = commentManager.getActiveCommentsByTaskId(id);
            if (activeCommentsByTaskId != null){
                for (Comment comment : activeCommentsByTaskId) {
                    List<Comment> activeReplyesByCommentId = commentManager.getActiveReplyesByCommentId(comment.getId());
                    if (activeReplyesByCommentId != null){
                        for (Comment perReply : activeReplyesByCommentId) {
                            commentManager.deleteCommentById(perReply.getId());
                        }
                    }
                    commentManager.deleteCommentById(comment.getId());
                }
            }
        notificationManager.deleteNotsByTaskId(id);
        taskManager.deleteTaskByID(id);
            resp.sendRedirect("/managerHome");
        } catch (IOException | ParseException | SQLException e) {
//            req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
            e.printStackTrace();
        }
    }
}
