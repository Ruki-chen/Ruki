package com.gx.dao;

import org.apache.ibatis.annotations.Param;

import com.gx.po.UserSongCommentStutsPo;

public interface UserSongCommentStutsDao {

	public void addUserSongCommentStuts(UserSongCommentStutsPo userSongCommentStutsPo);

	public UserSongCommentStutsPo selectUserSongCommentStuts(@Param("mail")String mail,@Param("songCommentId")int songCommentId);

	public void updateUserSongCommentStuts(UserSongCommentStutsPo po);

	public void deleteUserSongCommentStuts(Integer songCommentId);
	

}
