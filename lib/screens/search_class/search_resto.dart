import 'package:flutter/material.dart';

class CustomeSearchDelegate extends SearchDelegate{

  List<String> searchTerms = [
    'Resto 1',
    'Resto 2',
    'Resto 3',
    'Resto 4',
    'Resto 5',
  ];

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
   // throw UnimplementedError();
    return [IconButton(onPressed: (){
      query = '';
    }, icon: const Icon(Icons.clear))];
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<String> matchQuery = [];
    for(var resto in searchTerms){
      if(resto.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(resto);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context, index){
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery = [];
    for(var resto in searchTerms){
      if(resto.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(resto);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context, index){
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
    });
  }
}