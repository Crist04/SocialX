import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/component/news_lits_item.dart';
import 'package:news_app/service/api_service.dart';

class SearchResults extends StatefulWidget {
  SearchResults({super.key,required this.searchQuery});
  String searchQuery;
  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  ApiService apiService = ApiService();
  late String q;
  @override
  void initState() {
    
    super.initState();
   q=widget.searchQuery;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News related to $q'),),
      body: FutureBuilder(
        future: apiService.getNewsByResults(q),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List articleModel = snapshot.data ?? [];
            return ListView.builder(itemBuilder: (context, index) {
              return NewsListItem(articleModel: articleModel[index],);
            },itemCount: articleModel.length,);
          }
          return Center(
            child: CircularProgressIndicator(color: Colors.red,),
          );
        },
      ),
    );
  }
}