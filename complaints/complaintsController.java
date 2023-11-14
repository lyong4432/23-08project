package kr.or.project.main.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.project.main.domain.cvpl_infoVO;
import kr.or.project.main.model.Criteria;
import kr.or.project.main.model.PageMakeDTO;
import kr.or.project.main.service.ComplaintsService;


@Controller
public class ComplaintsController {
	
	private static final Logger log = LoggerFactory.getLogger(ComplaintsController.class);
	
	@Autowired
	private ComplaintsService complaintsService;
	
	/* @RequestMapping(value="/complaints/complaintsInfo")
	public String complaintsList(Model model) {
		log.info("민원 게시판(전체 리스트)입니다.");
		model.addAttribute("list",complaintsService.getList());
		return "complaints/complaintsInfo";
		
	} */ 
	
	
	/* 민원 목록 (페이징 적용) */
	@RequestMapping(value="/complaints/complaintsInfo" ,method=RequestMethod.GET)
	public void complaintsList(Model model, Criteria cri) {
		log.info("민원 게시판(전체 리스트)입니다.");
		model.addAttribute("list",complaintsService.getListPaging(cri));
		int total = complaintsService.getTotal(cri);
		PageMakeDTO pageMake = new PageMakeDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
        model.addAttribute("total", total);
	}
	
	
	
	
	@RequestMapping(value="/complaints/complaintsInfoDetail")
	public String complaintsList1(Model model) {
		log.info("민원 게시판(상세)입니다.");
		model.addAttribute("list",complaintsService.getList());
		return "complaints/complaintsInfoDetail";
		
	}
	
	@RequestMapping(value="/complaints/registerComplaints",method=RequestMethod.GET)
	public String complaintsEnroll() {
		log.info("민원 게시판(등록)입니다.");
		
		return "complaints/registerComplaints";
		
	}
	
	/* 민원 등록*/
	@RequestMapping(value="/complaints/registerComplaints",method=RequestMethod.POST)
	public String complaintsEnrollPost(cvpl_infoVO cvpl, RedirectAttributes rttr) {
		log.info("민원 등록하였습니다.");
		
		complaintsService.enroll(cvpl);
		rttr.addFlashAttribute("result", "enrol success");
		return "redirect:/complaints/complaintsInfo?pageNum=1&amount=10&keyword=&category=all";
	}
	
	/* 민원 조회 */
	@RequestMapping(value="/complaints/complaintsInfoDetail",method=RequestMethod.GET)
	public void complaintsDetailPageGET(int CVPL_NO, Model model, Criteria cri) {
		
		log.info("민원 조회합니다.");
		model.addAttribute("pageInfo", complaintsService.getPage(CVPL_NO));
		model.addAttribute("cri", cri);
		
	}
	
	/* 민원 수정페이지 이동 */
	@RequestMapping(value="/complaints/complaintsInfoModify",method=RequestMethod.GET)
	public void complaintsModifyGET(int CVPL_NO, Model model,Criteria cri) {
		model.addAttribute("pageInfo", complaintsService.getPage(CVPL_NO));
		model.addAttribute("cri", cri);
	}
	
	/* 페이지 수정 */
	@RequestMapping(value="/complaints/complaintsInfoModify",method=RequestMethod.POST)
	public String complaintsModifyPOST(cvpl_infoVO cvpl, RedirectAttributes rttr) {
		complaintsService.modify(cvpl);
		
		log.info("민원 수정하였습니다.");
		
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/complaints/complaintsInfo?pageNum=1&amount=10&keyword=&category=all";
	}
	
	/* 페이지 삭제 */
	@RequestMapping(value="/complaints/delete",method=RequestMethod.POST)
	public String ComplaintsDeletePOST(int CVPL_NO, RedirectAttributes rttr) {
		
		complaintsService.delete(CVPL_NO);
		log.info("민원 삭제하였습니다.");
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/complaints/complaintsInfo?pageNum=1&amount=10&keyword=&category=all";
	}
	
	/* 답변 등록 */ 
	@RequestMapping(value="/complaints/complaintsInfoDetail",method=RequestMethod.POST)
	public String answerEnrol(cvpl_infoVO cvpl, RedirectAttributes rttr) {
		log.info("민원 등록하였습니다.");
		
		complaintsService.answer(cvpl);
		rttr.addFlashAttribute("result", "answer success");
		return "redirect:/complaints/complaintsInfo?pageNum=1&amount=10&keyword=&category=all";
	}
	
	
	
	
	
	
	
	
}
