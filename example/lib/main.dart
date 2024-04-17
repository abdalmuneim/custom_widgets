import 'package:custom_widgets/custom_widgets.dart';
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
      body: Center(
        child: ContainerShadow(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.5,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              const CustomText(
                text: "Hello",
                color: Colors.purple,
                fontSize: 22,
              ),
              10.sh,
              const CustomTextFormField(
                labelText: 'Lable Text',
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
            ],
          ),
        ),
      ),
    );
  }
}
