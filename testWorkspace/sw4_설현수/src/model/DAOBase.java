package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAOBase implements DAO {

	@Override
	public Connection getConnection() throws SQLException {
		
		String jdbc_driver = "oracle.jdbc.OracleDriver";
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
		try {
			Class.forName(jdbc_driver);
			Connection conn = DriverManager.getConnection(db_url,"webmvc","123123");
			return conn;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
