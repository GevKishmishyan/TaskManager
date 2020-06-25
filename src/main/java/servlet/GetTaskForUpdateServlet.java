package servlet;

import manager.TaskManager;
import manager.UserManager;
import model.Task;
import model.User;
import model.UserStatus;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/getTaskForUpdate")
public class GetTaskForUpdateServlet extends HttpServlet {

    private static final TaskManager taskManager = new TaskManager();
    private static final UserManager userManager = new UserManager();

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
        Task task = taskManager.getTaskByID(id);
        List<User> allUsers = null;
        try {
            allUsers = userManager.getAllUsers();
            List<User> allUsersByStatus = userManager.getAllUsersByStatus(UserStatus.USER);
            req.setAttribute("users", allUsers);
            req.setAttribute("task", task);
            req.setAttribute("usersByStatus", allUsersByStatus);
            req.getRequestDispatcher("/WEB-INF/updateTask.jsp").forward(req, resp);
        } catch (SQLException | ServletException | IOException e) {
//            req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
            e.printStackTrace();
        }
    }

}
