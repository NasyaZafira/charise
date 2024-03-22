import 'package:charise/components/neu_container.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  final Map<String, dynamic> data;
  final int qty;
  final Function onIncreasePressed;
  final Function onDecreasePressed;

  const OrderItem({
    super.key,
    required this.data,
    required this.qty,
    required this.onIncreasePressed,
    required this.onDecreasePressed,
  });

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return NeuContainer(
      key: ValueKey(widget.data["id"]),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.data["id"].toString(),
              ),
              const SizedBox(
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data["product"],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text(
                        "Rp ${widget.data["price"]}",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.green.shade300,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 18.0,
                  onPressed: () => widget.onDecreasePressed(),
                  icon: const Icon(
                    Icons.remove_circle_outline_sharp,
                  ),
                ),
                Text(
                  widget.qty.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  iconSize: 18.0,
                  onPressed: () => widget.onIncreasePressed(),
                  icon: const Icon(
                    Icons.add_circle_outline_sharp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
