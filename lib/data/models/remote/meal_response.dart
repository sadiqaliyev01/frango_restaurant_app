class MealResponse {
  final String? id;
  final String? title;
  final String? image;
  final List<String>? ingredientsList;
  final Category? category;
  final String? description;
  final double carbohydrates;
  final double calories;
  final double fat;
  final double gram;
  final double protein;
  final double price;
  final double salePrice;
  final int? rate;

  MealResponse({
    this.id,
    this.title,
    this.image,
    this.ingredientsList,
    this.category,
    this.description,
    required this.carbohydrates,
    required this.calories,
    required this.fat,
    required this.gram,
    required this.protein,
    required this.price,
    required this.salePrice,
    this.rate,
  });
  factory MealResponse.fromJson(Map<String, dynamic> json) {
    return MealResponse(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      ingredientsList: json['ingredients'] as List<String>? ?? [],
      category: Category(
        id: json['category']['id'],
        title: json['category']['title'],
        image: json['category']['image'],
      ),
      description: json['description'],
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble() ?? 0.0,
      calories: (json['calories'] as num?)?.toDouble() ?? 0.0,
      fat: (json['fat'] as num?)?.toDouble() ?? 0.0,
      gram: (json['gram'] as num?)?.toDouble() ?? 0.0,
      protein: (json['protein'] as num?)?.toDouble() ?? 0.0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      salePrice: (json['sale_price'] as num?)?.toDouble() ?? 0.0,
      rate: (json['rate'] as num?)?.toInt(),
    );
  }
}

class Category {
  final String? id;
  final String? title;
  final String? image;

  Category({
    this.id,
    this.title,
    this.image,
  });
}
