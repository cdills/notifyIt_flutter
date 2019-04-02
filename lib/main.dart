import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Landing.dart';
import 'AddNotifierDialog.dart';
import 'package:Notify.It_flutter/model/NotifierItem.dart';
import 'package:Notify.It_flutter/redux/reducers.dart';
import 'package:redux/redux.dart';

void main() {
 final store = new Store<List<NotifierItem>> (
   appReducers,
   initialState: new List());
 
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
   final Store<List<NotifierItem>> store;
  // This widget is the root of your application.

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<List<NotifierItem>>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.orange,
        ),
        home: MyHomePage(title: 'notify.it'),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: AfterSplash(),
      title: new Text('notify.it',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      backgroundColor: Colors.orange,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red
    );
  }
}

class AfterSplash extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notify.it"),
      ),
      body: LandingScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => addNotifierDialog()
            );
          },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
      bottomNavigationBar: new BottomNav() 
    );
  }
}

class BottomNav extends StatefulWidget {
  @override
  BottomNavState createState() => BottomNavState();
} 

class BottomNavState extends State<BottomNav> {
  int _selectedIndex = 1;

  void _onItemTapped (index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.today), title: Text('Today')),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), title: Text('History')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.orangeAccent,
        onTap: _onItemTapped,
    );
  }
}
