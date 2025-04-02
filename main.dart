import 'package:flutter/material.dart';

void main() {
  runApp(PlumbingQuoteApp());
}

class PlumbingQuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plumbing Quote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuoteForm(),
    );
  }
}

class QuoteForm extends StatefulWidget {
  @override
  _QuoteFormState createState() => _QuoteFormState();
}

class _QuoteFormState extends State<QuoteForm> {
  final TextEditingController _manpowerController = TextEditingController();
  final TextEditingController _scopeController = TextEditingController();
  final TextEditingController _materialsController = TextEditingController();
  final TextEditingController _clausesController = TextEditingController();

  // Predefined phrases to be added to the clauses
  final Map<String, String> _triggerClauses = {
    'pipe replacement': 'This project includes the replacement of old pipes.',
    'water leak': 'A water leak assessment is included.',
  };

  void _completeQuote() {
    final quoteText = '''
Manpower:
${_manpowerController.text}

Scope of Works:
${_scopeController.text}

Materials:
${_materialsController.text}

Additional Clauses:
${_clausesController.text}
    ''';

    // Logic to copy the text and open Gmail (via a custom URL scheme)
    // This will require more integration with the Gmail app, but for now, we will just print the text to the console
    print('Quote Generated: $quoteText');
    // Add a feature to open Gmail here when complete (can use url_launcher package)
  }

  void _onScopeChanged() {
    final scopeText = _scopeController.text.toLowerCase();
    _triggerClauses.forEach((trigger, clause) {
      if (scopeText.contains(trigger)) {
        _clausesController.text += '\n$clause';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plumbing Quote Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _manpowerController,
              decoration: InputDecoration(labelText: 'Manpower Requirements'),
              maxLines: 4,
            ),
            SizedBox(height: 8),
            TextField(
              controller: _scopeController,
              decoration: InputDecoration(labelText: 'Scope of Works'),
              maxLines: 4,
              onChanged: (_) => _onScopeChanged(),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _materialsController,
              decoration: InputDecoration(labelText: 'Materials'),
              maxLines: 4,
            ),
            SizedBox(height: 8),
            TextField(
              controller: _clausesController,
              decoration: InputDecoration(labelText: 'Additional Clauses'),
              maxLines: 4,
              readOnly: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _completeQuote,
              child: Text('Complete Quote'),
            ),
          ],
        ),
      ),
    );
  }
}