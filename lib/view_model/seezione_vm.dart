import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seezioneprodotto/config/routers/nav_service.dart';
import 'package:seezioneprodotto/domain/models/data_models/seezione_model.dart';
import 'package:seezioneprodotto/utils/constants/k_colors.dart';
import 'package:seezioneprodotto/utils/widget_utils/k_toast.dart';

abstract class BaseSeezioneClass {
  void configProduct({required SeezioneProduct product});
  // void removeProduct({required SeezioneProduct product});
  void clearCart();
}

class SeezioneViewModel extends BaseSeezioneClass with ChangeNotifier {
  final Navigate _nav = Navigate.instance;
  SeezioneViewModel(this.ref);
  final Ref ref;
  // final Read _read;
  // SeezioneViewModel(this._read) : super() {
  //   addProduct();
  // }

  List<SeezioneProduct> _selectedProducts = [];
  List<SeezioneProduct> get selectedProducts => _selectedProducts;

  @override
  void configProduct({required SeezioneProduct product}) {
    if (!_selectedProducts.contains(product)) {
      _selectedProducts.add(product);
    } else {
      _selectedProducts.remove(product);
    }
    notifyListeners();
  }

  // @override
  // void removeProduct({required SeezioneProduct product}) {
  //   _selectedProducts.remove(product);
  //   notifyListeners();
  // }

  bool isProductAdded({required SeezioneProduct product}) {
    if (_selectedProducts.contains(product)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void clearCart() {
    _selectedProducts = [];
    notifyListeners();
  }

  List<Map<String, List<SeezioneProduct>>> _selectedOutfits = [];
  List<Map<String, List<SeezioneProduct>>> get selectedOutfits =>
      _selectedOutfits;

  void configOutfits({required Map<String, dynamic> outfit}) {
    _selectedOutfits = [];
    final temp = outfit.values.elementAt(0);
    temp.addAll(_selectedProducts);
    final Map<String, List<SeezioneProduct>> newOutfit = {
      outfit.keys.elementAt(0): temp
    };
    _selectedOutfits.remove(temp);
    _selectedOutfits.add(newOutfit);
    _selectedProducts = [];
    _nav.pushBack();
    kToast(message: "Outfit has been added to ${outfit.keys.elementAt(0)}");
    notifyListeners();
  }

  void removeProductFromOutfit(
      {required SeezioneProduct product,
      required Map<String, List<SeezioneProduct>> outfit}) {
    final List<SeezioneProduct> temp = outfit.values.elementAt(0);
    temp.remove(product);
    final Map<String, List<SeezioneProduct>> newOutfit = {
      outfit.keys.elementAt(0): temp
    };
    _selectedOutfits.remove(outfit);
    _selectedOutfits.add(newOutfit);
    kToast(message: "Outfit has been removed");
    // _nav.pushBack();
    notifyListeners();
  }

  void configNewOutfit({required String outfit}) {
    if (_selectedOutfits
        .every((element) => element.keys.elementAt(0) != outfit)) {
      _selectedOutfits.add({outfit: _selectedProducts});
      _selectedProducts = [];
      _nav.pushBack();
      kToast(message: "New Outfit has been created");
    } else {
      kToast(
        backgroundColor: KColors.errorColor,
        message: "Outfit already Exists",
      );
    }
    notifyListeners();
  }

  void clearOutfits() {
    _selectedOutfits = [];
    notifyListeners();
  }
}
