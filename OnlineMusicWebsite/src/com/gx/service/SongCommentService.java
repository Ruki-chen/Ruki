package com.gx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gx.po.UserSongCommentStutsPo;
import com.gx.po.songCommentPo;


public interface SongCommentService {

	public List<songCommentPo> showComment(HttpServletRequest request, String songPath);

	public boolean addComment(HttpServletRequest request, String userComment, String songName, int parentCommentId);

	public void addGoodNumber(HttpServletRequest request, int id);

	public String selectUserSongCommentStuts(HttpServletRequest request,List<songCommentPo> resultList,int i);

	public List<songCommentPo> addUserSongCommentStutsIntosongCommentPo(HttpServletRequest request, List<songCommentPo> resultList);

	public void reduceGoodNumber(HttpServletRequest request, int id);

	public void addUserSongCommentStuts(HttpServletRequest request, int id,String stuts);

	public void updateUserSongCommentStuts(HttpServletRequest request, UserSongCommentStutsPo po,String stuts);

	public List<songCommentPo> selectReplayComment(HttpServletRequest request,int id);

	public void deleteComment(HttpServletRequest request, int id, int parentCommentId);

	public void deleteCommentBySongName(String songName);

	public void deleteAllReplay(int id);

}
