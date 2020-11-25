import 'package:flutter/material.dart';

/* change below to StatefulWidget if want to use class below
* isCheck must NOT be final if it is StatefulWidget*/
class TaskTile extends StatelessWidget {
  final bool isCheck;
  final String taskTitle;
  Function toggleBoxState;
  final Function longPressCallback;
  TaskTile(
      {this.isCheck,
      this.taskTitle,
      this.toggleBoxState,
      this.longPressCallback});

  /*use for statefulwidget style*/
  // void checkBoxCallback(bool boxState) {
  //   setState(() {
  //     isCheck = boxState;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        '$taskTitle',
        style: TextStyle(
          fontSize: 20.0,
          decoration: isCheck ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent.shade100,
        value: isCheck,
        onChanged: toggleBoxState,
      ),
    );
  }
}

/*below is a way to learn callback by making TaskTile above
 to stateful and use properties from below*/
class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({this.checkBoxState, this.toggleBoxState});
  bool checkBoxState;
  Function toggleBoxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent.shade100,
      value: checkBoxState,
      onChanged: toggleBoxState,
    );
  }
}
