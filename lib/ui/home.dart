import 'package:flutter/material.dart';
import 'package:news_app/service/auth_service.dart';
import 'package:news_app/ui/all_news.dart';
import 'package:news_app/ui/breaking_news.dart';
import 'package:news_app/ui/login_screen.dart';
import 'package:news_app/ui/result_screen.dart';
import 'package:news_app/ui/search_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.logout_rounded),onPressed:()async {
            await AuthService().signOut();
            setState(() {
              Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return LoginPage();
                          })));
            });
          },),
          centerTitle: true,
          actions: [GestureDetector(onTap: () {
            Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return NewsBySearch();
                      })));
          },child: Container(padding:EdgeInsets.only(right: 10),child: Icon(Icons.search)))],
          title: Text(
            "Social X",
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "Breaking",
              ),
              Tab(
                text: "All News",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BreakingNews(),
            AllNews()
          ],
        ),),
    );
  }
}

