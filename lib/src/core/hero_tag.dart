// There's a single tag for all instances of navigation bars because they can
// all transition between each other (per Navigator) via Hero transitions.
import 'package:flutter/widgets.dart';

const HeroTag kDefaultHeroTag = HeroTag(null);

@immutable
class HeroTag {
  const HeroTag(this.navigator);

  final NavigatorState? navigator;

  @override
  String toString() =>
      'Default Hero tag for Locus navigation bars with navigator $navigator';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other.runtimeType != runtimeType) return false;

    return other is HeroTag && other.navigator == navigator;
  }

  @override
  int get hashCode => identityHashCode(navigator);
}
