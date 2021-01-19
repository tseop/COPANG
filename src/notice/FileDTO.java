package notice;

import java.io.Serializable;

public class FileDTO implements Serializable {
	private int fileNo;
	private String fileName;
	private int fileSize;

	public FileDTO() {
		super();
	}

	public FileDTO(int fileNo, String fileName, int fileSize) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.fileSize = fileSize;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "FileDTO [fileNo=" + fileNo + ", fileName=" + fileName + ", fileSize=" + fileSize + "]";
	}

}
