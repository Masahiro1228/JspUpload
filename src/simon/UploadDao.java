package simon;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * 
 */
public class UploadDao extends BaseDao {

	/**
	 * 得到所有文件列表
	 * 
	 * @return 文件实体类集合对象
	 */
	public ArrayList<MyFile> getAlList() {
		ArrayList<MyFile> list = new ArrayList<MyFile>();
		String sql = "select * from upload";
		try {
			this.getConnection();
			statement = connection.prepareStatement(sql);
			rs = statement.executeQuery();
			while (rs.next()) {
				MyFile file = new MyFile();
				file.setId(rs.getInt(1));
				file.setName(rs.getString(2));
				file.setThePath(rs.getString(3));
				file.setSize(rs.getLong(4));
				file.setNote(rs.getString(5));
				file.setUploadTime(rs.getString(6).substring(0,19));
				list.add(file);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(rs, statement, connection);
		}
		return list;
	}
	
	/**
	 * 上传文件 添加记录
	 * @param name  文件名称
	 * @param pathname  文件名
	 * @param size 文件大小
	 * @param note 描述信息
	 * @return 受影响的行数
	 */
	public int addFile(String name,String pathname,long size,String note){
		int res = 0;
		String sql = "insert into upload(name,pathname,size,note,dtime) values(?,?,?,?,?)";
		String param[] = new String[]{name,pathname,String.valueOf(size),note,new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())};
		res = this.executeSql(sql, param);
		return res;
	}
}
