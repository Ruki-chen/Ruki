package com.gx.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.gx.page.Page;
import com.gx.po.MvPo;

public interface MvService {

	public Page<MvPo> pageFuzzyselect(String mvName, Page<MvPo> vo);

	public Boolean addMv(MvPo mvPo, MultipartFile mvFile,MultipartFile mvPhotoFile, HttpServletRequest request) throws IllegalStateException, IOException;

	public String saveMv(MvPo mvPo, MultipartFile mvFile, HttpServletRequest request) throws IllegalStateException, IOException;

	public MvPo returnMvById(Integer id);

	public void updateById(MvPo mvPo, MultipartFile mvFile,MultipartFile mvPhotoFile, HttpServletRequest request) throws IllegalStateException, IOException;

	public String deleteMv(MvPo mvPo, HttpServletRequest request);

	public void deleteById(Integer id, HttpServletRequest request);

	public List<MvPo> notPageFuzzySelect(String mvName);

	public List<MvPo> notPageFuzzySelectUser(MvPo mvpo);

	public String saveMvPhoto(MvPo mvPo, MultipartFile mvPhotoFile,HttpServletRequest request) throws IllegalStateException, IOException;

	public String deleteMvPhoto(MvPo mvPo, HttpServletRequest request);

	public List<MvPo> selectRecommendMv(MvPo mvpo);

	public List<Integer> getAllMvId(MvPo mvpo);

	public List<MvPo> selectMvBySingerName(String singerName);

}
