import 'package:flutter/material.dart';

class BaseController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BaseView();
  }
}

class _BaseView extends State<BaseController> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return setupView();
    // setupData();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。

        break;
      case AppLifecycleState.resumed: //从后台切换前台，界面可见
        break;
      case AppLifecycleState.paused: // 界面不可见，后台
        break;
      case AppLifecycleState.detached: // APP结束时调用
        break;
      default:
    }
  }

  Widget setupView() {
    return new MaterialApp();
  }

  void setupData() {}
}

class LaunchController extends StatefulWidget {
  @override
  createState() => LaunchView();
}

class LaunchView extends State<LaunchController> {
  var img = Image.asset(
    'lib/Image/video_placehold.jpg',
    width: 600.0,
    height: 240.0,
    fit: BoxFit.cover,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Base Demo",
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: _setupRoot(context),
    );

    // return CupertinoApp();
  }

  Widget _setupRoot(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Base Demo"),
        backgroundColor: Colors.white,
      ),
      body: new Center(
        child: _setupRootList(context),
      ),
    );
  }

  Widget _setupRootList(BuildContext context) {
    return new ListView(
      children: <Widget>[
        // new Image.asset(
        //   'lib/Image/video_placehold.jpg',
        //   width: 600.0,
        //   height: 240.0,
        //   fit: BoxFit.cover,
        // ),

        this.img,
        _setupTitle(),
        _setupFuncBtns(context)
      ],
    );
  }

  Widget _setupTitle() {
    final title = new Container(
      padding: EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    return title;
  }

  Widget _setupFuncBtns(BuildContext context) {
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL', context),
          buildButtonColumn(Icons.near_me, 'ROUTE', context),
          buildButtonColumn(Icons.share, 'SHARE', context),
        ],
      ),
    );
    return buttonSection;
  }

  Column buildButtonColumn(IconData icon, String label, BuildContext context) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }


}
