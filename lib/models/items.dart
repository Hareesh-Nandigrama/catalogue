class Item {
  String name;
  int qty;
  Item({
    required this.name,
    required this.qty,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'qty': qty};
  }

  static Item fromJson(Map<String, dynamic> data) {
    Item newItem = Item(name: data['item'], qty: data['qty']);
   
    return newItem;
  }
}
