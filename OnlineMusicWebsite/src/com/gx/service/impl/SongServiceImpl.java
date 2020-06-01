package com.gx.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gx.dao.SingerDao;
import com.gx.dao.SongDao;
import com.gx.page.Page;
import com.gx.po.SingerPo;
import com.gx.po.SongPo;
import com.gx.service.SongCommentService;
import com.gx.service.SongListService;
import com.gx.service.SongService;

@Transactional
@Service(value="songService")
public class SongServiceImpl implements SongService {
	
	@Autowired
	private SongDao songDao;
	
	@Autowired
	private SingerDao singerDao;
	
	@Autowired
	private SongListService songListService;
	
	@Autowired
	private SongCommentService songCommentService;

	@Override
	public Page<SongPo> pageFuzzyselect(HttpServletRequest request,String songName, Page<SongPo> vo) {
		// TODO Auto-generated method stub
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<SongPo> list=songDao.pageFuzzyselect(songName, start, vo.getPageSize());
		//数据是由另一张表提供的，所以用连接查询最可以提高速度，省去自己定义函数，学会在实践中用连接查询
		//可以用歌曲表连接歌曲详细表，用左连接，保留歌曲的，歌曲详细表为空。
		list = songListService.insetSongStutsIntoSong(request,list);
		vo.setResult(list);
		int count=songDao.countFuzzyselect(songName);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public Boolean addSong(SongPo song, MultipartFile songFile,MultipartFile lyricFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		 String songPath =  saveMusic(song,songFile,request);
		 String lyricPath = saveLyric(song,lyricFile,request);
		 song.setSongPath(songPath);
		 song.setLyric(lyricPath);
		 songDao.addSong(song);
		return true;
	}

	@Override
	public String saveMusic(SongPo song, MultipartFile songFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		 String ext = FilenameUtils.getExtension(songFile.getOriginalFilename());
		 String name=song.getSongName();
		 SongPo songpro = songDao.selectSongBySongPath("/music/"+song.getSongName()+"."+ext);
		if(songpro != null)
		{
			name = name + (int)((Math.random()*9+1)*100000)+"";	//避免文件同名
		}
         String url = request.getSession().getServletContext().getRealPath("/music");
         System.out.println(url);
         songFile.transferTo(new File(url+"/"+name + "." + ext));
         String path = "/music/"+name + "." + ext;
		return path;
	}
	
	@Override
	public String saveLyric(SongPo song, MultipartFile lyricFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		 String ext = FilenameUtils.getExtension(lyricFile.getOriginalFilename());
		 String name=song.getSongName();
		 SongPo songpro = songDao.selectSongByLyric("/lyric/"+song.getSongName()+"."+ext);
		if(songpro != null)
		{
			name = name + (int)((Math.random()*9+1)*100000)+"";	//避免文件同名
		}
         String url = request.getSession().getServletContext().getRealPath("/lyric");
         System.out.println(url);
         lyricFile.transferTo(new File(url+"/"+name + "." + ext));
         String path = "/lyric/"+name + "." + ext;
		return path;
	}
	
	

	

	@Override
	public SongPo returnSongById(Integer id) {
		// TODO Auto-generated method stub
		return songDao.returnSongById(id);
	}

	@Override
	public void updateById(SongPo songPo, MultipartFile songFile,MultipartFile lyricFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		if(!songFile.isEmpty())
		{
			String songName = deleteMusic(songPo, request);
			String url = request.getSession().getServletContext().getRealPath("/music");	
			songFile.transferTo(new File(url+"/"+songName));
		}
		if(!lyricFile.isEmpty())
		{
			String lyricName = deleteLyric(songPo, request);
			String url = request.getSession().getServletContext().getRealPath("/lyric");	
			songFile.transferTo(new File(url+"/"+lyricName));
		}
		songDao.updateById(songPo);	
	}

	//归为一个共同部分
	@Override
	public String deleteMusic(SongPo songPo, HttpServletRequest request) {
		// TODO Auto-generated method stub
		 String url = request.getSession().getServletContext().getRealPath("/music");
		 String  songPath =  songPo.getSongPath();
		 String  songName = songPath.substring(7);
		 File oldFile = new File(url+"/"+songName); 
		 oldFile.delete();	
		 return  songName;
	}
	
	@Override
	public String deleteLyric(SongPo songPo, HttpServletRequest request) {
		// TODO Auto-generated method stub
		 String url = request.getSession().getServletContext().getRealPath("/lyric");
		 String  lyric =  songPo.getLyric();
		 String lyricName = lyric.substring(7);
		 File oldFile = new File(url+"/"+lyricName); 
		 oldFile.delete();	
		 return  lyricName;
	}

	@Override
	public void deleteById(Integer id, HttpServletRequest request) {
		// TODO Auto-generated method stub
		SongPo songPo = songDao.returnSongById(id);
		deleteMusic(songPo, request);
		deleteLyric(songPo, request);
		songListService.deleteSongInSongList(songPo.getSongPath());
		songCommentService.deleteCommentBySongName(songPo.getSongName());
		songDao.deleteById(id);
	}

	@Override
	public Page<SongPo> pageFuzzyselectUser(HttpServletRequest request,SongPo song, Page<SongPo> vo) {
		// TODO Auto-generated method stub
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<SongPo> list=songDao.pageFuzzyselectUser(song.getCountry(),song.getSchools(),song.getIsPopular(), song.getYear(),start, vo.getPageSize());
		list = songListService.insetSongStutsIntoSong(request,list);
		vo.setResult(list);
		int count=songDao.countFuzzyselectUser(song.getCountry(),song.getSchools(),song.getIsPopular(),song.getYear());
		vo.setTotal(count);
		return vo;
	}

	@Override
	public List<String> checkLyric(HttpServletRequest request, String songPath) {
		// TODO Auto-generated method stub
		SongPo song = songDao.selectSongBySongPath(songPath);
		 String  lyric =  song.getLyric();
		 String lyricName = lyric.substring(7);
		 String url = request.getSession().getServletContext().getRealPath("/lyric");
		 File  lyricFile = new File(url+"/"+lyricName); 
		 List<String> resultList = new ArrayList<>();
		 try{
	            BufferedReader br = new BufferedReader(new FileReader(lyricFile));
	            String s = null;
	            while((s = br.readLine())!=null){
	                if (!s.equals("")) {
	                    resultList.add(s);
	                } else {
	                    resultList.add("");
	                }
	            }
	            br.close();
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return resultList;

		
		
	}

	@Override
	public SingerPo checkSingerPhotoPathbySongPath(String songPath) {
		// TODO Auto-generated method stub
		SongPo song = songDao.selectSongBySongPath(songPath);
		List<SingerPo> singer = singerDao.pageFuzzyselect(song.getSingerName(), 0, 1);
		SingerPo singerPo = singer.get(0);
		
		return singerPo;
	}

	@Override
	public SongPo selectSongBySongPath(String songPath) {
		// TODO Auto-generated method stub
		SongPo song = songDao.selectSongBySongPath(songPath);
		return song;
	}

	@Override
	public List<String> getAllMusicPath(List<SongPo> result) {
		// TODO Auto-generated method stub
		List<String> musicPathList = new ArrayList<String>();
		if(result!=null&&result.size()!=0) {
            for (SongPo songPo : result) {
    	         musicPathList.add(songPo.getSongPath());
            }
            return musicPathList;
		}
		return musicPathList;
	}

	@Override
	public List<SongPo> getSongListBySongPathList(String[] strs) {
		// TODO Auto-generated method stub
		 List<String>   list= Arrays.asList(strs);
		 List<SongPo> songPoList = new ArrayList<SongPo>();
		 for (String songPath : list) {
			 SongPo  songPo = songDao.selectSongBySongPath(songPath);
			 songPoList.add(songPo);
		}
		return songPoList;
	}

	@Override
	public List<SongPo> selectSongByAlbumName(HttpServletRequest request,String albumName) {
		// TODO Auto-generated method stub	
		List<SongPo> list = songDao.selectSongByAlbumName(albumName);
		list = songListService.insetSongStutsIntoSong(request,list);
		return list;
	}

	@Override
	public List<SongPo> selectSongBySingerName(HttpServletRequest request,String singerName) {
		// TODO Auto-generated method stub
		List<SongPo> list = songDao.selectSongBySingerName(singerName);
		list = songListService.insetSongStutsIntoSong(request,list);
		return list;
	}

	

}
