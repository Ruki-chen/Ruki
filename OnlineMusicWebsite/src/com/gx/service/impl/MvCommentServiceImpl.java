package com.gx.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

















import com.gx.dao.MvCommentDao;
import com.gx.dao.MvDao;
import com.gx.dao.UserAlbumCommentStutsDao;
import com.gx.dao.UserMvCommentStutsDao;
import com.gx.po.MvCommentPo;
import com.gx.po.MvPo;
import com.gx.po.UserAlbumCommentStutsPo;
import com.gx.po.UserMvCommentStutsPo;
import com.gx.po.albumCommentPo;
import com.gx.po.songCommentPo;
import com.gx.service.MvCommentService;

@Transactional
@Service(value="mvCommentService")
public class MvCommentServiceImpl implements MvCommentService {
	
	@Autowired
	private MvCommentDao mvCommentDao;
	
	@Autowired
	private MvDao mvDao;
	
	@Autowired
	private UserMvCommentStutsDao userMvCommentStutsDao;
	
	public static String COMMENTSTUTS_TRUE = "true";
	public static String COMMENTSTUTS_FALSE = "false";
	
	@Override
	public List<MvCommentPo> showComment(HttpServletRequest request, int id) {
		// TODO Auto-generated method stub
		MvPo po = mvDao.returnMvById(id);
		 List<MvCommentPo> resultList = mvCommentDao.selectMvCommentByMvName(po.getMvName());
			resultList = addUserMvCommentStutsIntoMvCommentPo(request,resultList);
			return resultList;
	}
	
	@Override
	public List<MvCommentPo> addUserMvCommentStutsIntoMvCommentPo(HttpServletRequest request,List<MvCommentPo> resultList) {
		// TODO Auto-generated method stub
		List<MvCommentPo> list = new ArrayList<MvCommentPo>();
		int i = 0;
		for (MvCommentPo mvCommentPo : resultList) {
			String mvCommentStuts = selectUserMvCommentStuts(request,resultList,i);
			mvCommentPo.setMvCommentStuts(mvCommentStuts);
			list.add(mvCommentPo);
			i++;
		}
		return list;
	}
	
