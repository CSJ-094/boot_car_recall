package com.boot.controller;

import com.boot.dto.BoardDTO;
import com.boot.service.BoardService;
import com.boot.service.UploadService;
import com.boot.dto.BoardAttachDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
public class BoardController {
    @Autowired
    private BoardService service;

//    @Autowired
//    private CommentService commentService;

    @Autowired
    private UploadService uploadService;

    @RequestMapping("/write")
    public String write(@RequestParam HashMap<String, String> param, Model model) {
        log.info("@# write()");
        log.info("@# param=>"+param);

        service.write(param);

        return "redirect:report_recallInfo";
    }

    @RequestMapping("/write_view")
    public String write_view() {
        log.info("@# write_view()");
        return "report_write_view";
    }

//    @RequestMapping("/report_content_view")
//    public String content_view(@RequestParam("boardNo") int boardNo,
//                               @RequestParam("pageNum") int pageNum,
//                               @RequestParam("amount") int amount,
//                               Model model) {
//        log.info("@# report_content_view()");
//
//        BoardDTO dto = service.contentView(boardNo);
//        log.info("@# boardNo => " + boardNo);
//        model.addAttribute("content_view", dto);
//        log.info("@# dto => " + dto);
        
        // 해당 게시글에 작성된 댓글 리스트를 가져옴
//        ArrayList<CommentDTO> commentList = commentService.commentList(boardNo);
//        log.info("@# commentList=>"+commentList);
//        
//        model.addAttribute("commentList", commentList);
//
//        model.addAttribute("pageNum", pageNum);
//        model.addAttribute("amount", amount);
//        log.info("@# pn => " + pageNum);
//        log.info("@# am => " + amount);
//
//        // 파일 목록 가져오기
//        List<BoardAttachDTO> fileList = uploadService.getFileList(boardNo);
//        model.addAttribute("fileList", fileList);
//
//        return "report_content_view";
//    }
    @RequestMapping("/report_modify_view")
    public String report_modify_view(@RequestParam("boardNo") int boardNo,
                                     @RequestParam("pageNum") int pageNum,
                                     @RequestParam("amount") int amount,
                                     Model model) {

        log.info("@# report_modify_view()");
        BoardDTO dto = service.contentView(boardNo); // 수정할 글 데이터 불러오기

        model.addAttribute("content_view", dto);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("amount", amount);

        return "report_modify_view"; // 수정 JSP로 이동
    }

    @RequestMapping("/report_modify")
    public String report_modify(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
        log.info("@# report_modify()");
        service.modify(param);

        rttr.addAttribute("pageNum", param.get("pageNum"));
        rttr.addAttribute("amount", param.get("amount"));
        return "redirect:report_recallInfo";
    }

    @RequestMapping("/report_delete")
    public String report_delete(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
        log.info("@# report_delete()");
        log.info("@# boardNo=>" + param.get("boardNo"));
        
        // 게시글 삭제
        service.delete(param);
        List<BoardAttachDTO> list = uploadService.getFileList(Integer.parseInt(param.get("boardNo")));
        uploadService.deleteFile(list);

        rttr.addAttribute("pageNum", param.get("pageNum"));
        rttr.addAttribute("amount", param.get("amount"));
        return "redirect:report_recallInfo";
    }

}
