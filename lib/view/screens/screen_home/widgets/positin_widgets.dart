import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/view/style/style.dart';

class HorzontalScreen extends StatelessWidget {
  const HorzontalScreen({
    super.key,
    required this.controller,
    required this.validator,
    required this.textinputType,
    required this.onpressed,
    required this.value,
    required this.items,
    required this.count,
    required this.text,
  });
  final void Function(String?) onpressed;
  final String value;
  final List<DropdownMenuItem<String>> items;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final int count;
  final TextInputType textinputType;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(count, (index) {
          return SizedBox(
            width: 360.w,
            height: 200.h,
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
                                fontWeight: FontWeight.bold, color: white),
                          ),
                          w170,
                          Text(
                            "${index + 1}/$text",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: white),
                          )
                        ],
                      ),
                      h15,
                      SizedBox(
                        width: 300.w,
                        child: TextFormField(
                          onChanged: (value) {},
                          keyboardType: textinputType,
                          controller: controller,
                          validator: validator,
                          decoration: InputDecoration(
                              counterStyle: TextStyle(color: bg),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 5.h),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.r),
                                  borderSide: const BorderSide(color: bg)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.r),
                                borderSide: const BorderSide(color: bg),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.r),
                                borderSide: const BorderSide(color: red),
                              ),
                              fillColor: bg,
                              focusColor: bg,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.r),
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
                            fontWeight: FontWeight.bold, color: white),
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
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                elevation: 6,
                                borderRadius: BorderRadius.circular(20),
                                alignment: AlignmentDirectional.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, color: grey),
                                value: value,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items,
                                onChanged: onpressed,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          );
        }),
      ),
    );
  }
}
