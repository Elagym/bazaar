package bt.formation.service;

import bt.formation.dto.CategoryDTO;
import bt.formation.entity.Category;

import java.util.Collection;

public interface CategoryService {

    Collection<CategoryDTO> getCategories();

    CategoryDTO createOrGetIfExists(String category);
}
