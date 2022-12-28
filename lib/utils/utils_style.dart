import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'utils_device.dart';

abstract class UtilsStyle {
  static PreferredSize preferredSize() => PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: AppBar(
        backgroundColor: kWhiteColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ));
  static ClipRRect clipRRect(BorderRadius borderRadius, String imageUrl,
          double width, double height, BoxFit boxFit) =>
      ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: boxFit,
        ),
      );
  static Text categoryTitle(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 13 * UtilsDevice.shared.ratio,
            fontWeight: FontWeight.w600,
            color: colorCategoryTitle),
      );
  //Food
  static Text textTitle(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 13 * UtilsDevice.shared.ratio,
            fontWeight: FontWeight.w600,
            color: colorTitle),
      );
  static Text textDesc(String desc) => Text(
        desc,
        style: TextStyle(
            fontSize: 12 * UtilsDevice.shared.ratio,
            fontWeight: FontWeight.w400,
            color: colorDesc),
      );
  static Text textPrice(String price) => Text(
        price,
        style: TextStyle(
            fontSize: 12 * UtilsDevice.shared.ratio,
            fontWeight: FontWeight.w400,
            color: colorPrice),
      );
  static Text textRating(String rating) => Text(
        rating,
        style: TextStyle(
            fontSize: 11 * UtilsDevice.shared.ratio,
            fontWeight: FontWeight.w600,
            color: colorRating),
      );
  //Favourite
  static Text textFavouriteTitle(String title) => Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
            fontSize: 13 * UtilsDevice.shared.ratio,
            fontWeight: FontWeight.w600,
            color: colorFavouriteTitle),
      );
  static Text textFavouritePrice(String price) => Text(
        price,
        style: TextStyle(
            fontSize: 11 * UtilsDevice.shared.ratio,
            fontWeight: FontWeight.w400,
            color: colorFavouritePrice),
      );
  static Text textFavouriteRating(String rating) => Text(
        rating,
        style: TextStyle(
            fontSize: 11 * UtilsDevice.shared.ratio,
            fontWeight: FontWeight.w400,
            color: colorFavouriteRating),
      );
  //Tabbar Notification
  static Tab tabTitle(String title) => Tab(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 13 * UtilsDevice.shared.ratio,
              fontWeight: FontWeight.w600),
        ),
      );
  static Container searchContainer(String hintText) => Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: 40,
        width: double.infinity,
        child: TextField(
          style: TextStyle(
              fontSize: 13 * UtilsDevice.shared.ratio,
              height: 1,
              color: colorTextInput),
          cursorColor: colorTextInput,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(color: Colors.black87)),
            prefixIcon: const SizedBox(
                width: 30,
                child: Icon(
                  Icons.search,
                  color: colorTextInput,
                  size: 24,
                )),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: colorTextInput, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(4))),
          ),
        ),
      );
  static TextFormField textFormField(
          TextEditingController textEditingController,
          FocusNode focusNode,
          String labelText,
          Function()? requestFocus,
          Image image,
          AsyncSnapshot snapshot,
          {bool obscureText = false}) =>
      TextFormField(
          controller: textEditingController,
          style: TextStyle(
              fontSize: 13 * UtilsDevice.shared.ratio,
              height: 1,
              color: colorTextInput),
          obscureText: obscureText,
          cursorColor: colorTextInput,
          keyboardType: TextInputType.emailAddress,
          focusNode: focusNode,
          onTap: requestFocus,
          decoration: InputDecoration(
              //errorText:snapshot.hasError?snapshot.error:null,
              isDense: true,
              labelText: labelText,
              labelStyle: TextStyle(
                  color: focusNode.hasFocus ? Colors.black87 : colorTextInput),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(color: Colors.black87)),
              prefixIcon: SizedBox(
                  width: 30,
                  child: image), // Image.asset("assets/ic_phone.png")),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: colorTextInput, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(4)))));
}
