import 'package:flutter/material.dart';
import 'package:listar_flux/widget/margin.dart';

class MultiImage extends StatelessWidget {
  final List<String> imagePaths;
  const MultiImage({Key key, @required this.imagePaths, this.size})
      : super(key: key);

  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(800),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(800)),
        child: GridView.builder(
          primary: false,
          padding: EdgeInsets.all(0),
          itemCount: imagePaths.length > 3 ? 4 : imagePaths.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: imagePaths.length == 1 ? 1 : 2,
          ),
          itemBuilder: (context, index) {
            return index == 3
                ? Container(
                    color: Colors.grey[800],
                    child: Center(
                      child: Text("+${imagePaths.length - 3}",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ))
                : Container(
                    color: Colors.red[index * 100],
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
