import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(homePage());
}

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: const Text(
              'KATIL',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
        // SONSUZ LIST VIEW
        body: FractionallySizedBox(
          heightFactor: 0.15,
          child: Container(
            color: Colors.blue,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  color: index % 2 == 0 ? Colors.red : Colors.green,
                  child: Center(
                    child: Text(
                      '$index',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}










































// istedigimiz oranda list view ekleyecek 
// body: FractionallySizedBox(
        //   heightFactor: 0.15,
        //   child: Container(
        //     color: Colors.blue,
        //     child: ListView(
        //       scrollDirection: Axis.horizontal,
        //       children: [
        //         Container(
        //           width: 120,
        //           color: Colors.red,
        //           child: Center(
        //             child: Text(
        //               '1',
        //               style: TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           color: Colors.green,
        //           child: Center(
        //             child: Text(
        //               '2',
        //               style: TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         Container(
        //           width: 100,
        //           color: Colors.yellow,
        //           child: Center(
        //             child: Text(
        //               '3',
        //               style: TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),