package com.gx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.AttributeDao;
import com.gx.po.attributePo;
import com.gx.service.attributeService;

@Transactional
@Service(value="attributeService")
public class attributeServiceImpl implements attributeService {

	@Autowired
	private AttributeDao attributeDao;

	@Override
	public List<attributePo> selectSpecialList(String parentAttributeName) {
		// TODO Auto-generated method stub
		List<attributePo> list = attributeDao.selectSpecialList(parentAttributeName);
		attributePo po = new attributePo();
		po.setAttributeName("全部");
		list.add(po);
		return list;
	}

	
}
