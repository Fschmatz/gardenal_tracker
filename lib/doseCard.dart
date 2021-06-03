import 'package:flutter/material.dart';

class DoseCard extends StatefulWidget {
  @override
  _DoseCardState createState() => _DoseCardState();

  int id;
  String diaDose;
  Function(int) delete;

  DoseCard({Key? key, required this.diaDose, required this.id, required this.delete}) : super(key: key);
}

class _DoseCardState extends State<DoseCard> {

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Color(0xFF3F8CCB),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onLongPress: () => widget.delete(
            (widget.id),
          ),
          child: Center(child: Text(widget.diaDose,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 16)
            )),
        ));
  }
}
