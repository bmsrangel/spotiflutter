import 'package:flutter/material.dart';
import 'package:spotiflutter/app/modules/artists/artists_module.dart';
import 'package:spotiflutter/app/modules/inicio/inicio_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            InicioModule(),
            Container(color: Colors.black,),
            Container(color: Colors.grey,)
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.search),),
              Tab(icon: Icon(Icons.library_books),)
            ],
            labelColor: Colors.green,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.green,
          ),
        ),
      ),
      length: 3,
    );
  }
}
