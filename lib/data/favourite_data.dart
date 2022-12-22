import '../model/favourite_model.dart';

List<FavouriteModel> getFavourites() {
  List<FavouriteModel> favourites = <FavouriteModel>[];

  FavouriteModel favouriteModel = FavouriteModel();
  favouriteModel.title = "Cơm sườn";
  favouriteModel.desc = "Cơm tấm sườn bì chả";
  favouriteModel.label = "Món ngon";
  favouriteModel.price = "50k VND";
  favouriteModel.rating = 4.5;
  favouriteModel.imgUrl =
      "https://img-global.cpcdn.com/recipes/a9b651b21ea75cd5/640x640sq70/photo.jpg";
  favourites.add(favouriteModel);

  favouriteModel = FavouriteModel();
  favouriteModel.title = "Cơm chiên hải sản";
  favouriteModel.desc = "Hải sản tôm mực";
  favouriteModel.label = "Bán chạy";
  favouriteModel.price = "60k VND";
  favouriteModel.rating = 4.3;
  favouriteModel.imgUrl =
      "https://file.hstatic.net/1000335798/file/2ba8c45678e99db7c4f8_e8a9bc52843b4c79a5bb7ee45277dbe4_grande.jpg";
  favourites.add(favouriteModel);

  favouriteModel = FavouriteModel();
  favouriteModel.title = "Bún Thịt Nướng";
  favouriteModel.desc = "Bún Thịt Nướng";
  favouriteModel.label = "Yêu thích";
  favouriteModel.price = "50k VND";
  favouriteModel.rating = 4.5;
  favouriteModel.imgUrl =
      "https://images.foody.vn/res/g29/286815/prof/s640x400/foody-mobile-1-jpg-208-636129001996747697.jpg";
  favourites.add(favouriteModel);

  favouriteModel = FavouriteModel();
  favouriteModel.title = "Cơm sườn";
  favouriteModel.desc = "Cơm tấm sườn bì chả";
  favouriteModel.label = "Món ngon";
  favouriteModel.price = "50k VND";
  favouriteModel.rating = 4.5;
  favouriteModel.imgUrl =
      "https://img-global.cpcdn.com/recipes/a9b651b21ea75cd5/640x640sq70/photo.jpg";
  favourites.add(favouriteModel);

  favouriteModel = FavouriteModel();
  favouriteModel.title = "Cơm chiên hải sản";
  favouriteModel.desc = "Hải sản tôm mực";
  favouriteModel.label = "Bán chạy";
  favouriteModel.price = "\$60k VND";
  favouriteModel.rating = 4.3;
  favouriteModel.imgUrl =
      "https://file.hstatic.net/1000335798/file/2ba8c45678e99db7c4f8_e8a9bc52843b4c79a5bb7ee45277dbe4_grande.jpg";
  favourites.add(favouriteModel);

  favouriteModel = FavouriteModel();
  favouriteModel.title = "Bún Thịt Nướng";
  favouriteModel.desc = "Bún Thịt Nướng";
  favouriteModel.label = "Yêu thích";
  favouriteModel.price = "50k VND";
  favouriteModel.rating = 4.5;
  favouriteModel.imgUrl =
      "https://images.foody.vn/res/g29/286815/prof/s640x400/foody-mobile-1-jpg-208-636129001996747697.jpg";
  favourites.add(favouriteModel);

  return favourites;
}
