import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('KATIL'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  width: MediaQuery.of(context).size.width / 5,
                  margin: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'katagoriler - $index',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent,
                  ),
                  width: MediaQuery.of(context).size.width / 5,
                  margin: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'duyurular - $index',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.transparent,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('DETAY SAYFALARI $index'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Arama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Takvim',
          ),
        ],
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