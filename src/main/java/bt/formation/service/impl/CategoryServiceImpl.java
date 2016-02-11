package bt.formation.service.impl;

import bt.formation.dto.CategoryDTO;
import bt.formation.entity.Category;
import bt.formation.entity.Offer;
import bt.formation.repository.CategoryRepository;
import bt.formation.repository.OfferRepository;
import bt.formation.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    OfferRepository offerRepository;

    @Override
    public Collection<CategoryDTO> getCategories() {
        List<Category> categories = categoryRepository.findAll();
        List<CategoryDTO> categoryDTOs = categories.stream().map(Category::toDto).collect(Collectors.toList());
        return categoryDTOs;
    }

    @Override
    public CategoryDTO createOrGetIfExists(String category) {
        Category cat = categoryRepository.findByName(category);
        if (cat == null) {
            cat = new Category();
            cat.setName(category);
            categoryRepository.save(cat);
        }
        return cat.toDto();
    }

    @Override
    public CategoryDTO findById(Long id) {
        return categoryRepository.findById(id).toDto();
    }

    @Override
    public Set<CategoryDTO> findAll() {
        List<Category> cats = categoryRepository.findAll();
        Set<CategoryDTO> catsDTO = new HashSet<>();
        for (Category cat : cats) {
            catsDTO.add(cat.toDto());
        }
        return catsDTO;
    }

    @Override
    public List<CategoryDTO> findAllByOrderByNameAsc() {
        List<Category> cats = categoryRepository.findAllByOrderByNameAsc();
        List<CategoryDTO> catsDTO = cats.stream().map(Category::toDto).collect(Collectors.toList());
        return catsDTO;
    }

    @Override
    public void deleteCategory(Long id) {
        if (categoryRepository.exists(id)) {
            replaceCategoryByOtherAndDelete(id);
        }
    }

    @Override
    public void deleteCategory(Category category) {
        if (categoryRepository.exists(category.getId())) {
            replaceCategoryByOtherAndDelete(category.getId());
        }
    }

    @Override
    public void replaceCategoryByOtherAndDelete(Long id) {
        List<Offer> list = offerRepository.findByCategoryId(id);
        for (Offer o : list) {
            o.getCategories().removeIf(category -> category.getId() == id);
            o.getCategories().add(categoryRepository.findById(1L));
        }
        categoryRepository.delete(categoryRepository.findById(id));
    }
}
