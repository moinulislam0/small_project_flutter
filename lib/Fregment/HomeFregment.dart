import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeFregment extends StatelessWidget{
  MySnackbar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
  AlertDialogButton(context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text("Alert "),
                content: Text("Do you want to delete ??"),
                actions: [
                  TextButton(onPressed: (){
                    MySnackbar("delete Successfully", context);
                    Navigator.of(context).pop();
                  }, child: Text("Yes")),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("No"))
                ],
              ));
        });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HomeFregment"),
            ElevatedButton(onPressed: (){
              AlertDialogButton(context);
            }, child: Text("click"))
          ],
        ),
        
      ),
    );
  }
}