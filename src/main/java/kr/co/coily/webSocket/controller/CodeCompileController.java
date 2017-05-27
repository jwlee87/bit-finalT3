package kr.co.coily.webSocket.controller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/editor")
public class CodeCompileController {
	@RequestMapping("/codeCompile.do")
	@ResponseBody
	public String codeCompile(HttpServletRequest request, String code, String oriName) throws Exception {
//		System.out.println("컴파일러 컨트롤러");
//		System.out.println("오리네임 : " + oriName);
		String result="";
		ServletContext context = request.getServletContext();
		
		String path = context.getRealPath("/compile");
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String datePath = sdf.format(new Date());
		
		String savePath = path + datePath;
		File f = new File(savePath);
		if (!f.exists()) f.mkdirs();
		
		File dest = new File(f, oriName);
		
		String name = oriName.substring(0, oriName.length()-5);
		
//		System.out.println("이게 진짜 이름이다........................" + name);
		
//		String name = oriName.split(".")[0];
//		
		File classFile = new File(f, name + ".class");
		if(classFile.exists()) classFile.delete();

		try (FileWriter fw = new FileWriter(dest);) {
//			System.out.println("code..........................: " + code);
			fw.write(code.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		try {
            Runtime rt = Runtime.getRuntime();
            String[] arr = {"C:/java90/bin/jdk8/bin/javac", "-encoding", "utf-8", savePath+"/"+oriName};
            Process proc = rt.exec(arr); //시스템 명령어
//            Process proc = new ProcessBuilder("C:/java90/bin/jdk8/bin/javac", savePath+"/Main.java").start();
            proc.waitFor();
            
           
            String[] arr2 = {"C:/java90/bin/jdk8/bin/java", "-Dfile.encoding=UTF8", "-cp", savePath, name};
            Process proc2 = rt.exec(arr2); //시스템 명령어
            
            InputStream is2 = proc2.getInputStream();
            InputStreamReader isr2 = new InputStreamReader(is2);
//            BufferedReader br2 = new BufferedReader(isr2);
            while(true) {
            	int ch = isr2.read();
            	if(ch == -1) break;
            	result += (char)ch;
            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		
		
//		System.out.print("result : " + result);
		return result.trim();	
	}
}
