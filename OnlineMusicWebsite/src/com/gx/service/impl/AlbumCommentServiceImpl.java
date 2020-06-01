package com.gx.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.AlbumCommentDao;
import com.gx.dao.AlbumDao;
import com.gx.dao.UserAlbumCommentStutsDao;
import com.gx.po.AlbumPo;
import com.gx.po.MvCommentPo;
import com.gx.po.UserAlbumCommentStutsPo;
import com.gx.po.UserSongCommentStutsPo;
import com.gx.po.albumCommentPo;
import com.gx.po.songCommentPo;
import com.gx.service.AlbumCommentService;

@Transactional
@Service(value="albumCommentService")
public class AlbumCommentServiceImpl implements AlbumCommentService {
	
	@Autowired
	private AlbumCommentDao albumCommentDao;
	
	@Autowired
	private UserAlbumCommentStutsDao userAlbumCommentStutsDao;
	
	@Autowired
	private AlbumDao albumDao;
	
	public static String COMMENTSTUTS_TRUE = "true";
	public static String COMMENTSTUTS_FALSE = "false";

	@Override
	public List<albumCommentPo> showComment(HttpServletRequest request, int id) {
		// TODO Auto-generated method stub
		AlbumPo po = albumDao.returnAlbumById(id);
		 List<albumCommentPo> resultList = albumCommentDao.selectAlbumCommentByAlbumName(po.getAlbumName());
			resultList = addUserAlbumCommentStutsIntosongCommentPo(request,resultList);
			return resultList;
	}
	
	@Override
	public List<albumCommentPo> addUserAlbumCommentStutsIntosongCommentPo(HttpServletRequest request,List<albumCommentPo> resultList) {
		// TODO Auto-generated method stub
		List<albumCommentPo> list = new ArrayList<albumCommentPo>();
		int i = 0;
		for (albumCommentPo albumCommentPo : resultList) {
			String albumCommentStuts = selectUserAlbumCommentStuts(request,resultList,i);
			albumCommentPo.setAlbumCommentStuts(albumCommentStuts);
			list.add(albumCommentPo);
			i++;
		}
		return list;
	}

