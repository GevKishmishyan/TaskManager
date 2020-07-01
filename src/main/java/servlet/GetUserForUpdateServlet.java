package servlet;

import manager.NotificationManager;
import manager.TaskManager;
import manager.UserManager;
import model.Notification;
import model.Task;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/getUserForUpdate")
public class GetUserForUpdateServlet extends HttpServlet {

    private static final UserManager userManager = new UserManager();
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
            User user = userManager.getUserById(id);

            req.setAttribute("user", user);
            List<Task> allTasks = taskManager.getAllTasks();
            List<Notification> allNotsByUser = new ArrayList<>();
            for (Task task : allTasks) {
                List<Notification> notShowedNotsByTaskId = notificationManager.getAllNotShowedNotsByTaskId((int) task.getId());
                if (notShowedNotsByTaskId != null) {
                    allNotsByUser.addAll(notShowedNotsByTaskId);
                }
            }
            req.setAttribute("allNots", allNotsByUser);
            req.getRequestDispatcher("/WEB-INF/updateUser.jsp").forward(req, resp);
        } catch (ServletException | IOException | SQLException | ParseException e) {
            e.printStackTrace();
        }
    }
}
