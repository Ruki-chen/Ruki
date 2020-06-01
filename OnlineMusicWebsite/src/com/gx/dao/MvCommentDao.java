package com.gx.dao;

import java.util.List;

import com.gx.po.MvCommentPo;

public interface MvCommentDao {

	public List<MvCommentPo> selectMvCommentByMvName(String mvName);

	public MvCommentPo selectMvCommentById(Integer id);

	public void updateMvCommentById(MvCommentPo po);

	public void addComment(MvCommentPo mvCommentPo);

	public List<MvCommentPo> selectReplayComment(Integer parentCommentId);

	public void deleteAllReplay(Integer parentCommentId);

	public void deleteCommentById(Integer id);

	public void deleteCommentByMvName(String mvName);

}
