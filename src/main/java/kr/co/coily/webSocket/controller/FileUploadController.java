package kr.co.coily.webSocket.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.coily.file.service.FileService;
import kr.co.coily.repository.vo.FileItemVO;

@Controller
@RequestMapping("/file")
public class FileUploadController {
	@Autowired
	FileService fs;
	
	@RequestMapping("/upload.do")
	@ResponseBody
	public List<FileItemVO> saveFile(MultipartHttpServletRequest mRequest, HttpServletResponse response) throws Exception {
		ServletContext context = mRequest.getServletContext();
		String path = context.getRealPath("/tree");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		String savePath = path + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		
	
//		Enumeration<String> fileNames = mRequest.getFileNames();
//		while (fileNames.hasMoreElements()) {
//			System.out.println("=============================");
//			String fileName = fileNames.nextElement();
//			System.out.println("파일 파라미터명 : " + fileName);
//			String oriFileName = mRequest.getOriginalFileName(fileName);
//			System.out.println("원본 파일명 : " + oriFileName);
//			String realFileName = mRequest.getFilesystemName(fileName);
//			System.out.println("서버 파일명 : " + realFileName);
//		}
		
		List<FileItemVO> lFile = new ArrayList<>();
		
		
		List<MultipartFile> lRequest = mRequest.getFiles("fileselect[]");
		System.out.println("gogogogogogo : " + lRequest);
		for(MultipartFile file: lRequest) {
		
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
				file.transferTo(new File(savePath + "/" + systemName));
							
				FileItemVO fileItem = new FileItemVO();
				fileItem.setFileType("code");
				fileItem.setFileRefNo(1);
				fileItem.setFileOriName(oriName);
				fileItem.setFileSysName(systemName);
				fileItem.setFilePath(datePath);
				fileItem.setFileSize(fileSize);
				fileItem.setFileExt(ext);
				lFile.add(fileItem);
			}
		}
	    
