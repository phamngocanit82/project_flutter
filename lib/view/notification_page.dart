import 'package:flutter/material.dart';
import '../base_Widget.dart';
import '/utils/utils_language.dart';
import '/utils/utils_style.dart';
import '/view/notification_news_page.dart';
import '/view/notification_service_page.dart';
import '../constants.dart';
import '/view/notification_my_self_page.dart';

class NotificationPage extends BaseWidget {
  const NotificationPage({Key? key}) : super(key: key);
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  static final List<Widget> _widgetOptions = <Widget>[
    const NotificationServicePage(),
    const NotificationMySelfPage(),
    const NotificationNewsPage(),
  ];
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  TabBar getTabBar() {
    return TabBar(
      indicatorColor: kTaskColor,
      labelColor: kTaskColor,
      unselectedLabelColor: colorTextInput,
      tabs: <Tab>[
        UtilsStyle.tabTitle(
            UtilsLanguage.shared.language("services", "services")),
        UtilsStyle.tabTitle(
            UtilsLanguage.shared.language("my self", "my self")),
        UtilsStyle.tabTitle(UtilsLanguage.shared.language("news", "news")),
      ],
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: tabs,
      controller: controller,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: AppBar(
            backgroundColor: kWhiteColor,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            bottom: getTabBar(),
          )),
      body: getTabBarView(
          <Widget>[_widgetOptions[0], _widgetOptions[1], _widgetOptions[2]]),
    );
  }
}
