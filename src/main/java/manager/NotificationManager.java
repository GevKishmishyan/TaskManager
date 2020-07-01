package manager;

import db.DBConnectionProvider;
import exception.ExistingModelException;
import model.NotType;
import model.Notification;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotificationManager {

    private Connection connection;

    private static final TaskManager taskManager = new TaskManager();
    private static final UserManager userManager = new UserManager();

    public NotificationManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }

    private Notification getNotificationFromResultSet(ResultSet resultSet) throws SQLException {
        return Notification.builder()
                .id(resultSet.getInt("id"))
                .notType(NotType.valueOf(resultSet.getString("not_type")))
                .task(taskManager.getTaskByID(resultSet.getInt("task_id")))
                .author(userManager.getUserById(resultSet.getInt("author_id")))
                .isShown(resultSet.getBoolean("is_shown"))
                .build();
    }

    public void addNotification(Notification not) throws SQLException, ExistingModelException {
        String query = "INSERT INTO notifications (not_type, task_id, author_id, is_shown) VALUES (?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, not.getNotType().name());
        ps.setInt(2, (int) not.getTask().getId());
        ps.setInt(3, (int) not.getAuthor().getId());
        ps.setBoolean(4, not.isShown());
        ps.executeUpdate();

        ResultSet resultSet = ps.getGeneratedKeys();

        while (resultSet.next()) {
            int id = resultSet.getInt(1);
            not.setId(id);
        }
    }

    public List<Notification> getAllNotShowedNotsByTaskId(int taskId) throws SQLException {
        String query = "SELECT * FROM notifications WHERE task_id = '" + taskId + "' AND is_shown = 1 ORDER BY created_date DESC";
        List<Notification> allNotifications = new ArrayList<Notification>();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            allNotifications.add(getNotificationFromResultSet(resultSet));
        }
        return allNotifications;
    }

    public List<Notification> getAllShowedNots() throws SQLException {
        String query = "SELECT * FROM notifications WHERE is_shown = 1";
        List<Notification> allNotifications = new ArrayList<Notification>();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            allNotifications.add(getNotificationFromResultSet(resultSet));
        }
        return allNotifications;
    }
    public List<Notification> getAllShowedNotsByType(NotType notType) throws SQLException {
        String query = "SELECT * FROM notifications WHERE is_shown = 1 AND not_type = '" + notType + "'";
        List<Notification> allNotifications = new ArrayList<Notification>();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            allNotifications.add(getNotificationFromResultSet(resultSet));
        }
        return allNotifications;
    }

    public Notification getNotByID(int id) {
        String sql = "SELECT * FROM notifications WHERE id = '" + id + "'";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                return getNotificationFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateNotification(boolean isShown, Notification notification) throws SQLException {
        String query = "UPDATE notifications SET is_shown = ? WHERE id = ?";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setBoolean(1, isShown);
        ps.setInt(2, notification.getId());
        ps.executeUpdate();
    }

    public void deleteNotsByTaskId(int taskId) {
        String sql = "DELETE FROM notifications WHERE task_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, taskId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
