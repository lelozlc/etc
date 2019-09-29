package com.etc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.etc.dao.DocumentDao;
import com.etc.model.Document;
import com.etc.service.DocumentService;
import com.etc.util.Page;
@Service("documentService")
public class DocumentServiceImpl implements DocumentService{

	@Autowired
	@Qualifier("documentDao")
	private DocumentDao documentDao;

	@Override
	public boolean addDocument(Document document) {
		if(documentDao.addDocument(document)>0){
			return true;
		}
		return false;
	}

	@Override
	public List<Document> documentSearchByPage(Document document, Page page) {
		int total=documentDao.getDocumentTotal(document);
		page.setTotal(total);
		return documentDao.getDocumentListByPage(document,page);
	}

	@Override
	public boolean updateDocument(Document document) {
		if(documentDao.updateDocument(document)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteDocument(String ids) {
		if(documentDao.deleteDocument(ids)>0){
			return true;
		}
		return false;
	}




}
