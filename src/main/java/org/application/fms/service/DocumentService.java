package org.application.fms.service;

import java.util.List;

import org.application.fms.bean.Document;
import org.application.fms.param.DocQueryParam;

public interface DocumentService {
	Integer add(Document doc);
	
	Document get(int id);
	
	List<Document> getListByParam(DocQueryParam param);
	
	Integer getCount(DocQueryParam param);
	
	Integer update(Document doc);
}
