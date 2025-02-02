import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zencode_payme_test/app/helpers/ui_helpers/amount_text.dart';
import 'package:zencode_payme_test/app/helpers/ui_helpers/extention_functions.dart';
import 'package:zencode_payme_test/app/constants/colors.dart';
import 'package:zencode_payme_test/feature/dashboard/presentation/cubit/dashboard_cubit.dart';

import '../state/dashboard_state.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit(),
      child: _DashboardContent(),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: colorPrimary,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, John!",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Spacer(),
                    if (state.isExpanded == false) ...[
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1000),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  currencyText(
                                      amount: 4562.52,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                      currency: "GEL"),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<DashboardCubit>()
                                          .updateIsExpanded(!state.isExpanded!);
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                      size: 30.sp,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: colorPrimary2),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset("icon_scan".svg),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: colorPrimary2),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset("icon_headphone".svg),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              state.isExpanded!
                  ? Center(
                      child: Column(
                        children: [
                          Text(
                            "Available Balance",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              currencyText(
                                  amount: 4562.52,
                                  style: TextStyle(
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                  currency: "GEL"),
                              SizedBox(
                                width: 5.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<DashboardCubit>()
                                      .updateIsExpanded(!state.isExpanded!);
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 30.sp,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container(),

              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: lightWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                    child: Column(
                      children: [
                        Container(
                          height: 70.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 70.h,
                                width: 56.w,
                                decoration: BoxDecoration(
                                  color: colorPrimary2,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    bottomLeft: Radius.circular(10.r),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SvgPicture.asset(
                                    "icon_gift".svg,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Zero free first purchase",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                        text: "For new users. ",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                        children: [
                                          TextSpan(
                                            text: "Learn more",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                color: colorPrimary2,
                                                decorationColor: colorPrimary2),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.close),
                              SizedBox(
                                width: 20.w,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          height: 45.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: state.action!.map((e) {
                              int index = state.action!.indexOf(e);
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<DashboardCubit>()
                                      .changeAvActionIndex(index);
                                  state.pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Container(
                                  width: 100.w,
                                  height:
                                      state.actionIndex == index ? 50.h : 45.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: state.avActionIndex != index
                                        ? Colors.transparent
                                        : colorPrimary2,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 16.w),
                                    child: Text(
                                      e.title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: state.avActionIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: state.avActionIndex == index
                                            ? FontWeight.w600
                                            : FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          // PageView
                          child: PageView.builder(
                            controller: state.pageController,
                            onPageChanged: (index) {
                              context
                                  .read<DashboardCubit>()
                                  .changeAvActionIndex(index);
                            },
                            itemCount: state.action?.length,
                            itemBuilder: (context, index) {
                              return state.action![index].route;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

