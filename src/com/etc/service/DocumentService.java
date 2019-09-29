package com.etc.service;
import java.util.List;
import com.etc.model.Document;
import com.etc.util.Page;

public interface DocumentService {

	public boolean addDocument(Document document);

	public List<Document> documentSearchByPage(Document document, Page page);

	public boolean updateDocument(Document document);

	public boolean deleteDocument(String ids);

}
