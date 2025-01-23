import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textoBoton;
  Color miColor;
  final GestureTapCallback _onPressed;
  CustomButton(this.miColor,this.textoBoton,this._onPressed);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: new MaterialButton(onPressed: (){
        _onPressed();
      },
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5),
          side: BorderSide(color: this.miColor,width: 3),
        ),
        child: Text(this.textoBoton),
      ),
    );
  }
}
