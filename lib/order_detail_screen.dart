import 'package:flutter/material.dart';

import 'model/order_model.dart';
import 'widget/common_component.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderModel orderItem;
  final int index;
  const OrderDetailScreen({
    Key? key,
    required this.orderItem,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonComponent.appbar('Order Details'),
      body: _body(context),
    );
  }

  SingleChildScrollView _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _orderIdContainer(),
          _seprator(),
          _productDetailContainer(context),
          _seprator(),
          _productTrackingContainer(),
          _seprator(),
          _ratingReviewContainer(context),
          _seprator(),
          _helpContainer(),
          _seprator(),
          const SizedBox(
            height: 5,
          ),
          _priceHeaderContainer(),
          _seprator(),
          _priceDetailContainer(),
          const SizedBox(
            height: 10,
          ),
          _invoiceContainer(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Divider _seprator() => Divider(
        height: 1,
        thickness: 0.7,
        color: Colors.grey.shade300,
      );

  Container _invoiceContainer() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      child: Row(
        children: [
          Icon(
            Icons.book_rounded,
            color: Colors.blue.shade900,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Invoice Download',
              style: TextStyle(
                  fontFamily: 'NotoSerif',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Container _priceDetailContainer() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          _priceDetail(
              'Selling Price', 'Rs.' + orderItem.sellingPrice.toString()),
          _priceDetail(
              'shipping fee', 'Rs.' + orderItem.shippingFee.toString()),
          _priceDetail(
            'Shipping discount',
            '-Rs.' + orderItem.shippingDiscount.toString(),
          ),
          _priceDetail('Total Amount', 'Rs.' + orderItem.amount,
              fontWeight: FontWeight.bold)
        ],
      ),
    );
  }

  Container _priceHeaderContainer() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: const Text(
        'Price Details',
        style: TextStyle(
            fontFamily: 'NotoSerif', fontSize: 13, color: Color(0xFF7A7A7A)),
      ),
    );
  }

  Container _helpContainer() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: const Center(
        child: Text(
          'Need Help?',
          style: TextStyle(
              fontFamily: 'NotoSerif',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
    );
  }

  Container _ratingReviewContainer(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Row(
        children: [
          Row(
            children: List.generate(5, (index1) {
              return CommonComponent.getRating(context, index, index1,
                  size: 30);
            }),
          ),
          const SizedBox(
            width: 15,
          ),
          CommonComponent.reviewText(context, orderItem.rating)
        ],
      ),
    );
  }

  Container _productTrackingContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 4, right: 20),
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.green,
                      indent: 0,
                      endIndent: 0,
                      thickness: 3,
                      width: 10,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ordered',
                    style: TextStyle(
                        fontFamily: 'NotoSerif',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Text(
                    orderItem.orderDate,
                    style:
                        const TextStyle(fontSize: 13, color: Color(0xFF7A7A7A)),
                  ),
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 4,
                    child: VerticalDivider(
                      color: Colors.green,
                      indent: 0,
                      endIndent: 0,
                      thickness: 3,
                      width: 10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Delivered',
                        style: TextStyle(
                            fontFamily: 'NotoSerif',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size: 18,
                      )
                    ],
                  ),
                  const Text(
                    'Your item has been delivered',
                    style: TextStyle(
                        fontFamily: 'NotoSerif',
                        fontSize: 13,
                        color: Color(0xFF7A7A7A)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Container _productDetailContainer(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7 - 10,
                    child: Text(
                      orderItem.orderdescription,
                      maxLines: null,
                      style: const TextStyle(
                        fontFamily: 'NotoSerif',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    orderItem.colorAvailable,
                    style: const TextStyle(
                        fontFamily: 'NotoSerif',
                        fontSize: 13,
                        color: Color(0xFF7A7A7A)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Seller: IndiRetail',
                    style: TextStyle(
                        fontFamily: 'NotoSerif',
                        fontSize: 13,
                        color: Color(0xFF7A7A7A)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rs.' + orderItem.amount,
                    style: const TextStyle(
                        fontFamily: 'NotoSerif',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.3 - 30,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(orderItem.imageUrl),
                        fit: BoxFit.fill),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Container _orderIdContainer() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 15, bottom: 20, left: 20),
      child: Text(
        'Order ID - ' + orderItem.orderID,
        style: const TextStyle(
            fontFamily: 'NotoSerif', fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _priceDetail(String title, String amount,
      {FontWeight fontWeight = FontWeight.w400}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontFamily: 'NotoSerif',
                fontSize: 14,
                fontWeight: fontWeight,
                color: Colors.black),
          ),
          const Spacer(),
          Text(
            amount,
            style: TextStyle(
                fontFamily: 'NotoSerif',
                fontSize: 14,
                fontWeight: fontWeight,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
