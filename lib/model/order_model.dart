class OrderModel {
  String orderStatus;
  String orderdescription;
  String imageUrl;
  String orderID;
  String colorAvailable;
  String amount;
  String orderDate;
  int sellingPrice;
  int shippingFee;
  int shippingDiscount;
  int? rating;
  OrderModel({
    required this.orderStatus,
    required this.orderdescription,
    required this.imageUrl,
    required this.orderID,
    required this.colorAvailable,
    required this.amount,
    required this.orderDate,
    required this.sellingPrice,
    required this.shippingFee,
    required this.shippingDiscount,
    required this.rating,
  });
}
