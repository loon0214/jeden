package jeden.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeden.common.Pagination;
import jeden.mapper.BoardMapper;
import jeden.vo.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper boardMapper;

	public List<BoardVO> boardListService(Pagination pagination) throws Exception{
		return boardMapper.boardList(pagination);
	}

	public BoardVO boardDetailService(int bno) throws Exception{
		return boardMapper.boardDetail(bno);
	}

	public int boardPostService(BoardVO board) throws Exception{
		return boardMapper.boardPost(board);
	}

	public int boardEditService(BoardVO board) throws Exception{
		return boardMapper.boardEdit(board);
	}

	public int boardDelService(int bno) throws Exception{
		return boardMapper.boardDel(bno);
	}
	
	public int getBoardListCnt() throws Exception{
		return boardMapper.getBoardListCnt();
	}
	
	

}
