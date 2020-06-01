package com.gx.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.SongCommentDao;
import com.gx.dao.SongDao;
import com.gx.dao.UserSongCommentStutsDao;
import com.gx.po.SongPo;
import com.gx.po.UserSongCommentStutsPo;
import com.gx.po.songCommentPo;
import com.gx.service.SongCommentService;

@Transactional
@Service(value="songCommentService")
public class SongCommentServiceImplement implements SongCommentService {
	
	@Autowired
	private SongCommentDao songCommentDao;
	
	@Autowired
	private SongDao songDao;
	
	@Autowired
	private UserSongCommentStutsDao userSongCommentStutsDao;
	
	public static String COMMENTSTUTS_TRUE = "true";
	public static String COMMENTSTUTS_FALSE = "false";

	@Override
	public List<songCommentPo> showComment(HttpServletRequest request,String songPath) {
		// TODO Auto-generated method stub
		SongPo songPo = songDao.selectSongBySongPath(songPath);
		List<songCommentPo> resultList = songCommentDao.selectSongCommentBySongName(songPo.getSongName());
		resultList = addUserSongCommentStutsIntosongCommentPo(request,resultList);
		return resultList;
	}

	@Override
	public List<songCommentPo> addUserSongCommentStutsIntosongCommentPo(HttpServletRequest request,List<songCommentPo> resultList) {
		// TODO Auto-generated method stub
		List<songCommentPo> list = new ArrayList<songCommentPo>();
		int i = 0;
		for (songCommentPo songCommentPo : resultList) {
			String songCommentStuts = selectUserSongCommentStuts(request,resultList,i);
			songCommentPo.setSongCommentStuts(songCommentStuts);
			list.add(songCommentPo);
			i++;
		}
		return list;
	}

	@Override
	public boolean addComment(HttpServletRequest request, String userComment,String songName, int parentCommentId) {
		// TODO Auto-generated method stub
		
		HttpSession ss = request.getSession();
		String userName = (String) ss.getAttribute("userName");
		String mail = (String) ss.getAttribute("mail");
		if(userName==null||userName.equals("")) {
			return false;
		}
		songCommentPo songCommentPo =new songCommentPo();
		songCommentPo.setUserComment(userComment);
		songCommentPo.setUserName(userName);
		songCommentPo.setMail(mail);
		songCommentPo.setGoodNumber(0);//第一次发，点赞最初肯定为空
		songCommentPo.setReplayNumber(0);
		songCommentPo.setTime(new java.sql.Timestamp(new Date().getTime()));
		songCommentPo.setSongName(songName);
		if(parentCommentId!=0) {
			songCommentPo.setParentCommentId(parentCommentId);
			songCommentPo po = songCommentDao.selectSongCommentById(parentCommentId);
			int replayNumber = po.getReplayNumber();
			po.setReplayNumber(++replayNumber);
			songCommentDao.updateSongCommentById(po);
		}
		songCommentDao.addComment(songCommentPo);
		return true;
	}

