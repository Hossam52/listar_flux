import 'package:flutter/material.dart';
class DeletedAppBar extends AppBar {
  DeletedAppBar(
      {@required removeIndexFromOriginalList,
      @required itemsToBeDeleted,
      @required clearSelectedItems})
      : super(actions: [
          IconButton(icon: Icon(Icons.share, size: 40), onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.delete_forever,
                size: 40,
              ),
              onPressed: () {
                int temp = 0;
                itemsToBeDeleted.sort();
                List<int> t = List<int>();
                for (int i = itemsToBeDeleted.length - 1; i >= 0; i--) {
                  t.add(itemsToBeDeleted[i]);
                  print(itemsToBeDeleted[i].toString() + "\n");
                }
                for (int i = 0; i < itemsToBeDeleted.length; i++) {
                  // print(widget.module.chat);
                  removeIndexFromOriginalList(itemsToBeDeleted[i] - temp);
                  temp++;
                }
                clearSelectedItems();
              }),
          InkWell(
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onTap: () {
                clearSelectedItems();
              })
        ]);
}
