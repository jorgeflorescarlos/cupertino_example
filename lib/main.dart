import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iOS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: CupertinoColors.lightBackgroundGray,
          //activeColor: CupertinoColors.activeGreen,
          //inactiveColor: CupertinoColors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.conversation_bubble),
                title: Text('Chat'))
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return CupertinoPageExampleOne();
                  break;
                case 1:
                  return CupertinoPageExampleTwo();
                  break;
                default:
                  return Container();
              }
            },
          );
        },
      ),
    );
  }
}

class CupertinoPageExampleOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Chats'),
            leading: Icon(
              CupertinoIcons.book,
              color: CupertinoColors.activeBlue,
            ),
            //middle: Text('Welcome Home'),
          ),
          SliverPadding(
            padding: MediaQuery.of(context)
                .removePadding(
                    removeTop: true, removeLeft: true, removeRight: true)
                .padding,
            sliver: SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(5.0),
                    color: index % 2 == 0 ? Colors.yellow : Colors.blue,
                    child: Center(
                      child: Text(index.toString()),
                    ),
                  ),
                );
              }, childCount: 20),
            ),
          )
        ],
      ),
    );
  }
}

class CupertinoPageExampleTwo extends StatefulWidget {
  @override
  _CupertinoPageExampleTwoState createState() =>
      _CupertinoPageExampleTwoState();
}

class _CupertinoPageExampleTwoState extends State<CupertinoPageExampleTwo> {
  double _value = 50.0;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Let's Chat"),
        trailing: Icon(CupertinoIcons.back),
        leading: Icon(CupertinoIcons.battery_full),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CupertinoButton(
              child: Text('button'),
              onPressed: () {},
              //color: CupertinoColors.activeBlue,
            ),
            CupertinoSlider(
              value: _value,
              min: 0.0,
              max: 100.0,
              onChanged: (double value) {
                setState(() {
                  _value = value;
                });
              },
              //activeColor: Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}
