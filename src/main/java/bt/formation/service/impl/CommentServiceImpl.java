package bt.formation.service.impl;

import bt.formation.dto.CommentDTO;
import bt.formation.repository.CommentRepository;
import bt.formation.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentRepository commentRepository;

    @Override
    public CommentDTO createComment(CommentDTO comment) {
        return commentRepository.save(comment.toEntity()).toDto();
    }
}
