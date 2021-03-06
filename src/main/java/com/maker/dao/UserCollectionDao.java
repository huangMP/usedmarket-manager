package com.maker.dao;

import com.maker.entity.UserCollection;

/**
 * Description：收藏表Dap
 * Created by Peivxuan on 2016/11/16.
 */
public interface UserCollectionDao {

	/**
	 * 添加一个收藏
	 * @param userCollection 要添加的参数
	 * @return
	 */
	boolean addCollection(UserCollection userCollection);

	/**
	 * 删除一个收藏
	 * @param userCollection 要删除的收藏
	 * @return
	 */
	boolean removeOneCollection(UserCollection userCollection);

	/**
	 * 判断是否存在次收藏
	 * @param userCollection
	 * @return
	 */
	UserCollection findOneCollection(UserCollection userCollection);

}
