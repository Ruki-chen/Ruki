package com.gx.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.gx.page.Page;
import com.gx.po.SingerPo;


public interface SingerService {
	
	public Page<SingerPo> pageFuzzyselect(String singerName,Page<SingerPo> vo);
	
	public boolean addSinger(SingerPo singer,MultipartFile pictureFile,HttpServletRequest request) throws IllegalStateException, IOException;

	public SingerPo returnSingerById(Integer id);

	public void updateById(SingerPo singer, MultipartFile pictureFile,HttpServletRequest request) throws IllegalStateException, IOException;
	
	public String savePhoto(SingerPo singer, MultipartFile pictureFile,HttpServletRequest request) throws IllegalStateException, IOException;
	
	public String deletePhoto(SingerPo singer,HttpServletRequest request);

	public void deleteById(Integer id, HttpServletRequest request);

	public List<SingerPo> selectSingerBySingerName(String singerName);

	public List<SingerPo> notPageFuzzySelectUser(SingerPo singerPo);

}
