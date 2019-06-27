import 'dart:math';
import 'package:flutter/material.dart';

class Rico extends StatefulWidget {
  @override
  _RicoState createState() => _RicoState();
}

//classe interna do tipo State, que recebe a Class rico
class _RicoState extends State<Rico> {

 double _contador = 10;

 void _showDialog()

 {
   showDialog(
       context: context,
      builder: (BuildContext context)
   {
     return AlertDialog(
       title: Text("Game Over"),
       content: Text("Você Perdeu Tudo - You Loose!!"),
       actions: <Widget>[
         new FlatButton(onPressed: () {
           Navigator.of(context).pop();
         },
             child: Text("Iniciar Novamente?")
         ),

       ],
     );
   },
   );
 }//ShowDialog











 void _maisgrana () {
   setState(() {
     Random sorteio = new Random();

     int min = 1;
     int max = 4;

     int r = min + sorteio.nextInt(max - min);


     if (r == 1) {
       //se o sorteio for = 1 o usuario tem direito de duplicar seu numero

       _contador = _contador * 2;
       print(r);
     }

     else if (r == 2) {
       //se o sorteio for = 2 o usuario tem direito de ficar apenas com metade
       //do seu dinheiro

       _contador = _contador / 2;
       print(r);
     }

     else if (r == 3) {
       // se o sorteio for =3 perde tudo

       _contador = _contador - 10;
       print(r);


     }

   if (_contador <= 0)

     {
       _showDialog();
       _contador = 10;
     }




   });
 }












  @override
  Widget build(BuildContext context) {
    //Cria a tela (uí)
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("\$\$ Rico App \$\$")),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: Column(
            children: <Widget>[
              //Título do App
              Expanded(
                child: Center(
                  child: Text(
                    "Venha ficar rico!!!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),

              //valor em dinheiro
              Expanded(
                child: Center(
                  child: Text(
                    "R\$ $_contador",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: _contador >= 150 ? Colors.red : Colors.green,
                    ),
                  ),
                ),
              ),

              //Botão de ação
              Expanded(
                child: Center(
                  child: FlatButton(
                    onPressed: _maisgrana,
                    color: Colors.purple,
                    textColor: Colors.white,


                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Mais grana!!!!",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
