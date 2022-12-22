import 'package:flutter/material.dart';
import '/data/favourite_data.dart';
import '/model/favourite_model.dart';
import '/utils/utils_style.dart';
import '/view/widget/food_tile_widget.dart';
import '/view/widget/rating_widget.dart';
import '../constants.dart';

class FoodDetailPage extends StatefulWidget {
  final String? imgUrl;
  final String? name;
  final String? desc;
  final String? price;
  final double? rating;
  const FoodDetailPage(
      {super.key, this.rating, this.price, this.imgUrl, this.name, this.desc});
  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  List<FavouriteModel> favourites = <FavouriteModel>[];
  @override
  void initState() {
    favourites = getFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    UtilsStyle.clipRRect(
                        BorderRadius.circular(0),
                        widget.imgUrl!,
                        MediaQuery.of(context).size.width,
                        300,
                        BoxFit.cover),
                    Container(
                      height: 130,
                      margin: const EdgeInsets.symmetric(vertical: 170),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 180,
                            right: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.name!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white70,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.desc!,
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RatingWidget(widget.rating!.round()),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "${widget.rating}",
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [ReviewWidget(), ReviewWidget()],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut scelerisque arcu quis eros auctor, eu dapibus urna congue. Nunc nisi diam, semper maximus risus dignissim, semper maximus nibh. Sed finibus ipsum eu erat finibus efficitur. ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15,
                                height: 1.5,
                                fontWeight: FontWeight.w600,
                                color: colorTextInput),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              itemCount: favourites.length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return FoodTileWidget(
                                  imgUrl: favourites[index].imgUrl!,
                                );
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 30,
                ),
                const SizedBox(
                  width: 30,
                ),
                Image.asset(
                  "assets/heart.png",
                  height: 30,
                  width: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  final String? title;
  final String? noOfReviews;
  final double? rating;
  const ReviewWidget({super.key, this.rating, this.title, this.noOfReviews});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: const Color(0xffE9F4F9),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: const Color(0xffD5E6F2),
                      borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(
                    "assets/card1.png",
                    height: 30,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Yêu thích",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: colorTextInput),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "8.0/10",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: colorTextInput),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              " Based on 30 reviews",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colorTextInput),
            ),
          ],
        ));
  }
}
