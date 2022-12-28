import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../base_widget.dart';
import '/constants.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class CarouselSliderPage extends BaseWidget {
  final String title = "Carousel Slider";
  const CarouselSliderPage({Key? key}) : super(key: key);
  @override
  State<CarouselSliderPage> createState() => _CarouselSliderPageState();
}

class _CarouselSliderPageState extends BaseState<CarouselSliderPage> {
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
        children: <Widget>[
          ListTile(
              title: const Text('Basic demo'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BasicDemo()));
              }),
          ListTile(
              title: const Text('No center mode demo'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NoCenterDemo()));
              }),
          ListTile(
              title: const Text('Image carousel slider'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ImageSliderDemo()));
              }),
          ListTile(
              title: const Text('More complicated image slider'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ComplicatedImageDemo()));
              }),
          ListTile(
              title: const Text('Enlarge strategy demo slider'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnlargeStrategyDemo()));
              }),
          ListTile(
              title: const Text('Manually controlled slider'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ManuallyControlledSlider()));
              }),
          ListTile(
              title: const Text('Noon-looping carousel slider'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NoonLoopingDemo()));
              }),
          ListTile(
              title: const Text('Vertical carousel slider'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerticalSliderDemo()));
              }),
          ListTile(
              title: const Text('Fullscreen carousel slider'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FullscreenSliderDemo()));
              }),
          ListTile(
              title: const Text('On-demand carousel slider'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnDemandCarouselDemo()));
              }),
          ListTile(
              title: const Text('Carousel with indicator demo'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CarouselWithIndicatorDemo()));
              }),
          ListTile(
              title: const Text('Image carousel slider with prefetch demo'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrefetchImageDemo()));
              }),
          ListTile(
              title: const Text('Carousel change reason demo'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CarouselChangeReasonDemo()));
              }),
          ListTile(
              title: const Text('Keep pageview position demo'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const KeepPageviewPositionDemo()));
              }),
          ListTile(
              title: const Text('Multiple item in one screen demo'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MultipleItemDemo()));
              }),
        ],
      ),
    );
  }
}

class BasicDemo extends StatelessWidget {
  const BasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(title: const Text('Basic demo')),
      body: CarouselSlider(
        options: CarouselOptions(),
        items: list
            .map((item) => Container(
                  color: Colors.green,
                  child: Center(child: Text(item.toString())),
                ))
            .toList(),
      ),
    );
  }
}

class NoCenterDemo extends StatelessWidget {
  const NoCenterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(title: const Text('Basic demo')),
      body: CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
        ),
        items: list
            .map((item) => Container(
                  color: Colors.green,
                  child: Text(item.toString()),
                ))
            .toList(),
      ),
    );
  }
}

class ImageSliderDemo extends StatelessWidget {
  const ImageSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image slider demo')),
      body: CarouselSlider(
        options: CarouselOptions(),
        items: imgList
            .map((item) => Center(
                child: Image.network(item, fit: BoxFit.cover, width: 1000)))
            .toList(),
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'No. ${imgList.indexOf(item)} image',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  const ComplicatedImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complicated image slider demo')),
      body: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}

class EnlargeStrategyDemo extends StatelessWidget {
  const EnlargeStrategyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complicated image slider demo')),
      body: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
        items: imageSliders,
      ),
    );
  }
}

class ManuallyControlledSlider extends StatefulWidget {
  const ManuallyControlledSlider({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Manually controlled slider')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(enlargeCenterPage: true, height: 200),
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.previousPage(),
                      child: const Text('←'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.nextPage(),
                      child: const Text('→'),
                    ),
                  ),
                  ...Iterable<int>.generate(imgList.length).map(
                    (int pageIndex) => Flexible(
                      child: ElevatedButton(
                        onPressed: () => _controller.animateToPage(pageIndex),
                        child: Text("$pageIndex"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class NoonLoopingDemo extends StatelessWidget {
  const NoonLoopingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Noon-looping carousel demo')),
      body: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: true,
        ),
        items: imageSliders,
      ),
    );
  }
}

class VerticalSliderDemo extends StatelessWidget {
  const VerticalSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vertical sliding carousel demo')),
      body: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
          autoPlay: true,
        ),
        items: imageSliders,
      ),
    );
  }
}

class FullscreenSliderDemo extends StatelessWidget {
  const FullscreenSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fullscreen sliding carousel demo')),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Center(
                        child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      height: height,
                    )))
                .toList(),
          );
        },
      ),
    );
  }
}

class OnDemandCarouselDemo extends StatelessWidget {
  const OnDemandCarouselDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('On-demand carousel demo')),
      body: CarouselSlider.builder(
        itemCount: 100,
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          autoPlay: true,
        ),
        itemBuilder: (ctx, index, realIdx) {
          return Text(index.toString());
        },
      ),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Carousel with indicator controller demo')),
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

class PrefetchImageDemo extends StatefulWidget {
  const PrefetchImageDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
}

class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageUrl in images) {
        precacheImage(NetworkImage(imageUrl), context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prefetch image slider demo')),
      body: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIdx) {
          return Center(
              child:
                  Image.network(images[index], fit: BoxFit.cover, width: 1000));
        },
      ),
    );
  }
}

class CarouselChangeReasonDemo extends StatefulWidget {
  const CarouselChangeReasonDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselChangeReasonDemoState();
  }
}

class _CarouselChangeReasonDemoState extends State<CarouselChangeReasonDemo> {
  String reason = '';
  final CarouselController _controller = CarouselController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Change reason demo')),
        body: Column(
          children: <Widget>[
            Expanded(
              child: CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  onPageChanged: onPageChange,
                  autoPlay: true,
                ),
                carouselController: _controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => _controller.previousPage(),
                    child: const Text('←'),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => _controller.nextPage(),
                    child: const Text('→'),
                  ),
                ),
                ...Iterable<int>.generate(imgList.length).map(
                  (int pageIndex) => Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.animateToPage(pageIndex),
                      child: Text("$pageIndex"),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  const Text('page change reason: '),
                  Text(reason),
                ],
              ),
            )
          ],
        ));
  }
}

class KeepPageviewPositionDemo extends StatelessWidget {
  const KeepPageviewPositionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keep pageview position demo')),
      body: ListView.builder(itemBuilder: (ctx, index) {
        if (index == 3) {
          return CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              pageViewKey: const PageStorageKey<String>('carousel_slider'),
            ),
            items: imageSliders,
          );
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.blue,
            height: 200,
            child: const Center(
              child: Text('other content'),
            ),
          );
        }
      }),
    );
  }
}

class MultipleItemDemo extends StatelessWidget {
  const MultipleItemDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiple item in one slide demo')),
      body: CarouselSlider.builder(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: false,
          viewportFraction: 1,
        ),
        itemCount: (imgList.length / 2).round(),
        itemBuilder: (context, index, realIdx) {
          final int first = index * 2;
          final int second = first + 1;
          return Row(
            children: [first, second].map((idx) {
              return Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(imgList[idx], fit: BoxFit.cover),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
