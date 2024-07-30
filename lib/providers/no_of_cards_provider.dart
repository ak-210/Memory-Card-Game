import 'package:hooks_riverpod/hooks_riverpod.dart';

final noOfCardsProvider = Provider((ref) => 30);

final discardedNoProvider = StateProvider<int>((ref) => 0);
