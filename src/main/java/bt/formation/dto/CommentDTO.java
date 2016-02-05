package bt.formation.dto;

import bt.formation.entity.Comment;

/**
 * Created by Student on 27-01-16.
 */
public class CommentDTO {

    private Long id;
    private String title;
    private String description;
    private boolean liked;
    private UserDTO author;

    public Comment toEntity(){
        Comment comment = new Comment();
        comment.setId(id);
        comment.setTitle(title);
        comment.setDescription(description);
        comment.setLiked(liked);
        comment.setAuthor(author.toEntity());
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

    public boolean isLiked() {
        return liked;
    }

    public void setLiked(boolean liked) {
        this.liked = liked;
    }

    public UserDTO getAuthor() {
        return author;
    }

    public void setAuthor(UserDTO author) {
        this.author = author;
    }
}
