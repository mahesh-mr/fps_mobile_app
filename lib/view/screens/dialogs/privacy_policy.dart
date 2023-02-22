import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/screens/widgets/custom_appbar.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/style/style.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen(
      {super.key,
      required this.mdFilename,
      required this.image,
      required this.title})
      : assert(mdFilename.contains('.md'),
            'The file must contains the .md extension');

  final String mdFilename;
  final String image;
  final String title; DateTime? lastpressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: CustomAppbarProfile(height: 170.h,widget: SizedBox()),
        body: DoubleTapBackPress(lastpressed: lastpressed, widget:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  width: double.infinity, 
                  height: 100.h,
                // color: yellow,
                  child: Row(
                    children: [
                      Container(
                       
                        height: 100.h,
                        width: 150.w,
                        decoration: BoxDecoration( 
                          image: DecorationImage(
                            image: AssetImage(image),
                          ),
                        
                        ),
                      ),
                      Container(
                     
                        height: 100.h,
                        width: 140.w,
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: Text(
                            title, style: welcomeText,
      
                            //   'Privacy\nPolicy',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              h20,
              Expanded(
                child: FutureBuilder(
                  future: Future.delayed(Duration(microseconds: 50)).then((value) {
                    return rootBundle.loadString('assets/$mdFilename');
                  }),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(data: snapshot.data.toString(),);
                    }
                    return const Center(
                      child: const CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  child: const Text(
                    "CLOSE",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
