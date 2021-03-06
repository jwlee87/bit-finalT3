package kr.co.coily.file.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.coily.file.service.FileService;
import kr.co.coily.repository.vo.FileItemVO;

@RequestMapping("/upload")
@Controller
public class FileController {
	
	@Autowired
	FileService fs;
	
	@RequestMapping("/fileTest.do")
	public String fileForm() throws Exception {
		return "upload/fileTest";
	}
	
	
	@RequestMapping("/writeForm.do")
	public String writeForm() throws Exception {
		return "upload/fileForm";
	}
	
	@RequestMapping("/save.do")
	public void saveFile(MultipartHttpServletRequest mRequest, HttpServletResponse response) throws Exception {
		System.out.println("컨트롤러!!!");
		
		ServletContext context = mRequest.getServletContext();
		String path = context.getRealPath("/upload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		String savePath = path + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		
		List<FileItemVO> lFile = new ArrayList<> ();
		
//		Iterator<String> itr =  mRequest.getFileNames();
		List<MultipartFile> lRequest = mRequest.getFiles("upload");
		
		
		for(MultipartFile file: lRequest) {
			
//		while(itr.hasNext()) {
			String oriName = file.getOriginalFilename();
			System.out.println("오리지널네임" + oriName);
	
			if (oriName != null && !oriName.equals("")) {
				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치 
				int index = oriName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriName.substring(index);
				}
				
				// 파일 사이즈
				long fileSize = file.getSize();
				System.out.println("파일 사이즈 : " + fileSize);
				
				// 고유한 파일명 만들기	
				String systemName = "mlec-" + UUID.randomUUID().toString() + ext;
				System.out.println("저장할 파일명 : " + systemName);
			
				// 임시저장된 파일을 원하는 경로에 저장
//				File file = new File(savePath + "/" + systemName);
				file.transferTo(new File(savePath + "/" + systemName));
							
				FileItemVO fileItem = new FileItemVO();
				fileItem.setFileType("card");
				fileItem.setFileRefNo(Integer.parseInt(mRequest.getParameter("cardNo")));
				fileItem.setFileOriName(oriName);
				fileItem.setFileSysName(systemName);
				fileItem.setFilePath(datePath);
				fileItem.setFileSize(1024);
				fileItem.setFileExt(ext);
				lFile.add(fileItem);
			}
		}
		
		if(fs.selectEmptyCard(Integer.parseInt(mRequest.getParameter("cardNo"))) == 0)
			fs.insertCardEmpty(Integer.parseInt(mRequest.getParameter("cardNo")));
		
//		if( fs.selectFile(Integer.parseInt(mRequest.getParameter("cardNo"))) != 0) {
//			fs.deleteFile(Integer.parseInt(mRequest.getParameter("cardNo")));
//		}
		
		fs.insertFile(lFile);
		System.out.println("컨트롤러 성공");
		PrintWriter write = response.getWriter();
		write.println("<script>alert('파일이 정상적으로 등록되었습니다.')</script>");
		
	}
	
	@RequestMapping("/saveFileList.do")
	@ResponseBody
	public String saveFileList(MultipartHttpServletRequest mRequest, HttpServletResponse response) throws Exception {
		System.out.println("컨트롤러!!!");
		
		ServletContext context = mRequest.getServletContext();
		String path = context.getRealPath("/upload");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		String savePath = path + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		
		List<FileItemVO> lFile = new ArrayList<> ();
		
//		Iterator<String> itr =  mRequest.getFileNames();
		List<MultipartFile> lRequest = mRequest.getFiles("uploadFile[]");
		
		
		for(MultipartFile file: lRequest) {
		System.out.println(file);	
//		while(itr.hasNext()) {
			String oriName = file.getOriginalFilename();
			System.out.println("오리지널네임" + oriName);
			
			if (oriName != null && !oriName.equals("")) {
				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치 
				int index = oriName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriName.substring(index);
				}
				
				// 파일 사이즈
				long fileSize = file.getSize();
				System.out.println("파일 사이즈 : " + fileSize);
				
				// 고유한 파일명 만들기	
				String systemName = "mlec-" + UUID.randomUUID().toString() + ext;
				System.out.println("저장할 파일명 : " + systemName);
				
				// 임시저장된 파일을 원하는 경로에 저장
//				File file = new File(savePath + "/" + systemName);
				file.transferTo(new File(savePath + "/" + systemName));
				
				FileItemVO fileItem = new FileItemVO();
				fileItem.setFileType("card");
				fileItem.setFileRefNo(Integer.parseInt(mRequest.getParameter("cardNo")));
				fileItem.setFileOriName(oriName);
				fileItem.setFileSysName(systemName);
				fileItem.setFilePath(datePath);
				fileItem.setFileSize(1024);
				fileItem.setFileExt(ext);
				lFile.add(fileItem);
			}
		}
		
//		if(fs.selectEmptyCard(Integer.parseInt(mRequest.getParameter("cardNo"))) == 0)
//			fs.insertCardEmpty(Integer.parseInt(mRequest.getParameter("cardNo")));
//		
//		if( fs.selectFile(Integer.parseInt(mRequest.getParameter("cardNo"))) != 0) {
//			fs.deleteFile(Integer.parseInt(mRequest.getParameter("cardNo")));
//		}
		
		fs.insertFile(lFile);
		return "";
	}
	
}
