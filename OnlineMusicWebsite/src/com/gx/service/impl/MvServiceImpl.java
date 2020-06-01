package com.gx.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;





import org.springframework.web.multipart.MultipartFile;

import com.gx.dao.MvDao;
import com.gx.page.Page;
import com.gx.po.AlbumPo;
import com.gx.po.MvPo;
import com.gx.po.SongPo;
import com.gx.service.MvCommentService;
import com.gx.service.MvService;


@Transactional
@Service(value="mvService")
public class MvServiceImpl implements MvService {
	
	@Autowired
	private MvDao mvDao;
	
	@Autowired
	private MvCommentService mvCommentService;

	@Override
	public Page<MvPo> pageFuzzyselect(String mvName, Page<MvPo> vo) {
		// TODO Auto-generated method stub
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<MvPo> list=mvDao.pageFuzzyselect(mvName, start, vo.getPageSize());
		vo.setResult(list);
		int count=mvDao.countFuzzyselect(mvName);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public Boolean addMv(MvPo mvPo, MultipartFile mvFile,MultipartFile mvPhotoFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		 String path =  saveMv(mvPo, mvFile,request);
		 String mvPhoto = saveMvPhoto(mvPo, mvPhotoFile,request);
		 mvPo.setMvPath(path);
		 mvPo.setMvPhotoPath(mvPhoto);
		 mvDao.addMv(mvPo);
		return true;
	}

	@Override
	public String saveMvPhoto(MvPo mvPo, MultipartFile mvPhotoFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		String ext = FilenameUtils.getExtension(mvPhotoFile.getOriginalFilename());
		 String name=mvPo.getMvName();
		 MvPo mv = mvDao.selectMvByMvPhotoPath("/mv/"+mvPo.getMvName()+"."+ext);
		if(mv != null)
		{
			name = name + (int)((Math.random()*9+1)*100000)+"";	
		}
      String url = request.getSession().getServletContext().getRealPath("/mv");
      System.out.println(url);
      mvPhotoFile.transferTo(new File(url+"/"+name + "." + ext));
      String path = "/mv/"+name + "." + ext;
		return path;
	}

	@Override
	public String saveMv(MvPo mvPo, MultipartFile mvFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		String ext = FilenameUtils.getExtension(mvFile.getOriginalFilename());
		 String name=mvPo.getMvName();
		 MvPo mv = mvDao.selectMvByMvPath("/mv/"+mvPo.getMvName()+"."+ext);
		if(mv != null)
		{
			name = name + (int)((Math.random()*9+1)*100000)+"";	
		}
       String url = request.getSession().getServletContext().getRealPath("/mv");
       System.out.println(url);
       mvFile.transferTo(new File(url+"/"+name + "." + ext));
       String path = "/mv/"+name + "." + ext;
		return path;
	}

	@Override
	public MvPo returnMvById(Integer id) {
		// TODO Auto-generated method stub
		return mvDao.returnMvById(id);
	}

	@Override
	public void updateById(MvPo mvPo, MultipartFile mvFile,MultipartFile mvPhotoFile,HttpServletRequest request) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		if(!mvFile.isEmpty())
		{
			String mvName = deleteMv(mvPo, request);
			String url = request.getSession().getServletContext().getRealPath("/mv");	
			mvFile.transferTo(new File(url+"/"+mvName));
		}
		if(!mvPhotoFile.isEmpty())
		{
			String mvPhotoName = deleteMvPhoto(mvPo, request);
			String url = request.getSession().getServletContext().getRealPath("/mv");	
			mvFile.transferTo(new File(url+"/"+mvPhotoName));
		}
		mvDao.updateById(mvPo);	
	}

	@Override
	public String deleteMvPhoto(MvPo mvPo, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String url = request.getSession().getServletContext().getRealPath("/mv");
		 String  mvPhotoPath =  mvPo.getMvPhotoPath();
		 String mvPhotoName = mvPhotoPath.substring(4);
		File oldFile = new File(url+"/"+mvPhotoName); 
		oldFile.delete();	
		return  mvPhotoName;
	}

	@Override
	public String deleteMv(MvPo mvPo, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String url = request.getSession().getServletContext().getRealPath("/mv");
		 String  mvPath =  mvPo.getMvPath();
		 String mvName = mvPath.substring(4);
		File oldFile = new File(url+"/"+mvName); 
		oldFile.delete();	
		return  mvName;
	}

	@Override
	public void deleteById(Integer id, HttpServletRequest request) {
		// TODO Auto-generated method stub
		MvPo mvPo = mvDao.returnMvById(id);
		deleteMv(mvPo, request);
		deleteMvPhoto(mvPo, request);
		mvCommentService.deleteCommentByMvName(mvPo.getMvName());
		mvDao.deleteById(id);
	}

	@Override
	public List<MvPo> notPageFuzzySelect(String mvName) {
		// TODO Auto-generated method stub
		return mvDao.notPageFuzzySelect(mvName);
	}

	@Override
	public List<MvPo> notPageFuzzySelectUser(MvPo mvpo) {
		// TODO Auto-generated method stub
		return mvDao.notPageFuzzySelectUser(mvpo);
	}

	@Override
	public List<MvPo> selectRecommendMv(MvPo mvpo) {
		// TODO Auto-generated method stub
		List<MvPo> recommendAlbumList = mvDao.selectMvBySingerName(mvpo.getSingerName());
		for(int i=0;i<recommendAlbumList.size();i++) {
			if(recommendAlbumList.get(i).getMvName().equals(mvpo.getMvName())) {
				recommendAlbumList.remove(i);
				i--;
			}
		}
		return recommendAlbumList;
	}

	@Override
	public List<Integer> getAllMvId(MvPo mvpo) {
		// TODO Auto-generated method stub
		List<MvPo> recommendAlbumList = mvDao.selectMvBySingerName(mvpo.getSingerName());
		List<Integer> mvIdList = new ArrayList<Integer>();
		if(recommendAlbumList!=null&&recommendAlbumList.size()!=0) {
            for (MvPo mvpo2 : recommendAlbumList) {
            	mvIdList.add(mvpo2.getId());
            }
            return mvIdList;
		}
		return mvIdList;
	}

	@Override
	public List<MvPo> selectMvBySingerName(String singerName) {
		// TODO Auto-generated method stub
		return mvDao.selectMvBySingerName(singerName);
	}
	

}
