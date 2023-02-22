import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fps/view/screens/screen_home/home_screen.dart';
import 'package:fps/view/style/style.dart';
import 'package:intl/intl.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,required this.buttonColor,required this.textColor,required this.width,required this.vertical,
    
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final Color textColor;
  final  Color buttonColor;
  final double width;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width,
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: 4.5,
          intensity: 3,
          shape: NeumorphicShape.convex,
          lightSource: LightSource.top,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(40.r),
          ),
        ),
        child: NeumorphicButton(
          minDistance: 3,
          onPressed: () {},
          style: NeumorphicStyle(
            color: buttonColor,
            depth: 5,
            intensity: -7,
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(40.r),
            ),
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: vertical),
              child: NeumorphicText(
             text,
                style:  NeumorphicStyle(
                  depth: .5,
                  intensity: 0.8,
                  color: textColor,
                ),
                textStyle: NeumorphicTextStyle(
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
