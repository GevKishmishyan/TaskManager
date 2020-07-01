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

@WebServlet(urlPatterns = "/updateUser")
public class UpdateUserServlet extends HttpServlet {

    private static final UserManager userManager = new UserManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Gender gender = Gender.valueOf(req.getParameter("gender"));
        int age = Integer.parseInt(req.getParameter("age"));
        UserStatus userStatus = UserStatus.valueOf(req.getParameter("userStatus"));
        try {
            User user = User.builder()
                    .name(name)
                    .surname(surname)
                    .email(email)
                    .password(password)
                    .gender(gender)
                    .age(age)
                    .userStatus(userStatus)
                    .build();
            userManager.managerUpdateUser(user, id);
            resp.sendRedirect("/getUserForUpdate?id=" + id);
        } catch (IOException | SQLException e) {
            e.printStackTrace();
        }
    }
}
