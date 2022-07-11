import 'package:endless_listview_module/widget/common_component.dart';
import 'package:flutter/material.dart';
import 'model/dataList/data.dart';
import 'model/order_model.dart';
import 'order_detail_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<OrderModel> item = [];
  bool loading = false, allLoaded = false;
  late ScrollController _scrollController;

  mockFetch() async {
    if (allLoaded) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    List<OrderModel> newData = item.length >= 21
        ? []
        : List.generate(7, (index) => Data().orderlist[index]);
    if (newData.isNotEmpty) {
      item.addAll(newData);
    }
    setState(() {
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    mockFetch();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
        mockFetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonComponent.appbar('My Orders'),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: item.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                ListView.builder(
                    controller: _scrollController,
                    itemCount: item.length + (allLoaded ? 1 : 0),
                    itemBuilder: (BuildContext context, int index) {
                      if (index < item.length) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OrderDetailScreen(
                                        orderItem: item[index], index: index),
                              ),
                            );
                          },
                          child: _orderItemContainer(context, index),
                        );
                      } else {
                        return Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: 80,
                          child:
                              const Center(child: Text("No more data to load")),
                        );
                      }
                    }),
                loading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 160,
                            width: double.infinity,
                            color: Colors.grey.shade200,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
    );
  }

  Widget _orderItemContainer(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 60,
                    child: Image.network(
                      item[index].imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width -
                                MediaQuery.of(context).size.width * 0.25 -
                                50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item[index].orderStatus,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontFamily: 'NotoSerif',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  item[index].orderdescription,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontFamily: 'NotoSerif',
                                      fontSize: 13,
                                      color: Color(0xFF7A7A7A)),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.all(7.5),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5),
                        child: Row(
                          children: List.generate(5, (index1) {
                            return CommonComponent.getRating(
                                context, index, index1);
                          }),
                        ),
                      ),
                      CommonComponent.reviewText(context, item[index].rating)
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(
            height: 1,
            thickness: 0.7,
            color: Colors.grey.shade300,
          )
        ],
      ),
    );
  }
}
