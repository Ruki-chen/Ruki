package com.gx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gx.po.SongListInformationPo;
import com.gx.po.SongListPo;
import com.gx.po.SongPo;

public interface SongListService {

	public Boolean addSongList(SongListPo songListPo, HttpServletRequest request);

	public List<SongListPo> selectUserSongListByMail(String mail);

	public void saveCurrentPlaySongList(HttpServletRequest request,String songPath);

	public List<SongListInformationPo> showSongList(HttpServletRequest request,String songListName);

	public List<SongListInformationPo> insertSongInfroIntoSongListInformation(List<SongListInformationPo> list);

	public void autoCreatSongList(String mail);

	public void CreatSongList(String songListName, String mail, String introduce);

	public void removeMusic(int id);

	public void clearSongList(HttpServletRequest request, String songListName);

	public List<SongPo> insetSongStutsIntoSong(HttpServletRequest request, List<SongPo> list);

	public void joinSaveList(HttpServletRequest request, String songPath);

	public void addSongListInformationPo(String mail, String songPath,String songListName);

	public void removeSaveList(HttpServletRequest request, String songPath);

	public List<SongListInformationPo> insertSongStutsIntoSongListInformation(HttpServletRequest request,List<SongListInformationPo> list);

	public List<SongListPo> handleUserSongList(List<SongListPo> list);

	public void deleteSongList(HttpServletRequest request, String songListName);

	public void deleteSongInSongList(String songPath);

}
