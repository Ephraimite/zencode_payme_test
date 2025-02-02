import 'package:flutter/cupertino.dart';

import '../cubit/dashboard_cubit.dart';

class DashboardState {
  final int actionIndex;
  final int avActionIndex;
  final bool? isExpanded;
  final PageController pageController;
  final List<ToggleModel>? action; // Moved action list to the state

  DashboardState({
    this.actionIndex = 0,
    this.avActionIndex = 0,
    this.action,
     this.isExpanded = false,
    required this.pageController,
  });

  DashboardState copyWith({
    int? actionIndex,
    int? avActionIndex,
    PageController? pageController,
    bool? isExpanded,
  }) {
    return DashboardState(
      action: action,
      actionIndex: actionIndex ?? this.actionIndex,
      avActionIndex: avActionIndex ?? this.avActionIndex,
      pageController: pageController ?? this.pageController,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
