import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/custom_dialog.dart';
import 'package:tictactoe/gamebutton.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> _buttons;
  var player1;
  var player2;
  var activeplayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buttons = doInit();
  }
  List<GameButton> doInit()
  {
    player1 = new List();
    player2 = new List();
    activeplayer = 1;
    var gamebuttons = <GameButton>[
     new GameButton(id:1),
     new GameButton(id:2),
     new GameButton(id:3),
     new GameButton(id:4),
     new GameButton(id:5),
     new GameButton(id:6),
     new GameButton(id:7),
     new GameButton(id:8),
     new GameButton(id:9),

      


    ];
    return gamebuttons;
  }
  void PlayGame(GameButton gb)
  {
    setState(() {
    if(activeplayer==1)
    {
      gb.text = "X";
      gb.bg = Colors.red;
      activeplayer =2;
      player1.add(gb.id);
      
      
    }
    else
    {
      gb.text = "0";
      gb.bg = Colors.black;
      activeplayer =1;
      player2.add(gb.id);
      

    }
    gb.enable = false;
  int winner =  checkWinner();
  if(winner==-1)
  {
    if (_buttons.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => ShowDialog(title: "Game Tied",content: "Press the reset button to start again.",callback: resetGame )); 
                  
        }
        else{
          activeplayer == 2 ? autoPlay() : null;
        }
  }
    
    });

  }
  void autoPlay()
  {
    var empty = new List();
    var list = new List.generate(9, (i)=>i+1);
    for(var cellId in list)
    {
      if(!(player1.contains(cellId) || player2.contains(cellId)))
      {
        empty.add(cellId);
      }
    }
    var r = new Random();
    var randIndex = r.nextInt(empty.length-1);
    var cellID = empty[randIndex];
    int i = _buttons.indexWhere((p)=> p.id == cellID);
    PlayGame(_buttons[i]);

  }
  int checkWinner()
  {
    var winner = -1;
    if(player1.contains(1) && player1.contains(2) && player1.contains(3))
   {
     winner =1;
   }
    if(player2.contains(1) && player2.contains(2) && player2.contains(3))
   {
     winner =2;
   }
    if(player1.contains(4) && player1.contains(5) && player1.contains(6))
   {
     winner =1;
   }
    if(player2.contains(4) && player2.contains(5) && player2.contains(6))
   {
     winner =2;
   }
    if(player1.contains(7) && player1.contains(8) && player1.contains(9))
   {
     winner =1;
   }
    if(player2.contains(7) && player2.contains(8) && player2.contains(9))
   {
     winner =2;
   }
    if(player1.contains(1) && player1.contains(4) && player1.contains(7))
   {
     winner =1;
   }
    if(player2.contains(1) && player2.contains(4) && player2.contains(7))
   {
     winner =2;
   }
    if(player1.contains(2) && player1.contains(5) && player1.contains(8))
   {
     winner =1;
   }
    if(player2.contains(2) && player2.contains(5) && player2.contains(8))
   {
     winner =2;
   }
    if(player1.contains(3) && player1.contains(6) && player1.contains(9))
   {
     winner =1;
   }
    if(player2.contains(3) && player2.contains(6) && player2.contains(9))
   {
     winner =2;
   }
    if(player1.contains(1) && player1.contains(5) && player1.contains(9))
   {
     winner =1;
   }
    if(player2.contains(1) && player2.contains(5) && player2.contains(9))
   {
     winner =2;
   }
    if(player1.contains(3) && player1.contains(5) && player1.contains(7))
   {
     winner =1;
   }
    if(player2.contains(3) && player2.contains(5) && player2.contains(7))
   {
     winner =2;
   }
   if(winner!=-1)
   {
     if(winner==1)
     {
      showDialog(
        context: context,  builder: (_)=> ShowDialog(title: "Player 1 won",content: "Press reset to play again",callback: resetGame,));
     }else
     {
        showDialog(
        context: context,  builder: (_)=> ShowDialog(title: "Player 2 won",content: "Press reset to play again",callback: resetGame,));
     }
   }
      return winner;

  }
  void resetGame()
  {
        if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
        _buttons = doInit();
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        centerTitle: true,
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
                      child: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: _buttons.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 9.0,
              mainAxisSpacing: 9.0
              ),
            itemBuilder: (context,i)=> new SizedBox(
              width: 100,
              height: 100,
              child: RaisedButton(
                onPressed: _buttons[i].enable?()=>  PlayGame(_buttons[i]): null,
                padding: const EdgeInsets.all(8.0),
                child: Text(_buttons[i].text,style: TextStyle(color: Colors.white,fontSize: 16),),
                color: _buttons[i].bg,
                disabledColor: _buttons[i].bg,

              ),
              
            ),
        ),
          ),
          RaisedButton(onPressed: resetGame,
          child: Text("Reset",
          style: TextStyle(color: Colors.white,fontSize: 20),),
          color: Colors.red,
          padding: EdgeInsets.all(20.0),),
          

        ],
               
      ),
    );
  }
}