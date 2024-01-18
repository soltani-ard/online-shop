import 'package:online_shop/features/shop/models/category_model.dart';
import 'package:online_shop/utils/constants/image_strings.dart';

class TDummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronics', image: TImages.toyIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: TImages.jerseyIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: TImages.shoesIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '8', name: 'Jewelery', image: TImages.jewelIcon, isFeatured: true),

    // sub categories
    // CategoryModel(id: '9', name: 'Sport Shoes', image: TImages.sportIcon, isFeatured: false, parentId: '1'),
    // CategoryModel(id: '10', name: 'Track Suites', image: TImages.sportIcon, isFeatured: false, parentId: '1'),
    // CategoryModel(id: '11', name: 'Sport Equipments', image: TImages.sportIcon, isFeatured: false, parentId: '1'),
    //
    // CategoryModel(id: '12', name: 'Bedroom Furniture', image: TImages.furnitureIcon, isFeatured: false, parentId: '5'),
    // CategoryModel(id: '13', name: 'Kitchen Furniture', image: TImages.furnitureIcon, isFeatured: false, parentId: '5'),
    // CategoryModel(id: '14', name: 'Office Furniture', image: TImages.furnitureIcon, isFeatured: false, parentId: '5'),
    //
    // CategoryModel(id: '15', name: 'Laptop', image: TImages.toyIcon, isFeatured: false, parentId: '2'),
    // CategoryModel(id: '16', name: 'Mobile', image: TImages.toyIcon, isFeatured: false, parentId: '2'),
    //
    // CategoryModel(id: '17', name: 'Shirts', image: TImages.jerseyIcon, isFeatured: false, parentId: '3'),
  ];
}