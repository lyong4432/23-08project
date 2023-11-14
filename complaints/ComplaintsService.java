package kr.or.project.main.service;


import java.util.List;

import kr.or.project.main.domain.cvpl_infoVO;
import kr.or.project.main.model.Criteria;

public interface ComplaintsService {
	/* 민원 등록 */
	public void enroll(cvpl_infoVO cvpl);
	/* 민원 목록 */
	public List<cvpl_infoVO> getList();
	/* 민원 목록 (페이징 적용) */
	public List<cvpl_infoVO> getListPaging(Criteria cri);
	/* 민원 조회 */
	public cvpl_infoVO getPage(int CVPL_NO);
	/* 민원 수정 */
	public int modify(cvpl_infoVO cvpl);
	/* 민원 삭제 */
	public int delete(int CVPL_NO);
	/* 답변 등록 */
	public void answer(cvpl_infoVO cvpl);
	/* 민원 총 개수 */
	public int getTotal(Criteria cri);
}
