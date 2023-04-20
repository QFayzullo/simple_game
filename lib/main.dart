import 'package:flutter/material.dart';
import 'package:tic_tac_taos/board_tile.dart';
import 'package:tic_tac_taos/tile_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _boardState=List.filled(9, TileState.EMPTY);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.green[100],
          child: Center(child:
          Stack(
            children: [Image.asset("images/rumka.png",width: double.infinity,
              fit: BoxFit.fill,
              color: Colors.blue),
              _boardTiles(),
            ]),
          ),
        ),
        ),
      );
  }
  Widget _boardTiles(){
    return Builder(builder: (context){
      final boardDimention=MediaQuery.of(context).size.width;
      final tileDimention=boardDimention/3;
      return Container(
        width: boardDimention,
        height: boardDimention,
        child: Column(
          children:
            chunk(_boardState, 3).asMap().entries.map((entry){
              final chunkIndex=entry.key;
              final tileStateChunk=entry.value;
              return Row(
                children: tileStateChunk.asMap().entries.map((innerEntry){
                  final innerIndex=innerEntry.key;
                  final tileState=innerEntry.value;
                  final tileIndex=(chunkIndex*3)+innerIndex;
                  return BoardTile(
                    tileState: tileState,
                    dimention: tileDimention,
                    onPressed: () => _updateTileStateForIndex(tileIndex),
                  );
                }).toList(),
              );
            }).toList()));
    });
  }
  void _updateTileStateForIndex(int selectedIndex){
    if(_boardState[selectedIndex]==TileState.EMPTY){
      setState(() {
        _boardState[selectedIndex]=TileState.CIRCLE;
      });
    }
  }
}
