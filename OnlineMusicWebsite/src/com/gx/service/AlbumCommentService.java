package com.gx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gx.po.UserAlbumCommentStutsPo;
import com.gx.po.albumCommentPo;

public interface AlbumCommentService {

	public List<albumCommentPo> showComment(HttpServletRequest request, int id);

	public boolean addComment(HttpServletRequest request, String userComment,String albumName, int parentCommentId);

	public void addGoodNumber(HttpServletRequest request, int id);

	public void addUserAlbumCommentStuts(HttpServletRequest request, int id,String stuts);

	public void updateUserAlbumCommentStuts(HttpServletRequest request,UserAlbumCommentStutsPo po, String stuts);

	public void reduceGoodNumber(HttpServletRequest request, int id);

	public List<albumCommentPo> addUserAlbumCommentStutsIntosongCommentPo(HttpServletRequest request, List<albumCommentPo> resultList);

	public String selectUserAlbumCommentStuts(HttpServletRequest request,List<albumCommentPo> resultList, int i);

	public List<albumCommentPo> selectReplayComment(HttpServletRequest request,int id);

	public void deleteComment(HttpServletRequest request, int id,int parentCommentId);

	public void deleteCommentByAlbumName(String albumName);

	public void deleteAllReplay(int id);

}
