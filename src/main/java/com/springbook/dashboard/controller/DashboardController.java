
package com.springbook.dashboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.dashboard.domain.MasterDTO;
import com.springbook.dashboard.service.DashboardService;
import com.springbook.member.service.MemberService;
import com.springbook.member.vo.MemberVO;
import com.springbook.utill.session.SessionManager;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequiredArgsConstructor
public class DashboardController {
	
	private final DashboardService dashboardService;

	private final MemberService memberService;

	@GetMapping("/goDashboard.do")    
	public String goDashboard(Model model) {
		List<Map<String,Object>> safetyList = dashboardService.getLeakSafety();
        model.addAttribute("safetyList", safetyList);
		return "dashboard/dashboard";
	}	
	
	@GetMapping("/goDashboardSales.do")    
	public String goDashboardSales(Model model) {
		
		return "dashboard/dashboard_sales";
	}	
	
	@GetMapping("/goDashboardSalesPart.do")    
	public String goDashboardSalesPart(Model model) {
		
		
		return "dashboard/dashboard_sales_part";
	}	
	
	//주문현황 이동
	@GetMapping("/goMasterInfoEdit.do")    
	public ModelAndView goMasterInfoEdit(HttpServletRequest request ,  ModelAndView mv) {
		String userId = SessionManager.getSession(request);
		MemberVO member = memberService.getMemberInfo(userId);
		log.info("member={}", member);
		mv.addObject("Member", member);
		mv.setViewName("dashboard/master_info_edit");
		return mv;
	}
	
	@PutMapping("/master")
	@ResponseBody
	public ResponseEntity<String> editMaster(MasterDTO masterIfno) throws Exception{
		log.info("masterIfno = {}",masterIfno);
		int result = memberService.modifyMasterInfo(masterIfno);
		if(result > 0 ){
			return new ResponseEntity<>("정보 수정 완료되었습니다.",HttpStatus.OK);
		}
			return new ResponseEntity<>("비밀번호를 확인해 주세요.", HttpStatus.BAD_REQUEST);
	}
}

