import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;

  const UserProductItem({this.id, this.title, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(this.imgUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                  arguments: id,
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
              onPressed: () {
                Provider.of<Products>(context).removeProduct(id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
