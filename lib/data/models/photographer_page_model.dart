class PhotographerPageModel {
  String image;
  String name;
  String bio;
  String rate;
  bool isFavourit;
  int photographerId;
  PhotographerPageModel(
      {required this.image,
      required this.name,
      required this.bio,
      required this.rate,
      required this.isFavourit,
      required this.photographerId});
}
