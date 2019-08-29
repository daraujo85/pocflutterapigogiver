import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste/models/categoria.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
     final Categoria categoria = Categoria();
                
  @override
  Widget build(BuildContext context) {
    final title = 'Cached Images';

    
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: FutureBuilder(
            
            future: categoria.obterTodas(http.Client()),
            //future: categoria.obterPorId(http.Client(), 1),
            builder: (BuildContext context, AsyncSnapshot snapshot)
            {                            
              if(snapshot.data == null){
                 return Container(
                   child: Center(
                     child: Text("Carregando..."),
                   ),
                 );
              }
              return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Card(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                   
                new Container(
            
            child: new Image.network(
                                snapshot.data[index].background, 
                                //width: 250.0,
                                fit: BoxFit.scaleDown                               
                                ),                                                     
            padding: EdgeInsets.all(10.0)
         ),
         new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: new Container(
                        width: 500,
                        child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  <Widget>[
                          new Text(
                      snapshot.data[index].descricao,
                        style: new TextStyle(fontSize:20.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto")
                      ),
                      new Padding(
                        padding: EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                        child: new Text(
                        "Uma descrição qualquer sobre a categoria",
                        style: new TextStyle(fontSize:18.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto")
                      )
                      )
                       
                      ],
                      
                  ),
                  padding: EdgeInsets.all(8.0)
                  )
                )
            ]
          )
          ),
                
 
        ]

      );
         
                },
              );
            },
          ),
        ),
      ),
    );
  }
 }
/*
void main() => runApp(MyApp());

CachedNetworkImage(
            placeholder: (context, url) => LinearProgressIndicator(),
            imageUrl:
                'https://picsum.photos/250?image=9',
          )

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gogiver Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Consumindo API Rest Dotnet Core'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      final Categoria categoria = Categoria();
      categoria.obterTodas(http.Client());
 
   });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Acrescentar',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/