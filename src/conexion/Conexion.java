package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {
	private String jdbcURL;
	private String jdbcUserName;
	private String jdbcPassword;
	private Connection jdbcConnection;

	public Conexion(String jdbcURL, String jdbcUserName, String jdbcPassword) {
		this.jdbcURL = jdbcURL;
		this.jdbcUserName = jdbcUserName;
		this.jdbcPassword = jdbcPassword;
	}

	public void connection() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);

		}
	}

	public void discconect() throws SQLException {
		if (jdbcConnection!=null&& !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}
	
	public Connection getJdbcConnection() {
		return jdbcConnection;
	}

}
