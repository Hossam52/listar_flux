import 'package:flutter/material.dart';
import 'package:listar_flux/widget/margin.dart';

class PersonOnConversation extends StatefulWidget {
  final List<String> images;
  PersonOnConversation({@required this.images});
  @override
  State<StatefulWidget> createState() {
    return _PersonOnConversationState();
  }
}

class _PersonOnConversationState extends State<PersonOnConversation> {
  List<String> images;
  @override
  void initState() {
    super.initState();
    images = widget.images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Persons details")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //images.add("assets/images/noImage.png");
          setState((){images.add("assets/images/noImage.png");});
        },
        tooltip: "Add Person",
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Margin(
              child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        images[index],
                      ),
                    ),
                    title: Text("Ahemd salem"),
                    trailing: IconButton(icon:Icon(Icons.delete),onPressed:(){
                      setState((){images.removeAt(index);});
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
