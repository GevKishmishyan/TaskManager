package servlet;

import manager.NotificationManager;
import model.Notification;
import model.User;
import model.UserStatus;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/seenNot")
public class NotificationSeenServlet extends HttpServlet {

    private static final NotificationManager notificationManager = new NotificationManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String refererStr = req.getHeader("Referer");
        String[] refSplit = refererStr.split("0/");
        String referer = "/" + refSplit[1];


        Notification not = notificationManager.getNotByID(id);
        User user = (User) req.getSession().getAttribute("user");
        try {
            notificationManager.updateNotification(false, not);
            resp.sendRedirect(referer);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
