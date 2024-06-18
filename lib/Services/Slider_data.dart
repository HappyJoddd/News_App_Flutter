import 'package:news_app/models/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> category = [];
  SliderModel sliderModel = new SliderModel();

  sliderModel.name = "Bow to The Authority of Silenforce";
  sliderModel.image = 'images/business.jpeg';
  category.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.name = "Bow to The Authority of Silenforce";
  sliderModel.image = 'images/entertainment.jpeg';
  category.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.name = "Bow to The Authority of Silenforce";
  sliderModel.image = 'images/science.jpeg';
  category.add(sliderModel);
  sliderModel = new SliderModel();

  sliderModel.name = "Bow to The Authority of Silenforce";
  sliderModel.image = 'images/sport.jpeg';
  category.add(sliderModel);
  sliderModel = new SliderModel();

  return category;
}
