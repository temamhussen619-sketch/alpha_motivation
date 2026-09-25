import 'package02/flutter/material.dart';

void main() {
  runApp(const AlphaMotivationApp());
}

class AlphaMotivationApp extends StatelessWidget {
  const AlphaMotivationApp({super.key});

  @style
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alpha Motivation',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> _quotes = [
    {
      'text': 'ስኬት የየቀኑ ትናንሽ ጥረቶች ውጤት ነው!',
      'author': 'Alpha Motivation',
    },
    {
      'text': 'የዛሬው ድካም የነገው ስኬት መሰረት ነው፤ በጭራሽ አትተው!',
      'author': 'Alpha Motivation',
    },
    {
      'text': 'ትልቁ ስኬት ውድቀትን ሳይፈሩ ደጋግሞ መሞከር ነው::',
      'author': 'Alpha Motivation',
    },
  ];

  int _currentIndex = 0;

  void _nextQuote() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _quotes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuote = _quotes[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alpha Motivation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeDark,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.format_quote_rounded,
                      size: 60,
                      color: Colors.deepOrangeAccent,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '"${currentQuote['text']}"',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '- ${currentQuote['author']}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton.icon(
                      onPressed: _nextQuote,
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('ሌላ አነቃቂ ጥቅስ'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.grey[900],
              child: const Center(
                child: Text(
                  'AdMob Banner Ad Space',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
