import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zencode_payme_test/app/helpers/ui_helpers/extention_functions.dart';
import 'package:zencode_payme_test/feature/actions/presentation/action_view.dart';
import 'package:zencode_payme_test/feature/activities/presentation/activities_view.dart';
import 'package:zencode_payme_test/feature/dashboard/presentation/view/dashboard_view.dart';
import 'package:zencode_payme_test/feature/more/presentation/more_view.dart';
import 'package:zencode_payme_test/feature/offers/presentation/offers_view.dart';

import '../../../../app/constants/colors.dart';
import '../cubit/bottom_navigation_cubit.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  _BottomNavigationViewState createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<NavigationCubit>();
          return Scaffold(
            backgroundColor: lightWhiteColor,
            bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
              builder: (context, selectedIndex) {
                return DefaultTabController(
                  length: 5,
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 0,
                          blurRadius: 5.r,
                        ),
                      ],
                    ),
                    child: TabBar(
                      labelColor: colorPrimary,
                      indicatorColor: Colors.transparent,
                      onTap: (index) => cubit.updateSelectedTab(index),
                      labelPadding: EdgeInsets.only(bottom: 25.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: lightGrey,
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                      tabs: [
                        Tab(
                          icon: SvgPicture.asset(
                            "icon_home".svg,
                            colorFilter: ColorFilter.mode(
                              selectedIndex == 0 ? colorPrimary : lightGrey,
                              BlendMode.srcIn,
                            ),
                          ),
                          text: 'Home',
                        ),
                        Tab(
                          icon: SvgPicture.asset(
                            "icon_activity".svg,
                            colorFilter: ColorFilter.mode(
                              selectedIndex == 1 ? colorPrimary : lightGrey,
                              BlendMode.srcIn,
                            ),
                          ),
                          text: 'Activities',
                        ),
                        Tab(
                          icon: SvgPicture.asset(
                            "icon_action".svg,
                            colorFilter: ColorFilter.mode(
                              selectedIndex == 2 ? colorPrimary : lightGrey,
                              BlendMode.srcIn,
                            ),
                          ),
                          text: 'Action',
                        ),
                        Tab(
                          icon: SvgPicture.asset(
                            "icon_offers".svg,
                            colorFilter: ColorFilter.mode(
                              selectedIndex == 3 ? colorPrimary : lightGrey,
                              BlendMode.srcIn,
                            ),
                          ),
                          text: 'Offers',
                        ),
                        Tab(
                          icon: SvgPicture.asset(
                            "icon_more".svg,
                            colorFilter: ColorFilter.mode(
                              selectedIndex == 4 ? colorPrimary : lightGrey,
                              BlendMode.srcIn,
                            ),
                          ),
                          text: 'More',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            body: BlocBuilder<NavigationCubit, int>(
              builder: (context, selectedIndex) {
                return PageTransitionSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (Widget child,
                          Animation<double> primaryAnimation,
                          Animation<double> secondaryAnimation) =>
                      FadeThroughTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  ),
                  child: IndexedStack(
                    index: selectedIndex,
                    children:  [
                      DashboardView(),
                      ActivitiesView(),
                      ActionView(),
                      OffersView(),
                      MoreView(),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
