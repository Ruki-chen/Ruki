package com.gx.dao;

import org.apache.ibatis.annotations.Param;

import com.gx.po.UserAlbumCommentStutsPo;

public interface UserAlbumCommentStutsDao {

	public UserAlbumCommentStutsPo selectUserAlbumCommentStuts(@Param("mail")String mail,@Param("albumCommentId")int albumCommentId);

	public void addUserAlbumCommentStuts(UserAlbumCommentStutsPo userAlbumCommentStutsPo);

	public void updateUserAlbumCommentStuts(UserAlbumCommentStutsPo po);

	public void deleteUserAlbumCommentStuts(Integer albumCommentId);

}
