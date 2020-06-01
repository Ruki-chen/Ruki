package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.po.SongListInformationPo;

public interface SongListInformationDao {

	public SongListInformationPo selectSpecialSongListInformation(@Param("mail")String mail, @Param("songPath")String songPath ,@Param("songListName")String songListName);

	public void saveCurrentPlaySongList(SongListInformationPo po);

	public List<SongListInformationPo> showSongList(@Param("mail")String mail,@Param("songListName")String songListName);

	public void deleteSongListInformationbyId(Integer id);

	public void deleteSongListInformation(@Param("mail")String mail, @Param("songListName")String songListName);

	public void deleteSpecialSongListInformation(@Param("mail")String mail,@Param("songPath")String songPath,@Param("songListName")String songListName);

	public void deleteSongInSongList(String songPath);

}
