package servlet;

import manager.UserManager;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/changePass")
public class ChangePassServlet extends HttpServlet {

    private static final UserManager userManager = new UserManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        User user = (User) req.getSession().getAttribute("user");
        String password = req.getParameter("password");
        StringBuilder msg = new StringBuilder();
        if (password == null || password.length() == 0) {
            msg.append("Password field is required.<br>");
        }
        if(msg.toString().equals("")) {
            try {
                userManager.changeUserPassword(user, password);
                req.getSession().setAttribute("message", "Password was successfully changed.");
                resp.sendRedirect("/");
            } catch (SQLException | IOException e) {
//            req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
                e.printStackTrace();
            }
        } else {
            req.getSession().setAttribute("message", msg.toString());
            try {
                req.getRequestDispatcher("/WEB-INF/changePass.jsp").forward(req, resp);
            } catch (IOException | ServletException ex) {
//                req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
                ex.printStackTrace();
            }
        }

    }
}
