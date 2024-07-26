import 'package:api_flutter/Recipes%20App/Api_Helper/api_helper.dart';
import 'package:api_flutter/Recipes%20App/modal/recipes_modal.dart';
import 'package:flutter/material.dart';

class RecipesProvider extends ChangeNotifier
{
  RecipesModal? recipesModal;
  ApiHelper apiHelper =ApiHelper();
  int selectIndex = 0;
  int pageValue = 0;

  Future<RecipesModal?> fromMap()
  async {
    final data = await apiHelper.fetchApiData();
    recipesModal = RecipesModal.fromJson(data);
    return recipesModal;
  }
  void selectedIndex(int index)
  {
    selectIndex = index;
    notifyListeners();
  }

  void Page(int value)
  {
    pageValue = value;
    notifyListeners();
  }
}