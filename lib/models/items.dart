class item {
  String name;
  int qty;
  item({
    required this.name,
    required this.qty,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'qty': qty};
  }

  static item fromJson(Map<String, dynamic> data) {
    item newItem = item(name: data['item'], qty: data['qty']);
   
    return newItem;
  }
}
