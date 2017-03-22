package com.maker.service.impl;

import com.maker.dao.UserCollectionDao;
import com.maker.entity.UserCollection;
import com.maker.service.UserCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description：收藏service实现类
 * Created by Peivxuan on 2016/11/16.
 */
@Service("userCollectionService")
public class UserCollectionServiceImpl implements UserCollectionService {

	@Autowired
	UserCollectionDao userCollectionDao;

	/**
	 * 添加一个收藏
	 *
	 * @param userCollection 要添加的参数
	 * @return
	 */
	@Override
	public boolean addCollection(UserCollection userCollection) {
		return userCollectionDao.addCollection(userCollection);
	}

	/**
	 * 删除一个收藏
	 *
	 * @param userCollection 要删除的收藏
	 * @return
	 */
	@Override
	public boolean removeOneCollection(UserCollection userCollection) {
		return userCollectionDao.removeOneCollection(userCollection);
	}

	/**
	 * 判断是否存在次收藏
	 *
	 * @param userCollection
	 * @return
	 */
	@Override
	public UserCollection findOneCollection(UserCollection userCollection) {
		return userCollectionDao.findOneCollection(userCollection);
	}
}
