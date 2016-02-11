package bt.formation.service;

import bt.formation.dto.CommentDTO;

import java.util.List;

public interface CommentService {

    CommentDTO createComment(CommentDTO comment);

    List<CommentDTO> findByUserId(Long id);
}
