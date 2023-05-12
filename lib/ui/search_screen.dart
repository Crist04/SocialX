import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/constant/constant.dart';
import 'package:news_app/ui/result_screen.dart';

class NewsBySearch extends StatefulWidget {
  const NewsBySearch({super.key});

  @override
  State<NewsBySearch> createState() => _NewsBySearchState();
}

class _NewsBySearchState extends State<NewsBySearch> {
   late String searchData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    searchData = value;
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.redAccent),
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return SearchResults(searchQuery: searchData);
                      })));
                },
                child: Text(
                  'Search',
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}