import 'package:flutter/material.dart';
import 'package:synchronized_scroll/constants.dart';
import 'package:synchronized_scroll/data/data.dart';
import 'package:synchronized_scroll/data/list_item_model.dart';
import 'package:synchronized_scroll/data/tab_category_model.dart';

class LogicBloC with ChangeNotifier {
  ScrollController scrollController = ScrollController();
  List<TabCategory> tabs = [];
  List<ListItem> items = [];
  TabController tabController;
  bool _listener = true;

  void init(TickerProvider vsync) {
    tabController = TabController(vsync: vsync, length: allProducts.length);
    double offSetFrom = 0.0;
    double offSetTo = 0.0;

    allProducts.forEach(
      (cat) {
        int index = allProducts.indexOf(cat);
        if (index > 0) {
          offSetFrom += allProducts[index - 1].products.length * productHeight;
        }

        if (index < allProducts.length - 1) {
          offSetTo = offSetFrom +
              allProducts[index + 1].products.length * productHeight;
        } else {
          offSetTo = double.infinity;
        }

        tabs.add(
          TabCategory(
            category: allProducts[index],
            selected: index == 0,
            offSetFrom: categoryHeight * index + offSetFrom,
            offSetTo: offSetTo,
          ),
        );
        items.add(
          ListItem(category: allProducts[index]),
        );
        allProducts[index].products.forEach(
              (prod) => {
                items.add(
                  ListItem(
                    product: prod,
                  ),
                ),
              },
            );
      },
    );
    scrollController.addListener(_onScrollListener);
  }

  void _onScrollListener() {
    if (_listener) {
      for (int i = 0; i < tabs.length; i++) {
        final tab = tabs[i];

        if (scrollController.offset >= tab.offSetFrom &&
            scrollController.offset <= tab.offSetTo &&
            !tab.selected) {
          onCategorySelected(i, requireAnimation: false);
          tabController.animateTo(i);
          break;
        }
      }
    }
  }

  void onCategorySelected(int value, {requireAnimation: true}) async {
    TabCategory selectedTab = tabs[value];
    for (int i = 0; i < tabs.length; i++) {
      if (selectedTab == tabs[i]) {
        tabs[i] = tabs[i].coppyWith(true);
      } else {
        tabs[i] = tabs[i].coppyWith(false);
      }
    }

    notifyListeners();

    if (requireAnimation) {
      _listener = false;
      await scrollController.animateTo(
        selectedTab.offSetFrom,
        duration: Duration(milliseconds: 500),
        curve: Curves.bounceOut,
      );
      _listener = true;
    }
  }

  @override
  void dispose() {
    scrollController?.removeListener(_onScrollListener);
    tabController?.dispose();
    scrollController?.dispose();

    super.dispose();
  }
}
