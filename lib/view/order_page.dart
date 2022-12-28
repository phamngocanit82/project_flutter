import 'package:flutter/material.dart';
import '../base_widget.dart';
import '/data/order_data.dart';
import '/model/order_model.dart';
import '/utils/utils_style.dart';
import '/view/widget/order_widget.dart';

class OrderPage extends BaseWidget {
  const OrderPage({Key? key}) : super(key: key);
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage> {
  List<OrderModel> orders = <OrderModel>[];
  @override
  void initState() {
    orders = getOrders();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: UtilsStyle.preferredSize(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
            child: Text(
              "Đơn hàng",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
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
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return OrderWidget(
                          desc: orders[index].desc,
                          imgUrl: orders[index].imgUrl,
                          title: orders[index].title,
                          price: orders[index].price,
                          rating: orders[index].rating,
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Hoàn tất",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
