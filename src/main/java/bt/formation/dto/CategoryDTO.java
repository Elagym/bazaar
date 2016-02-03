package bt.formation.dto;

import bt.formation.entity.Category;

/**
 * Created by Student on 27-01-16.
 */
public class CategoryDTO {

    private Long id;
    private String name;

    public Category toEntity(){
        Category cat = new Category();
        cat.setId(id);
        cat.setName(name);
        return cat;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String toString(){
        return name;
    }
}
