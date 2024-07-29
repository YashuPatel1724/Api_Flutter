import 'package:api_flutter/E-commerce/modal/e_comm_modal.dart';
import 'package:api_flutter/E-commerce/provider/e_comm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ECommProvider eCommProviderTrue = Provider.of<ECommProvider>(context,listen: true);
    ECommProvider eCommProviderFalse = Provider.of<ECommProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Color(0xff292929),
      appBar: AppBar(
        backgroundColor: Color(0xff292929),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.bag,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<ECommProvider>(context, listen: false).fromMap(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ECommModal? ecom = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 8),
                        child: Text(
                          'Discover products',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0, top: 8),
                        child: Icon(
                          Icons.tune,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      ...List.generate(
                        ecom!.products.length,
                        (index) => InkWell(
                          onTap: () {
                            eCommProviderFalse.selectedIndex(index);
                            Navigator.of(context).pushNamed('/detail');
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(8),
                                height: 158,
                                width: 158,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xff939393),
                                    Color(0xffBDBDBD),
                                  ]),
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${ecom.products[index].images[0]}'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  width: 156,
                                  child: Text(
                                    '${ecom.products[index].title}',
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                width: 156,
                                child: Row(
                                  children: [
                                    Text('  Price : \$${ecom.products[index].price}',style: TextStyle(color: Colors.white,),),
                                    Spacer(),
                                    Icon(Icons.star,color: Colors.yellow,size: 18,),
                                    Text(' ${ecom.products[index].rating}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
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
