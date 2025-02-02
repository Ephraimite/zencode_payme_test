
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoView extends StatelessWidget {
  const CryptoView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:Text("Crypto View", style: TextStyle(
        fontWeight: FontWeight.w500, fontSize: 20.sp
      ),),
    );
  }
}
