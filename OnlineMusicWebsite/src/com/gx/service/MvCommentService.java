package com.gx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gx.po.MvCommentPo;
import com.gx.po.UserMvCommentStutsPo;

public interface MvCommentService {

	public List<MvCommentPo> showComment(HttpServletRequest request, int id);

	public List<MvCommentPo> addUserMvCommentStutsIntoMvCommentPo(HttpServletRequest request, List<MvCommentPo> resultList);

	public String selectUserMvCommentStuts(HttpServletRequest request,List<MvCommentPo> resultList, int i);

	public boolean addComment(HttpServletRequest request, String userComment,int id, int parentCommentId);

	public void addGoodNumber(HttpServletRequest request, int id);

	public void addUserMvCommentStuts(HttpServletRequest request, int id, String stuts);

	public void updateUserMvCommentStuts(HttpServletRequest request,UserMvCommentStutsPo po, String stuts);

	public void reduceGoodNumber(HttpServletRequest request, int id);

	public List<MvCommentPo> selectReplayComment(HttpServletRequest request,int id);

	public void deleteComment(HttpServletRequest request, int id,int parentCommentId);

	public void deleteCommentByMvName(String mvName);

	public void deleteAllReplay(int id);

}
