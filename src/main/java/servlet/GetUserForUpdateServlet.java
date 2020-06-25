package servlet;

import manager.UserManager;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/getUserForUpdate")
public class GetUserForUpdateServlet extends HttpServlet {

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
        User user = userManager.getUserById(id);
        req.setAttribute("user", user);
        try {
            req.getRequestDispatcher("/WEB-INF/updateUser.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
//            req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
            e.printStackTrace();
        }
    }
}
