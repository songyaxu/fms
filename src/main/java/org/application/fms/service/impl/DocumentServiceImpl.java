package org.application.fms.service.impl;

import java.util.List;

import org.application.fms.bean.Document;
import org.application.fms.mapper.DocumentMapper;
import org.application.fms.param.DocQueryParam;
import org.application.fms.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DocumentServiceImpl implements DocumentService{

	@Autowired
	private DocumentMapper documentMapper;
	@Override
	public Integer add(Document doc) {
		return this.documentMapper.add(doc);
	}

	@Override
	public Document get(int id) {
		return this.documentMapper.get(id);
	}

	@Override
	public List<Document> getListByParam(DocQueryParam param) {
		List<Document> docList=documentMapper.getListByParam(param);
		return docList;
	}

	@Override
	public Integer getCount(DocQueryParam param) {
		return this.documentMapper.getCount(param);
	}

	@Override
	public Integer update(Document doc) {
		return this.documentMapper.update(doc);
	}
	
	
}
