class Food {
  final String slug;
  final String id;
  final String name;
  final String image;
  final String cookTime;
  final String restaurantId;
  final int price;
  final String restaurantName;

  Food({
    this.slug,
    this.id,
    this.name,
    this.image,
    this.cookTime,
    this.restaurantId,
    this.price,
    this.restaurantName
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
        slug: json['slug'],
        id: json['_id'],
        name: json['foodName'],
        image: json['foodImage'],
        cookTime: json['cookingTime'],
        restaurantId: json['restaurantContact'],
        price: json['foodPrice'],
        restaurantName: json['restaurantName']
    );
  }
}