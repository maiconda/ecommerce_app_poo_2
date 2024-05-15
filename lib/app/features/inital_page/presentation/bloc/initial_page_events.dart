sealed class InitialPageEvents {}

final class NavigatorIndexTriggered extends InitialPageEvents {
  final int index;

  NavigatorIndexTriggered({
    required this.index,
  });
}
