import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fps/controller/controller/itemscontroller/itemes_controller.dart';
import 'package:fps/view/screens/sreen_survay/widgets/survey_form_wiidget.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ItemForm extends StatefulWidget {
  ItemForm({super.key, required this.index});
  int index;
  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final assignedquantityController = TextEditingController();
  final physicalstockController = TextEditingController();
  final badstockController = TextEditingController();
  final fonkey = GlobalKey<FormState>();

  final itemStorage = GetStorage();
// double? a;
// double? b;
// double? c;
  double? calculation = 0;

  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(ItemController());

    return Scaffold(
      backgroundColor: bg,
      body: Form(
          key: fonkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSurveyTextForm(
                suffix: itemController.getItemModel[widget.index].id != 7
                    ? (itemController.getItemModel[widget.index].id == 5
                        ? 'Pkg'
                        : "Kg")
                    : "Ltr",
                onChanged: (p0) {
                  itemStorage.write(
                      'StockInEpos', assignedquantityController.text);
                  String phyStockT = physicalstockController.text.isEmpty
                      ? '0'
                      : physicalstockController.text;
                  String badStockT = badstockController.text.isEmpty
                      ? '0'
                      : badstockController.text;

                  setState(() {
                    double goodStokQ = double.parse(phyStockT);
                    double stockInEPOS =
                        double.parse(assignedquantityController.text);
                    double badQ = double.parse(badStockT);
                    double stockdetails = goodStokQ + badQ;
                    print("${stockdetails}===bad");
                    calculation = stockInEPOS - stockdetails;
                    print("$stockInEPOS ===epos");
                  });
                  print("$phyStockT ===phy");
                  print("$badStockT ====bad");
                },
                controller: assignedquantityController,
                textinputType: TextInputType.number,
                title: "Stock in e-POS machine",
                validator: (value) {
                  if (value!.length == null) {
                    return "Enter assignedquantity";
                  } else if (!RegExp(r'[0-9]./').hasMatch(value)) {
                    return 'Please enter a valid quntity';
                  } else {
                    return null;
                  }
                },
              ),
              h15,
              CustomSurveyTextForm(
                suffix: itemController.getItemModel[widget.index].id != 7
                    ? (itemController.getItemModel[widget.index].id == 5
                        ? 'Pkg'
                        : "Kg")
                    : "Ltr",
                controller: physicalstockController,
                textinputType: TextInputType.number,
                title: "Good Physical stock",
                validator: (value) {
                  if (value!.length == null) {
                    return "Enter physicalstock";
                  } else if (!RegExp(r"(-?[0-9]+.[0-9]+),(-?[0-9]+.[0-9]+)")
                      .hasMatch(value)) {
                    return 'Please enter a valid quntity';
                  } else {
                    return null;
                  }
                },
                onChanged: (p0) {
                    itemStorage.write(
                      'goodStock', physicalstockController.text);
                  print(
                      "${itemController.getItemModel[widget.index].id}=====ind led");

                  String badStockT = badstockController.text.isEmpty
                      ? '0'
                      : badstockController.text;

                  double stockInEPOS =
                      double.parse(assignedquantityController.text);
                  double goodStokQ = double.parse(physicalstockController.text);
                  double badQ = double.parse(badStockT);

                  print('$badStockT ==11hhhhh11bad');
                  print('$goodStokQ ==11hhhhh11good');
                  print('$badQ ==11hhhhh11 tep bad');
                  // print('$')

                  setState(() {
                    double stockdetails = goodStokQ + badQ;
                    print("${stockdetails}===bad");
                    calculation = stockInEPOS - stockdetails;
                    print('$calculation ==cal');
                  });
                },
              ),
              h10,

              CustomSurveyTextForm(
                suffix: itemController.getItemModel[widget.index].id != 7
                    ? (itemController.getItemModel[widget.index].id == 5
                        ? 'Pkg'
                        : "Kg")
                    : "Ltr",
                controller: badstockController,
                textinputType: TextInputType.number,
                title: "Bad Physical stock",
                validator: (value) {
                  // if (value!.length ==null ) {
                  //   return "Enter badstock";
                  // } else if (!RegExp(r"(-?[0-9]+.[0-9]+),(-?[0-9]+.[0-9]+)")
                  //     .hasMatch(value)) {
                  //   return 'Please enter a valid quntity';
                  // } else {
                  //   return null;
                  // }
                },
                onChanged: (p0) {
                
                  print(
                      "${itemController.getItemModel[widget.index].id}=====ind led");
                  itemStorage.write('Badstock', badstockController.text);

                  double goodStokQ = double.parse(physicalstockController.text);
                  double stockInEPOS =
                      double.parse(assignedquantityController.text);
                  String badQunty = badstockController.text == null
                      ? '0'
                      : badstockController.text;
                  double badQ = double.parse(badQunty);
                  setState(() {
                    double stockdetails = goodStokQ + badQ;
                    print("${stockdetails}===bad");
                    calculation = stockInEPOS - stockdetails;
                  });

                  itemStorage.write('calculation', calculation);
                  print("${itemStorage.read(
                    'StockInEpos',
                  )}====ass");
                  print("${itemStorage.read(
                    'goodStock',
                  )}====phy");
                  print("${itemStorage.read(
                    'calculation',
                  )}====cal");
                },
              ),
              // h10,
              h10,
              Text(
                "Stock Difference",
                style: const TextStyle(
                  color: grey3,
                ),
              ),
              h10,
              ClayContainer(
                color: white,
                borderRadius: 50.r,
                depth: 40,
                parentColor: white,
                spread: 2,
                child: Container(
                  height: 45.w,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      color: white,
                      border: Border.all(color: lightgrey)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 110),
                          child: Text(
                            calculation!.toStringAsFixed(1),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, color: lightblack),
                          ),
                        ),
                        SizedBox(
                          width: 110.w,
                        ),
                        Text(
                          itemController.getItemModel[widget.index].id != 7
                              ? (itemController.getItemModel[widget.index].id ==
                                      5
                                  ? 'Pkg'
                                  : "Kg")
                              : "Ltr",
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: lightblack),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // CustomSurveyTextForm(
              //   controller: difrenceController,
              //   textinputType: TextInputType.text,
              //   title: "Difference",
              //   validator: (value) {}, onChanged: (p0) {

              //   },
              // ),
            ],
          )),
    );
  }
}

class StockItemController extends GetxController {
  final assignedquantityController = TextEditingController();
  final physicalstockController = TextEditingController();
  final badstockController = TextEditingController();
}
