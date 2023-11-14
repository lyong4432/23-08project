package kr.or.project.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.project.main.domain.cvpl_infoVO;
import kr.or.project.main.model.Criteria;
import kr.or.project.main.service.ComplaintsService;
import kr.or.project.mapper.ComplaintsMapper;

@Service
public class ComplaintsServiceImpl implements ComplaintsService {
	@Autowired
	private ComplaintsMapper mapper;

	 	@Override
	    public List<cvpl_infoVO> getList() {
	        
	        return mapper.getList();
	    }
	    
	    /* 민원 목록 (페이징 적용) */
	    @Override
	    public List<cvpl_infoVO> getListPaging(Criteria cri) {
	        
	        return mapper.getListPaging(cri);
	    }
	    
	    /* 민원 등록 */
	    @Override
		public void enroll(cvpl_infoVO cvpl) {
			mapper.enroll(cvpl);
		}
	  
	     /* 민원 조회 */
	    @Override
	    public cvpl_infoVO getPage(int CVPL_NO) {
	    	return mapper.getPage(CVPL_NO);
	    }
	    
	    /* 민원 수정 */
	    @Override
	    public int modify(cvpl_infoVO cvpl) {
	    	return mapper.modify(cvpl);
	    }
	    
	    /* 민원 삭제  */
	    @Override
	    public int delete(int CVPL_NO) {
	    	return mapper.delete(CVPL_NO);
	    }
	    /* 민원 등록 */
	    @Override
		public void answer(cvpl_infoVO cvpl) {
			mapper.answer(cvpl);
		}
	    /* 민원 총 개수 */
	    @Override
	    public int getTotal(Criteria cri) {
	    	return mapper.getTotal(cri);
	    }
	    
}
