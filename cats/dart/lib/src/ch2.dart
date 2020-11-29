import 'dart:math';

/// Create a memoized version of a given function.
///
/// [f] must map an [A] to a [B].
B Function(A) memoize<A, B>(B Function(A) f) {
  final lookupTable = <A, B>{};
  return (A a) {
    if (!lookupTable.containsKey(a)) {
      lookupTable[a] = f(a);
    }
    return lookupTable[a];
  };
}

/// Create a memoized version of a given function.
///
/// [f] must "ignore its input" and return a constant value from [B]. This is
/// the equivalent of a function from unit to b in Haskell.
B Function() memoizeVoid<B>(B Function() f) {
  final lookupTable = <Null, B>{};
  return () {
    if (!lookupTable.containsKey(null)) {
      lookupTable[null] = f();
    }
    return lookupTable[null];
  };
}

/// Return a random [int], using [seed] as the random number generator's seed.
///
/// The returned [int] will be in the range [0, 100).
int nextIntGivenSeed(int seed) {
  final rand = Random(seed);
  // Fix max int at 100 (exlusive) to avoid having to pass in a second argument
  // to this function.
  return rand.nextInt(100);
}

bool f() {
  print('Hello!');
  return true;
}
