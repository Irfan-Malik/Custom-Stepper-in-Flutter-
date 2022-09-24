import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/custom_stepper.dart';

class StepperHome extends StatefulWidget {
  const StepperHome({Key? key}) : super(key: key);

  @override
  State<StepperHome> createState() => _StepperHomeState();
}

class _StepperHomeState extends State<StepperHome> {
  static const platform = MethodChannel('going.native.for.stepper.data');
  Map<String, String> stepperData = {};
  int selectedIndex = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    try {
      final result = await platform.invokeMethod('get_stepper_data');
      stepperData = Map.from(result);
    } on PlatformException catch (e) {
      debugPrint('=======>  $e');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tyrads'),
        elevation: 0.5,
      ),
      body: ListView(
        children: List.generate(stepperData.length, (index) {
          final item = stepperData.entries.elementAt(index);
          return MyCustomStepper(
            index: index,
            title: item.key,
            subTitle: item.value,
            itemsLength: stepperData.length,
            selectedIndex: selectedIndex,
            onContinue: onContinue,
            onBack: onBack,
            onFinish: onFinish,
          );
        }),
      ),
    );
  }

  void onContinue() {
    if (selectedIndex == stepperData.length - 1) {
      return;
    }
    selectedIndex++;
    setState(() {});
  }

  void onBack() {
    if (selectedIndex == 0) {
      return;
    }
    selectedIndex--;
    setState(() {});
  }

  void onFinish() {
    var snackBar = const SnackBar(content: Text('Stepper Finished'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
