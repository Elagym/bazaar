package bt.formation.entity;

import javax.annotation.Generated;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by Student on 27-01-16.
 */

@Entity
public class Advertisement {

    @Id @GeneratedValue
    private Long Id;
    private String title;
    private String description;
    private String imageUrl;
    private Date creationDate;

    public Advertisement() {
    }
}
