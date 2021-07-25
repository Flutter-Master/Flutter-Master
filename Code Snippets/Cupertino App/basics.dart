import 'package:flutter/cupertino.dart';

class MyCupertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // using cupertino app instead of
    // material app
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      // cupertino page scaffold instead of
      // scaffold
      home: CupertinoPageScaffold(
        // cupertino colors instead of
        // colors
        backgroundColor: CupertinoColors.inactiveGray,
        // cupertino navigation bar instead of
        // bottom navigation bar
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Page Title'),
          // cupertino button instead of
          // material button
          trailing: CupertinoButton(
            padding: EdgeInsets.all(0),
            // cupertino icons instead of
            // normal icons
            child: Icon(CupertinoIcons.search),
            onPressed: () {
              //TODO:
            },
          ),
        ),
        child: Center(
          child: Text(
            'My Cupertino App',
            // cupertino them of context instead of
            // theme of context
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
        ),
      ),
    );
  }
}
