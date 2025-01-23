import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {

  final String hint;
  final Icon miIcono;
  final FormFieldValidator<String> _validator;

  Customtextfield(this.hint, this.miIcono, this._validator);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        validator: _validator,
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 20,color: Colors.white24),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide(
                color: Colors.orangeAccent.shade200,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide(
                color: Colors.green.shade100,
                width: 1,
              ),
            ),
          prefixIcon: Padding(
              padding: EdgeInsets.only(right: 20,left: 20),
            child: this.miIcono,
          ),
        ),
      ),
    );
  }
}
