package com.gx.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.gx.page.Page;
import com.gx.po.SingerPo;
import com.gx.po.SongPo;

public interface SongService {

	public Page<SongPo> pageFuzzyselect(HttpServletRequest request, String songName, Page<SongPo> vo);

	public Boolean addSong(SongPo song, MultipartFile songFile,MultipartFile lyricFile,HttpServletRequest request) throws IllegalStateException, IOException;

	public String saveMusic(SongPo song, MultipartFile songFile,HttpServletRequest request) throws IllegalStateException,	IOException;

	public SongPo returnSongById(Integer id);

	public void updateById(SongPo songPo, MultipartFile songFile,MultipartFile lyricFile, HttpServletRequest request) throws IllegalStateException, IOException;

	public String deleteMusic(SongPo songPo, HttpServletRequest request);

	public void deleteById(Integer id, HttpServletRequest request);

	public	String saveLyric(SongPo song, MultipartFile lyricFile,	HttpServletRequest request) throws IllegalStateException, IOException;

	public String deleteLyric(SongPo songPo, HttpServletRequest request);

	public Page<SongPo> pageFuzzyselectUser(HttpServletRequest request, SongPo song, Page<SongPo> vo);

	public List<String> checkLyric(HttpServletRequest request, String songPath);

	public SingerPo checkSingerPhotoPathbySongPath(String songPath);

	public SongPo selectSongBySongPath(String songPath);

	public List<String> getAllMusicPath(List<SongPo> result);

	public List<SongPo> getSongListBySongPathList(String[] strs);

	public List<SongPo> selectSongByAlbumName(HttpServletRequest request, String albumName);

	public List<SongPo> selectSongBySingerName(HttpServletRequest request,String singerName);

	

}
