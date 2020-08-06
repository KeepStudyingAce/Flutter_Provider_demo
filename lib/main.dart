import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/ThemeProvider.dart';
import 'Provider/UserInfoProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          //两种写法
          // ChangeNotifierProvider.value(value: ThemeProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => UserInfoProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    //改变主题色以及姓名
    ThemeColorType temp =
        Provider.of<ThemeProvider>(context, listen: false).themeColor ==
                ThemeColorType.white
            ? ThemeColorType.black
            : ThemeColorType.white;
    Provider.of<ThemeProvider>(context, listen: false).changeThemeColor(temp);
    String name = Provider.of<UserInfoProvider>(context, listen: false).name;
    Provider.of<UserInfoProvider>(context, listen: false).setName(name + "K");

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Consumer2<ThemeProvider, UserInfoProvider>(
          builder: (context, themeProvider, userInfoProvider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              userInfoProvider.name,
              style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.themeColor == ThemeColorType.white
                      ? Colors.white
                      : Colors.black),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
