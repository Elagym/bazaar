package bt.formation.service.impl;

import bt.formation.dto.CommentDTO;
import bt.formation.entity.Comment;
import bt.formation.repository.CommentRepository;
import bt.formation.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentRepository commentRepository;

    @Override
    public CommentDTO createComment(CommentDTO comment) {
        return commentRepository.save(comment.toEntity()).toDto();
    }

    @Override
    public List<CommentDTO> findByUserId(Long id) {
        List<CommentDTO> list = new ArrayList<>();
        for (Comment comment : commentRepository.findByUserId(id)) {
            list.add(comment.toDto());
        }
        return list;
    }
}
