package jeden.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import jeden.common.Pagination;
import jeden.vo.BoardVO;

@Repository("jeden.mapper.BoardMapper")
public interface BoardMapper {
	
	public int boardCount() throws Exception;				// board count
	public List<BoardVO> boardList(Pagination pagination) throws Exception;		// board List
	public BoardVO boardDetail(int bno) throws Exception;	// board Detail
	public int boardPost(BoardVO board) throws Exception;	// board Post
	public int boardEdit(BoardVO board) throws Exception;	// board Edit
	public int boardDel(int bno) throws Exception;			// board Delete	
	public int getBoardListCnt() throws Exception;			// total post count
	

}
