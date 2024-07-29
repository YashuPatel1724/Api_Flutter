class ECommModal
{
  late List<ProductModal> products;

  ECommModal({required this.products});

  factory ECommModal.fromJson(Map m1)
  {
    return ECommModal(products: (m1['products'] as List).map((e) => ProductModal.fromJson(e),).toList());
  }

}

class ProductModal {
  late String title, description, category, thumbnail,warrantyInformation,shippingInformation;
  late double price, discountPercentage, rating;
  late List<ReviewModal> reviews;
  late List images;

  ProductModal({required this.title,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.reviews,
    required this.images});

  factory ProductModal.fromJson(Map m1)
  {
    return ProductModal(title: m1['title'],
        warrantyInformation: m1['warrantyInformation'],
        shippingInformation: m1['shippingInformation'],
        description: m1['description'],
        category: m1['category'],
        thumbnail: m1['thumbnail'],
        price: m1['price'].toDouble(),
        discountPercentage: m1['discountPercentage'].toDouble(),
        rating: m1['rating'].toDouble(),
        reviews: (m1['reviews'] as List).map((e) => ReviewModal.fromJson(e),).toList(),
        images: m1['images']);
  }
}

class ReviewModal {
  late String comment, date, reviewerName, reviewerEmail;
  late int rating;

  ReviewModal({required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
    required this.rating});

  factory ReviewModal.fromJson(Map m1)
  {
    return ReviewModal(comment: m1['comment'],
        date: m1['date'],
        reviewerName: m1['reviewerName'],
        reviewerEmail: m1['reviewerEmail'],
        rating: m1['rating']);
  }
}
