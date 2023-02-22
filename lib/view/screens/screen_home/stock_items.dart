import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/controller/controller/survey_controller/position_controller.dart';
import 'package:fps/model/dropdown_model/dropdow.dart';
import 'package:fps/view/screens/screen_home/widgets/botomfom.dart';
import 'package:fps/view/screens/screen_home/widgets/custom_inspection_form.dart';
import 'package:fps/view/screens/screen_register/widgets/custombutton.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StoreItems extends StatefulWidget {
  const StoreItems({super.key});

  @override
  State<StoreItems> createState() => _StoreItemsState();
}

class _StoreItemsState extends State<StoreItems> {
  List<InspectorModel> inspectersList = [];

  List<TextEditingController> nameControllersList = [];
  final positionController = Get.put(PositionController());
  final survayData = GetStorage();
  final numberController = TextEditingController();
  final fomkey = GlobalKey<FormState>();  final key = GlobalKey<FormState>();
  DateTime? lastpressed;
  int? count;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainred,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Accompanied\nInspection',
                  style: bottomtext,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            h50,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: const Text(
                'Number of Accompanied Persons',
                style: TextStyle(fontWeight: FontWeight.bold, color: white),
              ),
            ),
            h15,
            Form(
              key: fomkey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: BotosheetForm(
                  maxLength: 1,
                  
                  onChanged: (p0) {
                    setState(() {
                      count = int.parse(numberController.text);
                      nameControllersList = List.generate(
                          count!, (index) => TextEditingController());
                      inspectersList =
                          List.generate(count!, (index) => InspectorModel());
                    });
                    print("$inspectersList ==23");
                  },
                  controller: numberController,
                  textinputType: TextInputType.number,
                  validator: (value) {
                    if (value!.length==0) {
                      return "          Zero is not a valid number";
                    
                    } else if (!RegExp(r'[1-9]').hasMatch(value)) {
                      return '          Please enter a valid number';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            h25,
            divider(),
            h10,
            count == null
                ? dummy()
                : Form(
                  key: key,
                  child: LimitedBox(
                      maxHeight: 220.h,
                      maxWidth: 360.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: count!,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 360.w,
                            height: 220.h,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  h15,
                                  Form(
                                    //   key: fomkey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          children: [
                                            CustoName(
                                              name: 'Inspector Name',
                                              color: white,
                                            ),
                                            w170,
                                            Text(
                                              "${index + 1}/$count",      
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: white),
                                            )
                                          ],
                                        ),
                                        h15,
                                        InspectorNameForm(
                                          onChanged: (value) {
                                            setState(() {
                                              inspectersList[index].name = value;
                                            });
                                          },
                                          controller: nameControllersList[index],
                                          validator: (value) {
                                            if (value!.length == 0) {
                                              return "          Enter your name";
                                            } else if (!RegExp(r'(^[a-z A-Z]+$)')
                                                .hasMatch(value)) {
                                              return '          Please enter a valid name';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  h25,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustoName(
                                        name: 'Position',
                                        color: white,
                                      ),
                                      h15,
                                      // dropdown(index),
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
                                                  hint: const Text('POSITION'),
                                                  elevation: 6,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  //  alignment:
                                                  // AlignmentDirectional.center,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: black),
                                                  value: inspectersList[index]
                                                      .role_id,
                                                  icon: const Icon(
                                                      Icons.keyboard_arrow_down),
                                                  items: positionController
                                                      .positinList
                                                      .map((e) {
                                                    return DropdownMenuItem(
                                                        value: e.id.toString(),
                                                        child: Text(e.role!));
                                                  }).toList(),
                
                                                  onChanged: (String? newValue) {
                                                    setState(() {
                                                      inspectersList[index]
                                                          .role_id = newValue!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  h20,
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.arrow_back_ios,
                                              size: 15,
                                              color: bg,
                                            ),
                                            Text(
                                              "swipe",
                                              style: TextStyle(color: white),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "swipe",
                                              style: TextStyle(color: white),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 15,
                                              color: bg,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          );
                        },
                      ),
                    ),
                )

            //models================================================
            //======================================================

            ,
            h10,
            divider(),
            h25,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: CustomButton(
                textColor: mainred,
                onPressed: () {
                  String? name;
                  String? role;
                  for (var element in inspectersList) {
                    name = element.name;
                    role = element.role_id;
                  }
                  if (fomkey.currentState!.validate()) {
                  if (inspectersList.isNotEmpty) {
                    if (name != null && role != null) {
                      survayData.write('inspectersList', inspectersList);
                      positionController.switchValue.value = true;
                      print('value add');
                      Get.back();
                   }

                    } else {
                      positionController.switchValue.value = false;
                      Get.back();
                      print("no data data null");
                      Get.snackbar("Warning", "Please fill the all feilds",
                          backgroundColor: yellow);
                    }
                  // } else {
                    // positionController.switchValue.value = true;
                    // print("no data");
                 //   Get.snackbar("Warning", "Please fill the all feilds",
                      //  backgroundColor: yellow);
                  }
                  // }
                },
                title: "SUBMIT",
                btncolor: white,
                //   textColor: mainred,
              ),
            ),
          ]),
        ),
      ),
      //  ),
    );
  }

  SizedBox dropdown(int index) {
    return SizedBox(
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
                hint: const Text('POSITION'),
                elevation: 6,
                borderRadius: BorderRadius.circular(20),
                alignment: AlignmentDirectional.center,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, color: grey),
                value: positionController.positionValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: positionController.positinList.map((e) {
                  return DropdownMenuItem(
                      value: e.id.toString(), child: Text(e.role!));
                }).toList(),
                onChanged: (String? newValue) {
                  positionController.dropdownPositionChange(
                      newValue!, 'POSITION');
                },
              ),
            ),
          ),
        ));
  }

  SizedBox dummy() {
    return SizedBox(
      //   color: blue,
      width: double.infinity,
      height: 220.h,
      child: const Center(
        child: Text(
          'Please enter number of\naccompanied persons',
          style: TextStyle(fontWeight: FontWeight.bold, color: white),
        ),
      ),
    );
  }

  Padding divider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Divider(thickness: 1.w, color: white),
    );
  }
}

// ignore: must_be_immutable
class CustoName extends StatelessWidget {
  CustoName({Key? key, required this.name, required this.color})
      : super(key: key);
  String name;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontWeight: FontWeight.bold, color: color),
    );
  }
}
