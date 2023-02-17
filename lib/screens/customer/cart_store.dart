class CartStore {
  List<Map<String, dynamic>> cartItems = [];

  clear(){
    cartItems = [];
  }

  void addItem(String id){
    for(var item in cartItems)
      {
        if(item['item'] == id)
          {
            item['qty']++;
            return;
          }
      }
    cartItems.add({
      'item': id,
      'qty': 1
    });
  }

  void deleteItem(String id)
  {
    for(var item in cartItems)
    {
      if(item['item'] == id)
      {
        item['qty']--;
        return;
      }
    }
    cartItems.add({
      'item': id,
      'qty': 1
    });

  }
}
