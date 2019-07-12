package model;

import java.sql.Connection;
import java.sql.SQLException;

public interface DAO {
	Connection getConnection() throws SQLException;
}
