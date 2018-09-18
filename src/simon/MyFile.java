package simon;

/**
 * 文件实体类
 */
public class MyFile {

	int id;         //ID
	String name;    //名称
	String thePath; //文件名称 路径
	long size;   //文件大小 单位字节
	String note;  //描述信息
	String uploadTime; //上传时间
	
	
	public MyFile() {
		super();
	}
	public MyFile(int id, String name, String thePath, long size, String note) {
		super();
		this.id = id;
		this.name = name;
		this.thePath = thePath;
		this.size = size;
		this.note = note;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getThePath() {
		return thePath;
	}
	public void setThePath(String thePath) {
		this.thePath = thePath;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}
	
}
