
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:Text("Activities View", style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 20.sp
      ),),
    );
  }
}
