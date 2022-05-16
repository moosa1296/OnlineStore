import 'package:flutter/cupertino.dart';
import 'package:myshop/model/products.dart';

class ProductsProvider with ChangeNotifier {
  List<Products> _items = [
    Products(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Products(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice quality trousers.',
        price: 59.99,
        imageUrl:
            'https://www.fashionbeans.com/wp-content/uploads/2018/08/modern-trouser-19-8.jpg'),
    Products(
        id: 'p3',
        title: 'Shoes',
        description: 'Shoes New Variety.',
        price: 89.99,
        imageUrl:
            'https://ids.si.edu/ids/deliveryService?max_w=550&id=NMAAHC-2018_58ab_006'),
    Products(
        id: 'p4',
        title: 'Ladies Shoes',
        description: 'Ladies Best quality Sandals.',
        price: 110,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Skor_fr%C3%A5n_1700-_till_1960-talet_-_Nordiska_Museet_-_NMA.0056302.jpg/640px-Skor_fr%C3%A5n_1700-_till_1960-talet_-_Nordiska_Museet_-_NMA.0056302.jpg'),
    Products(
        id: 'p5',
        title: 'Leather Jacket',
        description: 'Best Quality Jackets.',
        price: 199.99,
        imageUrl:
            'https://images.unsplash.com/photo-1521223890158-f9f7c3d5d504?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVhdGhlciUyMGphY2tldHxlbnwwfHwwfHw%3D&w=1000&q=80'),
    Products(
        id: 'p6',
        title: 'Denim Jackets',
        description: '.',
        price: 159.99,
        imageUrl:
            'https://img.mensxp.com/media/content/2020/Aug/Easy-To-Follow-Tips-To-Wear-A-Denim-Jacket-Like-A-Big-Shot-Celebrity-500-2_5f2d458334ee7.jpeg?w=500&h=748'),
    Products(
        id: 'p7',
        title: 'Scarf',
        description: '.',
        price: 19.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/81xPT2TBSaL._AC_UY445_.jpg'),
    Products(
        id: 'p8',
        title: 'Ladies HandBag',
        description: '.',
        price: 299.99,
        imageUrl:
            'https://www.affordable.pk/uploads/products/thumbs/large_15154998500_30.JPG'),
    Products(
        id: 'p9',
        title: 'Ladies Jeans Top',
        description: '.',
        price: 59.99,
        imageUrl:
            'https://lh3.googleusercontent.com/HTxCAefq6PFQAbVzAhep9n031WFgM0cOSC6XY8FGNX08Hbh2DS5t5zzcQZWrBZkJTqiJ1I6dssrZkdoaW2cLK4piSY07fuD9Sr3KEp-v=h450'),
  ];

  List<Products> get items {
    return [..._items];
  }

  Products findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void addProduct() {
    notifyListeners();
  }
}
