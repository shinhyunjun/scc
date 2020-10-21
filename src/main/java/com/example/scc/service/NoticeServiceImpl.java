package com.example.scc.service;

import com.example.scc.common.security.domain.PageRequest;
import com.example.scc.domain.Criteria;
import com.example.scc.domain.Notice;
import com.example.scc.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeMapper mapper;

    @Transactional
    @Override
    public void register(Notice notice) throws Exception{

        mapper.create(notice);

        //첨부파일 추가
        String[] files = notice.getFiles();

        if (files == null) {
            return;
        }

        for (String fileName : files) {
            mapper.addAttach(fileName);
        }
    }


    // 페이징 요청 정보를 매개변수로 받아 페이징 처리를 한 게시글 목록을 반환한다.
    @Override
    public List<Notice> list(PageRequest pageRequest) throws Exception {

        return mapper.list(pageRequest);
    }

    /*
    public int listCount() throws Exception{
        return mapper.listCount();
    }
*/

    /*
    @Override
    public List<Notice> search(String title) throws Exception{
        return mapper.search(title);
    }
*/

    @Override
    public Notice read(Integer boardNo) throws Exception{

        //공개자료 조회 건수 업데이트
        mapper.updateViewCnt(boardNo);

        return mapper.read(boardNo);
    }

    @Transactional
    @Override
    public void modify(Notice notice) throws Exception {

        mapper.update(notice);

        // 첨부파일 수정
        Integer boardNo = notice.getBoardNo();

        mapper.deleteAttach(boardNo);

        String[] files = notice.getFiles();

        if (files == null) {
            return;
        }

        for (String fileName : files) {
            mapper.replaceAttach(fileName, boardNo);
        }
    }

    //삭제 처리
    @Transactional
    @Override
    public void remove(Integer boardNo) throws Exception {

        mapper.deleteAttach(boardNo);
        mapper.delete(boardNo);
    }

    // 검색처리된 게시글 건수를 반환한다.
    @Override
    public int count(PageRequest pageRequest) throws Exception {

        return mapper.count(pageRequest);
    }


    //첨부파일 목록 조회
    @Override
    public List<String> getAttach(Integer boardNo) throws Exception {

        return mapper.getAttach(boardNo);
    }

    //첨부파일 다운로드 건수 업데이트
    @Override
    public void updateAttachDownCnt(String fullName) throws Exception {

        mapper.updateAttachDownCnt(fullName);
    }
}
