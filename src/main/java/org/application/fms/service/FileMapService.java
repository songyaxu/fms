package org.application.fms.service;

import java.util.List;

import org.application.fms.bean.FileMap;
import org.application.fms.param.MapQueryParam;

public interface FileMapService {
	Integer add(FileMap fm);
	
	FileMap getMapByFileIdAndLevel(FileMap map);
	
	FileMap get(int id);
	
	Integer update(FileMap map); 
	
	List<FileMap> select(MapQueryParam p);
	
	Integer count(MapQueryParam param);
}
