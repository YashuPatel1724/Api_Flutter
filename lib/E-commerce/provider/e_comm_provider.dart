

import 'package:api_flutter/E-commerce/Api%20Helper/helper_api.dart';
import 'package:api_flutter/E-commerce/modal/e_comm_modal.dart';
import 'package:api_flutter/utils/global.dart';
import 'package:flutter/cupertino.dart';

class ECommProvider extends ChangeNotifier {
  ECommModal? eCommModal;
  HelperApi helperApi = HelperApi();
  List<ProductModal> cartList = [];
  List<int> qty = [];
  int select = 0;
  // List cartList = [];
  double Price = 0;
  int quantity = 1;

  Future<ECommModal?> fromMap() async {
    final data = await helperApi.fetchData();
    eCommModal = ECommModal.fromJson(data);
    return eCommModal;
  }

  void addtoCart(ProductModal iteam)
  {
    cartList.add(iteam);
    qty.add(1);
    TotalPrice();
    notifyListeners();
  }
  void selectedIndex(int index) {
    select = index;
    notifyListeners();
  }

  void countIndex(int index) {
    qty[index]++;
    TotalPrice();
    notifyListeners();
  }

  void countLess(int index) {
    if (qty[index] > 1) {
      qty[index]--;
      TotalPrice();
      notifyListeners();
    }
  }

  void TotalPrice()
  {
    Price = 0;
    for(int i=0; i<cartList.length; i++)
    {
      Price += cartList[i].price * qty[i];
    }
    notifyListeners();
  }

  void Remove(int index)
  {
    cartList.removeAt(index);
    qty.removeAt(index);
    TotalPrice();
    notifyListeners();
  }
}
