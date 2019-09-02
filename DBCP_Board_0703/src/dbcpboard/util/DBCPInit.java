package dbcpboard.util;

import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.dbcp2.BasicDataSourceFactory;
import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.ObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {

	@Override
	public void init() throws ServletException {
		loadJDBCDriver();
		initConnectionPool();
	}

	private void loadJDBCDriver() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}

	private void initConnectionPool() {
		try {
			String jdbcUrl = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
			String username = "jsldb";
			String pw = "123123";
			
			//커넥션풀이 새로운 커넥션을 생성할 때 사용할 커넥션팩토리를 생성.
			ConnectionFactory connFactory = 
					new DriverManagerConnectionFactory(jdbcUrl, username, pw);
			 // PoolableConnection을 생성하는 팩토리 생성.
            // DBCP는 커넥션을 보관할 때 PoolableConnection 을 사용
            // 실제 커넥션을 담고 있있으며, 커넥션 풀을 관리하는데 필요한 기능을 제공한다.
            // 커넥션을 close하면 종료하지 않고 커넥션 풀에 반환
			PoolableConnectionFactory poolableConnFactory = 
					new PoolableConnectionFactory(connFactory, null);
			
			//커넥션이 유효한지 여부를 검사할 때 사용하는 쿼리를 지정한다.
			poolableConnFactory.setValidationQuery("select 1");

			
			//커넥션 풀의 설정 정보를 생성한다.
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			
			 //유휴 커넥션 검사 주기	
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);//유효 커넥션 검사 주기(밀리초)
			poolConfig.setTestWhileIdle(true);//커넥션이 유효한지 검사
			poolConfig.setMinIdle(4);//풀이 유지할 최소 커넥션 수
			poolConfig.setMaxTotal(50);//풀이 관리할 커넥션 최대 갯수

			GenericObjectPool<PoolableConnection> connectionPool = 
					new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connectionPool);
			
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = 
					(PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			driver.registerPool("oracledb", connectionPool);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
