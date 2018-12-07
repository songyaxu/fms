package org.application.fms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.application.fms.bean.Document;
import org.application.fms.param.DocQueryParam;

public interface DocumentMapper {
	Integer add(@Param("d") Document document);
	
	Document get(int id);
	
	List<Document> getListByParam(@Param("p") DocQueryParam param);
	
	Integer getCount(@Param("p") DocQueryParam param);
	
	Integer update(@Param("d") Document doc);
	
}
