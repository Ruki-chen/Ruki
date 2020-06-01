package com.gx.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import org.springframework.web.multipart.MultipartFile;

import com.gx.dao.SingerDao;
import com.gx.page.Page;
import com.gx.po.SingerPo;
import com.gx.service.SingerService;

@Transactional
@Service(value="singerService")
public class SingerServiceImpl implements SingerService {
	
	@Autowired
	private SingerDao singerDao;
	@Override
	public Page<SingerPo> pageFuzzyselect(String singerName, Page<SingerPo> vo) {
		// TODO Auto-generated method stub
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<SingerPo> list=singerDao.pageFuzzyselect(singerName, start, vo.getPageSize());
		vo.setResult(list);
		int count=singerDao.countFuzzyselect(singerName);
		vo.setTotal(count);
		return vo;
	}
	@Override
	public boolean addSinger(SingerPo singer, MultipartFile pictureFile,HttpServletRequest request) throws  IllegalStateException, IOException {
		// TODO Auto-generated method stub
		 String path =  savePhoto(singer, pictureFile,request);
         singer.setPhotoPath(path);
         singerDao.addSinger(singer);
		return true;
	}
	@Override
	public SingerPo returnSingerById(Integer id) {
		// TODO Auto-generated method stub
		return singerDao.returnSingerById(id);
	}
	@Override
	public void updateById(SingerPo singer, MultipartFile pictureFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		if(!pictureFile.isEmpty())
		{
			String photoName = deletePhoto(singer, request);
			String url = request.getSession().getServletContext().getRealPath("/img");	
			 pictureFile.transferTo(new File(url+"/"+photoName));
		}
		singerDao.updateById(singer);	
	}
	@Override
	public String savePhoto(SingerPo singer, MultipartFile pictureFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		 String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		 String name=singer.getSingerName();
		 SingerPo singerpro = singerDao.selectSingerByPhotoPath("/img/"+singer.getSingerName()+"."+ext);
		if(singerpro != null)
		{
			name = name + (int)((Math.random()*9+1)*100000)+"";	
		}
         String url = request.getSession().getServletContext().getRealPath("/img");
         System.out.println(url);
         pictureFile.transferTo(new File(url+"/"+name + "." + ext));
         String path = "/img/"+name + "." + ext;
		return path;
	}
	
	@Override
	public void deleteById(Integer id,HttpServletRequest request) {
		// TODO Auto-generated method stub
		SingerPo singer = singerDao.returnSingerById(id);
		deletePhoto(singer, request);
		singerDao.deleteById(id);
		
	}
	@Override
	public String deletePhoto(SingerPo singer, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String url = request.getSession().getServletContext().getRealPath("/img");
		 String  photoPath =  singer.getPhotoPath();
		 String photoName = photoPath.substring(5);
		File oldFile = new File(url+"/"+photoName); 
		oldFile.delete();	
		return  photoName;
	}
	@Override
	public List<SingerPo> selectSingerBySingerName(String singerName) {
		// TODO Auto-generated method stub
		return singerDao.selectSingerBySingerName(singerName);
	}
	@Override
	public List<SingerPo> notPageFuzzySelectUser(SingerPo singerPo) {
		// TODO Auto-generated method stub
		return singerDao.notPageFuzzySelectUser(singerPo);
	}
	
}
