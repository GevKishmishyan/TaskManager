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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/deleteComment")
public class DeleteCommentServlet extends HttpServlet {

    private static final CommentManager commentManager = new CommentManager();
    private static final TaskManager taskManager = new TaskManager();

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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String queryString = req.getQueryString();
        Map<String, String> map = getQueryMap(queryString);
        String idStr = map.get("id");
        int id = Integer.parseInt(idStr);
        Comment commentById = commentManager.getCommentById(id);
        Task taskByID = taskManager.getTaskByID((int) commentById.getTask().getId());
        if (commentById.getParrentCommentId() == 0){
            try {
                List<Comment> activeReplyesByCommentId = commentManager.getActiveReplyesByCommentId(commentById.getId());
                if (activeReplyesByCommentId != null){
                    for (Comment comment : activeReplyesByCommentId) {
                        commentManager.deleteCommentById(comment.getId());
                    }
                }
            } catch (SQLException | ParseException e) {
                e.printStackTrace();
            }
        }
        commentManager.deleteCommentById(id);
        resp.sendRedirect("/getTaskById?id=" + taskByID.getId());

    }
}
