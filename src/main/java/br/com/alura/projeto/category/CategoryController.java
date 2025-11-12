package br.com.alura.projeto.category;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Controller
public class CategoryController {

    private final CategoryRepository categoryRepository;

    public CategoryController(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("/admin/categories")
    public String list(Model model) {
        List<CategoryDTO> list = categoryRepository.findAll()
                .stream()
                .map(CategoryDTO::new)
                .toList();

        model.addAttribute("categories", list);

        return "admin/category/list";
    }

    @GetMapping("/admin/category/new")
    public String create(NewCategoryForm newCategory, Model model) {
        return "admin/category/newForm";
    }

    @Transactional
    @PostMapping("/admin/category/new")
    public String save(@Valid NewCategoryForm form, BindingResult result, Model model) {

        if (result.hasErrors()) {
            return create(form, model);
        }

        if (categoryRepository.existsByCode(form.getCode())) {
            return create(form, model);
        }

        categoryRepository.save(form.toModel());
        return "redirect:/admin/categories";
    }

    @GetMapping("/admin/category/{code}/edit")
    public String edit(@PathVariable String code, Model model) {
        Category category = categoryRepository.findByCode(code)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Category not found"));
        
        NewCategoryForm form = new NewCategoryForm();
        form.setName(category.getName());
        form.setCode(category.getCode());
        form.setColor(category.getColor());
        form.setOrder(category.getOrder());
        
        model.addAttribute("newCategoryForm", form);
        model.addAttribute("isEdit", true);
        model.addAttribute("categoryCode", code);
        
        return "admin/category/newForm";
    }

    @Transactional
    @PostMapping("/admin/category/{code}/edit")
    public String update(@PathVariable String code, @Valid NewCategoryForm form, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("isEdit", true);
            model.addAttribute("categoryCode", code);
            return "admin/category/newForm";
        }

        Category category = categoryRepository.findByCode(code)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Category not found"));
        if (!category.getCode().equals(form.getCode()) && categoryRepository.existsByCode(form.getCode())) {
            model.addAttribute("isEdit", true);
            model.addAttribute("categoryCode", code);
            model.addAttribute("error", "Code already exists");
            return "admin/category/newForm";
        }
        
        categoryRepository.delete(category);
        categoryRepository.save(form.toModel());
        
        return "redirect:/admin/categories";
    }

}
