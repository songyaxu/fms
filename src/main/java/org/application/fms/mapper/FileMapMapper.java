package org.application.fms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.application.fms.bean.FileMap;
import org.application.fms.param.MapQueryParam;

public interface FileMapMapper {
	
	Integer add(@Param("fm") FileMap fileMap);
	
	FileMap getMapByFileIdAndLevel(@Param("m") FileMap map);
	
	FileMap get(int id);
	
	Integer update(@Param("fm") FileMap map); 
	
	List<FileMap> select(@Param("p") MapQueryParam p);
	
	Integer count(@Param("p") MapQueryParam p);
	
}
