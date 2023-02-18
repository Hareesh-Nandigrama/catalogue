import 'package:catalogue/models/menu.dart';

import '../../models/items.dart';

class CartStore {
  static Map<String, int> cartItems = {};
  static Map<String, Menu> detail = {};

  static void clear(){
    cartItems = {};
    detail = {};
  }

  static List<Item> getOrder(){
    List<Item> answer = [];
    for(var keys in cartItems.keys)
      {
        answer.add(Item(name: keys, qty: cartItems[keys]!));
      }
    print(answer);
    return answer;
  }

  static void addItem(Menu x){
    if(detail.containsKey(x.id))
      {
        print('there');
        cartItems[x.id] = (cartItems[x.id]!+ 1);
      }
    else
      {
        print('notthere');
        cartItems[x.id] = 1;
        detail[x.id] = x;
      }
  }

  static void deleteItem(Menu x){
    if(detail.containsKey(x.id))
    {
      print('there');
      cartItems[x.id] = (cartItems[x.id]!- 1);
      if(cartItems[x.id] == 0)
        {
          cartItems.remove(x.id);
          detail.remove(x.id);
        }
    }
    else
    {
      print('not there');
      return;
    }
  }




}
