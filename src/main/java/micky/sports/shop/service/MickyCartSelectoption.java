package micky.sports.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import micky.sports.shop.dao.CartDao;
import micky.sports.shop.dao.ReviewDao;
import micky.sports.shop.dto.CartDto;
import micky.sports.shop.dto.ProductDto;


public class MickyCartSelectoption implements MickyServiceInter{

	private SqlSession sqlSession;
	
	public MickyCartSelectoption(SqlSession sqlsession) {
		this.sqlSession=sqlsession;
	}

	@Override
	public void execute(Model model) {
		System.out.println("dddddd서비스");		
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		String c_no=request.getParameter("c_no");
		String p_name=request.getParameter("p_name");
		System.out.println("dd"+p_name);
		CartDao dao=sqlSession.getMapper(CartDao.class);
		
		
		ReviewDao rdao=sqlSession.getMapper(ReviewDao.class);
		double avgStarscore=0;
		avgStarscore=rdao.avgStarscore(p_name);
		model.addAttribute("avgStarscore", avgStarscore);
		System.out.println(avgStarscore+"avgStarscore");
		
		//p_no(상품번호)를 토대로 product table의 레코드를 가져와서 그 레코드의 파람값을 Cart table에 인서트
	
		CartDto list=dao.CartSelectOptionlist(c_no);
		
		String p_no=list.getP_no();
		List<ProductDto> plist=dao.ProductSizeoption(p_no);
		model.addAttribute("plist",plist);
		model.addAttribute("list",list);	
	}
	
}
