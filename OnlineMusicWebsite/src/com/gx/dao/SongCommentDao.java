package com.gx.dao;

import java.util.List;

import com.gx.po.songCommentPo;

public interface SongCommentDao {

	public List<songCommentPo> selectSongCommentBySongName(String songName);

	public void addComment(songCommentPo songCommentPo);

	public songCommentPo selectSongCommentById(Integer id);

	public void updateSongCommentById(songCommentPo songCommentPo);

	public List<songCommentPo> selectReplayComment(Integer id);

	public void deleteAllReplay(Integer parentCommentId);

	public void deleteCommentById(Integer id);

	public void deleteCommentBySongName(String songName);



}