	@Override
	public String selectUserMvCommentStuts(HttpServletRequest request,List<MvCommentPo> resultList,int i) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		List<String> stutsList = new ArrayList<String>();
		for (MvCommentPo mvCommentPo : resultList) {
			UserMvCommentStutsPo po = userMvCommentStutsDao.selectUserMvCommentStuts(mail,mvCommentPo.getId());
			if(po==null||po.getMvCommentStuts().equals(COMMENTSTUTS_FALSE)) {
				stutsList.add(COMMENTSTUTS_FALSE);
			} else {
				stutsList.add(COMMENTSTUTS_TRUE);
			}
		}		
		return stutsList.get(i);
	}

	@Override
	public boolean addComment(HttpServletRequest request, String userComment,int id, int parentCommentId) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String userName = (String) ss.getAttribute("userName");
		String mail = (String) ss.getAttribute("mail");
		if(userName==null||userName.equals("")) {
			return false;
		}
		MvPo mvPo = mvDao.returnMvById(id);
		MvCommentPo mvCommentPo =new MvCommentPo();
		mvCommentPo.setUserComment(userComment);
		mvCommentPo.setUserName(userName);
		mvCommentPo.setMail(mail);
		mvCommentPo.setGoodNumber(0);//第一次发，点赞最初肯定为空
		mvCommentPo.setReplayNumber(0);
		mvCommentPo.setTime(new java.sql.Timestamp(new Date().getTime()));
		mvCommentPo.setMvName(mvPo.getMvName());
		if(parentCommentId!=0) {
			mvCommentPo.setParentCommentId(parentCommentId);
			MvCommentPo po = mvCommentDao.selectMvCommentById(parentCommentId);
			int replayNumber = po.getReplayNumber();
			po.setReplayNumber(++replayNumber);
			mvCommentDao.updateMvCommentById(po);
		}
		mvCommentDao.addComment(mvCommentPo);
		return true;
	}

	@Override
	public void addGoodNumber(HttpServletRequest request, int id) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		MvCommentPo mvCommentPo = mvCommentDao.selectMvCommentById(id);
		int goodNumber =mvCommentPo.getGoodNumber();
		mvCommentPo.setGoodNumber(++goodNumber);
		mvCommentDao.updateMvCommentById(mvCommentPo);
		UserMvCommentStutsPo po = userMvCommentStutsDao.selectUserMvCommentStuts(mail,id);
		if(po==null) {
			addUserMvCommentStuts(request,id,COMMENTSTUTS_TRUE);
		} else {
			updateUserMvCommentStuts(request,po,COMMENTSTUTS_TRUE);
		}
	}
	
	@Override
	public void updateUserMvCommentStuts(HttpServletRequest request,UserMvCommentStutsPo po, String stuts) {
		// TODO Auto-generated method stub
		if(stuts.equals(COMMENTSTUTS_TRUE)) {
			po.setMvCommentStuts(COMMENTSTUTS_TRUE);
		} else {
			po.setMvCommentStuts(COMMENTSTUTS_FALSE);
		}
		userMvCommentStutsDao.updateUserMvCommentStuts(po);
	}

	@Override
	public void addUserMvCommentStuts(HttpServletRequest request, int id,String stuts) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String userName = (String) ss.getAttribute("userName");
		String mail = (String) ss.getAttribute("mail");
		UserMvCommentStutsPo userMvCommentStutsPo = new UserMvCommentStutsPo();//如果登入用户点赞过，是有数据的
		userMvCommentStutsPo.setMail(mail);
		userMvCommentStutsPo.setUserName(userName);
		userMvCommentStutsPo.setMvCommentId(id);
		if(stuts.equals(COMMENTSTUTS_TRUE)) {
			userMvCommentStutsPo.setMvCommentStuts(COMMENTSTUTS_TRUE);
		} else {
			userMvCommentStutsPo.setMvCommentStuts(COMMENTSTUTS_FALSE);
		}
		userMvCommentStutsDao.addUserMvCommentStuts(userMvCommentStutsPo);
	}

	@Override
	public void reduceGoodNumber(HttpServletRequest request, int id) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail = (String) ss.getAttribute("mail");
		MvCommentPo mvCommentPo = mvCommentDao.selectMvCommentById(id);
		int goodNumber =mvCommentPo.getGoodNumber();
		mvCommentPo.setGoodNumber(--goodNumber);
		mvCommentDao.updateMvCommentById(mvCommentPo);
		UserMvCommentStutsPo po = userMvCommentStutsDao.selectUserMvCommentStuts(mail,id);
		if(po==null) {
			addUserMvCommentStuts(request,id,COMMENTSTUTS_FALSE);
		} else {
			updateUserMvCommentStuts(request,po,COMMENTSTUTS_FALSE);
		}
	}

	@Override
	public List<MvCommentPo> selectReplayComment(HttpServletRequest request,int id) {
		// TODO Auto-generated method stub
		List<MvCommentPo> resultList = mvCommentDao.selectReplayComment(id);
		resultList = addUserMvCommentStutsIntoMvCommentPo(request,resultList);
		return resultList;
	}

	@Override
	public void deleteComment(HttpServletRequest request, int id,int parentCommentId) {
		// TODO Auto-generated method stub
		if(parentCommentId != 0) {
			MvCommentPo  po = mvCommentDao.selectMvCommentById(parentCommentId);
			int replayNumber = po.getReplayNumber();
			po.setReplayNumber(--replayNumber);
			mvCommentDao.updateMvCommentById(po);
		}
		userMvCommentStutsDao.deleteUserMvCommentStuts(id);
		deleteAllReplay(id);
		mvCommentDao.deleteCommentById(id);
	}
	
	@Override
	public void deleteAllReplay(int id) {
		// TODO Auto-generated method stub
		List<MvCommentPo> list = mvCommentDao.selectReplayComment(id);
		for (MvCommentPo mvCommentPo : list) {
			userMvCommentStutsDao.deleteUserMvCommentStuts(mvCommentPo.getId());
		}
		mvCommentDao.deleteAllReplay(id);
	}

	@Override
	public void deleteCommentByMvName(String mvName) {
		// TODO Auto-generated method stub
		List<MvCommentPo> list = mvCommentDao.selectMvCommentByMvName(mvName);
		for (MvCommentPo mvCommentPo : list) {
			userMvCommentStutsDao.deleteUserMvCommentStuts(mvCommentPo.getId());
		}
		mvCommentDao.deleteCommentByMvName(mvName);
	}

}
