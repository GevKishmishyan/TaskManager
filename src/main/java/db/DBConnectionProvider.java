package db;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnectionProvider {

    private static DBConnectionProvider instance = new DBConnectionProvider();

    private Connection connection;

    private String driverName;
    private String dbUrl;
    private String dbUsername;
    private String dbPassword;


    private DBConnectionProvider() {
        try {
            loadProperties();
            Class.forName(driverName);
        } catch (ClassNotFoundException | IOException e) {
            e.printStackTrace();
        }
    }

    private void loadProperties() throws IOException {
        Properties properties = new Properties();
        properties.load(new FileInputStream("E:\\Projects\\TaskManager\\src\\main\\resources\\config.properties"));
        driverName = properties.getProperty("db.driver.name");
        dbUrl = properties.getProperty("db.url");
        dbUsername = properties.getProperty("db.username");
        dbPassword = properties.getProperty("db.password");
    }

    public static DBConnectionProvider getInstance() {
        return instance;
    }

    public Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

}
