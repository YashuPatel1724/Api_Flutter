class RecipesModal {
  late List<RecipesDetail> recipes = [];

  RecipesModal({required this.recipes});

  factory RecipesModal.fromJson(Map m1)
  {
    return RecipesModal(recipes: (m1['recipes'] as List).map((e) => RecipesDetail.fromJson(e),).toList());
  }
}

class RecipesDetail {
  late int id, prepTimeMinutes, cookTimeMinutes, reviewCount;
  late String name, image,cuisine,difficulty;
  late List tags = [];
  late List ingredients = [];
  late List instructions = [];

  RecipesDetail(
      {required this.difficulty,
        required this.id,
      required this.prepTimeMinutes,
      required this.cookTimeMinutes,
      required this.reviewCount,
      required this.name,
      required this.image,
      required this.tags,
      required this.ingredients,
      required this.instructions,
      required this.cuisine});

  factory RecipesDetail.fromJson(Map m1) {
    return RecipesDetail(
        difficulty : m1['difficulty'],
        id: m1['id'],
        prepTimeMinutes: m1['prepTimeMinutes'],
        cookTimeMinutes: m1['cookTimeMinutes'],
        reviewCount: m1['reviewCount'],
        name: m1['name'],
        image: m1['image'],
        tags: m1['tags'],
        ingredients: m1['ingredients'],
        instructions: m1['instructions'],
      cuisine: m1['cuisine']
    );
  }
}
