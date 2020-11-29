import 'dart:io';
import 'dart:math';

import 'lib/exercises.dart';

void main() {
  //ch1();
  ch2();
}

void ch1() {
  successor(int x) => x + 1;
  print(
    '(id \u26ac successor)(0) == successor(0): '
    '${id(successor(0)) == successor(0)}',
  );
  print(
    '(successor \u26ac id)(0) == successor(0): '
    '${successor(id(0)) == successor(0)}',
  );
  print(
    'successor(successor(0)) = '
    '${compose<int, int, int>(successor, successor)(0)}',
  );
}

void ch2() {
  int slow(int seconds) {
    sleep(Duration(seconds: seconds));
    return seconds;
  }

  final faster = memoize(slow);

  int ans;
  DateTime start;
  DateTime end;
  for (var i = 0; i < 10; i++) {
    // Run faster(i), and see how long it took.
    start = DateTime.now();
    print('\nRunning faster($i)...');
    ans = faster(i);
    end = DateTime.now();
    print('Answer: $ans');
    print('Took ${(end - start).inMilliseconds}ms to run');

    // Run faster(i) again, and see that it took less time.
    start = DateTime.now();
    print('Running faster($i) again...');
    ans = faster(i);
    end = DateTime.now();
    print('Answer: $ans');
    print('Took ${(end - start).inMilliseconds}ms to run\n');
  }

  final random = Random();
  final memoizedRandom = memoize(random.nextInt);
  print('');
  print('random.nextInt(100) = ${random.nextInt(100)}');
  print('random.nextInt(100) = ${random.nextInt(100)}');
  print('memoizedRandom(100) = ${memoizedRandom(100)}');
  print('memoizedRandom(100) = ${memoizedRandom(100)}');
  print('');

  const seed = 0xDEADBEEF;
  print('');
  print('nextIntGivenSeed(0xDEADBEEF) = ${nextIntGivenSeed(seed)}');
  print('nextIntGivenSeed(0xDEADBEEF) = ${nextIntGivenSeed(seed)}');
  print('');

  final memoizedF = memoizeVoid(f);
  print('');
  print('f() = ${f()}');
  print('f() = ${f()}');
  print('memoizedF() = ${memoizedF()}');
  print('memoizedF() = ${memoizedF()}');
  print('');
}

extension on DateTime {
  Duration operator -(DateTime other) => this.difference(other);
}
