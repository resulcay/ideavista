import 'package:flutter/material.dart';
import 'package:ideavista/view/home/home_view.dart';

mixin HomeViewModel on State<HomeView> implements TickerProvider {
  late final TabController tabController;
  int pageCount = 3;

  @override
  void initState() {
    tabController = TabController(length: pageCount, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
