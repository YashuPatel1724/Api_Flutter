
import 'package:api_flutter/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/e_comm_modal.dart';
import '../../provider/e_comm_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    ECommProvider eCommProviderTrue =
    Provider.of<ECommProvider>(context, listen: true);
    ECommProvider eCommProviderFalse =
    Provider.of<ECommProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xff292929),
      appBar: AppBar(
        backgroundColor: Color(0xff292929),
        centerTitle: true,
        title: Text(
          'Cart Screen',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<ECommProvider>(context, listen: false).fromMap(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ECommModal? ecomm = snapshot.data;
            return Column(
              children: [
                ...List.generate(
                  eCommProviderTrue.cartList.length,
                      (index) =>
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 137,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 135,
                                  width: 135,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xff939393),
                                        Color(0xffBDBDBD),
                                      ]),
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${eCommProviderTrue.cartList[index].images[0]}'))),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${eCommProviderTrue.cartList[index].title}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '＄ ${eCommProviderTrue.cartList[index].price}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(top: 15.0, left: 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            eCommProviderFalse.countLess(index);
                                            // for(int i=0; i<eCommProviderTrue.cartList.length; i++)
                                            // {
                                            //   total -= eCommProviderTrue.cartList[i].price * eCommProviderTrue.qty[i];
                                            // }
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 27,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            height: 25,
                                            width: 25,
                                            alignment: Alignment.center,
                                            color: Colors.white,
                                            child: Text(
                                              '${eCommProviderTrue.qty[index]}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            eCommProviderFalse.countIndex(index);
                                            // for(int i=0; i<cartList.length; i++)
                                            // {
                                            //   total = cartList[i].price * qty[i];
                                            // }
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 27,
                                          ),
                                        ),
                                        SizedBox(width: 50),
                                        InkWell(
                                          onTap: () {
                                            eCommProviderFalse.Remove(index);
                                            // cartList.removeAt(index);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                ),
                Spacer(),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black12
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text('Total amount', style: TextStyle(
                            color: Colors.white, fontSize: 25),),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text('${eCommProviderTrue.Price}', style: TextStyle(
                            color: Colors.white, fontSize: 25)),
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

double total = 0;
