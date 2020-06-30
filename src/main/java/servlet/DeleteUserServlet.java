package servlet;

import manager.CommentManager;
import manager.NotificationManager;
import manager.TaskManager;
import manager.UserManager;
import model.Comment;
import model.Task;
import model.User;

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

@WebServlet(urlPatterns = "/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    private static final UserManager userManager = new UserManager();
    private static final TaskManager taskManager = new TaskManager();
    private static final CommentManager commentManager = new CommentManager();
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
        User user = userManager.getUserById(id);

        List<Task> tasksByUser = null;
        try {
            tasksByUser = taskManager.getAllTasksByUser(user);
            for (Task task : tasksByUser) {
                List<Comment> activeCommentsByTaskId = commentManager.getActiveCommentsByTaskId((int) task.getId());
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
                notificationManager.deleteNotsByTaskId((int) task.getId());
                taskManager.deleteTaskByID((int) task.getId());
            }

            userManager.deleteUserByID(id);
            resp.sendRedirect("/managerGetUsersList");
        } catch (SQLException | IOException | ParseException e) {
//            req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
            e.printStackTrace();
        }

    }
}
