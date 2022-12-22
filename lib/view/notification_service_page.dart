import 'package:flutter/material.dart';
import '/data/notification_service_data.dart';
import '/model/notification_service_model.dart';
import '/view/widget/notification_widget.dart';

class NotificationServicePage extends StatefulWidget {
  const NotificationServicePage({super.key});
  @override
  State<NotificationServicePage> createState() =>
      _NotificationServicePageState();
}

class _NotificationServicePageState extends State<NotificationServicePage>
    with AutomaticKeepAliveClientMixin<NotificationServicePage> {
  @override
  bool get wantKeepAlive => true;
  List<NotificationServiceModel> notificationServices =
      <NotificationServiceModel>[];
  @override
  void initState() {
    notificationServices = getNotificationServices();
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
                      itemCount: notificationServices.length,
                      itemBuilder: (context, index) {
                        return NotificationWidget(
                          desc: notificationServices[index].desc,
                          imgUrl: notificationServices[index].imgUrl,
                          label: notificationServices[index].label,
                          date: notificationServices[index].date,
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
