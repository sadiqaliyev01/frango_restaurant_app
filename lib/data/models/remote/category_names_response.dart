class CategoryNamesResponse {
  final String? id;
  final String? title;
  final String? image;

  CategoryNamesResponse({
    this.id,
    this.title,
    this.image,
  });

  factory CategoryNamesResponse.fromJson(Map<String, dynamic> json) {
    return CategoryNamesResponse(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
