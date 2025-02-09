class MealResponse {
  final String? id;
  final int? position;
  final String? title;
  final String? image;
  final List<Meal>? meal;

  MealResponse({
    this.id,
    this.position,
    this.title,
    this.image,
    this.meal,
  });

  factory MealResponse.fromJson(Map<String, dynamic> json) => MealResponse(
        id: json["id"],
        position: json["position"],
        title: json["title"],
        image: json["image"],
        meal: json["meal"] == null
            ? []
            : List<Meal>.from(json["meal"]!.map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
        "title": title,
        "image": image,
        "meal": meal == null
            ? []
            : List<dynamic>.from(meal!.map((x) => x.toJson())),
      };
}

class Meal {
  final String? id;
  final String? title;
  final String? image;
  final List<String>? ingredientsList;
  final String? description;
  final double? carbohydrates; // Change to double
  final double? calories; // Change to double
  final double? fat; // Change to double
  final double? gram; // Change to double
  final double? protein; // Change to double
  final double? price; // Change to double
  final double? salePrice; // Change to double
  final double? rate; // Change to double

  Meal({
    this.id,
    this.title,
    this.image,
    this.ingredientsList,
    this.description,
    this.carbohydrates,
    this.calories,
    this.fat,
    this.gram,
    this.protein,
    this.price,
    this.salePrice,
    this.rate,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        ingredientsList: json["ingredientsList"] == null
            ? []
            : List<String>.from(json["ingredientsList"]!.map((x) => x)),
        description: json["description"],
        carbohydrates: json["carbohydrates"],
        calories: json["calories"],
        fat: json["fat"],
        gram: json["gram"],
        protein: json["protein"],
        price: json["price"],
        salePrice: json["salePrice"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "ingredientsList": ingredientsList == null
            ? []
            : List<dynamic>.from(ingredientsList!.map((x) => x)),
        "description": description,
        "carbohydrates": carbohydrates,
        "calories": calories,
        "fat": fat,
        "gram": gram,
        "protein": protein,
        "price": price,
        "salePrice": salePrice,
        "rate": rate,
      };
}
