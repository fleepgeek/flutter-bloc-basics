import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  test('Observable from controller', () {
    var controller = StreamController<String>();

    var streamObservable = Observable(controller.stream);

    controller.sink.add("Hello");

    streamObservable.listen(print);
    controller.close();
  });

  test('PublishSubject', () async {
    final subject = PublishSubject<int>();

    subject.listen((value) => print("Sub 1: $value"));

    subject.add(1);
    subject.add(2);

    subject.listen((value) => print("Sub 2: $value"));

    subject
        .where((value) => value.isEven)
        .listen((value) => print("Sub 3: $value"));

    subject.add(3);
    subject.add(4);

    // Sub 1 Prints: 1, 2, 3, 4
    // Sub 2 Prints: 3, 4
    // Sub 3 Prints: 4

    subject.close();
  });

  test('BehaviorSubject', () async {
    final subject = BehaviorSubject<int>();
    // final subject = BehaviorSubject<int>.seeded(10);

    subject.listen((value) => print("Sub 1: $value"));

    subject.add(1);
    subject.add(2);

    subject.listen((value) => print("Sub 2: $value"));

    subject.add(3);
    subject.add(4);

    // Sub 1 Prints: 1, 2, 3, 4
    // Sub 2 Prints: 2, 3, 4
    // If seeded with a value:
    // Sub 1 Prints: 10, 1, 2, 3, 4
    // Sub 2 Prints: 2, 3, 4

    subject.close();
  });

  test('ReplaySubject', () async {
    final subject = ReplaySubject<int>();

    subject.listen((value) => print("Sub 1: $value"));

    subject.add(1);
    subject.add(2);

    subject.listen((value) => print("Sub 2: $value"));

    subject.add(3);
    subject.add(4);

    // Sub 1 Prints: 1, 2, 3, 4
    // Sub 2 Prints: 1, 2, 3, 4

    subject.close();
  });
}
