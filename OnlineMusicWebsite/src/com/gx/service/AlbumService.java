package com.gx.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.gx.page.Page;
import com.gx.po.AlbumPo;

public interface AlbumService {

	public Page<AlbumPo> pageFuzzyselect(String albumName, Page<AlbumPo> vo);

	public Boolean addAlbum(AlbumPo album, MultipartFile albumFile,HttpServletRequest request) throws IllegalStateException, IOException;

	public String savePhoto(AlbumPo album, MultipartFile albumFile,HttpServletRequest request) throws IllegalStateException, IOException;

	public AlbumPo returnAlbumById(Integer id);

	public void updateById(AlbumPo album, MultipartFile albumFile,HttpServletRequest request) throws IllegalStateException, IOException;

	public String deletePhoto(AlbumPo album, HttpServletRequest request);

	public void deleteById(Integer id, HttpServletRequest request);

	public List<AlbumPo> notPageFuzzySelect(String albumName);

	public List<AlbumPo> notPageFuzzySelectUser(AlbumPo album);

	public List<AlbumPo> selectRecommendAlbum(AlbumPo albumPo);

	public List<AlbumPo> selectAlbumBySingerName(String singerName);

}
