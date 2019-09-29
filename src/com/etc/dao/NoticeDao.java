package com.etc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.etc.model.Notice;
import com.etc.util.Page;

public interface NoticeDao {


	public int addNotice(Notice notice);

	public int getNoticeListCount(Notice notice);

	public List<Notice> getNoticeListByPage(@Param("notice")Notice notice,@Param("page") Page page);

	public int deleteNotice(@Param("ids")String ids);

	public int updateNotice(Notice notice);

}
