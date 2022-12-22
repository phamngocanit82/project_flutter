import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/constants.dart';

class OrderWidget extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String price;
  final double rating;
  const OrderWidget(
      {super.key,
      required this.imgUrl,
      required this.rating,
      required this.desc,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: const Color(0xffebeaea),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4E6059)),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  desc,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff89A097)),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  price,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff89A097)),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
              margin: const EdgeInsets.only(bottom: 0, right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: const Icon(
                Icons.delete,
                color: kTaskColor,
                size: 24,
              ))
        ],
      ),
    );
  }
}
