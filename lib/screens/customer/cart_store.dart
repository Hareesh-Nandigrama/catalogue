
import '../../models/items.dart';

class FIlterStore{
  static List<dynamic> filteredList = [];
  static void clear()
  {
   filteredList = [];
  }
}
class CartStore {
  static Map<String, int> cartItems = {};
  static Map<String, dynamic> detail = {};

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

  static void addItem(var x){
    if(detail.containsKey(x['_id']))
      {
        print('there');
        cartItems[x['_id']] = (cartItems[x['_id']]!+ 1);
      }
    else
      {
        print('notthere');
        cartItems[x['_id']] = 1;
        detail[x['_id']] = x;
      }
  }

  static void deleteItem(var x){
    if(detail.containsKey(x['_id']))
    {
      print('there');
      cartItems[x['_id']] = (cartItems[x['_id']]!- 1);
      if(cartItems[x['_id']] == 0)
        {
          cartItems.remove(x['_id']);
          detail.remove(x['_id']);
        }
    }
    else
    {
      print('not there');
      return;
    }
  }

}


