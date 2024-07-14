class MenuItemsModel{
  MenuItemsModel({required this.foodName, this.isSelected = false});

  final String foodName;
  bool isSelected;

  static List<MenuItemsModel> menuItemsNames = [
    MenuItemsModel(foodName: "Dönər"),
    MenuItemsModel(foodName: "Pizza"),
    MenuItemsModel(foodName: "Taco"),
    MenuItemsModel(foodName: "Burger"),
    MenuItemsModel(foodName: "Lahmacun"),
    MenuItemsModel(foodName: "Qarnirlər"),
    MenuItemsModel(foodName: "Souslar"),
    MenuItemsModel(foodName: "İçkilər"),
  ];
}