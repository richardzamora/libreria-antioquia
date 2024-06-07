import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:libreria_antioquia/config/main_config.dart';
import 'package:libreria_antioquia/domain/model/book_model.dart';
import 'package:libreria_antioquia/ui/helpers/routes/book_detail_routes.dart';
import 'package:mocktail/mocktail.dart';

import '../../base_test.dart';
import '../../mocks/cache_storage_mock.dart';

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
          ElevatedButton(
              key: const Key('routesButton'),
              onPressed: () => BookDetailRoutes.getBookDetailPage(fakeContext),
              child: const Text('go to book detail page'))
        ],
      ),
    );
  }
}

void main() {
  late Widget fakeApp = const Scaffold();
  Future<void> loadAppHomeScreen(WidgetTester tester) async {
    await tester.pumpWidget(fakeApp);
  }

  group('book detail routes Test', () {
    testWidgets('BookDetailRoutes class test', (WidgetTester tester) async {
      await tester.runAsync(() async {
        MainConfig.cacheStorage = CacheStorageMock();
        when(() => MainConfig.cacheStorage.init()).thenAnswer((_) async {});
        when(() => MainConfig.cacheStorage.getListString(any()))
            .thenAnswer((_) async => []);
        when(() => MainConfig.cacheStorage.setListString(any(), any()))
            .thenAnswer((_) async {});

        fakeApp = await BaseTest.appTest(FakePage(key: UniqueKey()),
            args: BookModel(title: 'Test', isbn: '1234567891234'));
        await loadAppHomeScreen(tester);
        await tester.pumpAndSettle(const Duration(milliseconds: 20));
      });

      final findedBtn =
          find.byKey(const Key('routesButton'), skipOffstage: false).first;
      expect(findedBtn, findsOneWidget);
      await tester.tap(findedBtn);
      await tester.pumpAndSettle(const Duration(milliseconds: 20));
    });
  });
}
