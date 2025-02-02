import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zencode_payme_test/app/helpers/ui_helpers/extention_functions.dart';
import 'package:zencode_payme_test/app/constants/colors.dart';

import '../../../../app/helpers/ui_helpers/amount_text.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              Text(
                "My Cards",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "+ Get a Card",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: colorPrimary),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: MyCards(
                    image: index == 0 ? 'icon_georgia' : "icon_euro",
                    title:
                        index == 0 ? 'My Mastercard in GEL' : "My VISA in EUR",
                    amount: 2562.52,
                    cardNumber: '21242124',
                    expiryDate: '06/25',
                    cardTypeIcon: index == 0 ? 'icon_master_card' : "icon_visa",
                    currency: index == 0 ? 'GEL' : "EUR",
                  ),
                );
              }),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Collecting Funds",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: CollectingFunds(
                    image: 'icon_standup_donations',
                    title: 'My Startup Donations',
                    subTitle: 'Donations (50)',
                    amount: 2562.52,
                    currency: index == 0 ? 'GEL' : "EUR",
                    equivalentAmount: 800,
                    equivalentCurrency: 'EUR',
                  ),
                );
              }),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                "Other",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "+ Link",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: colorPrimary),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Other(
                    image: index == 1 ? 'icon_my_bog_card' : "icon_tbc_card",
                    title: index == 0
                        ? 'My TBC Card'
                        : index == 1
                            ? "My BOG Card"
                            : "My VISA in EUR",
                    amount: 2562.52,
                    cardNumber: '21242124',
                    expiryDate: '06/25',
                    cardTypeIcon: index == 0 ? 'icon_master_card' : "icon_visa",
                    currency: index == 0 ? 'GEL' : "EUR",
                    subTitle: 'TBGB12341213412345678',
                    shouldShowCardType: index == 2? false: true,
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class MyCards extends StatelessWidget {
  final String image;
  final String title;
  final double amount;
  final String cardNumber;
  final String expiryDate;
  final String cardTypeIcon;
  final String currency;

  const MyCards({
    super.key,
    required this.image,
    required this.title,
    required this.amount,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardTypeIcon,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r), color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(image.svg),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Spacer(),
                SizedBox(
                  width: 48.w,
                  child: SvgPicture.asset(
                    cardTypeIcon.svg,
                    width: 48.w,
                    height: 48.h,
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 10.h,
            // ),
            currencyText(
                amount: amount,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                currency: currency),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  cardNumber.asteriskFirstFourLetters(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: lightBlack),
                ),
                Spacer(),
                Text(
                  expiryDate,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: lightBlack),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CollectingFunds extends StatelessWidget {
  final String image;
  final String title;
  final double amount;
  final double equivalentAmount;
  final String equivalentCurrency;

  final String currency;
  final String subTitle;

  const CollectingFunds({
    super.key,
    required this.image,
    required this.title,
    required this.amount,
    required this.currency,
    required this.subTitle,
    required this.equivalentAmount,
    required this.equivalentCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r), color: Colors.white),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 15.w, bottom: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(image.svg),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          subTitle,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w200,
                              color: lightBlueColor),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    currencyText(
                        amount: amount,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        currency: currency),
                    Text(
                      "/",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w200,
                          color: lightBlueColor),
                    ),
                    currencyText(
                        amount: amount,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                        currency: equivalentCurrency),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          Positioned(
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: SvgPicture.asset("water_mark_image".svg),
              )),
        ],
      ),
    );
  }
}

class Other extends StatelessWidget {
  final String image;
  final String title;
  final double amount;
  final String cardNumber;
  final String expiryDate;
  final String cardTypeIcon;
  final String currency;
  final String subTitle;
  final bool shouldShowCardType;

  const Other({
    super.key,
    required this.image,
    required this.title,
    required this.amount,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardTypeIcon,
    required this.currency,
    required this.subTitle,
    required this.shouldShowCardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r), color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  image.png,
                  width: 32.w,
                  height: 32.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Spacer(),
                if (shouldShowCardType == true) ...[
                  SizedBox(
                    width: 48.w,
                    child: SvgPicture.asset(
                      cardTypeIcon.svg,
                      width: 48.w,
                      height: 48.h,
                    ),
                  ),
                ] else ...[
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '55.60',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          children:  [
                            TextSpan(
                              text: ' EUR',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]
              ],
            ),
            // SizedBox(
            //   height: 10.h,
            // ),
            Text(
              subTitle,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  cardNumber.asteriskFirstFourLetters(),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: lightBlack),
                ),
                Spacer(),
                Text(
                  expiryDate,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: lightBlack),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
