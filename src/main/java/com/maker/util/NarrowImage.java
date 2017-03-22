package com.maker.util;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;

public class NarrowImage {

	/**
	 * 压缩目标值
	 */
	public static final int bigNarrowTarget = 100;
	public static final int normalNarrowTarget = 40;
	public static final int smallNarrowTarget = 20;

	public static void main(String args[]) {

		imageNarrow("H:\\图片\\", "test2.PNG", "test.PNG", 20);
		//System.out.println( getNarrowImageFileName("6b6326ebf5584c83ab81ba177a458252.jpg") );
		//System.out.println( getOriginalFileName("1_.jsp") );
	}
	/**
	 * @param inputFoler       原图路径
	 * @param newFileName      压缩图片的文件名
	 * @param originalFileName 原图文件名
	 * @param target           期望得到的压缩图的大小 若为0  采用默认压缩
	 */
	public static void imageNarrow(String inputFoler, String newFileName, String originalFileName, int target) {
		System.out.println("压缩初始化");
		String originalFileSrc = inputFoler + originalFileName;
		String newFileSrc = inputFoler + newFileName;
		NarrowImage narrowImage = new NarrowImage();
		narrowImage.writeHighQuality(narrowImage.zoomImage(originalFileSrc, target), newFileSrc);
		System.out.println("压缩完成");
	}

	/**
	 * @param src    原图绝对路径
	 * @param target 期望得到的压缩图的大小 若为0  采用默认压缩
	 * @return
	 */
	private static BufferedImage zoomImage(String src, int target) {
		BufferedImage result = null;
		try {
			File srcfile = new File(src);
			if (!srcfile.exists()) {
				System.out.println("文件不存在");
			}

			BufferedImage im = ImageIO.read(srcfile);
				/* 原始图像的宽度和高度 */
			int width = im.getWidth();
			int height = im.getHeight();

			double resizeTimes;
			int srcfileLength = (int) (srcfile.length() / 1024);

			//压缩计算
			if (target != 0) {

				if (target > srcfileLength) {
					resizeTimes = (double) 1;
				} else {
					resizeTimes = (double)target/srcfileLength * 2;
				}
			} else {
				//压缩计算
				if(srcfileLength < 300) {
					resizeTimes = (double) 1;
				} else if (srcfileLength < 500 && srcfileLength > 300) {
					resizeTimes = (double) 0.2;
				} else {
					resizeTimes = (double) 0.01;
				}
			}

			/*这个参数是要转化成的倍数,如果是1就是转化成1倍*/
			/* 调整后的图片的宽度和高度 */
			int toWidth = (int) (width * resizeTimes);
			int toHeight = (int) (height * resizeTimes);
				/* 新生成结果图片 */
			result = new BufferedImage(toWidth, toHeight, BufferedImage.TYPE_INT_RGB);
			result.getGraphics().drawImage(im.getScaledInstance(toWidth, toHeight, java.awt.Image.SCALE_SMOOTH), 0, 0, null);
		} catch (Exception e) {
			System.out.println("创建缩略图发生异常" + e.getMessage());
		}
		return result;
	}

	private static boolean writeHighQuality(BufferedImage im, String fileFullPath) {
		try {
				/*输出到文件流*/
			FileOutputStream newimage = new FileOutputStream(fileFullPath);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);
			JPEGEncodeParam jep = JPEGCodec.getDefaultJPEGEncodeParam(im);
				/* 压缩质量 */
			jep.setQuality(0.9f, true);
			encoder.encode(im, jep);
				/*近JPEG编码*/
			newimage.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
