package manager;

import db.DBConnectionProvider;
import model.Comment;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class CommentManager {

    private Connection connection;

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static final UserManager userManager = new UserManager();
    private static final TaskManager taskManager = new TaskManager();

    public CommentManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }

    private Comment getCommentFromResultSet(ResultSet resultSet) throws SQLException, ParseException {
        return Comment.builder()
                .id(resultSet.getInt("id"))
                .text(resultSet.getString("text"))
                .createdDate(sdf.parse(resultSet.getString("created_date")))
                .author(userManager.getUserById(resultSet.getInt("comment_author_id")))
                .task(taskManager.getTaskByID(resultSet.getInt("task_id")))
                .isActive(resultSet.getBoolean("is_active"))
                .parrentCommentId(resultSet.getInt("parrent_comment_id"))
                .build();
    }

    public Comment getCommentById(int id) {
        String sql = "SELECT * FROM comments WHERE id = '" + id + "'";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                return getCommentFromResultSet(resultSet);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void comment(Comment comment) throws SQLException {
        String query = "INSERT INTO comments (`text`, comment_author_id, task_id, is_active) VALUES (?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, comment.getText());
        ps.setInt(2, (int) comment.getAuthor().getId());
        ps.setInt(3, (int) comment.getTask().getId());
        ps.setInt(4, 1);
        ps.executeUpdate();

        ResultSet resultSet = ps.getGeneratedKeys();

        while (resultSet.next()) {
            int id = resultSet.getInt(1);
            comment.setId(id);
        }
    }

    public void reply(Comment comment) throws SQLException {
        String query = "INSERT INTO comments (`text`, comment_author_id, task_id, is_active, parrent_comment_id) VALUES (?,?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, comment.getText());
        ps.setInt(2, (int) comment.getAuthor().getId());
        ps.setInt(3, (int) comment.getTask().getId());
        ps.setInt(4, 1);
        ps.setInt(5, comment.getParrentCommentId());
        ps.executeUpdate();

        ResultSet resultSet = ps.getGeneratedKeys();

        while (resultSet.next()) {
            int id = resultSet.getInt(1);
            comment.setId(id);
        }
    }

    public List<Comment> getActiveCommentsByTaskId(int id) throws SQLException, ParseException {
        String query = "SELECT * FROM comments WHERE task_id = '" + id + "' AND is_active = 1 AND parrent_comment_id IS NULL";
        List<Comment> commentsByTaskId = new ArrayList<Comment>();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            commentsByTaskId.add(getCommentFromResultSet(resultSet));
        }
        return commentsByTaskId;
    }

    public List<Comment> getActiveReplyesByCommentId(int id) throws SQLException, ParseException {
        String query = "SELECT * FROM comments WHERE parrent_comment_id = '" + id + "' AND is_active = 1";
        List<Comment> replyesByCommentId = new ArrayList<Comment>();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            replyesByCommentId.add(getCommentFromResultSet(resultSet));
        }
        return replyesByCommentId;
    }

    public void deleteCommentByTaskId(int taskId) {
        String sql = "DELETE FROM comments WHERE task_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, taskId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCommentById(int id) {
        String sql = "DELETE FROM comments WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
