import 'package:flutter/material.dart' show BorderSide, BuildContext, ButtonStyle, Color, ColorScheme, Column, EdgeInsets, Icon, IconButton, Icons, MainAxisAlignment, MaterialApp, MaterialState, MaterialStateProperty, Padding, Row, Scaffold, SizedBox, State, StatefulWidget, StatelessWidget, Theme, ThemeData, VoidCallback, Widget, runApp;

void main() {
  runApp(const IconButtonToggleApp());
}

class IconButtonToggleApp extends StatelessWidget {
  const IconButtonToggleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xffbe9924),
        useMaterial3: true,
      ),
      title: 'Icon Button Types',
      home: const Scaffold(
        body: DemoIconToggleButtons(),
      ),
    );
  }
}

class DemoIconToggleButtons extends StatefulWidget {
  const DemoIconToggleButtons({super.key});

  @override
  State<DemoIconToggleButtons> createState() => _DemoIconToggleButtonsState();
}

class _DemoIconToggleButtonsState extends State<DemoIconToggleButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
                children: const <Widget>[
                  DemoIconToggleButton(isEnabled: true),
                ]),
          ]),
    );
  }
}

class DemoIconToggleButton extends StatefulWidget {
  const DemoIconToggleButton(
      {required this.isEnabled, this.getDefaultStyle, super.key});

  final bool isEnabled;
  final ButtonStyle? Function(bool, ColorScheme)? getDefaultStyle;

  @override
  State<DemoIconToggleButton> createState() => _DemoIconToggleButtonState();
}

class _DemoIconToggleButtonState extends State<DemoIconToggleButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = widget.isEnabled ? () {
      setState(() {
        selected = !selected;
      });
    }: null;

    return IconButton(
      isSelected: selected,
      icon: const Icon(Icons.star_border),
      selectedIcon: const Icon(Icons.star),
      onPressed: onPressed,
    );
  }
}


