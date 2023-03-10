package micky.sports.shop.service.member;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import micky.sports.shop.crypt.CryptoUtil;
import micky.sports.shop.dao.Member;
import micky.sports.shop.dao.OrderDao;
import micky.sports.shop.dto.MemberDto;
import micky.sports.shop.dto.OrderMemberDto;
import micky.sports.shop.service.MickyServiceInter;

public class InfoUpdateService implements MickyServiceInter{

	private SqlSession sqlSession;
	private HttpSession session;
	
	public InfoUpdateService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession = sqlSession;
		this.session = session;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("InfoUpdateService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		CryptoUtil crypt = (CryptoUtil) map.get("crypt");
		
		String attachPath="resources\\upload\\";
	    String uploadPath=request.getSession().getServletContext().getRealPath("/");
	    System.out.println("uploadpathhhhh:"+uploadPath);
	    String path = "C:\\2022spring\\springwork1\\micky_SportsWear\\src\\main\\webapp\\resources\\upload";
	    MultipartRequest req = null;
	    try {
	    	req=
	  	          new MultipartRequest(request, path, 1024*1024*20, "utf-8",
	  	                new DefaultFileRenamePolicy());
	    	System.out.println("req : "+req);
		} catch (Exception e) {
			// TODO: handle exception
		} 
		
//		String m_id = request.getParameter("m_id");
//		String m_pw = request.getParameter("m_pw");
//		String m_tel = request.getParameter("m_tel");
//		String m_name2 = request.getParameter("m_name2");
//		
//		String m_email = request.getParameter("m_email"); //이메일 앞주소
//		//String m_email2 = request.getParameter("m_email2"); //이메일 뒷주소
//		//String m_email = m_emaill+m_email2;
//		
//		String m_filesrc = request.getParameter("m_filesrc");
	    
	    
	    String m_id = req.getParameter("m_id");
		String m_pw = req.getParameter("m_pw");
	
		String m_tel = req.getParameter("m_tel");
		String m_name2 = req.getParameter("m_name2"); 
		
		

		String m_email = req.getParameter("m_email");
		
		System.out.println("이메일주소조합확인 : "+m_email);
		
		String m_filesrc = req.getFilesystemName("m_filesrc");
		System.out.println("파일확인좀하자 프로필사진 : "+m_filesrc);
		System.out.println("확인좀하자@@@@@@@@@@@@@@@@@"+m_name2);
		
		
		
		
		
		String key="";
		try {
			key=CryptoUtil.sha512(m_pw);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("sha512방식 암호화 : "+key);
		
		String key2=key;
		String encryStr = "";
		try {
			encryStr = CryptoUtil.encryptAES256(m_pw, key2);			
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("양방향암호화 : "+encryStr);
		
		Member dao = sqlSession.getMapper(Member.class);
//		if(m_tel1==null && m_tel2==null && m_tel3==null) {
//			dao.infoupdat3(m_id,m_pw,m_name2,m_email,key,encryStr);
//		}else if(m_name2==null) {
//			dao.infoupdat4(m_id,m_pw,m_tel,m_email,key,encryStr);
//		}else if(m_pw==null) {
//			dao.infoupdat5(m_id,m_tel,m_name2,m_email,key,encryStr);
//		}else if(m_emaill==null) {
//			dao.infoupdat6(m_id,m_pw,m_tel,m_name2,key,encryStr);
//		}else if(m_filesrc==null) { // 파일첨부안하면 null이라 오류떠서 null상황 배제를 위해 조건을 달아준다
//			m_filesrc="";
//			dao.infoupdat2(m_id,m_pw,m_tel,m_name2,m_email,key,encryStr);
//		}else{
//			dao.infoupdate(m_id,m_pw,m_tel,m_name2,m_email,m_filesrc,key,encryStr);
//		}
		
		
		if(m_filesrc==null) { // 파일첨부안하면 null이라 오류떠서 null상황 배제를 위해 조건을 달아준다
			m_filesrc="";
			dao.infoupdat2(m_id,m_pw,m_tel,m_name2,m_email,key,encryStr);
		}else{
			dao.infoupdate(m_id,m_pw,m_tel,m_name2,m_email,m_filesrc,key,encryStr);
		}
		//dao.infoupdate(m_id,m_pw,m_tel,m_name2,m_email,m_filesrc);

		
		
		
		
		
		
		
		String loginId = (String)session.getAttribute("loginid");
		
		OrderDao odao = sqlSession.getMapper(OrderDao.class);

		model.addAttribute("myList",odao.ordersMember(loginId));
		
		model.addAttribute("myPage",odao.myPage(loginId));
		
		//결제완료 주문취소 배송완료 구매확정
		ArrayList<OrderMemberDto> myPages =odao.myPage(loginId);
		int state1=0;
		int state2=0;
		int state3=0;
		int state4=0;
		int[] stateList=new int[4];
		String state;
		for (OrderMemberDto orderMemberDto : myPages) {
			state=orderMemberDto.getOm_state();
			System.out.println(state);
			if (state=="결제완료" || state.equals("결제완료")) {
				state1=state1+1;
			}else if(state=="주문취소"|| state.equals("주문취소")) {
				state2=state2+1;
			}else if(state=="배송완료"|| state.equals("배송완료")) {
				state3=state3+1;
			}else if(state=="구매확정"|| state.equals("구매확정")) {
				state4=state4+1;
			}
		}
		stateList[0]=state1;
		stateList[1]=state2;
		stateList[2]=state3;
		stateList[3]=state4;
		
		for (int i : stateList) {
			System.out.println(i);
		}
		model.addAttribute("stateList",stateList);
		
		
	}

}
