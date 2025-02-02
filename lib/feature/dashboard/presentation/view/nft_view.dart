import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NftView extends StatelessWidget {
  const NftView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "NFT View",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
      ),
    );
  }
}
