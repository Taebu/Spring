package common;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtil {
	private static JdbcUtil instance = new JdbcUtil();
	
	private static DataSource ds;
	
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("Driver loading success!");
			InitialContext ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myOracle");
			System.out.println("Connection pool!");
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private JdbcUtil() {	}

	public static JdbcUtil getInstance() {
		return instance;
	}

	public static void setInstance(JdbcUtil instance) {
		JdbcUtil.instance = instance;
	}
	
	public Connection getConnection() throws SQLException{
		return ds.getConnection();
	}
	
	
}
