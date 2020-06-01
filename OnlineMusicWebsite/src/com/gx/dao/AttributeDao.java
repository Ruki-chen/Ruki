package com.gx.dao;

import java.util.List;

import com.gx.po.attributePo;

public interface AttributeDao {

	public	List<attributePo> selectSpecialList(String parentAttributeName);


}
