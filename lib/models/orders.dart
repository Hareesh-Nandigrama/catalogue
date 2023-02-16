import 'package:catalogue/models/items.dart';

class Order {
  final String customerId;
  final String shopkeeperId;
  final String description;
  final List<Item> items;

  Order({
    required this.customerId,
    required this.description,
    required this.items,
    required this.shopkeeperId,
  });

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'shopkeeperId': shopkeeperId,
      'description': description,
      'items': items.map(
        (e) => {
          {"item": e.name, "qty": e.qty}
        },
      )
    };
  }

  static Order fromJson(Map<String, dynamic> data) {
    Order order = Order(
      customerId: data['customerId'],
      description: data['description'],
      items: [],
      shopkeeperId: data['shopkeeperId'],
    );

    data['items'].forEach((e) => {order.items.add(Item.fromJson(e))});

    return order;
  }
}
