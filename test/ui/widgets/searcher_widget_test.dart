import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:libreria_antioquia/ui/widgets/searcher_widget.dart';

String _searchValue = "";
String _deleteValue = "";

class FakePage extends StatelessWidget {
  const FakePage({super.key});

  @override
  Widget build(BuildContext fakeContext) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: ListView(
        children: [
          SearcherWidget(
            onSearch: (value) => _searchValue = value,
            historyData: const ['flutter', 'dart'],
            onDeleteHistory: (value) => _deleteValue = value,
          )
        ],
      ),
    );
  }
}

void main() {
  group("SearcherWidget test", () {
    testWidgets(
      "SearcherWidget test",
      (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(
          home: FakePage(),
        ));
        final textfield = find.byKey(const Key('searcher_text_field'));
        final historyButton = find.byKey(const Key('searcher_history_button'));
        final searcherButton = find.byKey(const Key('searcher_search_button'));

        expect(textfield, findsOneWidget);
        expect(historyButton, findsOneWidget);
        expect(searcherButton, findsOneWidget);

        await tester.tap(textfield);
        await tester.pumpAndSettle();
        await tester.enterText(textfield, 'firebase');
        await tester.pumpAndSettle();
        await tester.tap(searcherButton);
        await tester.pumpAndSettle();
        expect(_searchValue, 'firebase');
        await tester.tap(historyButton);
        await tester.pumpAndSettle();
        final deleteButton = find.byKey(const Key('searcher_delete_btn 0'));
        expect(deleteButton, findsOneWidget);
        await tester.tap(deleteButton);
        await tester.pumpAndSettle();
        expect(_deleteValue, 'flutter');
      },
    );
  });
}
