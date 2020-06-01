package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.po.SongListPo;

public interface SongListDao {

	public SongListPo selectSpecialSongList(@Param("mail")String mail,@Param("songListName")String songListName);

	public void addSongList(SongListPo songListPo);

	public List<SongListPo> selectUserSongListByMail(String mail);

	public void deleteSongList(@Param("mail")String mail,@Param("songListName")String songListName);

}
