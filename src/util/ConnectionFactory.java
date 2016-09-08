package util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionFactory {
	
	private static String driver;
	private static String dburl;
	private static String user;
	private static String password;
	
	private static final ConnectionFactory factory = new ConnectionFactory();
	private Connection conn;
	
	static {
		Properties prop = new Properties();
		try{
			InputStream in = ConnectionFactory.class.getClassLoader().getResourceAsStream("dbconfig.properties");
			prop.load(in);
		}catch (Exception e){
			System.out.println("=====Read Config File Error=====");
		}
		
		driver = prop.getProperty("driver");
		dburl = prop.getProperty("dburl");
		user = prop.getProperty("user");
		password = prop.getProperty("password");
	}

	private ConnectionFactory(){}
	
	public static ConnectionFactory getInstance() {
		// TODO Auto-generated method stub
		return factory;
	}

	public Connection makeConnection() {
		// TODO Auto-generated method stub
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(dburl,user,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	
}
