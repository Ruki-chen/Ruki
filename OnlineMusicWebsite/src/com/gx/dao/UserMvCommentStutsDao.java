package com.gx.dao;

import org.apache.ibatis.annotations.Param;

import com.gx.po.UserMvCommentStutsPo;

public interface UserMvCommentStutsDao {

	public UserMvCommentStutsPo selectUserMvCommentStuts(@Param("mail")String mail,@Param("mvCommentId")int mvCommentId);

	public void addUserMvCommentStuts(UserMvCommentStutsPo userMvCommentStutsPo);

	public void updateUserMvCommentStuts(UserMvCommentStutsPo po);

	public void deleteUserMvCommentStuts(Integer mvCommentId);

}
