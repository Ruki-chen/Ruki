package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.po.AlbumPo;
import com.gx.po.MvPo;



public interface MvDao {
	
	//分页模糊查询
    public List<MvPo> pageFuzzyselect(@Param("mvName")String mvName,
    		@Param("start")int start,@Param("pageSize")int pageSize);

    //分页模糊查询总条数
    public int countFuzzyselect(@Param("mvName")String mvName);

	public MvPo selectMvByMvPath(String mvPath);

	public void addMv(MvPo mvPo);

	public MvPo returnMvById(Integer id);

	public void updateById(MvPo mvPo);

	public void deleteById(Integer id);

	public List<MvPo> notPageFuzzySelect(String mvName);

	public List<MvPo> notPageFuzzySelectUser(MvPo mvpo);

	public MvPo selectMvByMvPhotoPath(String mvPhotoPath);

	public List<MvPo> selectRecommendMv(MvPo mvpo);

	public List<MvPo> selectMvBySingerName(String singerName);

}
