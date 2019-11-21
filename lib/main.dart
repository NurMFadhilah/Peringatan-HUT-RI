import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HUT RI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Peringatan HUT RI'),
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

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Center(
                    child: Text(
                      'Peringatan HUT RI',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Senin 26 Agustus 2019, 05:15 WIB',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.blueGrey[500],
                      )
                    )
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
      child: Text(
        '''
        Jakarta - Kedutaan Besar Republik Indonesia (KBRI) di Wina menggelar pesta rakyat dalam rangka memperingati HUT RI ke-74. Pesta Rakyat diikuti oleh warga Indonesia, warga Wina, dan warga asing lainnya.

        Dubes RI di Wina, Darmansjah Djumala, mengatakan Pesta Rakyat adalah sebagai wujud rasa syukur atas nikmat Tuhan. Selain itu, Darmansjah juga mengajak peserta untuk memanjatkan doa demi kesejahteraan rakyat Indonesia.

        "Kita menyelenggarakan Pesta Rakyat ini untuk masyakat Indonesia dan sebagai rasa syukur atas karunia nikmat yang diberikan Tuhan kepada kita semua. Agar masyarakat menyelipkan doa bagi bangsa dan negara tercinta agar persatuan dan kesatuan terus terjaga, sehingga kita dapat terus membangun dan méningkatkan kemajuan serta kesejahteraan rakyat Indonesia," ujar Darmasjah dalam keterangan tertulis, Minggu (25/8/2019).''',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(widget.title),
        backgroundColorStart: Colors.green,
        backgroundColorEnd: Colors.lightGreen,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            'https://akcdn.detik.net.id/community/media/visual/2019/08/26/261543f2-836a-4eea-a507-4d5441837680_169.jpeg?w=780&q=90',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          textSection,
          buttonSection,
        ]
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

}
