package servlet;

import manager.UserManager;
import model.Gender;
import model.User;
import model.UserStatus;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/updateProfile")
public class UpdateProfileServlet extends HttpServlet {


    private static final UserManager userManager = new UserManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

        User user = (User) req.getSession().getAttribute("user");
        int id = (int) user.getId();
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        int age = Integer.parseInt(req.getParameter("age"));

        try {
            userManager.updateUser(name, surname, email, age, id);
            req.getSession().removeAttribute("user");
            User userById = userManager.getUserById(id);
            req.getSession().setAttribute("user", userById);
            resp.sendRedirect("/managerProfile");
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

}
