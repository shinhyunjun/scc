package com.example.scc.service;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.Criteria;
import com.example.scc.domain.Notice;

import java.util.List;

public interface NoticeService {

    public void register(Notice notice) throws Exception;

    // 페이징요청 정보를 매개변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
    public List<Notice> list(PageRequest pageRequest) throws Exception;

  //  public int listCount() throws Exception;

  //  public List<Notice> search(String title) throws Exception;

    public Notice read(Integer boardNo) throws Exception;

    public void modify(Notice notice) throws Exception;

    public void remove(Integer boardNo) throws Exception;

    //검색 처리된 게시글 건수를 반환한다.
    public int count(PageRequest pageRequest) throws Exception;


    //첨부파일 목록 조회
    public List<String> getAttach(Integer boardNo) throws Exception;

    //첨부파일 다운로드 건수 업데이트
    public void updateAttachDownCnt(String fullName) throws Exception;

}
