import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // will rebuild widget tree, if
    // orientation is changed
    return OrientationBuilder(
      builder: (context, orientation) {
        // show landscape UI, if orientation
        // is landscape
        if (orientation == Orientation.landscape) {
          return LandscapeUI();
        }
        // show landscape UI otherwise
        return PortraitUI();
      },
    );
  }
}

/// UI for portrait orientation
class PortraitUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portrait UI'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Search'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Favorite'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('Settings'),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(30.0),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Tile ${index + 1}'),
              subtitle: Text('This is subtitle ${index + 1}'),
              trailing: Icon(
                index % 4 != 0 ? Icons.favorite_border : Icons.favorite,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// UI for landscape orientation
class LandscapeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landscape UI'),
      ),
      body: SafeArea(
        left: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NavigationRail(
              selectedIndex: 0,
              unselectedIconTheme: IconThemeData(
                color: Colors.grey,
              ),
              destinations: [
                NavigationRailDestination(
                  label: Text('Home'),
                  icon: Icon(Icons.home),
                ),
                NavigationRailDestination(
                  label: Text('Search'),
                  icon: Icon(Icons.search),
                ),
                NavigationRailDestination(
                  label: Text('Favorite'),
                  icon: Icon(Icons.favorite),
                ),
                NavigationRailDestination(
                  label: Text('Settings'),
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(30.0),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Tile ${index + 1}'),
                    subtitle: Text('This is subtitle ${index + 1}'),
                    trailing: Icon(
                      index % 4 != 0 ? Icons.favorite_border : Icons.favorite,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
