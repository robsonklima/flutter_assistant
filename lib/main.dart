import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _alanSdkKey =
      '75173425bbd44f89175a6ea7215afcec2e956eca572e1d8b807a3e2338fdd0dc/stage';
  Color bgColor = Colors.white;

  @override
  void initState() {
    super.initState();

    initAlan();
  }

  initAlan() {
    AlanVoice.addButton(_alanSdkKey);
    AlanVoice.callbacks.add((command) => _handleCommand(command.data));
  }

  _handleCommand(Map<String, dynamic> response) {
    debugPrint(response["command"]);

    switch (response["command"]) {
      case "change_bg_color_red":
        setState(() {
          bgColor = Colors.red;
        });
        break;
      case "change_bg_color_yellow":
        setState(() {
          bgColor = Colors.yellow;
        });
        break;
      case "disable":
        AlanVoice.deactivate();
        break;
      default:
        print("no match found");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
    );
  }
}
