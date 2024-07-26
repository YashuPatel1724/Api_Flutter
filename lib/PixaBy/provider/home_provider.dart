import 'package:api_flutter/PixaBy/Api%20Helper/helper.dart';
import 'package:api_flutter/PixaBy/modal/search_modal.dart';
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier
{
  Helper helper = Helper();
   SearchModal? searchModal;
  String search = '';

  void searchImg(String img)
  {
    search = img;
    notifyListeners();
  }


  Future<SearchModal?> fromMap(String img)
  async {
    final data = await helper.fetchApiData(img);
    searchModal = SearchModal.fromJson(data);
    return searchModal;
  }

}