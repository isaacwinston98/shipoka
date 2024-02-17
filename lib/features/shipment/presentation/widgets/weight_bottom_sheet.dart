import 'package:flutter/material.dart';
import 'package:shipoka/features/shipment/data/package.dart';


class WeightBottomSheet extends StatelessWidget {
  final Weight selectedWeight;
  final Function(Weight weight) onTap;

  const WeightBottomSheet(
      {super.key, required this.onTap, required this.selectedWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Package Weight",
              style: TextStyle(fontSize: 16, color: Color(0xff101828)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Select Weight",
            style: TextStyle(fontSize: 12, color: Color(0xff101828)),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Weight.values.map((e) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    onTap(e);
                    Navigator.pop(context);
                  },
                  child: Material(
                    color: e == selectedWeight
                        ? const Color(0xffF26520)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            e.toText().split(' ')[0],
                            style: TextStyle(
                              fontSize: 12,
                              color: e == selectedWeight
                                  ? Colors.white
                                  : const Color(0xff344054),
                            ),
                          ),
                          Text(
                            e.toText().split(' ')[1],
                            style: TextStyle(
                              fontSize: 20,
                              color: e == selectedWeight
                                  ? Colors.white
                                  : const Color(0xff344054),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
