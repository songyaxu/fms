package org.application.fms.service.impl;

import java.util.List;

import org.application.fms.bean.FileMap;
import org.application.fms.mapper.FileMapMapper;
import org.application.fms.param.MapQueryParam;
import org.application.fms.service.FileMapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileMapServiceImpl  implements FileMapService{

	@Autowired
	private FileMapMapper fileMapMapper;
	@Override
	public Integer add(FileMap fm) {
		return this.fileMapMapper.add(fm);
	}
	@Override
	public FileMap getMapByFileIdAndLevel(FileMap map) {
		return this.fileMapMapper.getMapByFileIdAndLevel(map);
	}
	@Override
	public FileMap get(int id) {
		return this.fileMapMapper.get(id);
	}
	@Override
	public Integer update(FileMap map) {
		return this.fileMapMapper.update(map);
	}
	@Override
	public List<FileMap> select(MapQueryParam p) {
		return this.fileMapMapper.select(p);
	}
	@Override
	public Integer count(MapQueryParam p) {
		return this.fileMapMapper.count(p);
	}
	
}
