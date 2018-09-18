package simon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 数据库连接处理类
 * @author training
 *
 */
public class BaseDao {

	//驱动类连接字符串
	private final static String DRIVER="com.mysql.jdbc.Driver";
	//private final static String DRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	//数据源连接字符串
	//private final static String URL="jdbc:sqlserver://localhost:1433;databasename=upload";
	
	private final static String URL="jdbc:mysql://localhost:3306/test?createDatabaseIfNotExist=true&amp;useUnicode=true&amp;characterEncoding=utf-8";
		
	protected Connection connection;  //连接对象
	protected PreparedStatement statement;  //SQL指令执行对象
	protected ResultSet rs; //结果集
	
	/**
	 * 数据库连接方法
	 * @return 一个完成了数据库连接的对象
	 */
	protected Connection getConnection(){
		try {
			//加载驱动类
			Class.forName(DRIVER);
			//得到连接对象
			connection = DriverManager.getConnection(URL,"root","root");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("驱动类无法加载！请检查！");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("数据源无法找到！请检查！");
		}
		return connection;
	}
	
	/**
	 * 关闭数据库所有资源
	 * @param rs   记录集
	 * @param statement  SQL指令执行对象
	 * @param connection  连接对象
	 */
	protected void closeAll(ResultSet rs,PreparedStatement statement,Connection connection){
		try {
			if(rs!=null){  //关闭RS
				rs.close();
			}
			if(statement!=null){  //关闭指令执行对象
				statement.close();
			}
			//关闭连接对象
			if(connection!=null && !connection.isClosed()){
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("关闭数据库资源时发生错误！");
		}
	}
	
	/**
	 * 执行SQL 增 删 改 操作
	 * @param sql 增 删 改 语句
	 * @param param 参数
	 * @return  受影响的行数
	 */
	public int executeSql(String sql,String param[]){
		int res=0;  //受影响的行数
		try {
			//得到数据库连接
			this.getConnection();
			//创建SQL 指令执行连接对象
			statement = connection.prepareStatement(sql);
			//循环设置参数
			if(param!=null){
				for (int i = 0; i < param.length; i++) {
					statement.setString(i+1, param[i]);
				}
			}
			//执行增 删  改 返回受影响的行数
			res=statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("执行增 删 改时发生错误！");
		}finally{
			//关闭所有资源
			this.closeAll(null, statement, connection);
		}
		//返回受影响的行数
		return res;
	}
}
