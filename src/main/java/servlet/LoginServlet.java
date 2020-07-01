package servlet;

import exception.ModelNotFoundException;
import manager.UserManager;
import model.User;
import model.UserStatus;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    private static final UserManager userManager = new UserManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            User currentUser = userManager.getUserByEmailAndPassword(email, password);
            req.getSession().setAttribute("user", currentUser);
            if (currentUser.getUserStatus() == UserStatus.MANAGER) {
                resp.sendRedirect("/managerHome");
            } else if (currentUser.getUserStatus() == UserStatus.USER) {
                resp.sendRedirect("/userHome");
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        } catch (ModelNotFoundException e) {
            try {
                resp.sendRedirect("/");
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
}
