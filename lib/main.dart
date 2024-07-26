import 'package:api_flutter/PixaBy/provider/home_provider.dart';
import 'package:api_flutter/Recipes%20App/provider/recipes_provider.dart';
import 'package:api_flutter/Recipes%20App/view/screen/detail_page.dart';
import 'package:api_flutter/Recipes%20App/view/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'PixaBy/view/screen/search_page.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => RecipesProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/' : (context) => RecipePage(),
          '/detail' : (context) => DetailPage(),
        },
      ),
    );
  }
}
