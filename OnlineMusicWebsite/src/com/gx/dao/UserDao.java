package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.po.UserPo;



public interface UserDao {
	
	public UserPo selectLogin(UserPo user);
	
	public UserPo selectUserByMial(String mail);
	
	public int updateByMial(UserPo user);
	
	public int deleteByMial(String mail);
	
	public void selectRegist(UserPo user);
	
	public List<UserPo> selectUserExist(UserPo user);

	public void updatePassWordByMial(UserPo user);
	
	//分页模糊查询
    public List<UserPo> pageFuzzyselect(@Param("mail")String mail,
    		@Param("start")int start,@Param("pageSize")int pageSize);
    
    //分页模糊查询总条数
    public int countFuzzyselect(@Param("mail")String mail);

	public UserPo selectUserByPhotoPath(String photoPath);
}
