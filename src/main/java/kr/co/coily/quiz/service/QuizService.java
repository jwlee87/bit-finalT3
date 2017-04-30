package kr.co.coily.quiz.service;

import java.util.List;
import java.util.Map;

import kr.co.coily.repository.vo.CommentSearchVO;
import kr.co.coily.repository.vo.QuizCommentVO;
import kr.co.coily.repository.vo.QuizVO;
import kr.co.coily.repository.vo.SearchVO;

public interface QuizService {
	//조회
	public Map<String, Object> list(SearchVO search) throws Exception;
	
	//스크롤 다운
	public List<QuizVO> scrollDown(int noStart) throws Exception;
	
	//등록
	public void write(QuizVO quiz) throws Exception;
	
	//수정폼
	public QuizVO updateForm(int no) throws Exception;
	
	//수정
	public void update(QuizVO quiz) throws Exception;	
	
	//삭제
	public void delete(int no) throws Exception;
	
	//댓글 등록
	public List<QuizCommentVO> commentRegist(QuizCommentVO quizComment) throws Exception ;
	
	//댓글 조회
	public Map<String, Object> commentList(CommentSearchVO search) throws Exception ;
	
}