		fs.insertFile(lFile);
//		System.out.println("컨트롤러 성공");
//		PrintWriter write = response.getWriter();
//		write.println("<script>alert('파일이 정상적으로 등록되었습니다.')</script>");
		return lFile;
		
	}
	
	@ResponseBody
	@RequestMapping("/readFile.do")
	public String readFile(HttpServletRequest request, int fileNo) throws Exception {

	    ServletContext context = request.getServletContext();
	    String path = context.getRealPath("/tree");
//	    System.out.println("뜨나뜨나 : " + path);

	    FileItemVO fileInfo = fs.selectFileInfo(fileNo);
//	    String readFilePath = "";
//	    if(fileInfo.getFileOriName() == "Main.java") {
//	    	readFilePath = path + fileInfo.getFilePath() + "\\" + fileInfo.getFileOriName();
//	    } else {
	    String readFilePath = path + fileInfo.getFilePath() + "\\" + fileInfo.getFileSysName();
//	    }
	    System.out.println(fileInfo.getFileSysName());
//	    System.out.println("파일경로 : " + readFilePath);

	    // 버퍼 생성
	    BufferedReader br = null;       

	    // Input 스트림 생성
	    InputStreamReader isr = null;   

	    // File Input 스트림 생성
	    FileInputStream fis = null;       

	    // 버퍼로 읽어들일 임시 변수
	    String temp = "";

	    // 최종 내용 출력을 위한 변수
	    String content = "";

	    // File 경로
	    File file = new File(readFilePath);


	      try {

	            // 파일을 읽어들여 File Input 스트림 객체 생성
	            fis = new FileInputStream(file);

	            // File Input 스트림 객체를 이용해 Input 스트림 객체를 생서하는데 인코딩을 UTF-8로 지정
	            isr = new InputStreamReader(fis, "UTF-8");

	            // Input 스트림 객체를 이용하여 버퍼를 생성
	            br = new BufferedReader(isr);

	            // 버퍼를 한줄한줄 읽어들여 내용 추출
	            while( (temp = br.readLine()) != null) {
	                content += temp + "\n";
	            }
//	            content += "\n //coily공유파일";

//	            System.out.println("================== 파일 내용 출력 ==================");
//	            System.out.println(content);

	        } catch (FileNotFoundException e) {
	            e.printStackTrace();

	        } catch (Exception e) {
	            e.printStackTrace();

	        } finally {

	            try {
	                fis.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }

	            try {
	                isr.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }

	            try {
	                br.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }

	        }

	    return fileInfo.getFileOriName() + ":" + fileInfo.getFileSysName() + ":" + content;

	}
	
	
	
	@RequestMapping("/mainFile.do")
	@ResponseBody
	public FileItemVO codeCompile(HttpServletRequest request, String mainCode) throws Exception {

		System.out.println("컨트롤러");
		System.out.println("메인코드 : " + mainCode);
		ServletContext context = request.getServletContext();
		
		String path = context.getRealPath("/tree");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		String savePath = path + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();

		
			// 확장자 처리
			String oriName = "Main.java";
			String ext = "";
			// 뒤쪽에 있는 . 의 위치 
			int index = oriName.lastIndexOf(".");
			if (index != -1) {
				// 파일명에서 확장자명(.포함)을 추출
				ext = oriName.substring(index);
			}
			
			// 고유한 파일명 만들기	
			String systemName = "mlec-" + UUID.randomUUID().toString() + ext;
			
			File dest = new File(f, systemName);
			
			try (FileWriter fw = new FileWriter(dest);) {
				System.out.println("code: " + mainCode);
				fw.write(mainCode.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			FileItemVO fileItem = new FileItemVO();
			fileItem.setFileType("code");
			fileItem.setFileRefNo(1);
			fileItem.setFileOriName(oriName);
			fileItem.setFileSysName(systemName);
			fileItem.setFilePath(datePath);
			fileItem.setFileExt(ext);
			
			fs.insertOneFile(fileItem);
			return fileItem;
	}
	
	
	@ResponseBody
	@RequestMapping("/saveFile.do")
	public String saveFile(HttpServletRequest request, String code, String sysName) throws Exception {

	    ServletContext context = request.getServletContext();
	    String path = context.getRealPath("/tree");
	    
	    SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		String savePath = path + datePath;
		File f = new File(savePath, sysName);

		
//		FileWriter fw = null;	
		BufferedWriter bw = null;
		try {											
			bw = new BufferedWriter(new FileWriter(f));	
			bw.write(code);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(bw != null) {
				try {
					bw.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}

		
		
//	    // 버퍼 생성
//	    BufferedReader br = null;       
//
//	    // Input 스트림 생성
//	    InputStreamReader isr = null;   
//
//	    // File Input 스트림 생성
//	    FileInputStream fis = null;       
//
//	    // 버퍼로 읽어들일 임시 변수
//	    String temp = "";
//
//	    // 최종 내용 출력을 위한 변수
//	    String content = "";
//
//	    // File 경로
//	    File file = new File(readFilePath);
//
//
//	      try {
//
//	            // 파일을 읽어들여 File Input 스트림 객체 생성
//	            fis = new FileInputStream(file);
//
//	            // File Input 스트림 객체를 이용해 Input 스트림 객체를 생서하는데 인코딩을 UTF-8로 지정
//	            isr = new InputStreamReader(fis, "UTF-8");
//
//	            // Input 스트림 객체를 이용하여 버퍼를 생성
//	            br = new BufferedReader(isr);
//
//	            // 버퍼를 한줄한줄 읽어들여 내용 추출
//	            while( (temp = br.readLine()) != null) {
//	                content += temp + "\n";
//	            }
////	            content += "\n //coily공유파일";
//
////	            System.out.println("================== 파일 내용 출력 ==================");
////	            System.out.println(content);
//
//	        } catch (FileNotFoundException e) {
//	            e.printStackTrace();
//
//	        } catch (Exception e) {
//	            e.printStackTrace();
//
//	        } finally {
//
//	            try {
//	                fis.close();
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	            }
//
//	            try {
//	                isr.close();
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	            }
//
//	            try {
//	                br.close();
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	            }
//
//	        }
//
//	    return fileInfo.getFileOriName() + ":" + fileInfo.getFileSysName() + ":" + content;
	    return "";
	}
	
	
	

}
