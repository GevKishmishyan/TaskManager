package manager;

import db.DBConnectionProvider;
import exception.ExistingModelException;
import exception.ModelNotFoundException;
import model.Gender;
import model.User;
import model.UserStatus;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserManager {

    private Connection connection;

    public UserManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }

    private User getUserFromResultSet(ResultSet resultSet) throws SQLException {
        return User.builder()
                .id(resultSet.getInt("id"))
                .name(resultSet.getString("name"))
                .surname(resultSet.getString("surname"))
                .email(resultSet.getString("email"))
                .password(resultSet.getString("password"))
                .gender(Gender.valueOf(resultSet.getString("gender")))
                .age(resultSet.getInt("age"))
                .userStatus(UserStatus.valueOf(resultSet.getString("user_status")))
                .profPicUrl(resultSet.getString("prof_pic_url"))
                .build();
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM users WHERE id = '" + id + "'";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                return getUserFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void deleteUserByID(int id) {
        String sql = "DELETE FROM users WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void register(User user) throws SQLException, ExistingModelException {
        if (getUserByEmail(user.getEmail()) != null) {
            throw new ExistingModelException(String.format("User with \"%s\" email is already exist.", user.getEmail()));
        }
        String query = "INSERT INTO users (`name`, surname, email, password, gender, age, user_status, prof_pic_url) VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, user.getName());
        ps.setString(2, user.getSurname());
        ps.setString(3, user.getEmail());
        ps.setString(4, user.getPassword());
        ps.setString(5, user.getGender().name());
        ps.setInt(6, user.getAge());
        ps.setString(7, user.getUserStatus().name());
        ps.setString(8, user.getProfPicUrl());
        ps.executeUpdate();

        ResultSet resultSet = ps.getGeneratedKeys();

        while (resultSet.next()) {
            int id = resultSet.getInt(1);
            user.setId(id);
        }
    }

    public void updateUser(String name, String surname, String email, int age, int id) throws SQLException {
        String query = "UPDATE users SET `name` = ?, surname = ?, email = ?, age = ? WHERE id = ?";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, name);
        ps.setString(2, surname);
        ps.setString(3, email);
        ps.setInt(4, age);
        ps.setInt(5, id);
        ps.executeUpdate();
    }

    public void updateUserProficePic(String profilePic, int id) throws SQLException {
        String query = "UPDATE users SET prof_pic_url = ? WHERE id = ?";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, profilePic);
        ps.setInt(2, id);
        ps.executeUpdate();
    }



    public User getUserByEmail(String email) throws SQLException {
        String query = "SELECT * FROM users WHERE email = ?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, email);
        ResultSet resultSet = ps.executeQuery();

        if (resultSet.next()) {
            return getUserFromResultSet(resultSet);
        }
        return null;
    }

    public User getUserByEmailAndPassword(String email, String password) throws SQLException, ModelNotFoundException {
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet resultSet = ps.executeQuery();

        if (resultSet.next()) {
            return getUserFromResultSet(resultSet);
        }
        throw new ModelNotFoundException(String.format("User with \"%s\" email does not exist.", email));
    }

    public List<User> getAllUsers() throws SQLException {
        String query = "SELECT * FROM users";
        List<User> allUsers = new ArrayList<User>();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            allUsers.add(getUserFromResultSet(resultSet));
        }
        return allUsers;
    }

    public List<User> getAllUsersByStatus(UserStatus userStatus) throws SQLException {
        String query = "SELECT * FROM users WHERE user_status = '" + userStatus + "'";
        List<User> allUsers = new ArrayList<User>();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            allUsers.add(getUserFromResultSet(resultSet));
        }
        return allUsers;
    }

    public void changeUserPassword(User user, String password) throws SQLException {
        String query = "UPDATE users SET password = ? WHERE id = ?";
        PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, password);
        ps.setInt(2, (int) user.getId());
        ps.executeUpdate();

        ResultSet resultSet = ps.getGeneratedKeys();

        while (resultSet.next()) {
            int id = resultSet.getInt(1);
            user.setId(id);
        }
    }

}
