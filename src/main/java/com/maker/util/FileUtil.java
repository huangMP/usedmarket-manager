package com.maker.util;

import java.io.*;
import java.nio.ByteBuffer;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;

/**
 * 文件处理
 */
public class FileUtil {

	
	/**获取文件大小 返回 KB 保留3位小数  没有文件时返回0
	 * @param filepath 文件完整路径，包括文件名
	 * @return
	 */
	public static Double getFilesize(String filepath){
		File backupath = new File(filepath);
		return Double.valueOf(backupath.length())/1000.000;
	}

	/**
	 * 创建目录
	 * @param destDirName
	 * @return
     */
	public static Boolean createDir(String destDirName) {
		File dir = new File(destDirName);
		if(!dir.getParentFile().exists()){				//判断有没有父路径，就是判断文件整个路径是否存在
			return dir.getParentFile().mkdirs();		//不存在就全部创建
		}
		return false;
	}

	/**
	 * 删除文件
	 * @param filePathAndName String 文件路径及名称 如c:/fqf.txt
     */
	public static void delFile(String filePathAndName) {
		try {
			String filePath = filePathAndName;
			System.out.println(filePathAndName);
			filePath = filePath.toString();
			File myDelFile = new File(filePath);
			myDelFile.delete();
		} catch (Exception e) {
			System.out.println("删除文件操作出错");
			e.printStackTrace();
		}
	}

	/**
	 * 读取到字节数组0
	 * @param filePath //路径
	 * @throws IOException
	 */
	public static byte[] getContent(String filePath) throws IOException {
		File file = new File(filePath);
		long fileSize = file.length();
		if (fileSize > Integer.MAX_VALUE) {
			System.out.println("file too big...");
			return null;
		}
		FileInputStream fi = new FileInputStream(file);
		byte[] buffer = new byte[(int) fileSize];
		int offset = 0;
		int numRead = 0;
		while (offset < buffer.length
				&& (numRead = fi.read(buffer, offset, buffer.length - offset)) >= 0) {
			offset += numRead;
		}
		// 确保所有数据均被读取
		if (offset != buffer.length) {
			throw new IOException("Could not completely read file " + file.getName());
		}
		fi.close();
		return buffer;
	}

	/**
	 * 读取到字节数组1
	 * 
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray(String filePath) throws IOException {

		File f = new File(filePath);
		if (!f.exists()) {
			throw new FileNotFoundException(filePath);
		}
		ByteArrayOutputStream bos = new ByteArrayOutputStream((int) f.length());
		BufferedInputStream in = null;
		try {
			in = new BufferedInputStream(new FileInputStream(f));
			int buf_size = 1024;
			byte[] buffer = new byte[buf_size];
			int len = 0;
			while (-1 != (len = in.read(buffer, 0, buf_size))) {
				bos.write(buffer, 0, len);
			}
			return bos.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			bos.close();
		}
	}

	/**
	 * 读取到字节数组2
	 * 
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray2(String filePath) throws IOException {
		File f = new File(filePath);
		if (!f.exists()) {
			throw new FileNotFoundException(filePath);
		}
		FileChannel channel = null;
		FileInputStream fs = null;
		try {
			fs = new FileInputStream(f);
			channel = fs.getChannel();
			ByteBuffer byteBuffer = ByteBuffer.allocate((int) channel.size());
			while ((channel.read(byteBuffer)) > 0) {
				// do nothing
				// System.out.println("reading");
			}
			return byteBuffer.array();
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				channel.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				fs.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Mapped File way MappedByteBuffer 可以在处理大文件时，提升性能
	 * 
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray3(String filePath) throws IOException {

		FileChannel fc = null;
		RandomAccessFile rf = null;
		try {
			rf = new RandomAccessFile(filePath, "r");
			fc = rf.getChannel();
			MappedByteBuffer byteBuffer = fc.map(MapMode.READ_ONLY, 0,
					fc.size()).load();
			//System.out.println(byteBuffer.isLoaded());
			byte[] result = new byte[(int) fc.size()];
			if (byteBuffer.remaining() > 0) {
				// System.out.println("remain");
				byteBuffer.get(result, 0, byteBuffer.remaining());
			}
			return result;
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				rf.close();
				fc.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 删除某个文件夹下的所有文件夹和文件
	 * @param delpath String
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @return boolean
	 */
	public static boolean deleteFile(String delpath) throws Exception {
		File dir = new File(delpath);
		if(!dir.exists()){				//判断该文件夹是否存在
			return false;				//不存在就不删除
		}
		
		try {

			File file = new File(delpath);
			// 当且仅当此抽象路径名表示的文件存在且 是一个目录时，返回 true
			if (!file.isDirectory()) {
				file.delete();
			} else if (file.isDirectory()) {
				String[] filelist = file.list();
				for (int i = 0; i < filelist.length; i++) {
					File delfile = new File(delpath + "\\" + filelist[i]);
					if (!delfile.isDirectory()) {
						delfile.delete();
						System.out.println(delfile.getAbsolutePath() + "删除文件成功");
					} else if (delfile.isDirectory()) {
						deleteFile(delpath + "\\" + filelist[i]);
					}
				}
				System.out.println(file.getAbsolutePath() + "删除成功");
				file.delete();
			}

		} catch (FileNotFoundException e) {
			System.out.println("deletefile() Exception:" + e.getMessage());
		}
		return true;
	}

