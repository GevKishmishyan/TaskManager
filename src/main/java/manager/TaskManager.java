package manager;

import db.DBConnectionProvider;
import exception.ExistingModelException;
import model.Task;
import model.TaskStatus;
import model.User;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class TaskManager {

    private Connection connection;

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static final UserManager userManager = new UserManager();

    public TaskManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }

    public void addTask(Task task) throws SQLException, ParseException, ExistingModelException {
        if (getTaskByName(task.getName()) != null) {
            throw new ExistingModelException(String.format("Task with \"%s\" name is already exist.", task.getName()));
        }
        String query = "INSERT INTO tasks (`name`, description, assigned_user_id, task_status, deadline, manager_id) VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, task.getName());
        ps.setString(2, task.getDescription());
        ps.setInt(3, (int) task.getAssignedUser().getId());
        ps.setString(4, task.getTaskStatus().name());
        if (task.getDeadline() != null) {
            ps.setString(5, sdf.format(task.getDeadline()));
        } else {
            ps.setDate(5, null);
        }
        ps.setInt(6, (int) task.getAuthor().getId());
        ps.executeUpdate();

        ResultSet resultSet = ps.getGeneratedKeys();

        while (resultSet.next()) {
            int id = resultSet.getInt(1);
            task.setId(id);
        }
    }

    public void updateTask(Task task, int id) throws SQLException {
        String query = "UPDATE tasks SET `name` = ?, description = ?, assigned_user_id = ?, task_status = ?, deadline = ?, manager_id = ? WHERE id = ?";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, task.getName());
        ps.setString(2, task.getDescription());
        ps.setInt(3, (int) task.getAssignedUser().getId());
        ps.setString(4, task.getTaskStatus().name());
        if (task.getDeadline() != null) {
            ps.setString(5, sdf.format(task.getDeadline()));
        } else {
            ps.setDate(5, null);
        }
        ps.setInt(6, (int) task.getAuthor().getId());
        ps.setInt(7, id);
        ps.executeUpdate();
        task.setId(id);
    }

    public void updateTaskStatus(TaskStatus taskStatus, int id) throws SQLException {
        String query = "UPDATE tasks SET task_status = ? WHERE id = ?";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, taskStatus.name());
        ps.setInt(2, id);
        ps.executeUpdate();
    }

    public void deleteTaskByID(int id) {
        String sql = "DELETE FROM tasks WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteTaskByAssignedUser(int assignedUserId) {
        String sql = "DELETE FROM tasks WHERE assigned_user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, assignedUserId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Task getTaskByID(int id) {
        String sql = "SELECT * FROM tasks WHERE id = " + id;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                return getTaskFromResultSet(resultSet);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Task getTaskByName(String taskName) throws SQLException, ParseException {
        String query = "SELECT * FROM tasks WHERE `name` = ?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, taskName);
        ResultSet resultSet = ps.executeQuery();

        if (resultSet.next()) {
            return getTaskFromResultSet(resultSet);
        }
        return null;
    }

    private Task getTaskFromResultSet(ResultSet resultSet) throws SQLException, ParseException {
        return Task.builder()
                .id(resultSet.getInt("id"))
                .name(resultSet.getString("name"))
                .description(resultSet.getString("description"))
                .assignedUser(userManager.getUserById(resultSet.getInt("assigned_user_id")))
                .taskStatus(TaskStatus.valueOf(resultSet.getString("task_status")))
                .createdDate(sdf.parse(resultSet.getString("created_date")))
                .deadline(sdf.parse(resultSet.getString("deadline")))
                .author(userManager.getUserById(resultSet.getInt("manager_id")))
                .build();
    }

    public List<Task> getAllTasks() throws SQLException, ParseException {
        String query = "SELECT * FROM tasks";
        List<Task> allTasks = new ArrayList<Task>();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            allTasks.add(getTaskFromResultSet(resultSet));
        }
        return allTasks;
    }

    public List<Task> getAllTasksByUser(User user) throws SQLException, ParseException {
        String query = "SELECT * FROM tasks WHERE assigned_user_id = '" + user.getId() + "'";
        List<Task> allTasks = new ArrayList<>();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            allTasks.add(getTaskFromResultSet(resultSet));
        }
        return allTasks;
    }

    public List<Task> getTasksIfContains(String search) throws SQLException, ParseException {
        String query = "SELECT * FROM tasks WHERE `name` LIKE ?";
        List<Task> allTasks = new ArrayList<>();
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, "%" + search + "%");
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()) {
            allTasks.add(getTaskFromResultSet(resultSet));
        }

        if (allTasks.size() > 0) {
            return allTasks;
        }
        return null;
    }

    public List<Task> getTasksByUserIfContains(String search, long id) throws SQLException, ParseException {
        String query = "SELECT * FROM tasks WHERE `name` LIKE ? AND assigned_user_id = ?";
        List<Task> allTasks = new ArrayList<>();
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, "%" + search + "%");
        ps.setInt(2, (int) id);
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()) {
            allTasks.add(getTaskFromResultSet(resultSet));
        }

        if (allTasks.size() > 0) {
            return allTasks;
        }
        return null;
    }

}
