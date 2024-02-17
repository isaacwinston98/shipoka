class Package {
  final String title;
  final String category;
  final Weight weight;
  final String image;
  final bool finalized;

  Package(
      {required this.title,
        required this.category,
        required this.weight,
        required this.image,
        required this.finalized});

  Package copyWith(
      {String? title,
        String? category,
        Weight? weight,
        String? image,
        bool? finalized}) {
    return Package(
        title: title ?? this.title,
        category: category ?? this.category,
        weight: weight ?? this.weight,
        image: image ?? this.image,
        finalized: finalized ?? this.finalized);
  }
}

List<String> category = [
  'Clothing',
  'Documents',
  'Electronics',
  'Perishable Goods'
];

enum Weight { below, exact, above }

extension Weighs on Weight {
  String toText() {
    switch (this) {
      case Weight.below:
        return 'Below 1-5Kg';
      case Weight.exact:
        return 'Weighs 10Kg';
      default:
        return 'Above 10kg';
    }
  }
}
