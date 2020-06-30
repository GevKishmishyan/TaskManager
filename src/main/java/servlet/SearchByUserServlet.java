package servlet;

import manager.TaskManager;
import model.Task;
import model.User;
import model.UserStatus;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

@WebServlet(urlPatterns = "/search")
public class SearchByUserServlet extends HttpServlet {


    private static final TaskManager taskManager = new TaskManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String search = req.getParameter("search");
        User user = (User) req.getSession().getAttribute("user");
        long id = user.getId();
        try {
            if (user.getUserStatus() == UserStatus.MANAGER) {
                List<Task> tasksIfContains = taskManager.getTasksIfContains(search);
                req.setAttribute("searchedList", tasksIfContains);
            } else {
                List<Task> tasksIfContains = taskManager.getTasksByUserIfContains(search, id);
                req.setAttribute("searchedList", tasksIfContains);
            }
            req.setAttribute("searchedWord", search);
            req.getRequestDispatcher("/WEB-INF/search.jsp").forward(req, resp);

        } catch (SQLException | ParseException | ServletException | IOException e) {
//            req.getRequestDispatcher("/WEB-INF/errorHandler.jsp");
            e.printStackTrace();
        }

    }

}
