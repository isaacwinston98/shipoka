import 'package:flutter/material.dart';
import 'package:shipoka/features/shipment/data/package.dart';
import 'package:shipoka/features/shipment/data/package_category.dart';


class ShipmentProvider extends ChangeNotifier {
  bool _showSavedLocation = false;

  int _selectedWeightIndex = -1;

  bool get showSavedLocation => _showSavedLocation;

  String? _selectedCategory;

  int? get selectedWeightIndex => _selectedWeightIndex;

  String? get selectedCategory => _selectedCategory;

  bool get canAddPackage => !_packages.any((element) => element.finalized == false);

  final List<Package> _packages = [
    Package(
        title: '',
        category: '',
        weight: Weight.below,
        image: '',
        finalized: false)
  ];

  List<Package> get pacakages => _packages;

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }



  void updateSelectedWight(int index) {
    _selectedWeightIndex = index;
    notifyListeners();
  }

  void updateShowSavedLocation() {
    _showSavedLocation = !_showSavedLocation;
    notifyListeners();
  }

  void updatePackageTitle({required int index, required String title}) {
    _packages[index] = _packages[index].copyWith(title: title);
    notifyListeners();
  }

  void updatePackageCategory({required int index, required String category}) {
    _packages[index] = _packages[index].copyWith(category: category);
    notifyListeners();
  }

  void updatePackageWeight({required int index, required Weight weight}) {
    _packages[index] = _packages[index].copyWith(weight: weight);
    notifyListeners();
  }

  void updatePackageImage({required int index}) {
    _packages[index] = _packages[index].copyWith(image: 'assets/svgs/ps4.png');
    notifyListeners();
  }

  void addThisPackage(int index) {
    _packages[index] = _packages[index].copyWith(finalized: true);
    notifyListeners();
  }
  void addNewPackage(){
    _packages.add(Package(
        title: '',
        category: '',
        weight: Weight.below,
        image: '',
        finalized: false));
    notifyListeners();
  }

  void deletePackage(int index){
    if(_packages.length > 1){
      _packages.removeAt(index);
    }
    notifyListeners();
  }

  void editPackage(int index){
    _packages[index] = _packages[index].copyWith(finalized: false);
    notifyListeners();
  }
}