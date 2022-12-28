import 'package:flutter/material.dart';
import '../base_Widget.dart';
import '/data/notification_my_self_data.dart';
import '/model/notification_my_self_model.dart';
import '/view/widget/notification_widget.dart';

class NotificationMySelfPage extends BaseWidget {
  const NotificationMySelfPage({Key? key}) : super(key: key);
  @override
  State<NotificationMySelfPage> createState() => _NotificationMySelfPageState();
}

class _NotificationMySelfPageState extends State<NotificationMySelfPage>
    with AutomaticKeepAliveClientMixin<NotificationMySelfPage> {
  @override
  bool get wantKeepAlive => true;
  List<NotificationMySelfModel> notificationMySelfs =
      <NotificationMySelfModel>[];
  @override
  void initState() {
    notificationMySelfs = getNotificationMySelfs();
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
                      itemCount: notificationMySelfs.length,
                      itemBuilder: (context, index) {
                        return NotificationWidget(
                          desc: notificationMySelfs[index].desc,
                          imgUrl: notificationMySelfs[index].imgUrl,
                          label: notificationMySelfs[index].label,
                          date: notificationMySelfs[index].date,
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
