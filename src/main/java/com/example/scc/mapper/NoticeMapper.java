package com.example.scc.mapper;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.Criteria;
import com.example.scc.domain.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeMapper {

    public void create(Notice notice) throws Exception;

    //  public List<Notice> list(Criteria cri) throws Exception;
    public int listCount() throws Exception;

    //  public List<Notice> search(@Param("title")String title) throws Exception;
    //@Param("title") => 컬럼인 제목으로 검색하겠다는 설정

    // 페이징 요청 정보를 매개변수로 받아 페이징 처리를 한 게시글 목록을 반환
    public List<Notice> list(PageRequest pageRequest) throws Exception;

    public Notice read(Integer boardNo) throws Exception;

    public void update(Notice notice) throws Exception;

    public void delete(Integer boardNo) throws Exception;

    //검색처리된 게시글 건수를 반환한다.
    public int count(PageRequest pageRequest) throws Exception;









    //첨부파일 추가
    public void addAttach(String fullName) throws Exception;

    //첨부파일 목록 조회
    public List<String> getAttach(Integer boardNo) throws Exception;

    //첨부파일 삭제
    public void deleteAttach(Integer boardNo) throws Exception;

    //첨부파일 교체
    public void replaceAttach(@Param("fullName") String fullName, @Param("boardNo") Integer boardNo) throws Exception;

    // 첨부파일 다운로드 건수 업데이트
    public void updateAttachDownCnt(String fullName) throws Exception;

    // 공개자료 조회 건수 업데이트
    public void updateViewCnt(Integer boardNo) throws Exception;
}
