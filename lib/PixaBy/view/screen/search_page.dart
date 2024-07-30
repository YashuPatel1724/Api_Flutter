import 'package:api_flutter/PixaBy/modal/search_modal.dart';
import 'package:api_flutter/PixaBy/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextEditingController txtSearch = TextEditingController();

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =Provider.of<HomeProvider>(context,listen: false);
    HomeProvider homeProviderTrue =Provider.of<HomeProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: txtSearch,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  label: Text('Search Images'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            IconButton(onPressed: () {
              // homeProvider.fromMap(txtSearch.text);
              homeProvider.searchImg(txtSearch.text);
            }, icon: Icon(Icons.search)),
          ],
        ),
      ),
      body: FutureBuilder(
        future:
            Provider.of<HomeProvider>(context, listen: false).fromMap(homeProviderTrue.search),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SearchModal? search = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: search!.hits.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    homeProvider.selectedIndex(index);
                    Navigator.of(context).pushNamed('/detail');
                  },
                  child: Container(
                        margin: EdgeInsets.all(10),
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    '${search.hits[index].webformatURL}'))),
                      ),
                ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}



