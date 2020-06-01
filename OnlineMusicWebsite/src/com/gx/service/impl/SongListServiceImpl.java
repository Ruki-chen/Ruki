package com.gx.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


























import com.gx.dao.SongDao;
import com.gx.dao.SongListDao;
import com.gx.dao.SongListInformationDao;
import com.gx.po.SongListInformationPo;
import com.gx.po.SongListPo;
import com.gx.po.SongPo;
import com.gx.po.songCommentPo;
import com.gx.service.SongListService;
import com.gx.service.SongService;

@Transactional
@Service(value="songListService")
public class SongListServiceImpl implements SongListService {
	
	@Autowired
	private SongListDao songListDao;
	
	@Autowired
	private SongDao songDao;
	
	@Autowired
	private SongService songService;
	@Autowired
	private SongListInformationDao songListInformationDao;
	
	public static String SONGLIST_SAVE = "收藏";
	public static String SONGLIST_LOAD = "下载";
	public static String SONGLIST_CURRENT = "最近";

	@Override
	public Boolean addSongList(SongListPo songListPo,HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail= (String) ss.getAttribute("mail");
		SongListPo po = songListDao.selectSpecialSongList(mail,songListPo.getSongListName());
		if(po != null) {
			return false;
		}
		songListPo.setMail(mail);
		songListPo.setTime(new java.sql.Timestamp(new Date().getTime()));
		songListDao.addSongList(songListPo);
		return true;
	}

	@Override
	public List<SongListPo> selectUserSongListByMail(String mail) {
		// TODO Auto-generated method stub
		return songListDao.selectUserSongListByMail(mail);
	}

	@Override
	public void saveCurrentPlaySongList(HttpServletRequest request,String songPath) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail= (String) ss.getAttribute("mail");
		SongListPo songListPo = songListDao.selectSpecialSongList(mail, SONGLIST_CURRENT);	
		addSongListInformationPo(mail,songPath,songListPo.getSongListName());
	}

	@Override
	public List<SongListInformationPo> showSongList(HttpServletRequest request,String songListName) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail= (String) ss.getAttribute("mail");
		List<SongListInformationPo> list = songListInformationDao.showSongList(mail,songListName);
		list = insertSongInfroIntoSongListInformation(list);
		list = insertSongStutsIntoSongListInformation(request,list);
		return list;
	}

	@Override
	public List<SongListInformationPo> insertSongStutsIntoSongListInformation(HttpServletRequest request,List<SongListInformationPo> list) {
		// TODO Auto-generated method stub
		List<SongListInformationPo> list2 = new ArrayList<SongListInformationPo>();
		HttpSession ss = request.getSession();
		String mail= (String) ss.getAttribute("mail");
		for (SongListInformationPo songListInformationPo : list) {
			SongListInformationPo po = songListInformationDao.selectSpecialSongListInformation(mail, songListInformationPo.getSongPath(), SONGLIST_SAVE);
		    if(po==null){
		    	songListInformationPo.setSongStuts("false");
		    }else {
		    	songListInformationPo.setSongStuts("true");
			}
		    list2.add(songListInformationPo);
		}
		return list2;
	}

	@Override
	public List<SongListInformationPo> insertSongInfroIntoSongListInformation(List<SongListInformationPo> list) {
		// TODO Auto-generated method stub
		List<SongListInformationPo> list2 = new ArrayList<SongListInformationPo>();
		List<SongPo> songList = new ArrayList<SongPo>();
		 for (SongListInformationPo po : list) {
			SongPo songPo = songDao.selectSongBySongPath(po.getSongPath());
			if(songPo!=null) {
			po.setSingerName(songPo.getSingerName());
			po.setSongName(songPo.getSongName());
			list2.add(po);
			songList.add(songPo);		
			}
		}
		List<String> musicPathList  = songService.getAllMusicPath(songList);
		if(musicPathList.size() != 0) {
			list2.get(0).setMusicPathList(musicPathList);
		}
		return list2;
	}

	@Override
	public void autoCreatSongList(String mail) {
		// TODO Auto-generated method stub
		CreatSongList(SONGLIST_SAVE,mail,SONGLIST_SAVE);
		CreatSongList(SONGLIST_LOAD,mail,SONGLIST_LOAD);
		CreatSongList(SONGLIST_CURRENT,mail,SONGLIST_CURRENT);	
	}
	@Override
	public void CreatSongList(String songListName,String mail,String introduce) {
		// TODO Auto-generated method stub
		SongListPo po  = new SongListPo();
	    po.setIntroduce(introduce);
	    po.setMail(mail);
	    po.setSongListName(songListName);
	    po.setTime(new java.sql.Timestamp(new Date().getTime()));
	    songListDao.addSongList(po);
	   
	}

	@Override
	public void removeMusic(int id) {
		// TODO Auto-generated method stub
		songListInformationDao.deleteSongListInformationbyId(id);
	}

	@Override
	public void clearSongList(HttpServletRequest request, String songListName) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail= (String) ss.getAttribute("mail");
		songListInformationDao.deleteSongListInformation(mail,songListName);
	}

	@Override
	public List<SongPo> insetSongStutsIntoSong(HttpServletRequest request,List<SongPo> list) {
		// TODO Auto-generated method stub
		List<SongPo> list2 = new ArrayList<SongPo>();
		HttpSession ss = request.getSession();
		String mail= (String) ss.getAttribute("mail");
		for (SongPo songPo : list) {
			SongListInformationPo po = songListInformationDao.selectSpecialSongListInformation(mail, songPo.getSongPath(), SONGLIST_SAVE);
		    if(po==null){
		    	songPo.setSongStuts("false");
		    }else {
		    	songPo.setSongStuts("true");
			}
		    list2.add(songPo);
		}
		return list2;
	}

	@Override
	public void joinSaveList(HttpServletRequest request, String songPath) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail= (String) ss.getAttribute("mail");
	   addSongListInformationPo(mail,songPath,SONGLIST_SAVE);	
	}

	@Override
	public  void addSongListInformationPo(String mail, String songPath,String songListName) {
		// TODO Auto-generated method stub
		SongListInformationPo songListInformationPo = songListInformationDao.selectSpecialSongListInformation(mail,songPath,songListName);
		if(songListInformationPo != null) {
			 return;
		}
		SongListInformationPo po  = new SongListInformationPo();
		po.setMail(mail);
		po.setSongListName(songListName);
		po.setSongStuts("true");
		po.setSongPath(songPath);
		po.setTime(new java.sql.Timestamp(new Date().getTime()));
		songListInformationDao.saveCurrentPlaySongList(po);
	}

	@Override
	public void removeSaveList(HttpServletRequest request, String songPath) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail= (String) ss.getAttribute("mail");
		songListInformationDao.deleteSpecialSongListInformation(mail, songPath,SONGLIST_SAVE);
	}

	@Override
	public List<SongListPo> handleUserSongList(List<SongListPo> list) {
		// TODO Auto-generated method stub
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getSongListName().equals(SONGLIST_SAVE)||list.get(i).getSongListName().equals(SONGLIST_LOAD)||list.get(i).getSongListName().equals(SONGLIST_CURRENT)) {
				list.remove(i);
				i--;
			}
		}
		return list;
	}

	@Override
	public void deleteSongList(HttpServletRequest request, String songListName) {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		String mail= (String) ss.getAttribute("mail");
		songListInformationDao.deleteSongListInformation(mail, songListName);
		songListDao.deleteSongList(mail,songListName);
	}

	@Override
	public void deleteSongInSongList(String songPath) {
		// TODO Auto-generated method stub
		songListInformationDao.deleteSongInSongList(songPath);
	}

}
