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

import com.gx.dao.AlbumDao;
import com.gx.page.Page;
import com.gx.po.AlbumPo;
import com.gx.service.AlbumCommentService;
import com.gx.service.AlbumService;

@Transactional
@Service(value="albumService")
public class AlbumServiceImpl implements AlbumService {
	
	@Autowired
	private AlbumDao albumDao;
	
	@Autowired
	private AlbumCommentService albumCommentService;

	@Override
	public Page<AlbumPo> pageFuzzyselect(String albumName, Page<AlbumPo> vo) {
		// TODO Auto-generated method stub
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<AlbumPo> list=albumDao.pageFuzzyselect(albumName, start, vo.getPageSize());
		vo.setResult(list);
		int count=albumDao.countFuzzyselect(albumName);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public Boolean addAlbum(AlbumPo album, MultipartFile albumFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		 String path =  savePhoto(album, albumFile,request);
		 album.setAlbumPhotoPath(path);
		 albumDao.addAlbum(album);
		return true;
	}

	@Override
	public String savePhoto(AlbumPo album, MultipartFile albumFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		String ext = FilenameUtils.getExtension(albumFile.getOriginalFilename());
		 String name=album.getAlbumName();
		 AlbumPo  albumpro = albumDao.selectAlbumByAlbumPhotoPath("/album/"+album.getAlbumName()+"."+ext);
		if(albumpro != null)
		{
			name = name + (int)((Math.random()*9+1)*100000)+"";	
		}
        String url = request.getSession().getServletContext().getRealPath("/album");
        System.out.println(url);
        albumFile.transferTo(new File(url+"/"+name + "." + ext));
        String path = "/album/"+name + "." + ext;
		return path;
	}

	@Override
	public AlbumPo returnAlbumById(Integer id) {
		// TODO Auto-generated method stub
		return albumDao.returnAlbumById(id);
	}

	@Override
	public void updateById(AlbumPo album, MultipartFile albumFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		if(!albumFile.isEmpty())
		{
			String photoName = deletePhoto(album, request);
			String url = request.getSession().getServletContext().getRealPath("/album");	
			albumFile.transferTo(new File(url+"/"+photoName));
		}
		albumDao.updateById(album);	
	}
	
	@Override
	public String deletePhoto(AlbumPo album, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String url = request.getSession().getServletContext().getRealPath("/album");
		 String  albumPhotoPath =  album.getAlbumPhotoPath();
		 String photoName = albumPhotoPath.substring(7);
		File oldFile = new File(url+"/"+photoName); 
		oldFile.delete();	
		return  photoName;
	}

	@Override
	public void deleteById(Integer id, HttpServletRequest request) {
		// TODO Auto-generated method stub
		AlbumPo album = albumDao.returnAlbumById(id);
		deletePhoto(album, request);
		albumCommentService.deleteCommentByAlbumName(album.getAlbumName());
		albumDao.deleteById(id);
	}

	@Override
	public List<AlbumPo> notPageFuzzySelect(String albumName) {
		// TODO Auto-generated method stub
		return albumDao.notPageFuzzySelect(albumName);
	}

	@Override
	public List<AlbumPo> notPageFuzzySelectUser(AlbumPo album) {
		// TODO Auto-generated method stub
		return albumDao.notPageFuzzySelectUser(album);
	}

	@Override
	public List<AlbumPo> selectRecommendAlbum(AlbumPo albumPo) {
		// TODO Auto-generated method stub
		List<AlbumPo> recommendAlbumList = albumDao.selectAlbumBySingerName(albumPo.getSingerName());
		for(int i=0;i<recommendAlbumList.size();i++) {
			if(recommendAlbumList.get(i).getAlbumName().equals(albumPo.getAlbumName())) {
				recommendAlbumList.remove(i);
				i--;
			}
		}
		return recommendAlbumList;
	}

	@Override
	public List<AlbumPo> selectAlbumBySingerName(String singerName) {
		// TODO Auto-generated method stub
		return albumDao.selectAlbumBySingerName(singerName);
	}
	
	
	

}
