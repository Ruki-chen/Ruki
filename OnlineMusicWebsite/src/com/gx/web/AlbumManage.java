package com.gx.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gx.page.Page;
import com.gx.po.AlbumPo;
import com.gx.po.SingerPo;
import com.gx.po.SongPo;
import com.gx.po.attributePo;
import com.gx.service.AlbumService;
import com.gx.service.SingerService;
import com.gx.service.SongService;
import com.gx.service.attributeService;


@Controller
@RequestMapping("/Album")
public class AlbumManage {
	
	@Autowired
	private attributeService attributeService;
	@Autowired
	private AlbumService albumService;
	
	@Autowired
	private SongService songService;
	
	@Autowired
	private SingerService singerService;
	public static String TIPS = "请填入信息";
	
	@RequestMapping("/tolist")
	public ModelAndView tolist(HttpServletRequest request,Integer currentPage,String txtname,String AdminTipe){
		if(AdminTipe==null) {
			AdminTipe="请谨慎操作哦！";
		}	
		ModelAndView mv=null;
		mv=new ModelAndView("/album/list");
		Page<AlbumPo> vo=new Page<AlbumPo>();
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		if(txtname==null)
		{
			txtname="";
		}
		vo.setCurrentPage(currentPage);
		vo=albumService.pageFuzzyselect(txtname, vo);
		mv.addObject("list",vo);
		mv.addObject("txtname",txtname);
		mv.addObject("AdminTipe",AdminTipe);
		return mv;
		
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView mv=null;
		mv=new ModelAndView("/album/add");
		return mv;
	}
	
	@RequestMapping("/add")
	public ModelAndView add(AlbumPo album,MultipartFile albumFile,HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mv = null;
			Boolean registStuts = albumService.addAlbum(album,albumFile,request);
			TIPS = registStuts ? "专辑新增成功" : "该专辑已经注册过了";
			if(registStuts) {
				album = null;
				mv=new ModelAndView("redirect:/Album/tolist.do");
				mv.addObject("AdminTipe","添加成功");
			}
			else{
				mv = new ModelAndView("/album/add");
			}
		
		mv.addObject("TIPS",TIPS);
		mv.addObject("user",album);
		
		return mv;
	}

