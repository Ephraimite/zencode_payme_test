import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:zencode_payme_test/feature/dashboard/presentation/state/dashboard_state.dart';
import 'package:zencode_payme_test/feature/dashboard/presentation/view/crypto_view.dart';
import 'package:zencode_payme_test/feature/dashboard/presentation/view/nft_view.dart';

import '../view/account_view.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit()
      : super(
          DashboardState(
            pageController: PageController(),
            action: [
              ToggleModel(title: "Account", route: AccountView()),
              ToggleModel(title: "Crypto", route: CryptoView()),
              ToggleModel(title: "NFT", route: NftView())
            ],
          ),
        );

  void changeActionIndex(int index) {
    emit(state.copyWith(actionIndex: index));
  }

  void changeAvActionIndex(int index) {
    emit(state.copyWith(avActionIndex: index));
  }

  void updateIsExpanded(bool isExpanded) {
    log("isExpanded: $isExpanded");
    emit(state.copyWith(isExpanded: isExpanded));
  }
}

class ToggleModel {
  String title;
  Widget route;

  ToggleModel({required this.title, required this.route});
}
