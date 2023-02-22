import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/style/style.dart';

class InspectorAddingScreen extends StatelessWidget {
   InspectorAddingScreen({super.key,
    required this.onChanged,
      required this.value,
      required this.items,
        required this.index});
  final void Function(String?) onChanged;
  final String value;
  final List<DropdownMenuItem<String>> items;
   
   

 final int index;

  @override
  Widget build(BuildContext context) {
    return    LimitedBox(
                  maxHeight: 220.h,
                  maxWidth: 360.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: index,
                      itemBuilder: (context, index) {
                        List<TextEditingController> textController =
                            List.generate(
                               index, (index) => TextEditingController());
                
                        return SizedBox(
                          width: 360.w,
                          height: 220.h,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                h15,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      children: [
                                        const Text(
                                          'Inspector Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        ),
                                        w170,
                                        Text(
                                          "${index + 1}/$index",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: white),
                                        )
                                      ],
                                    ),
                                    h15,
                                    SizedBox(
                                      width: 300.w,
                                      child: TextFormField(
                                        onChanged: (value) {},
                                        keyboardType: TextInputType.name,
                                        controller: textController[index],
                                        validator: (value) {},
                                        decoration: InputDecoration(
                                            counterStyle: TextStyle(color: bg),
                                            contentPadding: EdgeInsets.symmetric(
                                                horizontal: 15.w, vertical: 5.h),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40.r),
                                                borderSide:
                                                    const BorderSide(color: bg)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.r),
                                              borderSide:
                                                  const BorderSide(color: bg),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.r),
                                              borderSide:
                                                  const BorderSide(color: red),
                                            ),
                                            fillColor: bg,
                                            focusColor: bg,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.r),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                h25,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Position',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: white),
                                    ),
                                    h15,
                                    SizedBox(
                                      width: 300.w,
                                      child: ClayContainer(
                                        color: white,
                                        borderRadius: 50.r,
                                        depth: 0,
                                        parentColor: white,
                                        spread: 0,
                                        curveType: CurveType.none,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              elevation: 6,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              alignment:
                                                  AlignmentDirectional.center,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: grey),
                                              value: value,
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              items: items,
                                                 
                                              onChanged: onChanged,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        );
                      },
                    ),
                );
  }
}