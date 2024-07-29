import 'package:api_flutter/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/e_comm_modal.dart';
import '../../provider/e_comm_provider.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    ECommProvider eCommProviderTrue =
        Provider.of<ECommProvider>(context, listen: true);
    ECommProvider eCommProviderFalse =
        Provider.of<ECommProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xff292929),
      body: FutureBuilder(
        future: Provider.of<ECommProvider>(context, listen: false).fromMap(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ECommModal? ecomm = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff939393),
                        Color(0xffBDBDBD),
                      ]),
                      image: DecorationImage(
                          image: NetworkImage(
                              '${ecomm!.products[eCommProviderTrue.select].images[0]}'))),
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,top: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                        child: Icon(CupertinoIcons.back,color: Colors.white,)),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, top: 20),
                                    child: Text(
                                      '${ecomm.products[eCommProviderTrue.select].title}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 23),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12.0, top: 20),
                                    child: Text(
                                      '${ecomm.products[eCommProviderTrue.select].category}',
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  '${ecomm.products[eCommProviderTrue.select].description}',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 15),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Warranty Information : ${ecomm.products[eCommProviderTrue.select].warrantyInformation}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                    'Shipping Information : ${ecomm.products[eCommProviderTrue.select].shippingInformation}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Reviews  (${ecomm.products[eCommProviderTrue.select].reviews.length})',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ...List.generate(
                                ecomm.products[eCommProviderTrue.select].reviews
                                    .length,
                                (index) => ListTile(
                                  leading: Text('${index + 1}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                  title: Text(
                                    '${ecomm.products[eCommProviderTrue.select].reviews[index].reviewerName}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  subtitle: Text(
                                    '${ecomm.products[eCommProviderTrue.select].reviews[index].comment}',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 15),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20,
                                      ),
                                      Text(
                                        ' ${ecomm.products[eCommProviderTrue.select].reviews[index].rating}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 13.0, left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            eCommProviderFalse.addtoCart(ecomm.products[eCommProviderTrue.select]);
                            Navigator.of(context).pushNamed('/cart');
                          },
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black26),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      '＄ ${ecomm.products[eCommProviderTrue.select].price}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 23),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 70,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Color(0xff939393),
                                          Color(0xffBDBDBD),
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
