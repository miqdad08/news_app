import 'package:flutter/material.dart';
import 'package:news_app/helper/data_request.dart';
import 'package:news_app/models/ResponseNews.dart';

import 'helper/widget.dart';
import 'news_item.dart';

class NewsByCategories extends StatefulWidget {

  final String newsCategory;

  NewsByCategories({this.newsCategory});

  @override
  _NewsByCategoriesState createState() => _NewsByCategoriesState(newsCategory);
}

class _NewsByCategoriesState extends State<NewsByCategories> {

  NewsByCategory newsByCategory = NewsByCategory();
  String newsCategory;


  _NewsByCategoriesState(this.newsCategory);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: myAppbar(),
      body: FutureBuilder(
        future: newsByCategory.getNewsByCategory(newsCategory),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListViewCategory(snapshot.data);
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text("Data Tidak Ditemukan"));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ListViewCategory extends StatelessWidget {

  ResponseNews responseNews;
  ListViewCategory (this.responseNews);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: responseNews.articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return NewsItem(
                    imgUrl: responseNews.articles[index].urlToImage ?? "",
                    title: responseNews.articles[index].title ?? "",
                    desc: responseNews.articles[index].description ?? "",
                    content: responseNews.articles[index].content ?? "",
                    posturl: responseNews.articles[index].url ?? "",
                    name: responseNews.articles[index].source.name ?? "",
                  );
                }
            )
        ),
    );
  }
}




