class SearchModal {
  late List<Hit> hits = [];

  SearchModal({required this.hits});

  factory SearchModal.fromJson(Map m1) {
    return SearchModal(
        hits: (m1['hits'] as List)
            .map(
              (e) => Hit.fromJson(e),
            )
            .toList());
  }
}

class Hit {
  late int views, downloads, likes, user_id;
  late String webformatURL, user;

  Hit(
      {required this.webformatURL,
      required this.views,
      required this.user,
      required this.downloads,
      required this.likes,
      required this.user_id});

  factory Hit.fromJson(Map m1) {
    return Hit(
      user_id: m1['user_id'],
        webformatURL: m1['webformatURL'],
        views: m1['views'],
        user: m1['user'],
        downloads: m1['downloads'],
        likes: m1['likes']);
  }
}