	@Override
	public void addGoodNumber(HttpServletRequest request,int id) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		songCommentPo songCommentPo = songCommentDao.selectSongCommentById(id);
		int goodNumber =songCommentPo.getGoodNumber();
		songCommentPo.setGoodNumber(++goodNumber);
		songCommentDao.updateSongCommentById(songCommentPo);
		UserSongCommentStutsPo po = userSongCommentStutsDao.selectUserSongCommentStuts(mail,id);
		if(po==null) {
			addUserSongCommentStuts(request,id,COMMENTSTUTS_TRUE);
		} else {
			updateUserSongCommentStuts(request,po,COMMENTSTUTS_TRUE);
		}
		
		
	}

	@Override
	public void updateUserSongCommentStuts(HttpServletRequest request, UserSongCommentStutsPo po,String stuts) {
		// TODO Auto-generated method stub
		if(stuts.equals(COMMENTSTUTS_TRUE)) {
			po.setSongCommentStuts(COMMENTSTUTS_TRUE);
		} else {
			po.setSongCommentStuts(COMMENTSTUTS_FALSE);
		}
		userSongCommentStutsDao.updateUserSongCommentStuts(po);
	}

	@Override
	public void addUserSongCommentStuts(HttpServletRequest request, int id,String stuts) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String userName = (String) ss.getAttribute("userName");
		String mail = (String) ss.getAttribute("mail");
		UserSongCommentStutsPo userSongCommentStutsPo = new UserSongCommentStutsPo();//如果登入用户点赞过，是有数据的
		userSongCommentStutsPo.setMail(mail);
		userSongCommentStutsPo.setUserName(userName);
		userSongCommentStutsPo.setSongCommentId(id);
		if(stuts.equals(COMMENTSTUTS_TRUE)) {
			userSongCommentStutsPo.setSongCommentStuts(COMMENTSTUTS_TRUE);
		} else {
			userSongCommentStutsPo.setSongCommentStuts(COMMENTSTUTS_FALSE);
		}
		userSongCommentStutsDao.addUserSongCommentStuts(userSongCommentStutsPo);
	}

	@Override
	public String selectUserSongCommentStuts(HttpServletRequest request,List<songCommentPo> resultList,int i) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		List<String> stutsList = new ArrayList<String>();
		for (songCommentPo songCommentPo : resultList) {
			UserSongCommentStutsPo po = userSongCommentStutsDao.selectUserSongCommentStuts(mail,songCommentPo.getId());
			if(po==null||po.getSongCommentStuts().equals(COMMENTSTUTS_FALSE)) {
				stutsList.add(COMMENTSTUTS_FALSE);
			} else {
				stutsList.add(COMMENTSTUTS_TRUE);
			}
		}		
		return stutsList.get(i);
	}

	@Override
	public void reduceGoodNumber(HttpServletRequest request, int id) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		songCommentPo songCommentPo = songCommentDao.selectSongCommentById(id);
		int goodNumber =songCommentPo.getGoodNumber();
		songCommentPo.setGoodNumber(--goodNumber);
		songCommentDao.updateSongCommentById(songCommentPo);
		UserSongCommentStutsPo po = userSongCommentStutsDao.selectUserSongCommentStuts(mail,id);
		if(po==null) {
			addUserSongCommentStuts(request,id,COMMENTSTUTS_FALSE);
		} else {
			updateUserSongCommentStuts(request,po,COMMENTSTUTS_FALSE);
		}
	}

	@Override
	public List<songCommentPo> selectReplayComment(HttpServletRequest request,int id) {
		// TODO Auto-generated method stub
		List<songCommentPo> resultList = songCommentDao.selectReplayComment(id);
		resultList = addUserSongCommentStutsIntosongCommentPo(request,resultList);
		return resultList;
		
	}

	@Override
	public void deleteComment(HttpServletRequest request, int id,int parentCommentId) {
		// TODO Auto-generated method stub
		if(parentCommentId != 0) {
			songCommentPo  po = songCommentDao.selectSongCommentById(parentCommentId);
			int replayNumber = po.getReplayNumber();
			po.setReplayNumber(--replayNumber);
			songCommentDao.updateSongCommentById(po);
		}
		userSongCommentStutsDao.deleteUserSongCommentStuts(id);
		deleteAllReplay(id);
		songCommentDao.deleteCommentById(id);
	}

	@Override
	public void deleteAllReplay(int id) {
		// TODO Auto-generated method stub
		List<songCommentPo> list = songCommentDao.selectReplayComment(id);
		for (songCommentPo songCommentPo : list) {
			userSongCommentStutsDao.deleteUserSongCommentStuts(songCommentPo.getId());
		}
		songCommentDao.deleteAllReplay(id);
	}

	@Override
	public void deleteCommentBySongName(String songName) {
		// TODO Auto-generated method stub
		List<songCommentPo> list = songCommentDao.selectSongCommentBySongName(songName);
		for (songCommentPo songCommentPo : list) {
			userSongCommentStutsDao.deleteUserSongCommentStuts(songCommentPo.getId());
		}
		songCommentDao.deleteCommentBySongName(songName);
	}

}
