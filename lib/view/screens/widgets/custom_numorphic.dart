import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fps/view/style/style.dart';

class CustomNumorphic extends StatelessWidget {
  const CustomNumorphic({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
     
      style: NeumorphicStyle(
        shadowDarkColor: grey,
        shadowLightColor: white,
        
        color: white,
        depth: 4.5,
        intensity: 3,
        shape: NeumorphicShape.convex,
        lightSource: LightSource.top,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(40.r),
        ),
      ),
      child:child
    );
  }
}
