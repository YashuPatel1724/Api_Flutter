import 'package:api_flutter/Recipes%20App/modal/recipes_modal.dart';
import 'package:api_flutter/Recipes%20App/provider/recipes_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipesProvider recipesProviderTrue = Provider.of(context, listen: true);
    RecipesProvider recipesProviderFalse = Provider.of(context, listen: false);
    return Scaffold(
        body: FutureBuilder(
      future: Provider.of<RecipesProvider>(context, listen: false).fromMap(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          RecipesModal? recipe = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                '${recipe!.recipes[recipesProviderTrue.selectIndex].image}'))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                        child: Icon(
                      CupertinoIcons.arrow_left,
                      color: Colors.white,
                      size: 30,
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      '${recipe.recipes[recipesProviderTrue.selectIndex].name}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                    Spacer(),
                    Text(
                      '${recipe.recipes[recipesProviderTrue.selectIndex].difficulty}',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 36,
                    width: 90,
                    decoration: BoxDecoration(
                        border: (recipesProviderTrue.pageValue == 0)
                            ? Border(
                                bottom:
                                    BorderSide(color: Colors.orange, width: 5))
                            : Border()),
                    alignment: Alignment.center,
                    child: Text(
                      'Ingredients',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 36,
                    width: 90,
                    decoration: BoxDecoration(
                        border: (recipesProviderTrue.pageValue == 1)
                            ? Border(
                                bottom:
                                    BorderSide(color: Colors.orange, width: 5))
                            : Border()),
                    alignment: Alignment.center,
                    child: Text(
                      'Instructions',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 170,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: PageView(
                    onPageChanged: (value) {
                      recipesProviderFalse.Page(value);
                    },
                    children: [
                      Text(
                        '${recipe.recipes[recipesProviderTrue.selectIndex].ingredients.join(', ')}',
                        style: TextStyle(fontSize: 19, color: Colors.black87),
                      ),
                      Text(
                          '${recipe.recipes[recipesProviderTrue.selectIndex].instructions.join(', ')}')
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, top: 6, right: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: Colors.red,
                                size: 20,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '${recipe.recipes[recipesProviderTrue.selectIndex].cookTimeMinutes} mins',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Cook Time',
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 110,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, top: 6, right: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: Colors.red,
                                size: 20,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '${recipe.recipes[recipesProviderTrue.selectIndex].prepTimeMinutes} mins',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Prep Time',
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(50)),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
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
    ));
  }
}
