import 'package:diffutil_dart/diffutil.dart' as diffutil;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

typedef EqualityChecker<T> = bool Function(T, T);
typedef AnimatedDiffUtilWidgetBuilder<T> = Widget Function(
    BuildContext, int index, Animation<double>, T item);

class DiffUtilSliverList<T> extends StatefulWidget {
  /// the (immutable) list of items
  final List<T> items;

  /// builder that renders the insertion animation
  final AnimatedDiffUtilWidgetBuilder<T> itemBuilder;

  /// that renders the removal animation
  final AnimatedDiffUtilWidgetBuilder<T> onRemoveItem;
  final Duration insertAnimationDuration;
  final Duration removeAnimationDuration;

  final EqualityChecker<T>? equalityChecker;

  /// @param items a list of items to construct widgets from. Must implement == correctly if no equalityChecker is set.
  /// @param builder builds a widget from a given item
  /// @param insertAnimationBuilder The animation builder for insert animations
  /// @param removeAnimationBuilder The animation builder for insert animations
  /// @param insertAnimationDuration The duration of the insert animation
  /// @param removeAnimationDuration The duration of the remove animation
  /// @param equalityChecker optional custom equality implementation, defaults to ==
  const DiffUtilSliverList({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onRemoveItem,
    this.insertAnimationDuration = const Duration(milliseconds: 300),
    this.removeAnimationDuration = const Duration(milliseconds: 300),
    this.equalityChecker,
  });

  /// Construct a animated list from a list widgets with unique keys.
  ///
  /// @param children A List a Widgets with unique keys
  /// @param insertAnimationBuilder The animation builder for insert animations
  /// @param removeAnimationBuilder The animation builder for insert animations
  /// @param insertAnimationDuration The duration of the insert animation
  /// @param removeAnimationDuration The duration of the remove animation
  static DiffUtilSliverList<Widget> fromKeyedWidgetList({
    required List<Widget> children,
    required AnimatedDiffUtilWidgetBuilder insertAnimationBuilder,
    required AnimatedDiffUtilWidgetBuilder removeAnimationBuilder,
    Duration insertAnimationDuration = const Duration(milliseconds: 300),
    Duration removeAnimationDuration = const Duration(milliseconds: 300),
  }) {
    //
    if (kDebugMode) {
      final keys = <Key?>{};
      for (final child in children) {
        if (!keys.add(child.key)) {
          throw FlutterError(
              'DiffUtilSliverList.fromKeyedWidgetList called with widgets that do not contain unique keys! '
              'This is an error as changed is this list cannot be animated reliably. Use unique keys or the default constructor. '
              'This duplicate key was ${child.key} in widget $child. '
              'Note: Hot reload is often broken when this happens, better use Hot Restart');
        }
      }
    }
    return DiffUtilSliverList<Widget>(
      items: children,
      itemBuilder: insertAnimationBuilder,
      onRemoveItem: removeAnimationBuilder,
      insertAnimationDuration: insertAnimationDuration,
      removeAnimationDuration: removeAnimationDuration,
      equalityChecker: (a, b) => a.key == b.key,
    );
  }

  @override
  State<DiffUtilSliverList<T>> createState() => _DiffUtilSliverListState<T>();
}

class _DiffUtilSliverListState<T> extends State<DiffUtilSliverList<T>> {
  late GlobalKey<SliverAnimatedListState> listKey;

  late List<T?> tempList;

  @override
  void initState() {
    super.initState();
    listKey = GlobalKey<SliverAnimatedListState>();
  }

  @override
  void didUpdateWidget(DiffUtilSliverList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final tempList = oldWidget.items;
    final newList = widget.items;

    final diff = diffutil
        .calculateListDiff<T>(
          tempList,
          newList,
          detectMoves: false,
          equalityChecker: widget.equalityChecker,
        )
        .getUpdates(batch: true);

    this.tempList = List<T?>.of(tempList);
    diff.forEach(_onDiffUpdate);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: listKey,
      initialItemCount: widget.items.length,
      itemBuilder: (context, index, animation) => widget.itemBuilder(
        context,
        index,
        animation,
        widget.items[index],
      ),
    );
  }

  void _onChanged(int position, Object? payload) {
    listKey.currentState!.removeItem(
        position, (context, animation) => const SizedBox.shrink(),
        duration: const Duration());
    _onInserted(position, 1);
  }

  void _onInserted(final int position, final int count) {
    for (var loopCount = 0; loopCount < count; loopCount++) {
      listKey.currentState!.insertItem(position + loopCount,
          duration: widget.insertAnimationDuration);
    }
    tempList.insertAll(position, List<T?>.filled(count, null));
  }

  void _onRemoved(final int /*!*/ position, final int count) {
    for (var loopCount = 0; loopCount < count; loopCount++) {
      final index = position + loopCount;
      final oldItem = tempList[index]!;
      // i purposefully remove the item at the same position on each
      // turn. the internal state is updated, so it removes the right item
      // actually. i only need to calculate the position of oldList
      // which might get ot of sync if count > 1.
      // the tempList is only updated at the end of the method for better performance
      listKey.currentState!.removeItem(
        position,
        (context, animation) => widget.onRemoveItem(
          context,
          index,
          animation,
          oldItem,
        ),
        duration: widget.removeAnimationDuration,
      );
    }
    tempList.removeRange(position, position + count);
  }

  void _onDiffUpdate(diffutil.DiffUpdate update) {
    update.when<void>(
        move: (_, __) =>
            throw UnimplementedError('moves are currently not supported'),
        insert: _onInserted,
        change: _onChanged,
        remove: _onRemoved);
  }
}
