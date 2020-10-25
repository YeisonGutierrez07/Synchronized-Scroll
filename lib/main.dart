import 'package:flutter/material.dart';
import 'package:synchronized_scroll/constants.dart';
import 'package:synchronized_scroll/logic_bloc.dart';
import 'package:synchronized_scroll/widgets/category_item_widget.dart';
import 'package:synchronized_scroll/widgets/product_item_widget.dart';
import 'package:synchronized_scroll/widgets/tab_barapp_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  LogicBloC logicBloC = LogicBloC();

  @override
  void initState() {
    logicBloC.init(this);
    super.initState();
  }

  @override
  void dispose() {
    logicBloC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synchonized Scroll',
      home: Scaffold(
        backgroundColor: backgraundColor,
        body: AnimatedBuilder(
          animation: logicBloC,
          builder: (_, __) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Homepage",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/hamburguesa.png",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                child: TabBar(
                  controller: logicBloC.tabController,
                  onTap: logicBloC.onCategorySelected,
                  isScrollable: true,
                  indicatorWeight: 0.1,
                  tabs: logicBloC.tabs.map((e) => TabBarAppWidget(e)).toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: logicBloC.items.length,
                  controller: logicBloC.scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  itemBuilder: (context, index) {
                    var item = logicBloC.items[index];

                    if (item.isCategory) {
                      return CategoryItemWidget(item.category);
                    } else {
                      return ProductItemWidget(item.product);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




