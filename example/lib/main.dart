import 'package:custom_widgets/custom_widgets.dart';
import 'package:custom_widgets/widgets/custom_elevated_button.dart';
import 'package:custom_widgets/widgets/custom_stepper.dart';
import 'package:custom_widgets/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: ContainerShadow(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.1,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomText(
                  text: "Custom Text",
                  color: Colors.purple,
                  fontSize: 22,
                ),
                10.sh,
                const CustomTextFormField(
                  labelText: 'Custom Text Form Field',
                  hintText: "hint Text",
                  hintStyle: TextStyle(fontSize: 15),
                  labelAlign: TextAlign.start,
                  labelTextSize: 16,
                  fillColor: Colors.amber,
                  inputBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
                10.sh,
                CustomElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: CustomText(
                          text: 'Custom Eleveted button',
                        ),
                      ),
                    );
                  },
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(3),
                  child: const CustomText(
                    text: "custom elevated button",
                    color: Colors.white,
                  ),
                ),
                10.sh,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDivider(
                          isHor: false,
                          height: 145,
                          thickness: 5,
                        ),
                        RotatedBox(
                            quarterTurns: 1,
                            child: Text('Custom Divider vertical')),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Custom Divider horizontal'),
                        CustomDivider(
                          thickness: 5,
                          width: 160,
                        ),
                      ],
                    ),
                  ],
                ),
                10.sh,
                CustomDropDownButton(
                  items: const [1, 2, 3],
                  hintText: 'Choose',
                  newValue: selectValue,
                  onChanged: (value) {
                    setState(() {
                      selectValue = value;
                    });
                  },
                  itemColor: Colors.black,
                  labelColor: Colors.black,
                  labelText: "Custom DropDown",
                  fillColor: Colors.green,
                  inputBorder: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(),
                ),
                10.sh,
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12.5,
                  child: CustomStepper(
                    size: MediaQuery.of(context).size.width / 10,
                    notActiveColor: Colors.black.withOpacity(.2),
                    activeColor: Colors.green,
                    padding: EdgeInsets.zero,
                    shrinkWrap: false,
                    direction: Axis.horizontal,
                    currentStep: 0,
                    labelText: 'Custom Steper',
                    steps: stepOne(0),
                  ),
                ),
                10.sh,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const CustomText(
                    text: 'Custom Network img',
                    textAlign: TextAlign.start,
                  ),
                ),
                const CustomCacheNetwork(
                  url: 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  var selectValue;

  stepOne(int activeStep) => List.generate(
      3,
      (index) => activeStep >= index
          ? const StepWidget()
          : Text((index + 1).toString())).toList();
}

class StepWidget extends StatelessWidget {
  const StepWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.check,
      color: Colors.white,
    );
  }
}
