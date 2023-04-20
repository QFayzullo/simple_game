import 'package:flutter/material.dart';
import 'package:tic_tac_taos/tile_state.dart';
class BoardTile extends StatelessWidget {
  final dimention;
  final VoidCallback onPressed;
  final TileState tileState;
  const BoardTile({Key? key, this.dimention, required this.onPressed, required this.tileState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: dimention,
      height: dimention,
      child: TextButton(
        onPressed: onPressed,
        child: _widgetForTileState(),
      ),
    );
  }
  Widget _widgetForTileState(){
    Widget widget;
    switch (tileState){
      case TileState.EMPTY:{
        widget=Container();
      }
      break;
      case TileState.CROSS:{
        widget=Image.asset("images/xxx.png",width: 200,height: 200);
      }
      break;
      case TileState.CIRCLE:{
        widget=Image.asset("images/oo.png",width: 200,height: 200);
      }
      break;
    }
    return widget;
  }
}

