package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etc.model.Document;
import com.etc.util.Page;

public interface DocumentDao {

	public int addDocument(Document document);

	public int getDocumentTotal(Document document);

	public List<Document> getDocumentListByPage(@Param("document")Document document,@Param("page") Page page);

	public int updateDocument(Document document);

	public int deleteDocument(@Param("ids")String ids);

}
