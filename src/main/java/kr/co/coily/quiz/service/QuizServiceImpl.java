package kr.co.coily.quiz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.QuizDAO;
import kr.co.coily.repository.vo.CommentPageResultVO;
import kr.co.coily.repository.vo.CommentSearchVO;
import kr.co.coily.repository.vo.PageResultVO;
import kr.co.coily.repository.vo.QuizCommentVO;
import kr.co.coily.repository.vo.QuizVO;
import kr.co.coily.repository.vo.SearchVO;

@Service
public class QuizServiceImpl implements QuizService {

	@Autowired
	private QuizDAO dao;
	
	//조회
	@Override
	public Map<String, Object> list(SearchVO search) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("qList", dao.selectQuiz(search));
		result.put("pageResult", new PageResultVO(search.getPageNo(), dao.selectQuizCount(search)));
		return result;
	}
	
	//스크롤 다운
	@Override
	public List<QuizVO> scrollDown(QuizVO quiz, int noStart) throws Exception {
		return dao.scrollDown(quiz, noStart);
	}
	
	//퀴즈댓글 조회
	@Override
	public Map<String, Object> commentList(CommentSearchVO search) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("quizCommentList", dao.selectQuizComment(search));
		result.put("commentPageResult", new CommentPageResultVO(search.getPageNo(), dao.selectQuizCommentCount(search)));
		return result;
	}
	
	
	//등록
	@Override
	public void write(QuizVO quiz) throws Exception {
		dao.insertQuiz(quiz);
	}

	//수정폼
	@Override
	public QuizVO updateForm(int no) throws Exception {
		return dao.selectOneQuiz(no);
	}
	
	//수정
	@Override
	public void update(QuizVO quiz) throws Exception {
		dao.updateQuiz(quiz);
	}
	
	//삭제
	@Override
	public void delete(int no) throws Exception {
		dao.deleteQuiz(no);
	}

	//퀴즈댓글 등록
	@Override
	public List<QuizCommentVO> commentRegist(QuizCommentVO quizComment) throws Exception {
		dao.insertQuizComment(quizComment);
		return dao.selectQuizCommentByNo(quizComment.getQuizNo());
	}
	
	
}
