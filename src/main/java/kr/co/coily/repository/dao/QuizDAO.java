package kr.co.coily.repository.dao;

import java.util.List;

import kr.co.coily.repository.vo.CommentSearchVO;
import kr.co.coily.repository.vo.QuizCommentVO;
import kr.co.coily.repository.vo.QuizVO;
import kr.co.coily.repository.vo.SearchVO;

public interface QuizDAO {
	
	//퀴즈 목록(페이징 포함)
	public List<QuizVO> selectQuiz(SearchVO search) throws Exception;
	public int selectQuizCount(SearchVO search) throws Exception;
	
	//댓글 목록(페이징 포함)
	public List<QuizCommentVO> selectQuizComment(CommentSearchVO search) throws Exception;
	public int selectQuizCommentCount(CommentSearchVO search) throws Exception;
	
	//스크롤 다운
	public List<QuizVO> scrollDown(QuizVO quiz, int noStart);
	
	//퀴즈 하나 조회
	public QuizVO selectOneQuiz(int no) throws Exception;
	
	//퀴즈 등록
	public int insertQuiz(QuizVO quiz) throws Exception;
	
	//퀴즈 삭제
	public boolean deleteQuiz(int no) throws Exception;
	
	//퀴즈 수정
	public boolean updateQuiz(QuizVO quiz) throws Exception;
	
	//댓글 등록
	public void insertQuizComment(QuizCommentVO comment) throws Exception;
	
	//댓글 목록
	public List<QuizCommentVO> selectQuizCommentByNo(int no) throws Exception;
	
//	public List<QuizCommentVO> selectQuizCommentByNo1() throws Exception;
	
}













