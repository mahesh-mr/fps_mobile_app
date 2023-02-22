import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/style/style.dart';

class CostomDetailsContainer extends StatelessWidget {
   CostomDetailsContainer({super.key,required this.tite,required this.height});
  String tite;
  double height
  ;

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      color: white,
      borderRadius: 50.r,
      depth: 40,
      parentColor: white,
      spread: 2,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: white,
            border: Border.all(color: lightgrey)),
        child: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Text(
           tite,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, color: lightblack),
          ),
        ),
      ),
    );
  }
}
