package com.fh.util;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.apache.poi.xwpf.converter.core.BasicURIResolver;
import org.apache.poi.xwpf.converter.core.FileImageExtractor;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.w3c.dom.Document;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

/**
 * <p>Title: DocAndDocxToHtml </p>
 * <p>Description: 用.doc和.docx文件生成.html文件 </p>
 * @author  huangMP
 * @date    2016年8月29日
 */
public class DocAndDocxToHtml {
    
	public static void main(String[] args){
		try {
			docOrDocxToHtml("F:/2007.docx", "F:/2007/2007.html", "F:/2007/2007");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据文件的后缀，进行相应的处理
	 * @param docOrDocxPathAndName
	 * @param htmlPathAndName
	 * @param HtmlImgPath
	 * @throws Exception
	 * @author  huangMP
	 * @date    2016年8月29日
	 */
	public static void docOrDocxToHtml(String docOrDocxPathAndName ,String htmlPathAndName, String HtmlImgPath) throws Exception{
		//得到文件的后缀
		String postfix = docOrDocxPathAndName.substring( docOrDocxPathAndName.lastIndexOf('.') );
		//根据后缀，进行相应的处理
		if(".doc".trim().equals(postfix) ){
			docToHtml(docOrDocxPathAndName , htmlPathAndName, HtmlImgPath);
		}else if(".docx".trim().equals(postfix) ){
			docxToHtml(docOrDocxPathAndName , htmlPathAndName, HtmlImgPath);
		}
	}
    
	/**
	 * 用 .docx文件 生成相应的 .html 文件
	 * @param docxPathAndName	准备被转化格式的.docx文件	格式：F:\\1.docx
	 * @param htmlPathAndName	生成的.html文件的存放地址	格式：F:\\html\\test2.html
	 * @param HtmlImgPath	从.docx抽取出来的图片存放地址	格式：F:\\html\\image\\
	 * @throws Exception
	 * @author  huangMP
	 * @date    2016年8月29日
	 */
	public static void docxToHtml(String docxPathAndName ,String htmlPathAndName, String HtmlImgPath) throws Exception {

    	//System.out.println("DocxToHtml____start!");
        
        FileOutputStream fileOutputStream = null;
        OutputStreamWriter outputStreamWriter = null;
        
        try {
        	
            XWPFDocument document = new XWPFDocument(new FileInputStream(docxPathAndName));
            XHTMLOptions options = XHTMLOptions.create();
            //存放图片的文件夹
            options.setExtractor(new FileImageExtractor(new File(HtmlImgPath)));
            //html中图片的路径
            options.URIResolver(new BasicURIResolver( HtmlImgPath.substring( HtmlImgPath.lastIndexOf('/') + 1  ) ));
            
            //利用html的保存路径 
            File outFile = new File( htmlPathAndName );
	        outFile.getParentFile().mkdirs();
	        
            fileOutputStream = new FileOutputStream(outFile);
            outputStreamWriter = new OutputStreamWriter(fileOutputStream, "gb2312");
            XHTMLConverter xhtmlConverter = (XHTMLConverter) XHTMLConverter.getInstance();
            xhtmlConverter.convert(document, outputStreamWriter, options);
            
        } finally {
        	
        	//System.out.println("DocxToHtml____ending!");
        	
            if (outputStreamWriter != null) {
                outputStreamWriter.close();
            }
            if (fileOutputStream != null) {
                fileOutputStream.close();
            }
        }
    }

    
	/**
	 * 用 .doc文件 生成相应的 .html 文件
	 * @param docPathAndName	准备被转化格式的.docx文件	格式：F:\\1.doc
	 * @param htmlPathAndName	生成的.html文件的存放地址	格式：F:\\html\\test2.html
	 * @param HtmlImgPath	从.doc抽取出来的图片存放地址	格式：F:\\html\\image\\
	 * @throws Exception
	 * @author  huangMP
	 * @date    2016年8月29日
	 */
    private static void docToHtml(String docPathAndName ,String htmlPathAndName,final String HtmlImgPath) throws Exception {

    	//System.out.println("DocToHtml____start!");
    	
        //创建存放图片的文件夹
        FileUtil.createFolder(HtmlImgPath);  
        
        HWPFDocument wordDocument = new HWPFDocument(new FileInputStream(docPathAndName));
        WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument());
        
        //设置图片的相对路径
        wordToHtmlConverter.setPicturesManager( 
        		new PicturesManager(){
                    public String savePicture( byte[] content,
                            PictureType pictureType, String suggestedName,
                            float widthInches, float heightInches )
                    {
                    	//相对路径
                        return  HtmlImgPath.substring( HtmlImgPath.lastIndexOf('/') + 1  ) + "/" + suggestedName;
                    }
                }
        );
        
        wordToHtmlConverter.processDocument(wordDocument);
        List<Picture> pics = wordDocument.getPicturesTable().getAllPictures();

        for (Picture pic : pics) {
            //生成图片
            FileOutputStream fileOutputStream = new FileOutputStream( HtmlImgPath+ "/" + pic.suggestFullFileName() );
            pic.writeImageContent( fileOutputStream );
            fileOutputStream.close();
        }
        pics.clear();
        Document htmlDocument = wordToHtmlConverter.getDocument();
        DOMSource domSource = new DOMSource(htmlDocument);
        StreamResult streamResult = new StreamResult(new File(htmlPathAndName));

        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer serializer = tf.newTransformer();
        serializer.setOutputProperty(OutputKeys.ENCODING, "utf-8");
        serializer.setOutputProperty(OutputKeys.INDENT, "yes");
        serializer.setOutputProperty(OutputKeys.METHOD, "html");
        serializer.transform(domSource, streamResult);
        
    	//System.out.println("DocToHtml____ending!");
    }

}
