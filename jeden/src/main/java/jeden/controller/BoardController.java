package jeden.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jeden.common.Pagination;
import jeden.service.BoardService;
import jeden.vo.BoardVO;

@Controller
public class BoardController {
	
//	@Resource(name="jeden.service.BoardService")
//	BoardService boardService;
	
	@Autowired
	private BoardService boardService;
	
	// board List
	@RequestMapping("/board/boardList")
	private String boardList(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			) throws Exception{
		
		int listCnt = boardService.getBoardListCnt();
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("boardList", boardService.boardListService(pagination));
		return "board/boardList";
	}
	
	// board Detail
	@RequestMapping("/board/boardDetail/{bno}")
	private String boardDetail(@PathVariable int bno, Model model) throws Exception{
		model.addAttribute("boardDetail", boardService.boardDetailService(bno));
		return "board/boardDetail";
	}
	
	// board Post Form
	@RequestMapping("/board/boardPost")
	private String boardPostForm() {
		return "board/boardPost";
	}
	
	// board Post Process
	@RequestMapping("/boardPostProc")
	private String boardPostProc(HttpServletRequest request) throws Exception{
		
		BoardVO board = new BoardVO();
		
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));

		boardService.boardPostService(board);
		return "redirect:/board/boardList";
	}
	
	// board Edit Form
	@RequestMapping("/board/boardEdit/{bno}")
	private String boardEditForm(@PathVariable int bno, Model model) throws Exception{
		model.addAttribute("boardDetail", boardService.boardDetailService(bno));
		return "board/boardEdit";
	}
	
	// board Edit Process
	@RequestMapping("/boardEditProc")
	private String boardEditProc(HttpServletRequest request) throws Exception{
		
		BoardVO board = new BoardVO();
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setBno(Integer.parseInt(request.getParameter("bno")));
		
		boardService.boardEditService(board);
		
		return "redirect:/board/boardDetail/"+request.getParameter("bno");
	}
	
	// board Delete
	@RequestMapping("/boardDel/{bno}")
	private String boardDel(@PathVariable int bno) throws Exception{
		boardService.boardDelService(bno);
		return "redirect:/board/boardList";
	}
}
