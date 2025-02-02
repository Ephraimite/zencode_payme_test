
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:Text("Offers View", style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 20.sp
      ),),
    );
  }
}
