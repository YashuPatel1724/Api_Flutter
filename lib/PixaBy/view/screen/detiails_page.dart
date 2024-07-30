import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/search_modal.dart';
import '../../provider/home_provider.dart';

class Detiail_Page extends StatelessWidget {
  const Detiail_Page({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: FutureBuilder(
        future: Provider.of<HomeProvider>(context, listen: false)
            .fromMap(homeProviderTrue.search),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SearchModal? sea = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              '${sea!.hits[homeProviderTrue.select].webformatURL}'))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${sea.hits[homeProviderTrue.select].user_id}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${sea.hits[homeProviderTrue.select].user}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${sea.hits[homeProviderTrue.select].likes}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Downloads : ${sea.hits[homeProviderTrue.select].downloads}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Views : ${sea.hits[homeProviderTrue.select].views}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 13.0,left: 15,right: 15),
                  child: GestureDetector(
                    onTap: () {
                      homeProvider.setWallpaper('${sea!.hits[homeProviderTrue.select].webformatURL}');
                      SnackBar(content: Text('Seccefully setWallpaper'),);
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'SetWallPaper',
                        style: TextStyle(
                            color: Colors.white, fontSize: 23, letterSpacing: 1),
                      ),
                    ),
                  ),
                )
              ],
            );
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
