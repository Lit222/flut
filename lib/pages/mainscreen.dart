import 'package:flutter/material.dart';

class NotificationSetting{
  String title;
  bool value;

  NotificationSetting({
    required this.title,
    this.value = false,
  });
}

////////////////////////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////////////////////////

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late String _user;
  final notifications = ([NotificationSetting(title: 'Программирование оконным приложений'),NotificationSetting(title: 'Математический анализ')]);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],
        appBar: AppBar(title: const Text('Учеба'),
            centerTitle: true,
            backgroundColor: Colors.deepPurple[500]
        ),
      body: ListView(
        children: [
          ...notifications.map(buildSingleCheckbox).toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: (){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Добавить дело'),
            content: TextField(
              onChanged: (String value){
                _user = value;
              },
            ),
            actions: [
              ElevatedButton(onPressed: () {
                setState(() {
                  notifications.add(NotificationSetting(title: _user));
                });
                Navigator.of(context).pop();
              }, child: const Text('Добавить'))
            ],
          );
        });
      },
      child: const Icon(Icons.add, color: Colors.grey,),
    ),
    );
  }

  Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(
    notification: notification,
    onClicked: (){
      setState(() {
        final newValue = !notification.value;
        notification.value = newValue;
      });
    }
  );

  Widget buildCheckbox({
    required NotificationSetting notification,
    required VoidCallback onClicked,
  }) => ListTile(
    leading: Checkbox(
        value: notification.value,
        onChanged: (value) => onClicked(),
      ),
    title: Text(notification.title),
  );


}