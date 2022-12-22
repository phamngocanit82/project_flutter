import 'package:flutter/material.dart';
import '/utils/utils_language.dart';
import '/utils/utils_platform.dart';
import '/utils/utils_style.dart';
import '/constants.dart';
import 'examples/carousel_slider_page.dart';
import 'examples/card_page.dart';
import 'examples/image_picker_page.dart';
import 'examples/mask_text_input_formatter_page.dart';
import 'examples/barcode_scanner_page.dart';
import 'examples/parser_text_page.dart';
import 'examples/zoom_widget_page.dart';
import 'examples/card_swiper_page.dart';
import 'examples/toggle_switch_page.dart';
import 'examples/clay_container_page.dart';
import 'examples/lite_rolling_switch_page.dart';
import 'examples/tutorial_coach_mark_page.dart';
import 'examples/photo_view_page.dart';
import 'examples/svg_page.dart';
import 'examples/image_cropper_page.dart';
import 'examples/api_repository_page.dart';
import 'examples/spinkit_page.dart';
import 'examples/shimmer_page.dart';
import 'examples/flutter_slidable_page.dart';
import 'examples/qr_flutter_page.dart';
import 'examples/encrypt_page.dart';
import 'login_page.dart';
/*import 'package:flutter_cuisine/view/generic_page.dart';
import 'package:flutter_cuisine/view/image_cropper_page.dart';
import 'package:flutter_cuisine/view/multi_image_picker.dart';
import 'package:flutter_cuisine/view/api_repository_page.dart';
import 'package:flutter_cuisine/view/smooth_star_rating_page.dart';
import 'barcode_scanner_page.dart';
import 'carousel_slider_page.dart';
import 'clay_container_page.dart';
import 'contact_page.dart';
import 'lite_rolling_switch_page.dart';*/

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: UtilsStyle.preferredSize(),
        body: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
              leading: Image.asset("assets/ic_menu_user.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("my account", "my account"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("carousel slider", "Carousel Slider"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                //navService.pushNamed('/carousel_slider_page', args: 'From Home Screen');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CarouselSliderPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("card", "Card"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CardPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("image picker", "Image Picker"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ImagePickerPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("smooth star rating", "Smooth Star Rating"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SmoothStarRatingPage()));*/
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language(
                    "mask text input formatter", "Mask Text Input Formatter"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MaskTextInputFormatterPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("barcode scanner", "Barcode Scanner"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BarcodeScannerPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("parser text", "Parser Text"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ParserTextPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("zoom widget", "Zoom Widget"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ZoomWidgetPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("toggle switch", "Toggle Switch"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ToggleSwitchPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("clay container", "Clay Container"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ClayContainerPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("lite rolling switch", "Lite Rolling Switch"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LiteRollingSwitchPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("tutorial coach mark", "Tutorial Coach Mark"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TutorialCoachMarkPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("photo view", "Photo View"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PhotoViewPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("svg", "svg"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SvgPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("image cropper", "Image Cropper"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ImageCropperPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("api repository", "Api Repository"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ApiRepositoryPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("spinkit", "Spinkit"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SpinkitPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("shimmer", "shimmer"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShimmerPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("Flutter Slidable", "Flutter Slidable"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FlutterSlidablePage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("QR Flutter", "QR Flutter"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QRFlutterPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("encrypt", "encrypt"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EncryptPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("Card Swiper", "Card Swiper"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CardSwiperPage()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_history.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("generic", "Generic"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GenericPage()));*/
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_contact.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("contact us", "contact us"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactPage()));*/
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_logout.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("logout", "logout"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
            ),
          ]).toList(),
        ));
  }
}
