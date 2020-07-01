package servlet;

import exception.ExistingModelException;
import manager.UserManager;
import model.Gender;
import model.User;
import model.UserStatus;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/register")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class UserRegisterServlet extends HttpServlet {

    private static final UserManager userManager = new UserManager();
    private static final String UPLOAD_DIR = "E:\\Projects\\TaskManager\\uploads\\profilePics";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String age = req.getParameter("age");
        String userStatus = req.getParameter("userStatus");
        try {
            User user = User.builder()
                    .name(name)
                    .surname(surname)
                    .email(email)
                    .password(password)
                    .gender(Gender.valueOf(gender))
                    .age(Integer.parseInt(age))
                    .userStatus(UserStatus.valueOf(userStatus))
                    .build();
            for (Part part : req.getParts()) {
                if (getFileName(part) != null) {
                    String fileName = System.currentTimeMillis() + getFileName(part);
                    String fullFileName = UPLOAD_DIR + File.separator + fileName;
                    part.write(fullFileName);
                    user.setProfPicUrl(fileName);
                }
            }
            userManager.register(user);
            req.getSession().setAttribute("message", "User successfully registered.");
            if (req.getSession().getAttribute("user") == null) {
                resp.sendRedirect("/");
            } else {
                resp.sendRedirect("/addNewUser");
            }
        } catch (SQLException | ExistingModelException | IOException | ServletException e) {
            e.printStackTrace();
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename"))
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
        }
        return null;
    }
}
