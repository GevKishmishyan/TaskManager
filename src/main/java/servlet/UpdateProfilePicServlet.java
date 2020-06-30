package servlet;

import manager.UserManager;
import model.User;

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

@WebServlet(urlPatterns = "/updateProfilePic")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class UpdateProfilePicServlet extends HttpServlet {

    private static final UserManager userManager = new UserManager();
    private static final String UPLOAD_DIR = "E:\\Projects\\TaskManager\\uploads\\profilePics";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

        User user = (User) req.getSession().getAttribute("user");

        try {
            for (Part part : req.getParts()) {
                if (getFileName(part) != null) {
                    String fileName = System.currentTimeMillis() + getFileName(part);
                    String fullFileName = UPLOAD_DIR + File.separator + fileName;
                    part.write(fullFileName);
                    user.setProfPicUrl(fileName);
                }
            }
            userManager.updateUserProficePic(user.getProfPicUrl(), (int) user.getId());
            req.getSession().removeAttribute("user");
            User userById = userManager.getUserById((int) user.getId());
            req.getSession().setAttribute("user", userById);
            resp.sendRedirect("/userProfile");
        } catch (SQLException | ServletException | IOException e) {
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
