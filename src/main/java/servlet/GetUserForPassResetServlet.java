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

@WebServlet(urlPatterns = "/getUser")
public class GetUserForPassResetServlet extends HttpServlet {

    private static final UserManager userManager = new UserManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String email = req.getParameter("email");
        StringBuilder msg = new StringBuilder();
        if (email == null || email.length() == 0) {
            msg.append("Email field is required.<br>");
        }
        if (msg.toString().equals("")) {
            try {
                User currentUser = userManager.getUserByEmail(email);
                if (currentUser != null) {
                    req.getSession().setAttribute("user", currentUser);
                    req.getRequestDispatcher("/WEB-INF/changePass.jsp").forward(req, resp);
                } else {
                    req.getSession().setAttribute("message", "Invalid email.");
                    req.getRequestDispatcher("/WEB-INF/getUser.jsp").forward(req, resp);
                }
            } catch (SQLException | ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            req.getSession().setAttribute("message", msg.toString());
            try {
                resp.sendRedirect("/forgotPass");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