	/**
	 * 输出某个文件夹下的所有文件夹和文件路径
	 * @param filepath
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @return boolean
	 */
	public static boolean readFile(String filepath)
			throws FileNotFoundException, IOException {
		try {

			File file = new File(filepath);
			System.out.println("遍历的路径为：" + file.getAbsolutePath());
			// 当且仅当此抽象路径名表示的文件存在且 是一个目录时（即文件夹下有子文件时），返回 true
			if (!file.isDirectory()) {
				System.out.println("该文件的绝对路径：" + file.getAbsolutePath());
				System.out.println("名称：" + file.getName());
			} else if (file.isDirectory()) {
				// 得到目录中的文件和目录
				String[] filelist = file.list();
				if (filelist.length == 0) {
					System.out.println(file.getAbsolutePath()
							+ "文件夹下，没有子文件夹或文件");
				} else {
					System.out
							.println(file.getAbsolutePath() + "文件夹下，有子文件夹或文件");
				}
				for (int i = 0; i < filelist.length; i++) {
					File readfile = new File(filepath + "\\" + filelist[i]);
					System.out.println("遍历的路径为：" + readfile.getAbsolutePath());
					if (!readfile.isDirectory()) {
						System.out.println("该文件的路径："
								+ readfile.getAbsolutePath());
						System.out.println("名称：" + readfile.getName());
					} else if (readfile.isDirectory()) {
						System.out.println("-----------递归循环-----------");
						readFile(filepath + "\\" + filelist[i]);
					}
				}

			}

		} catch (FileNotFoundException e) {
			System.out.println("readfile() Exception:" + e.getMessage());
		}
		return true;
	}
	
	/**
	 * 创建的文件夹
	 * @param folder 要创建的文件夹路径
	 * @return  Boolean
	 */
	public static Boolean createFolder(String folder) {
		File f = new File(folder);
		if(!f.exists()){				//判断文件夹是否存在
			return f.mkdirs();		    //不存在就创建
		}
		return false;
	}

	public static void main(String[] args) {
		try {

			delFile(ResourcesPath.headPortraitAbsoluteath.replaceAll("classes/../../", "UsedMarket/") + "_a1df74a810af41898343064e4e59b593.jpg");
			System.out.println("ok");
			//F:/tomcat_work/apache-tomcat-7.0.62/webapps/pn_archives/static/practices/e673824670024a29ad7fedb86b07acb1
			// readFile("F:/tomcat_work/apache-tomcat-7.0.62/webapps/pn_archives/static/papers/8684f73516394a5c81247e6e48544e76");
			//deleteFile("F://tomcat_work//apache-tomcat-7.0.62//webapps//pn_archives//static//practices//11fdb7b0dddd4279a7d129f0ab10d9a0");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}