import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionView extends StatelessWidget {
  const ActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Action View",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
      ),
    );
  }
}