	@Override
	public String selectUserAlbumCommentStuts(HttpServletRequest request,List<albumCommentPo> resultList,int i) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		List<String> stutsList = new ArrayList<String>();
		for (albumCommentPo albumCommentPo : resultList) {
			UserAlbumCommentStutsPo po = userAlbumCommentStutsDao.selectUserAlbumCommentStuts(mail,albumCommentPo.getId());
			if(po==null||po.getAlbumCommentStuts().equals(COMMENTSTUTS_FALSE)) {
				stutsList.add(COMMENTSTUTS_FALSE);
			} else {
				stutsList.add(COMMENTSTUTS_TRUE);
			}
		}		
		return stutsList.get(i);
	}
	
	@Override
	public boolean addComment(HttpServletRequest request, String userComment,String albumName, int parentCommentId) {
		// TODO Auto-generated method stub

		HttpSession ss = request.getSession();
		String userName = (String) ss.getAttribute("userName");
		String mail = (String) ss.getAttribute("mail");
		if(userName==null||userName.equals("")) {
			return false;
		}
		albumCommentPo albumCommentPo =new albumCommentPo();
		albumCommentPo.setUserComment(userComment);
		albumCommentPo.setUserName(userName);
		albumCommentPo.setMail(mail);
		albumCommentPo.setGoodNumber(0);//第一次发，点赞最初肯定为空
		albumCommentPo.setReplayNumber(0);
		albumCommentPo.setTime(new java.sql.Timestamp(new Date().getTime()));
		albumCommentPo.setAlbumName(albumName);
		if(parentCommentId!=0) {
			albumCommentPo.setParentCommentId(parentCommentId);
			albumCommentPo po = albumCommentDao.selectAlbumCommentById(parentCommentId);
			int replayNumber = po.getReplayNumber();
			po.setReplayNumber(++replayNumber);
			albumCommentDao.updateAlbumCommentById(po);
		}
		albumCommentDao.addComment(albumCommentPo);
		return true;
	}

	@Override
	public void addGoodNumber(HttpServletRequest request, int id) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		albumCommentPo albumCommentPo = albumCommentDao.selectAlbumCommentById(id);
		int goodNumber =albumCommentPo.getGoodNumber();
		albumCommentPo.setGoodNumber(++goodNumber);
		albumCommentDao.updateAlbumCommentById(albumCommentPo);
		UserAlbumCommentStutsPo po = userAlbumCommentStutsDao.selectUserAlbumCommentStuts(mail,id);
		if(po==null) {
			addUserAlbumCommentStuts(request,id,COMMENTSTUTS_TRUE);
		} else {
			updateUserAlbumCommentStuts(request,po,COMMENTSTUTS_TRUE);
		}
	}
	
	@Override
	public void updateUserAlbumCommentStuts(HttpServletRequest request, UserAlbumCommentStutsPo po,String stuts) {
		// TODO Auto-generated method stub
		if(stuts.equals(COMMENTSTUTS_TRUE)) {
			po.setAlbumCommentStuts(COMMENTSTUTS_TRUE);
		} else {
			po.setAlbumCommentStuts(COMMENTSTUTS_FALSE);
		}
		userAlbumCommentStutsDao.updateUserAlbumCommentStuts(po);
	}
	
	@Override
	public void addUserAlbumCommentStuts(HttpServletRequest request, int id,String stuts) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String userName = (String) ss.getAttribute("userName");
		String mail = (String) ss.getAttribute("mail");
		UserAlbumCommentStutsPo userAlbumCommentStutsPo = new UserAlbumCommentStutsPo();//如果登入用户点赞过，是有数据的
		userAlbumCommentStutsPo.setMail(mail);
		userAlbumCommentStutsPo.setUserName(userName);
		userAlbumCommentStutsPo.setAlbumCommentId(id);
		if(stuts.equals(COMMENTSTUTS_TRUE)) {
			userAlbumCommentStutsPo.setAlbumCommentStuts(COMMENTSTUTS_TRUE);
		} else {
			userAlbumCommentStutsPo.setAlbumCommentStuts(COMMENTSTUTS_FALSE);
		}
		userAlbumCommentStutsDao.addUserAlbumCommentStuts(userAlbumCommentStutsPo);
	}

	@Override
	public void reduceGoodNumber(HttpServletRequest request, int id) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		albumCommentPo albumCommentPo = albumCommentDao.selectAlbumCommentById(id);
		int goodNumber =albumCommentPo.getGoodNumber();
		albumCommentPo.setGoodNumber(--goodNumber);
		albumCommentDao.updateAlbumCommentById(albumCommentPo);
		UserAlbumCommentStutsPo po = userAlbumCommentStutsDao.selectUserAlbumCommentStuts(mail,id);
		if(po==null) {
			addUserAlbumCommentStuts(request,id,COMMENTSTUTS_FALSE);
		} else {
			updateUserAlbumCommentStuts(request,po,COMMENTSTUTS_FALSE);
		}
		
	}

	@Override
	public List<albumCommentPo> selectReplayComment(HttpServletRequest request,int id) {
		// TODO Auto-generated method stub
		List<albumCommentPo> resultList = albumCommentDao.selectReplayComment(id);
		resultList = addUserAlbumCommentStutsIntosongCommentPo(request,resultList);
		return resultList;
	}

	@Override
	public void deleteComment(HttpServletRequest request, int id,int parentCommentId) {
		// TODO Auto-generated method stub
		if(parentCommentId != 0) {
			albumCommentPo  po = albumCommentDao.selectAlbumCommentById(parentCommentId);
			int replayNumber = po.getReplayNumber();
			po.setReplayNumber(--replayNumber);
			albumCommentDao.updateAlbumCommentById(po);
		}
		 userAlbumCommentStutsDao.deleteUserAlbumCommentStuts(id);
		deleteAllReplay(id);
		albumCommentDao.deleteCommentById(id);
	}
	
	@Override
	public void deleteAllReplay(int id) {
		// TODO Auto-generated method stub
		List<albumCommentPo> list = albumCommentDao.selectReplayComment(id);
		for (albumCommentPo albumCommentPo : list) {
			userAlbumCommentStutsDao.deleteUserAlbumCommentStuts(albumCommentPo.getId());
		}
		albumCommentDao.deleteAllReplay(id);
	}

	@Override
	public void deleteCommentByAlbumName(String albumName) {
		// TODO Auto-generated method stub
		 List<albumCommentPo> resultList = albumCommentDao.selectAlbumCommentByAlbumName(albumName);
		 for (albumCommentPo albumCommentPo : resultList) {
			 userAlbumCommentStutsDao.deleteUserAlbumCommentStuts(albumCommentPo.getId());
		}
		albumCommentDao.deleteCommentByAlbumName(albumName);
	}

}
