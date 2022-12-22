import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '/constants.dart';
import '/utils/utils_language.dart';
import '/utils/utils_platform.dart';
import 'card_swiper_example_swiper_in_scrollview.dart';
import 'card_swiper_example_custom.dart';

const images = <String>[
  'assets/bg0.jpeg',
  'assets/bg1.jpeg',
  'assets/bg2.jpeg',
];

class CardSwiperPage extends StatefulWidget {
  const CardSwiperPage({Key? key}) : super(key: key);
  @override
  State<CardSwiperPage> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(44),
            child: AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              elevation: 0.0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: colorTextInput),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )),
        body: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
              leading: Image.asset("assets/ic_menu_user.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("Example Horizontal", "Example Horizontal"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleHorizontal()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_user.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("Example Vertical", "Example Vertical"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleVertical()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_user.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("Example Fraction", "Example Fraction"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleFraction()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_user.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language(
                    "Example Custom Pagination", "Example Custom Pagination"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleCustomPagination()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_user.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("Example Phone", "Example Phone"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExamplePhone()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_user.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared.language("Example Swiper In ScrollView",
                    "Example Swiper In ScrollView"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ExampleSwiperInScrollView()));
              },
            ),
            ListTile(
              leading: Image.asset("assets/ic_menu_user.png",
                  width: 40.0, height: 40.0, color: colorMenu),
              title: Text(
                UtilsLanguage.shared
                    .language("Example Custom", "Example Custom"),
                style: TextStyle(
                    fontSize: 13 * UtilsDevice.shared.ratio, color: colorMenu),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleCustom()));
              },
            ),
          ]).toList(),
        ));
  }
}

const List<String> titles = [
  'Flutter Swiper is awesome',
  'Really nice',
  'Yeah'
];

class ExampleHorizontal extends StatelessWidget {
  const ExampleHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExampleHorizontal'),
      ),
      body: Swiper(
        itemBuilder: (context, index) {
          final image = images[index];
          return Image.asset(
            image,
            fit: BoxFit.fill,
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        itemCount: images.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}

class ExampleVertical extends StatelessWidget {
  const ExampleVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ExampleVertical'),
        ),
        body: Swiper(
          itemBuilder: (context, index) {
            return Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          pagination: const SwiperPagination(alignment: Alignment.centerRight),
          control: const SwiperControl(),
        ));
  }
}

class ExampleFraction extends StatelessWidget {
  const ExampleFraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ExampleFraction'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Swiper(
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: images.length,
              pagination:
                  const SwiperPagination(builder: SwiperPagination.fraction),
              control: const SwiperControl(),
            )),
            Expanded(
                child: Swiper(
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: images.length,
              scrollDirection: Axis.vertical,
              pagination: const SwiperPagination(
                  alignment: Alignment.centerRight,
                  builder: SwiperPagination.fraction),
            ))
          ],
        ));
  }
}

class ExampleCustomPagination extends StatelessWidget {
  const ExampleCustomPagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Custom Pagination'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Swiper(
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: images.length,
                pagination: SwiperPagination(
                    margin: EdgeInsets.zero,
                    builder: SwiperCustomPagination(builder: (context, config) {
                      return ConstrainedBox(
                        constraints: const BoxConstraints.expand(height: 50.0),
                        child: Container(
                          color: Colors.white,
                          child: Text(
                            '${titles[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}',
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                      );
                    })),
                control: const SwiperControl(),
              ),
            ),
            Expanded(
              child: Swiper(
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: images.length,
                pagination: SwiperPagination(
                    margin: EdgeInsets.zero,
                    builder: SwiperCustomPagination(builder: (context, config) {
                      return ConstrainedBox(
                        constraints: const BoxConstraints.expand(height: 50.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '${titles[config.activeIndex]} ${config.activeIndex + 1}/${config.itemCount}',
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: const DotSwiperPaginationBuilder(
                                        color: Colors.black12,
                                        activeColor: Colors.black,
                                        size: 10.0,
                                        activeSize: 20.0)
                                    .build(context, config),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
                control: const SwiperControl(color: Colors.redAccent),
              ),
            )
          ],
        ));
  }
}

class ExamplePhone extends StatelessWidget {
  const ExamplePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone'),
      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.asset(
              'assets/bg0.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          Swiper.children(
            autoplay: false,
            pagination: const SwiperPagination(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                builder: DotSwiperPaginationBuilder(
                    color: Colors.white30,
                    activeColor: Colors.white,
                    size: 20.0,
                    activeSize: 20.0)),
            children: <Widget>[
              Image.asset(
                'assets/bg1.jpeg',
                fit: BoxFit.contain,
              ),
              Image.asset(
                'assets/bg2.jpeg',
                fit: BoxFit.contain,
              ),
              Image.asset('assets/bg1.jpeg', fit: BoxFit.contain)
            ],
          )
        ],
      ),
    );
  }
}

class ScaffoldWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final List<Widget>? actions;

  const ScaffoldWidget({
    Key? key,
    required this.title,
    required this.child,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: child,
    );
  }
}
