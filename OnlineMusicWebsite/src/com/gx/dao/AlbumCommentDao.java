package com.gx.dao;

import java.util.List;

import com.gx.po.albumCommentPo;

public interface AlbumCommentDao {

	public List<albumCommentPo> selectAlbumCommentByAlbumName(String albumName);

	public albumCommentPo selectAlbumCommentById(Integer id);

	public void updateAlbumCommentById(albumCommentPo po);

	public void addComment(albumCommentPo albumCommentPo);

	public List<albumCommentPo> selectReplayComment(Integer id);

	public void deleteAllReplay(Integer parentCommentId);

	public void deleteCommentById(Integer id);

	public void deleteCommentByAlbumName(String albumName);

}
