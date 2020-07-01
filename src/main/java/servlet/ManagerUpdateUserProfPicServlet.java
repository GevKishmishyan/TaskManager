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

@WebServlet(urlPatterns = "/managerUpdateUserProfPic")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class ManagerUpdateUserProfPicServlet extends HttpServlet {

    private static final UserManager userManager = new UserManager();
    private static final String UPLOAD_DIR = "E:\\Projects\\TaskManager\\uploads\\profilePics";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

        User user = (User) req.getSession().getAttribute("user");
        int id = Integer.parseInt(req.getParameter("id"));
        User byId = userManager.getUserById(id);
        try {
            for (Part part : req.getParts()) {
                if (getFileName(part) != null) {
                    String fileName = System.currentTimeMillis() + getFileName(part);
                    String fullFileName = UPLOAD_DIR + File.separator + fileName;
                    part.write(fullFileName);
                    byId.setProfPicUrl(fileName);
                }
            }
            req.removeAttribute("user");
            userManager.updateUserProficePic(byId.getProfPicUrl(), (int) byId.getId());
            req.setAttribute("user", byId);
            resp.sendRedirect("/getUserForUpdate?id=" + id);
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
