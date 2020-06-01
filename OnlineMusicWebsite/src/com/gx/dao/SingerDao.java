package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;





import com.gx.po.SingerPo;




public interface SingerDao {
	//分页模糊查询
    public List<SingerPo> pageFuzzyselect(@Param("singerName")String singerName,
    		@Param("start")int start,@Param("pageSize")int pageSize);

  //分页模糊查询总条数
    public int countFuzzyselect(@Param("singerName")String singerName);
    
    public void addSinger(SingerPo singer);
    
    public SingerPo selectSingerByPhotoPath(String photoPath);

	public SingerPo returnSingerById(Integer id);
	
	public int updateById(SingerPo singer);

	public void deleteById(Integer id);

	public List<SingerPo> selectSingerBySingerName(String singerName);

	public List<SingerPo> notPageFuzzySelectUser(SingerPo singerPo);


}
