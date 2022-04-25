
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  Socket? _socket;
  int count = 0;


  void _initSocket() async {
    try {
      _socket = io(
        'ws://localhost:3000/counttest',
        OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build()
      );

      _socket!.on('connected', (data) {
        print(data);
      });

      _socket!.on('count', (data) {
        print(data);
        setState(() { count = data; });
      });

      _socket!.onConnect((data) {
        print('Connected');
      });

      _socket!.onDisconnect((data) {
        print('Disconnected');
      });

      _socket!.onError((data) {
        print(data);
      });

      _socket!.connect();
    }
    catch (e) {
      print(e);
    }
  }


  bool _isPrime(int num){
    int m = num ~/ 2;
    for (int i = 2; i <= m; i++) {
      if (num % i == 0)
        return false;
    }
    return true;
  }


  @override
  void initState() {
    super.initState();
    _initSocket();
  }


  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;

    if (count % 2 == 0)
      color = Colors.green;
    else if (count % 3 == 0)
      color = Colors.yellow;
    else if (_isPrime(count))
      color = Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: color,
        child: Center(
          child: Text(
            count.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
