package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.po.SingerPo;
import com.gx.po.SongPo;

public interface SongDao {

	//分页模糊查询
    public List<SongPo> pageFuzzyselect(@Param("songName")String songName,
    		@Param("start")int start,@Param("pageSize")int pageSize);

    //分页模糊查询总条数
    public int countFuzzyselect(@Param("songName")String songName);

	public SongPo selectSongBySongPath(String songPath);

	public void addSong(SongPo song);

	public SongPo returnSongById(Integer id);

	public void updateById(SongPo songPo);

	public void deleteById(Integer id);

	public SongPo selectSongByLyric(String lyric);


	public List<SongPo> pageFuzzyselectUser(@Param("country")String country,@Param("schools")String schools,@Param("isPopular")String isPopular,@Param("year")String year, @Param("start")int start, @Param("pageSize")int pageSize);

	public int countFuzzyselectUser(@Param("country")String country,@Param("schools")String schools,@Param("isPopular")String isPopular,@Param("year")String year);

	public List<SongPo> selectSongByAlbumName(String albumName);

	public List<SongPo> selectSongBySingerName(String singerName);



}
