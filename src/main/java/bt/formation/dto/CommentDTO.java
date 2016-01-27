package bt.formation.dto;

import bt.formation.entity.Comment;

/**
 * Created by Student on 27-01-16.
 */
public class CommentDTO {

    private Long id;
    private String title;
    private String description;
    private boolean like;

    public Comment toEntity(){
        Comment comment = new Comment();
        comment.setId(id);
        comment.setTitle(title);
        comment.setDescription(description);
        comment.setLike(like);
        return comment;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isLike() {
        return like;
    }

    public void setLike(boolean like) {
        this.like = like;
    }
}