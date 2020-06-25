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
        StringBuilder msg = new StringBuilder();
        if (email == null || email.length() == 0) {
            msg.append("Email field is required.<br>");
        }
        if (password == null || password.length() == 0) {
            msg.append("Password field is required.<br>");
        }
        if (msg.toString().equals("")) {
            try {
                User currentUser = userManager.getUserByEmailAndPassword(email, password);
                req.getSession().setAttribute("user", currentUser);
                if (currentUser.getUserStatus() == UserStatus.MANAGER) {
                    resp.sendRedirect("/managerHome");
                } else if (currentUser.getUserStatus() == UserStatus.USER) {
                    resp.sendRedirect("/userHome");
                }

            } catch (SQLException | IOException e) {
//            req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
                e.printStackTrace();
            } catch (ModelNotFoundException e) {
                req.getSession().setAttribute("message", "Email or password is incorrect.");
                try {
                    resp.sendRedirect("/");
                } catch (IOException ex) {
//                req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
                    ex.printStackTrace();
                }
            }
        } else {
            req.getSession().setAttribute("message", msg.toString());
            try {
                resp.sendRedirect("/");
            } catch (IOException ex) {
//                req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
                ex.printStackTrace();
            }
        }


    }
}
