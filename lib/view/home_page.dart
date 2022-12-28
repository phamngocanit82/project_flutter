import 'package:flutter/material.dart';
import '../base_widget.dart';
import '/data/favourite_data.dart';
import '/data/food_data.dart';
import '/model/favourite_model.dart';
import '/model/food_model.dart';
import '/utils/utils_language.dart';
import '/utils/utils_style.dart';
import '/view/widget/menu_category_widget.dart';
import '/view/widget/favourite_widget.dart';
import '/view/widget/food_widget.dart';

class HomePage extends BaseWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  List<FavouriteModel> favourites = <FavouriteModel>[];
  List<FoodModel> foods = <FoodModel>[];
  static List<String> categoryTitle = <String>[
    UtilsLanguage.shared.language("all list", "all list"),
    UtilsLanguage.shared.language("vietnamese list", "vietnamese list"),
    UtilsLanguage.shared.language("korean list", "korean list"),
    UtilsLanguage.shared.language("japanese list", "japanese list"),
  ];
  int indexTab = 0;
  @override
  void initState() {
    favourites = getFavourites();
    foods = getFoods();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    // this method IS called when parent widget is rebuilt
    super.didUpdateWidget(oldWidget);
  }

  @override
  didChangeDependencies() {
    // called when InheritedWidget updates
    // read more here https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: UtilsStyle.preferredSize(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                MenuCategoryWidget(
                  index: 0,
                  indexSelected: indexTab,
                  name: UtilsLanguage.shared.language("all", "all"),
                  callbackOnClicked: () {
                    debugPrint("all clicked.");
                  },
                  onClicked: (int index) {
                    menuSelected(index);
                  },
                ),
                MenuCategoryWidget(
                  index: 1,
                  indexSelected: indexTab,
                  name:
                      UtilsLanguage.shared.language("vietnamese", "vietnamese"),
                  callbackOnClicked: () {
                    debugPrint("vietnamese clicked.");
                  },
                  onClicked: (int index) {
                    menuSelected(index);
                  },
                ),
                MenuCategoryWidget(
                  index: 2,
                  indexSelected: indexTab,
                  name: UtilsLanguage.shared.language("korean", "korean"),
                  callbackOnClicked: () {
                    debugPrint("korean clicked.");
                  },
                  onClicked: (int index) {
                    menuSelected(index);
                  },
                ),
                MenuCategoryWidget(
                  index: 3,
                  indexSelected: indexTab,
                  name: UtilsLanguage.shared.language("japanese", "japanese"),
                  callbackOnClicked: () {
                    debugPrint("japanese clicked.");
                  },
                  onClicked: (int index) {
                    menuSelected(index);
                  },
                ),
              ],
            ),
          ),
          UtilsStyle.searchContainer(
              UtilsLanguage.shared.language("search food", "search food")),
          Expanded(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: UtilsStyle.categoryTitle(UtilsLanguage.shared
                        .language("favourite food", "favourite food")),
                  ),
                  FavouriteWidget(favourites),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                    child: UtilsStyle.categoryTitle(categoryTitle[indexTab]),
                  ),
                  FoodWidget(foods),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void menuSelected(int index) {
    setState(() => indexTab = index);
  }
}
