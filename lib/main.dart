import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iOS App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
            middle: Text('Welcome Home'),
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
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
