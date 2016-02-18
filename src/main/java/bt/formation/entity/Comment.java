package bt.formation.entity;

import bt.formation.dto.CommentDTO;
import bt.formation.dto.UserDTO;

import javax.persistence.*;

@Entity
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;
    private boolean liked;
    @ManyToOne
    private User author;

    public Comment() {
    }

    public Comment(String title, String description, Boolean liked) {
        this.title = title;
        this.description = description;
        this.liked = liked;
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

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public CommentDTO toDto(){
        CommentDTO dto = new CommentDTO();
        dto.setId(id);
        dto.setDescription(description);
        dto.setLiked(liked);
        dto.setTitle(title);
        UserDTO u = new UserDTO();
        u.setId(author.getId());
        u.setUsername(author.getUsername());
        dto.setAuthor(u);
        return dto;
    }
}
