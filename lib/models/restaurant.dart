class Restaurant {
  final String slug;
  final String id;
  final String name;
  final String image;
  final String address;
  final String phone;

  Restaurant({
    this.slug,
    this.id,
    this.name,
    this.image,
    this.address,
    this.phone
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      slug: json['slug'],
      id: json['_id'],
      name: json['restaurantName'],
      image: json['restaurantImage'],
      address: json['restaurantAddress'],
      phone: json['restaurantContact']
    );
  }
}