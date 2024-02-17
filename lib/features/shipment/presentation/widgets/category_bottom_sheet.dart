import 'package:flutter/material.dart';
import 'package:shipoka/features/shipment/data/package.dart';

class CategoryBottomSheet extends StatelessWidget {
  final Function(String category) onTap;

  const CategoryBottomSheet({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Package category",
            style: TextStyle(fontSize: 16, color: Color(0xff101828)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onTap(category[index]);
                  Navigator.pop(context);
                },
                child: SizedBox(
                  child: Row(
                    children: [
                      Text(
                        category[index],
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xff101828)),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: category.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}
