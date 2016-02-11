package bt.formation.service;

import bt.formation.dto.CategoryDTO;
import bt.formation.entity.Category;

import java.util.Collection;
import java.util.List;
import java.util.Set;

public interface CategoryService {

    Collection<CategoryDTO> getCategories();

    CategoryDTO createOrGetIfExists(String category);

    CategoryDTO findById(Long id);

    Set<CategoryDTO> findAll();

    List<CategoryDTO> findAllByOrderByNameAsc();

    void deleteCategory(Long id);

    void deleteCategory(Category category);

    void replaceCategoryByOtherAndDelete(Long id);
}
