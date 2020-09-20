package com.semi.partner.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.partner.model.dao.PartnerDao;
public class PartnerService {

	private PartnerDao dao = new PartnerDao();
	
	//기존에 있던 거는 totalmember로 통합되면서 지웠어요
	
	
}
