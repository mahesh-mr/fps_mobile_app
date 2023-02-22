import 'package:flutter/cupertino.dart';
import 'package:fps/model/qustion_model.dart';
import 'package:fps/view/screens/items_list/items_list.dart';
import 'package:fps/view/screens/qution_air/widgets/custom_radio/yes_or_no_button.dart';
import 'package:get/get.dart';

class QustionController extends GetxController {
  var selectedIndex = 0.obs;
  bool get isLastPage => selectedIndex.value == qustionsList.length - 1;
  var pagecontroller = PageController();
  var tabTextIndexSelected = 0.obs;
  final listTextTabToggle = ['MAL', 'ENG'];

  forwerdPageJumb() {
    pagecontroller.nextPage(
      duration: 550.milliseconds,
      curve: Curves.ease,
    );
  }

  forwerdAction() {
    if (isLastPage) {
      Get.to(ItemsListHome());
    } else {
      pagecontroller.nextPage(
        duration: 550.milliseconds,
        curve: Curves.ease,
      );
    }
  }

  @override
  void onClose() {
    qustionsList;
    super.onClose();
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;
}

List<QustionModel> qustionsList = [
  //1=================
  QustionModel(
    text:
        'പരിശോധന നടത്താൻ എത്തിയപ്പോൾ KTPDS (Control) Order 2021 para 44 പ്രകാരം എഫ്.പി.എസ്. തുറന്ന് പ്രവർത്തിക്കുന്നുണ്ടോ?',
    headaLine: 'Start Inspection',
    //  ,
    bar: 0.036,
    number: 1,
  ),
//2=======================

  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1) (XXI) പ്രകാരം പരിശോധനയ്ക്ക് ആവശ്യമായ സൗകര്യവും സഹകരണവും ലഭ്യമായിരുന്നോ?',
      headaLine: '',
      // ,
      bar: 0.072,
      number: 2),
  //3===========================

  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1) (XIII) പ്രകാരം പരിശോധനാ സൗകര്യാർത്ഥം ഭക്ഷ്യ ധാന്യങ്ങൾ അട്ടി ഇട്ടിരുന്നോ?',
      headaLine: '',
      //   widget: CustomRadioWidget(),
      bar: 0.10799999999999998,
      number: 3),

  //4===================================================

  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1)(XII) പ്രകാരം എഫ്. പി.എസ്-ഉം പരിസരവും വൃത്തിയായി സൂക്ഷിച്ചിട്ടുണ്ടോ?',
      headaLine: '',
      //  widget: CustomRadioWidget(),
      bar: 0.144,
      number: 4),
  //5=================================================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1)(XI)  പ്രകാരം ആവശ്യമായ റിക്കാർഡുകളും രജിസ്റ്ററുകളും എഫ്.പി.എസ്-ൽ സൂക്ഷിച്ചിട്ടുണ്ടോ?',
      headaLine: '',
      bar: 0.18,
      number: 5),

  //6=============================================
  QustionModel(
      text:
          'പരിശോധന സമയം ലഭ്യമായ സ്റ്റോക്കിന്റെ എല്ലാ രസീതുകളും വരവുവച്ചിട്ടുണ്ടോ?',
      headaLine: '',
      bar: 0.216,
      number: 6),

  //7=============================================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1) പ്രകാരം എഫ്.പി.എസ് -ൽ പ്രദർശിപ്പിക്കാനുള്ള വസ്തുക്കൾ പ്രദർശിപ്പിച്ചിട്ടുണ്ടോ?',
      headaLine: '',
      bar: 0.252,
      number: 7),

  //8==========================================
  QustionModel(
      text:
          'KTPDS (Control)Order 2021 Para 42(1) (XXIV) പ്രകാരമുള്ള നിർദ്ദിഷ്ഠ മാതൃകയിലുള്ള നെയിംബോർഡുകൾ പ്രദർശിപ്പിച്ചിട്ടുണ്ടോ?',
      headaLine: '',
      bar: 0.288,
      number: 8),

  //9===========================================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1) (III) പ്രകാരം വ്യാപാരി ഗുണഭോക്താക്കളോട് മാന്യമായി പെരുമാറാറുണ്ടോ?',
      headaLine: '',
      bar: 0.32399999999999995,
      number: 9),

  //10====================================================

  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 32(1) പ്രകാരം മണ്ണെണ്ണ പ്രത്യേക മുറിയിലാണോ സൂക്ഷിക്കുന്നത് ?',
      headaLine: '',
      bar: 0.35999999999999993,
      number: 10),
  //11=============================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (2) (III) പ്രകാരം ഗുണഭോക്താവിന് കൃത്യമായ അളവിൽ റേഷൻ വിതരണം ചെയ്യുന്നുണ്ടോ ?',
      headaLine: '',
      bar: 0.3959999999999999,
      number: 11),

  //12======================================

  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (2) (V) പ്രകാരം അംഗീകാരമില്ലാത്ത വ്യക്തികൾ എഫ്.പി.എസ് –ന്റെ പ്രവർത്തനങ്ങളിൽ ഇടപെടാറുണ്ടോ?',
      headaLine: '',
      bar: 0.4319999999999999,
      number: 12),
  //13========================================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1) (VII) പ്രകാരം എഫ്.പി.എസ്. പ്രവർത്തന സമയം കൃത്യമായി പാലിക്കാറുണ്ടോ ?',
      headaLine: '',
      bar: 0.46799999999999986,
      number: 13),

  //14========================================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1) (VII) പ്രകാരം അനുമതി ഇല്ലാതെ അവധി ദിനങ്ങളിൽ എഫ്.പി.എസ് തുറന്ന് പ്രവർത്തിച്ചിട്ടുണ്ടോ?',
      headaLine: '',
      bar: 0.5039999999999999,
      number: 14),

  //15========================================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1) (VI) പ്രകാരം ലൈസൻസിൽ പ്രതിപാദിക്കാത്ത സ്ഥലത്ത് ഭക്ഷ്യ ധാന്യങ്ങൾ സംഭരിക്കാറുണ്ടോ ?',
      headaLine: '',
      bar: 0.5399999999999999,
      number: 15),

  //16========================================

  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1) (II) പ്രകാരം ഗുണഭോക്താക്കൾക്ക് റേഷൻ വിതരണം ചെയ്യുമ്പോൾ ബില്ലുകൾ കൃത്യമായി നൽകാറുണ്ടോ?',
      headaLine: '',
      bar: 0.576,
      number: 16),
  //17========================================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1) (IV) പ്രകാരം അളവ് / തൂക്ക ഉപകരണങ്ങൾ സീൽ ചെയ്തിട്ടുണ്ടോ?',
      headaLine: '',
      bar: 0.612,
      number: 17),

  //18========================================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (1) (II) പ്രകാരം റേഷൻ സാധനങ്ങൾക്ക് ഗുണഭോക്താക്കളിൽ നിന്നും അമിത വില ഈടാക്കാറുണ്ടോ ?',
      headaLine: '',
      bar: 0.648,
      number: 18),

  //19========================================

  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 43 (IV) പ്രകാരം അനുമതിയില്ലാതെ ഇ-പോസ് മെഷിൻ എഫ്.പി.എസ് -ൽ നിന്നും മാറ്റാറുണ്ടോ ?',
      headaLine: '',
      bar: 0.684,
      number: 19),
  //20========================================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (2) (VI) പ്രകാരം സിവിൽ സപ്ലൈസ് വകുപ്പിൽ നിന്നുള്ള അനുമതിയില്ലാതെ വസ്തുക്കൾ സംഭരിക്കുകയോ എഫ്.പി.എസ് വഴി വിതരണം ചെയ്യുകയോ ചെയ്തിട്ടുണ്ടോ ?',
      headaLine: '',
      bar: 0.7200000000000001,
      number: 20),
  //21==================================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (2) (VIII) പ്രകാരം  ഇ-പോസ് മെഷീൻ മനഃപൂർവ്വം കേട് വരുത്താറുണ്ടോ ?',
      headaLine: '',
      bar: 0.7560000000000001,
      number: 21),

  //22============================

  QustionModel(
      text:
          "KTPDS (Control) Order 2021 para 42 (2) (X) പ്രകാരം  ഉപയോഗശൂന്യമായ റേഷൻ സാധനങ്ങൾ വിതരണം ചെയ്തിട്ടുണ്ടോ ?",
      headaLine: '',
      bar: 0.7920000000000001,
      number: 22),
  //23=============================

  QustionModel(
      text:
          'KTPDS CONTROL ORDER 2021 Para 43(IV) പ്രകാരം രജിസ്റ്ററിൽ ഉൾപ്പെടുത്താതെ ഇ പോസ് മുഖേന മാന്വൽ വിതരണം നടത്തിയിട്ടുണ്ടോ ?',
      headaLine: '',
      bar: 0.8280000000000002,
      number: 23),
  //24==============================
  QustionModel(
      text:
          'KTPDS (Control) Order2021 para 42 (2) (11) പ്രകാരം പരിശോധന സമയത്ത്‌ രജിസ്റ്ററുകളിലും റിക്കാർഡുകളിലും വ്യാജമായി രേഖപ്പെടുത്തലുകൾ നടത്തിയതായി  കാണാൻ സാധിച്ചിട്ടുണ്ടോ?',
      headaLine: '',
      bar: 0.8640000000000002,
      number: 24),
  //25==============================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (2) (vii) പ്രകാരം  പരിശോധന സമയത്ത്‌  റേഷൻ കടയെ സംബന്ധിച്ച് റിക്കാർഡുകൾ റേഷൻകടയിൽ അല്ലാതെ മറ്റ് സ്ഥലത്ത് സൂക്ഷിക്കുന്നതായി ശ്രദ്ധയിൽപ്പെട്ടിട്ടുണ്ടോ?',
      headaLine: '',
      bar: 0.9000000000000002,
      number: 25),
  //26==============================
  QustionModel(
      text:
          'KTPDS (Control) Order-2021 para 42 (1) (xvi) പരിശോധന സമയത്ത്‌ റേഷൻ സാധനങ്ങളുടെ വില കൃത്യമായി അടച്ച് സ്റ്റോക്ക് എടുക്കാത്തതായി അറിയാൻ സാധിച്ചിട്ടിണ്ടോ?',
      headaLine: '',
      bar: 0.9360000000000003,
      number: 26),
  //27==============================
  QustionModel(
      text:
          'KTPDS (Control) Order 2021 para 42 (2) (I) പ്രകാരം റേഷൻ വിതരണത്തിനു ശേഷം ഉപഭോക്താക്കളുടെ റേഷൻ കാർഡുകൾ എഫ്.പി.എസ്-ൽ സൂക്ഷിച്ചിട്ടുണ്ടോ ?',
      headaLine: '',
      bar: 0.9720000000000003,
      number: 27),
  //  QustionModel(
  // text:
  //     'ഉണ്ടെങ്കിൽ എത്ര കാർഡുകൾ ? ( കാർഡ് നമ്പരുകൾ രേഖപ്പെടുത്തുക )',
  // headaLine: '',
  // bar: 1.0,
  // number: 25),
];
List englishQustion = [
  //1
  "As per KTPDS (Control) Order 2021 para 44, when the inspection is conducted,  Is the FPS open?",
   //2,
  "As per KTPDS (Control) Order 2021 para 42 (1) (XXI),Was necessary facility and cooperation available for inspection ?",
  //3
  "As per KTPDS (Control) Order 2021 para 42 (1) (XIII), whether the food grains were arranged?",
  //4
  "As per KTPDS (Control) Order 2021 para 42 (1)(XII), Is FPS and surroundings kept clean?",
  //5
  "As per KTPDS (Control) Order 2021 para 42 (1)(XI), Are the necessary records and registers maintained in the FPS ?",
  //6
  "Have all receipts of stock available at the time of inspection been received?",
  //7
  "As per KTPDS (Control) Order 2021 para 42 (1), are the items to be exhibited is exhibited in FPS?",
  //8
  "As per KTPDS (Control)Order 2021 Para 42(1) (XXIV), have nameboards of the specified format been displayed?",
  //9
  "As per KTPDS (Control) Order 2021 para 42 (1) (III), does the ard treat the beneficiaries fairly?",
  //10
  "As per KTPDS (Control) Order 2021 para 32(1), is kerosene stored in a separate room?",
  //11
  "As per KTPDS (Control) Order 2021 para 42 (2) (III), is exact quantity of ration distributed to the beneficiary?",
  //12
  "As per KTPDS (Control) Order 2021 para 42 (2) (V), do unauthorized persons interfere in the activities of FPS?",
  //13
  "As per KTPDS (Control) Order 2021 para 42 (1) (VII),  is  working hours strictly followed by FPS?",
  //14
  "As per KTPDS (Control) Order 2021 para 42 (1) (VII), is the FPS open on holidays without permission?",
  //15
  "As per KTPDS (Control) Order 2021 para 42 (1) (VI), whether food grains are stored in a place not specified in the licence?",
  //16
  "As per KTPDS (Control) Order 2021 para 42 (1) (II), are the bills properly given  to the beneficiaries while distributing ration ?",
  //17
  "As per KTPDS (Control) Order 2021 para 42 (1) (IV), are measuring / weighing instruments sealed?",
  //18
  "As per KTPDS (Control) Order 2021 para 42 (1) (II), are the beneficiaries charged exorbitant price for ration items?",
  //19
  "As per KTPDS (Control) Order 2021 para 43 (IV), is e-pos machine removed from FPS without permission?",
  //20
  "As per KTPDS (Control) Order 2021 para 42 (2) (VI), are goods have been procured or distributed through FPS without permission from Civil Supplies Department?",
  //21
  "As per KTPDS (Control) Order 2021 para 42 (2) (VIII), whether e-POS machine is intentionally damaged?",
  //22
  "As per KTPDS (Control) Order 2021 para 42 (2) (X), have unusable ration items been distributed?",
  //23
  "As per KTPDS (Control) Order 2021 para 43 (IV), has ration goods been distributed manually other than through e-POS without permission?",
  //24
  "As per KTPDS (Control) Order2021 para 42 (2) (11), during the inspection, any false entries in the registers or records could be found?",
  //25
  "As per KTPDS (Control) Order 2021 para 42 (2) (vii), during the inspection was it noticed that the records in respect of the ration shop are kept at a place other than the ration shop?",
  //26
  "As per KTPDS (Control) Order-2021 para 42 (1) (xvi), at the time of inspection, was it found that, the stock was procured properly by paying ?",
  //27
  "As per KTPDS (Control) Order 2021 para 42 (2) (I), are the ration cards of consumers kept in FPS after distribution of ration?",
];
