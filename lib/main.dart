import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material design Dialogs',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text("Material design Dialogs"),
              ),
              body: const TestPage()),
        ));
  }
}

// new class build
class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return TestState();
  }
}

// adjustment for class
class TestState extends State<TestPage> {
  @override
  // build new widget
  Widget build(BuildContext context) {
    return Center(
      // context arranged by column
      child: Column(
        // context arranged to be centered
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        // list of context
        children: [
          // calling widget btn1 function
          btn1(context),
          // create the gap between widget
          const SizedBox(height: 24),
          // calling widget btn2 function
          btn2(context),
          // create the gap between widget
          const SizedBox(height: 24),
          // calling widget btn3 function
          btn3(context),
          // create the gap between widget
          const SizedBox(height: 24),
          // calling widget btn4 function
          btn4(context),
        ],
      ),
    );
  }
  // create widget btn1
  Widget btn1(BuildContext context) {
    return MaterialButton(
      // customization the button at body
      color: Colors.grey[300],
      minWidth: 300,
      // calling function from package material_dialog when button pressed
      onPressed: () => Dialogs.materialDialog(
          msg: 'Are you sure ? you can\'t undo this',
          title: "Delete",
          color: Colors.white,
          context: context,
          dialogWidth: kIsWeb ? 0.3 : null,
          // ignore: avoid_print
          onClose: (value) => print("returned value is '$value'"),
          // customize button inside the dialog
          actions: [
            // button cancel created
            IconsOutlineButton(
              onPressed: () {
                Navigator.of(context).pop(['Test', 'List']);
              },
              text: 'Cancel',
              iconData: Icons.cancel_outlined,
              textStyle: const TextStyle(color: Colors.grey),
              iconColor: Colors.grey,
            ),
            // button delete created
            IconsButton(
              onPressed: () {},
              text: "Delete",
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]),
      // text inside the button at body created
      child: const Text("Show Material Dialog"),
    );
  }

  // create widget btn2
  Widget btn2(BuildContext context) {
    return MaterialButton(
      // customization the button at body
      minWidth: 300,
      color: Colors.grey[300],
      // calling function from package material_dialog when button pressed
      onPressed: () => Dialogs.bottomMaterialDialog(
          msg: 'Are you sure? you can\'t undo this action',
          title: 'Delete',
          context: context,
          // customize button inside the dialog
          actions: [
            // button cancel created
            IconsOutlineButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Cancel',
              iconData: Icons.cancel_outlined,
              textStyle: const TextStyle(color: Colors.grey),
              iconColor: Colors.grey,
            ),
            // button delete created
            IconsButton(
              onPressed: () {},
              text: 'Delete',
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]),
      // text inside the button at body created
      child: const Text("Show Bottom Material Dialog"),
    );
  }

  // create widget btn3
  Widget btn3(BuildContext context) {
    return MaterialButton(
      // customization the button at body
      minWidth: 300,
      color: Colors.grey[300],
      // calling function from package material_dialog when button pressed
      onPressed: () => Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Congratulations, you won 500 points',
        title: 'Congratulations',
        // calling lottie assets 'correct_animation.json' from directory assets
        lottieBuilder: Lottie.asset(
          'correct_animation.json',
          fit: BoxFit.contain,
        ),
        dialogWidth: kIsWeb ? 0.3 : null,
        context: context,
        // customize button inside the dialog
        actions: [
          // button claim created
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Claim',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ],
      ),
      // text inside the button at body created
      child: const Text("Show animations Material Dialog"),
    );
  }

  // create widget btn4
  Widget btn4(BuildContext context) {
    return MaterialButton(
      // customization the button at body
      minWidth: 300,
      color: Colors.grey[300],
      // calling function from package material_dialog when button pressed
      onPressed: () => Dialogs.bottomMaterialDialog(
        msg: 'Congratulations, you won 500 points',
        title: 'Congratulations',
        color: Colors.white,
        // calling lottie assets 'correct_animation.json' from directory assets
        lottieBuilder: Lottie.asset(
          'correct_animation.json',
          fit: BoxFit.contain,
        ),
        context: context,
        // customize button inside the dialog
        actions: [
          // button claim created
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Claim',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ],
      ),
      // text inside the button at body created
      child: const Text("Show animations Bottom Dialog"),
    );
  }
}