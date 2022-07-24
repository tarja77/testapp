import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'table_cell.dart';
import 'constants.dart';

class TableBody extends StatefulWidget {
  const TableBody({Key? key}) : super(key: key);



  @override
  _TableBodyState createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  LinkedScrollControllerGroup? _controllers;
  LinkedScrollControllerGroup? _controllers2;
  ScrollController? _firstColumnController;
  ScrollController? _restColumnsController;

  @override
  void initState() {
    super.initState();

    _controllers = LinkedScrollControllerGroup();
    _controllers2 = LinkedScrollControllerGroup();
    _firstColumnController = _controllers!.addAndGet();
    _restColumnsController = _controllers2!.addAndGet();
  }

  @override
  void dispose() {
    _firstColumnController?.dispose();
    _restColumnsController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 300,
        scrollDirection: Axis.horizontal,
        controller: _restColumnsController,
        itemBuilder: (context,x){
          return SizedBox(
            width: (maxNumber - 1) * cellWidth,
            child: ListView.builder(itemCount: 300,
                controller: _firstColumnController,
                itemBuilder: (context,y){
                  return MultiplicationTableCell(
                    x: x,
                    y: y,
                  );
                }),
          );
    });
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
    controller: _restColumnsController,
    scrollDirection: Axis.horizontal,
    physics: const BouncingScrollPhysics(),
    child: SizedBox(
      width: (maxNumber - 1) * cellWidth,
      child: ListView.builder(itemCount: 300,
          itemBuilder: (context,index){
            return Row(
              children: List.generate(maxNumber - 1, (x) {
                return MultiplicationTableCell(
                  x: x,
                  y: 0,
                );
              }),
            );
          }),
    ),
  );
  }
}
