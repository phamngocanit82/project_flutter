import 'package:flutter/material.dart';
import '/model/favourite_model.dart';
import '/utils/utils_language.dart';
import '/utils/utils_platform.dart';
import '/utils/utils_style.dart';
import '/constants.dart';
import '../food_detail_page.dart';

class FavouriteWidget extends StatelessWidget {
  final List<FavouriteModel> favourites;
  const FavouriteWidget(this.favourites, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ListView.builder(
          itemCount: favourites.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return FavouriteItemWidget(
              label: favourites[index].label,
              title: favourites[index].title,
              desc: favourites[index].desc,
              price: favourites[index].price,
              rating: favourites[index].rating,
              imgUrl: favourites[index].imgUrl,
            );
          }),
    );
  }
}

class FavouriteItemWidget extends StatelessWidget {
  final String? label;
  final String? title;
  final String? desc;
  final String? price;
  final double? rating;
  final String? imgUrl;
  const FavouriteItemWidget(
      {super.key,
      this.title,
      this.desc,
      this.label,
      this.price,
      this.rating,
      this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetailPage(
                      imgUrl: imgUrl,
                      name: title,
                      desc: desc,
                      rating: rating,
                      price: price,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            UtilsStyle.clipRRect(
                BorderRadius.circular(8), imgUrl!, 150, 150, BoxFit.cover),
            SizedBox(
              height: 150,
              width: 150,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 8, top: 8),
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: colorGreenTransparent),
                          child: Text(
                            label ??
                                UtilsLanguage.shared
                                    .language("new food", "new food"),
                            style: TextStyle(
                                fontSize: 12 * UtilsDevice.shared.ratio,
                                color: Colors.white),
                          ))
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            bottom: 10, left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 90,
                              child: UtilsStyle.textFavouriteTitle(title!),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            UtilsStyle.textFavouriteTitle(price!),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                          margin: const EdgeInsets.only(bottom: 10, right: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: colorRedTransparent),
                          child: Column(
                            children: [
                              UtilsStyle.textFavouriteRating("$rating"),
                              const SizedBox(
                                height: 2,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 20,
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
