import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/controller/controller/itemscontroller/itemes_controller.dart';
import 'package:fps/controller/controller/tost/tost.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/controller/service/stock_details/other_item_service.dart';

import 'package:fps/view/screens/widgets/custom_appbar.dart';
import 'package:fps/view/screens/sreen_survay/widgets/survey_form_wiidget.dart';
import 'package:fps/view/screens/widgets/double_tapp.dart';
import 'package:fps/view/screens/widgets/shadow_button.dart';
import 'package:fps/view/screens/witness_screen/withness_1_screen.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OtherItemsList extends StatefulWidget {
  OtherItemsList({
    super.key,
  });

  @override
  State<OtherItemsList> createState() => _OtherItemsListState();
}

class _OtherItemsListState extends State<OtherItemsList> {
  final pageController = PageController();

  int? count;

  String? survayId = GetLocalStorage.getfpsId('sId');

  final prouctName = TextEditingController();

  final assignedquantityController = TextEditingController();

  final numberController = TextEditingController();

  final physicalstockController = TextEditingController();

  final badstockController = TextEditingController();
  final calculationController = TextEditingController();

  final fonkey = GlobalKey<FormState>();
  final itemController = Get.put(ItemController());

  DateTime? lastpressed;

  double? calculation = 0;
  double? goodStokQ;
  double? stockInEPOS;
  double? badQ;

  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(ItemController());
    return Scaffold(
      backgroundColor: bg,
      appBar: CustomAppbar(height: 210.h),
      body: DoubleTapBackPress(
        lastpressed: lastpressed,
        widget: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              children: [
                Text(
                  "Other Items",
                  style: fontZ_30_black,
                ),
                h10,
                numberCard(),

                h10,
                count == null
                    ? Container(
                        height: 300.h,
                        //color: red,
                        child: Center(
                          child: Text(
                            'No More items',
                            style: fontZ_14_Grey,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          CustomItemSurveyTextForm(
                              controller: prouctName,
                              textinputType: TextInputType.text,
                              title: 'Enter the Product',
                              validator: (value) {
                                // if (value!.length == 0) {
                                //   return "          Enter Product name";
                                // } else if (!RegExp(r'(^[a-z A-Z]+$)')
                                //     .hasMatch(value)) {
                                //   return '          Please enter a valid product name';
                                // } else {
                                //   return null;
                                // }
                              },
                              onChanged: (p0) {},
                              hintText: ''),
                          h10,
                          CustomItemSurveyTextForm(
                            hintText: "",
                            onChanged: (p0) {
                              String phyStockT =
                                  physicalstockController.text.isEmpty
                                      ? ''
                                      : physicalstockController.text;
                              String badStockT = badstockController.text.isEmpty
                                  ? ''
                                  : badstockController.text;
                              String goodStockT =
                                  assignedquantityController.text.isEmpty
                                      ? ''
                                      : assignedquantityController.text;

                              setState(() {
                                goodStokQ = double.parse(phyStockT);
                                stockInEPOS = double.parse(goodStockT);
                                badQ = double.parse(badStockT);
                                double stockdetails = goodStokQ! + badQ!;
                                print("${stockdetails}===bad");
                                calculation = stockInEPOS! - stockdetails;
                                calculationController.text =
                                    calculation.toString();
                                print("$stockInEPOS ===epos");
                              });
                              print("$phyStockT ===phy");
                              print("$badStockT ====bad");
                            },
                            controller: assignedquantityController,
                            textinputType: TextInputType.number,
                            title: "Stock in e-POS machine",
                            validator: (value) {
                              // if (value!.length == null) {
                              //   return "Enter assignedquantity";
                              // } else if (!RegExp(r'[0-9]./').hasMatch(value)) {
                              //   return 'Please enter a valid quntity';
                              // } else {
                              //   return null;
                              // }
                            },
                          ),
                          h15,
                          CustomItemSurveyTextForm(
                            hintText: "",
                            controller: physicalstockController,
                            textinputType: TextInputType.number,
                            title: "Good Physical stock",
                            validator: (value) {
                              // if (value!.length == null) {
                              //   return "Enter physicalstock";
                              // } else if (!RegExp(
                              //         r"(-?[0-9]+.[0-9]+),(-?[0-9]+.[0-9]+)")
                              //     .hasMatch(value)) {
                              //   return 'Please enter a valid quntity';
                              // } else {
                              //   return null;
                              // }
                            },
                            onChanged: (p0) {
                              //  print(
                              //  "${itemController.getItemModel[widget.index].id}=====ind led");
                              String phyStockT =
                                  physicalstockController.text.isEmpty
                                      ? '0'
                                      : physicalstockController.text;
                              String badStockT = badstockController.text.isEmpty
                                  ? '0'
                                  : badstockController.text;
                              String goodStockT =
                                  assignedquantityController.text.isEmpty
                                      ? ''
                                      : assignedquantityController.text;
                              stockInEPOS = double.parse(goodStockT);
                              goodStokQ = double.parse(phyStockT);
                              badQ = double.parse(badStockT);

                              print('$badStockT ==11hhhhh11bad');
                              print('$goodStokQ ==11hhhhh11good');
                              print('$badQ ==11hhhhh11 tep bad');
                              // print('$')

                              setState(() {
                                double stockdetails = goodStokQ! + badQ!;
                                print("${stockdetails}===bad");
                                calculation = stockInEPOS! - stockdetails;
                                calculationController.text =
                                    calculation.toString();
                                print('$calculation ==cal');
                              });
                            },
                          ),
                          h10,

                          CustomItemSurveyTextForm(
                            hintText: "",
                            controller: badstockController,
                            textinputType: TextInputType.number,
                            title: "Bad Physical stock",
                            validator: (value) {
                              // if (value!.length == null) {
                              //   return "Enter badstock";
                              // } else if (!RegExp(
                              //         r"(-?[0-9]+.[0-9]+),(-?[0-9]+.[0-9]+)")
                              //     .hasMatch(value)) {
                              //   return 'Please enter a valid quntity';
                              // } else {
                              //   return null;
                              // }
                            },
                            onChanged: (p0) {
                              // print(
                              //     "${itemController.getItemModel[widget.index].id}=====ind led");
                              // itemStorage.write(
                              //     'Badstock', badstockController.text);
                              String phyStockT =
                                  physicalstockController.text.isEmpty
                                      ? '0'
                                      : physicalstockController.text;
                              String badStockT = badstockController.text.isEmpty
                                  ? '0'
                                  : badstockController.text;
                              String goodStockT =
                                  assignedquantityController.text.isEmpty
                                      ? ''
                                      : assignedquantityController.text;

                              goodStokQ = double.parse(phyStockT);
                              stockInEPOS = double.parse(goodStockT);
                              badQ = double.parse(badStockT);
                              setState(() {
                                double stockdetails = goodStokQ! + badQ!;
                                print("${stockdetails}===bad");
                                calculation = stockInEPOS! - stockdetails;

                                calculationController.text =
                                    calculation.toString();
                              });

                              //  itemStorage.write('calculation', calculation);
                              // print("${itemStorage.read(
                              //   'StockInEpos',
                              // )}====ass");
                              // print("${itemStorage.read(
                              //   'goodStock',
                              // )}====phy");
                              // print("${itemStorage.read(
                              //   'calculation',
                              // )}====cal");
                            },
                          ),
                          // h10,
                          h10,
                          CustomItemSurveyTextForm(
                            hintText: "0.0",
                            controller: calculationController,
                            textinputType: TextInputType.number,
                            title: 'Stock Difference',
                            validator: (value) {
                              // if (value!.length == null) {
                              //   return "Enter physicalstock";
                              // } else if (!RegExp(
                              //         r"(-?[0-9]+.[0-9]+),(-?[0-9]+.[0-9]+)")
                              //     .hasMatch(value)) {
                              //   return 'Please enter a valid quntity';
                              // } else {
                              //   return null;
                              // }
                            },
                            onChanged: (p0) {
                              // print(
                              // //     "${itemController.getItemModel[widget.index].id}=====ind led");
                              // itemStorage.write(
                              //     'goodStock', physicalstockController.text);
                            },
                          ),
                          // Text(
                          //   "Stock Difference",
                          //   style: const TextStyle(
                          //     color: grey3,
                          //   ),
                          // ),
                          // h10,
                          // ClayContainer(
                          //   color: white,
                          //   borderRadius: 50.r,
                          //   depth: 40,
                          //   parentColor: white,
                          //   spread: 2,
                          //   child: Container(
                          //     height: 45.w,
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(40.r),
                          //         color: white,
                          //         border: Border.all(color: lightgrey)),
                          //     child: Padding(
                          //       padding: EdgeInsets.only(top: 15.h),
                          //       child: Wrap(
                          //         children: [
                          //           Padding(
                          //             padding: const EdgeInsets.only(left: 110),
                          //             child: Text(
                          //               calculation!.toStringAsFixed(1),
                          //               textAlign: TextAlign.center,
                          //               style: TextStyle(
                          //                   fontWeight: FontWeight.w600,
                          //                   color: lightblack),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          h20,
                          // Obx(
                          //  () {

                          //   return
                        ],
                      ),
                CustomShadowButton(
                    onTap: itemController.isLoding.value
                        ? null
                        : () async {
                            itemController.loding.value = true;
                            await Future.delayed(const Duration(seconds: 1));
                            // bool isValid = fonkey.currentState!.validate();
                            itemController.loding.value = true;


                            
                            // if (isValid) {
                            OtherStockDetaisSercive.stockItemService(
                                    survayId: survayId!,
                                    productName: prouctName.text.isEmpty
                                        ? ""
                                        : prouctName.text,
                                    assignedQuandity:
                                        assignedquantityController.text.isEmpty
                                            ? ""
                                            : assignedquantityController.text,
                                    physicalStock:
                                        physicalstockController.text.isEmpty
                                            ? ""
                                            : physicalstockController.text,
                                    diffrence: calculation.toString().isEmpty
                                        ? ""
                                        : calculation.toString(),
                                    badsStock: badstockController.text.isEmpty
                                        ? ""
                                        : badstockController.text)
                                .then((value) {
                              if (value == "success") {
                                String cal = calculation.toString();
                                itemController.increment();
                                itemController.countValue.value;
                                print(itemController.countValue.value);

                                count == itemController.countValue.value
                                    ? print('sucess')
                                    : print('working');
                                prouctName.clear();
                                assignedquantityController.clear();
                                physicalstockController.clear();
                                badstockController.clear();
                                calculationController.clear();
                                // calculation
                                // cal = '0.0';
                                //  calculation.toString()='0';
                                if (count == itemController.countValue.value) {
                                  Get.offAll(WitnessScreen1(),
                                      transition: Transition.noTransition,
                                      duration: const Duration(seconds: 1));
                                }
                              }
                            });
                            //  }
                          },
                    buttonColor: mainred,
                    height: 40.h,
                    width: double.infinity,
                    title: itemController.isLoding.value
                        ? const CupertinoActivityIndicator(
                            animating: true,
                            color: yellow,
                            radius: 25,
                          )
                        : butenText(title: "Submit", textColor: bg)),
                //   }
                // ),
                h20
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row numberCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Number of Items',
          style: const TextStyle(
            color: grey3,
          ),
        ),
        w30,
        Expanded(
          child: ClayContainer(
            color: white,
            borderRadius: 50.r,
            depth: 40,
            parentColor: white,
            spread: 2,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  count = int.parse(numberController.text);
                });
              },
              keyboardType: TextInputType.number,
              controller: numberController,
              validator: (value) {},
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: const BorderSide(color: lightgrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: const BorderSide(color: lightgrey),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: const BorderSide(color: red),
                ),
                fillColor: white,
                focusColor: white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
