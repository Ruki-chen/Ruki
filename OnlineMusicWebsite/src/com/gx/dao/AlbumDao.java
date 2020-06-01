package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.po.AlbumPo;


public interface AlbumDao {

	//分页模糊查询
    public List<AlbumPo> pageFuzzyselect(@Param("albumName")String albumName,
    		@Param("start")int start,@Param("pageSize")int pageSize);

    //分页模糊查询总条数
    public int countFuzzyselect(@Param("albumName")String albumName);

	public void addAlbum(AlbumPo album);

	public AlbumPo selectAlbumByAlbumPhotoPath(String albumPhotoPath);

	public AlbumPo returnAlbumById(Integer id);

	public void updateById(AlbumPo album);

	public void deleteById(Integer id);

	public List<AlbumPo> notPageFuzzySelect(String albumName);

	public List<AlbumPo> notPageFuzzySelectUser(AlbumPo album);

	public List<AlbumPo> selectAlbumBySingerName(String singerName); 


}
