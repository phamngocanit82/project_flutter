import 'package:flutter/material.dart';
import '../base_Widget.dart';
import '/data/notification_news_data.dart';
import '/model/notification_news_model.dart';
import '/view/widget/notification_widget.dart';

class NotificationNewsPage extends BaseWidget {
  const NotificationNewsPage({Key? key}) : super(key: key);
  @override
  State<NotificationNewsPage> createState() => _NotificationNewsPageState();
}

class _NotificationNewsPageState extends State<NotificationNewsPage>
    with AutomaticKeepAliveClientMixin<NotificationNewsPage> {
  @override
  bool get wantKeepAlive => true;
  List<NotificationNewsModel> notificationNews = <NotificationNewsModel>[];
  @override
  void initState() {
    notificationNews = getNotificationNews();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: notificationNews.length,
                      itemBuilder: (context, index) {
                        return NotificationWidget(
                          desc: notificationNews[index].desc,
                          imgUrl: notificationNews[index].imgUrl,
                          label: notificationNews[index].label,
                          date: notificationNews[index].date,
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
