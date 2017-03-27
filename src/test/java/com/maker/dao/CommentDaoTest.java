package com.maker.dao;

import com.maker.dto.CommentCustom;
import com.maker.entity.Comment;
import com.maker.service.CommentService;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Description：enter your comment
 * Created by Peivxuan on 2017/3/8.
 */
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration({"classpath:spring/ApplicationContext.xml","classpath:spring/ApplicationContext-mvc.xml"})
public class CommentDaoTest extends TestCase {

//	@Resource(name = "commentService")
//	CommentService commentService;
//
	@Test
	public void testFindByCommodityId() throws Exception {
//		List<CommentCustom> commentList = commentService.findByCommodityId("a4f18a59c54f40e29775c368c3530c63");
//		for( Comment comment: commentList ){
			System.out.println("test");
//		}
	}
}