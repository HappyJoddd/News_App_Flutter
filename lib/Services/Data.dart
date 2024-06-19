import 'package:news_app/models/Category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.image = 'images/business.jpeg';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.image = 'images/entertainment.jpeg';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Technology";
  categoryModel.image = 'images/general.jpeg';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.image = 'images/health.jpeg';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Science";
  categoryModel.image = 'images/science.jpeg';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Sport";
  categoryModel.image = 'images/sport.jpeg';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
