import 'package:flutter/material.dart';
import 'package:ideavista/view/home/home_view.dart';
import 'package:ideavista/view_model/home/home_view_model.dart';

mixin HomeViewMixin on State<HomeView> implements TickerProvider {
  late final HomeViewModel viewModel;
  late final TabController tabController;
  int pageCount = 3;

  @override
  void initState() {
    viewModel = HomeViewModel();
    viewModel.getPhotos();
    tabController = TabController(length: pageCount, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
