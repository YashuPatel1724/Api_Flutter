import 'package:api_flutter/Recipes%20App/modal/recipes_modal.dart';
import 'package:api_flutter/Recipes%20App/provider/recipes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipesProvider recipesProviderTrue = Provider.of(context,listen: true);
    RecipesProvider recipesProviderFalse = Provider.of(context,listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Explore Recipes',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              Spacer(),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black38),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.orangeAccent,
                ),
              )
            ],
          ),
        ),
        body: FutureBuilder(
          future:
              Provider.of<RecipesProvider>(context, listen: false).fromMap(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              RecipesModal? recipe = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/images (1).jpg'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                  colors: [
                                    Colors.black87,
                                    Colors.transparent,
                                  ]),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 90.0, left: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Weekly Pick',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'This italian pasta and steak will warm up the faintest of hearts.',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Recent Recipes',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Wrap(
                        children: [
                          ...List.generate(
                            recipe!.recipes.length,
                            (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    recipesProviderFalse.selectedIndex(index);
                                    Navigator.of(context).pushNamed('/detail');
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    height: 152,
                                    width: 152,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                '${recipe.recipes[index].image}'))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text('${recipe.recipes[index].cuisine}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Container(
                                    height: 39,
                                    width: 150,
                                      child: Text(
                                    '${recipe.recipes[index].name}',
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                  )),
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text('${recipe.recipes[index].reviewCount} Reviews',style: TextStyle(color: Colors.black54),),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
