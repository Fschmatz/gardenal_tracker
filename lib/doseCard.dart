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

    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.green[700],
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onLongPress: () => widget.delete(
              (widget.id),
            ),
            child: Center(child: Text(widget.diaDose,style: TextStyle(color: Colors.white),)),
          )),
    );
  }
}