	@RequestMapping("/toupdate")
	public ModelAndView toupdate(int id){
		ModelAndView mv=null;
		AlbumPo  list=albumService.returnAlbumById(id);
		mv=new ModelAndView("/album/update");
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(AlbumPo album,MultipartFile albumFile,HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mv=null;
		albumService.updateById(album,albumFile,request);
		mv=new ModelAndView("redirect:/Album/tolist.do");
		mv.addObject("AdminTipe","修改成功");
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(String id,HttpServletRequest request) {
		ModelAndView mv = null;
		String[] FenGe = id.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			albumService.deleteById(Integer.parseInt(FenGe[i]),request);
		}
		mv = new ModelAndView("redirect:/Album/tolist.do");
		mv.addObject("AdminTipe","删除成功");
		return mv;
	}
	
	@RequestMapping("/userList")
	public ModelAndView userList(HttpServletRequest request,AlbumPo album,String AdminTipe){
		if(AdminTipe==null) {
			AdminTipe="鼠标点击查询歌名！";
		}	
		ModelAndView mv=null;
		mv=new ModelAndView("/album/userList");
		List<AlbumPo> aList = new ArrayList<AlbumPo>();
//刚开始进来		
		if(album.getSchools()==null&&album.getIsPopular()==null&&album.getCountry()==null)
		{
			String txtname="";
			aList = albumService.notPageFuzzySelect(txtname);
		}
		else if(album.getAlbumName()!=null&&!album.getAlbumName().equals(""))
		{
			String txtname=album.getAlbumName();
			aList = albumService.notPageFuzzySelect(txtname);
		}
		else{
			aList = albumService.notPageFuzzySelectUser(album);
		}
		List<attributePo> countryList = attributeService.selectSpecialList("地区");
		List<attributePo> isPopularList = attributeService.selectSpecialList("是否流行");
		List<attributePo> schoolsList = attributeService.selectSpecialList("流派");
		List<attributePo> yearList = attributeService.selectSpecialList("年份");
		mv.addObject("list",aList);
		mv.addObject("AdminTipe",AdminTipe);
		mv.addObject("countryList",countryList);
		mv.addObject("countryListSize",countryList.size());
		mv.addObject("isPopularList",isPopularList);
		mv.addObject("isPopularListSize",isPopularList.size());
		mv.addObject("schoolsList",schoolsList);
		mv.addObject("schoolsListSize",schoolsList.size());
		mv.addObject("yearList",yearList);
		mv.addObject("yearListSize",yearList.size());
		return mv;
		
	}
	
	@RequestMapping("/checkAlbum")
	public ModelAndView checkAlbum(HttpServletRequest request,int id){
		ModelAndView mv=null;
		mv=new ModelAndView("/album/showAlbum");
		AlbumPo albumPo = albumService.returnAlbumById(id);
		List<SingerPo> singerPo = singerService.selectSingerBySingerName(albumPo.getSingerName());
		List<SongPo> songList = songService.selectSongByAlbumName(request,albumPo.getAlbumName());	
		List<String> musicPathList = songService.getAllMusicPath(songList);
		List<AlbumPo> recommendAlbumList = albumService.selectRecommendAlbum(albumPo);
		mv.addObject("albumPo",albumPo);
		mv.addObject("songList",songList);
		mv.addObject("singerimfo",singerPo.get(0));
		mv.addObject("total",songList.size());
		mv.addObject("musicPathList",musicPathList);
		mv.addObject("recommendAlbumList",recommendAlbumList);
		
		return mv;
		
	}
	
	@RequestMapping("/loadAlbum")
	public ModelAndView loadAlbum(HttpServletRequest request,HttpServletResponse res,int id) throws IOException {
		ModelAndView mv = null;
		   try{
		   AlbumPo albumPo = albumService.returnAlbumById(id);
		    String url = request.getSession().getServletContext().getRealPath("/music");
		    String zipBasePath=request.getSession().getServletContext().getRealPath("/album");  
		    String zipName = albumPo.getAlbumName()+".zip";
		    String zipFilePath = zipBasePath+File.separator+zipName;  
		    OutputStream out = res.getOutputStream();  
		    List<SongPo> songList = songService.selectSongByAlbumName(request,albumPo.getAlbumName());
		    List<String> musicPaths = songService.getAllMusicPath(songList);
		    List<String> filePaths = new ArrayList<String>();  
		    for (String songPath : musicPaths) {
		    	 String  songName = songPath.substring(7);
		    	 String songAllPath = url+"/"+songName;
		    	 filePaths.add(songAllPath);
			}
		    File zip = new File(zipFilePath);  
		    if (!zip.exists()){     
		        zip.createNewFile();     
		    }
		    ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zip));
		    this.zipFile(zipBasePath,zipName, zipFilePath,filePaths,zos);
		    zos.close();
		    String fileName  = new String(zipName.getBytes(), "iso8859-1");
		    res.setHeader("Content-disposition", "attachment;filename="+fileName);//设置下载的压缩文件名称
		    //将打包后的文件写到客户端，输出的方法同上，使用缓冲流输出  
		    BufferedInputStream bis = new BufferedInputStream(new FileInputStream(zipFilePath));  
		    byte[] buff = new byte[bis.available()];  
		    bis.read(buff);
		    bis.close();
			out.write(buff);//输出数据文件
			out.flush();//释放缓存
			out.close();//关闭输出流

	    }catch(Exception e) {
			e.printStackTrace();
			res.reset();
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html;charset=UTF-8"); 
			res.getWriter().print("<div align=\"center\" style=\"font-size: 30px;font-family: serif;color: red;\">系统内部错误，下载未成功，请联系管理员！</div>"
					+ "<div>错误信息："+e.getMessage()+"</div>");
			res.getWriter().flush();
			res.getWriter().close();
		}
			return mv;
	}

private String zipFile(String zipBasePath, String zipName, String zipFilePath, List<String> filePaths,ZipOutputStream zos) throws IOException {
    //循环读取文件路径集合，获取每一个文件的路径  
    for(String filePath : filePaths){  
        File inputFile = new File(filePath);  //根据文件路径创建文件  
        if(inputFile.exists()) { //判断文件是否存在  
            if (inputFile.isFile()) {  //判断是否属于文件，还是文件夹  
                //创建输入流读取文件  
                BufferedInputStream bis = new BufferedInputStream(new FileInputStream(inputFile));  
                //将文件写入zip内，即将文件进行打包  
                zos.putNextEntry(new ZipEntry(inputFile.getName()));  
                //写入文件的方法，同上                  
                int size = 0;  
                byte[] buffer = new byte[1024];  //设置读取数据缓存大小
                while ((size = bis.read(buffer)) > 0) {  
                	zos.write(buffer, 0, size);  
                }  
                //关闭输入输出流  
                zos.closeEntry();  
                bis.close();                
            } else {  //如果是文件夹，则使用穷举的方法获取文件，写入zip  
                try {  
                    File[] files = inputFile.listFiles();  
                    List<String> filePathsTem = new ArrayList<String>();  
                    for (File fileTem:files) {  
                    	filePathsTem.add(fileTem.toString());
                    }  
                    return zipFile(zipBasePath, zipName, zipFilePath, filePathsTem,zos);
                } catch (Exception e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
    }  
    return null;
} 

}
