import 'package:flutter/material.dart';

const _radius20 = BorderRadius.all(Radius.circular(20));

class AppSmartButtonBarItem {
  const AppSmartButtonBarItem(this.label, {this.onSubmit, this.onSelect});

  final String label;
  final VoidCallback? onSubmit;
  final VoidCallback? onSelect;
}

class AppSmartButtonBar extends StatelessWidget {
  AppSmartButtonBar({super.key, required this.items, this.onSelect, this.onSubmit});

  final _value = ValueNotifier(0);
  final List<AppSmartButtonBarItem> items;
  final ValueChanged<int>? onSubmit;
  final ValueChanged<int>? onSelect;

  ColorScheme _scheme(BuildContext context) => Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 40,
      child: DecoratedBox(
          decoration: BoxDecoration(borderRadius: _radius20, color: _scheme(context).secondary),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                  items.length,
                  (index) => ValueListenableBuilder(
                      valueListenable: _value,
                      builder: (BuildContext context, int value, Widget? child) => Expanded(
                          child: AnimatedCrossFade(
                              crossFadeState: value == index ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                              duration: const Duration(milliseconds: 300),
                              firstChild: _SmartButton.on(
                                  label: items[index].label,
                                  onTap: () {
                                    onSubmit?.call(index);
                                    items[index].onSubmit?.call();
                                  }),
                              secondChild: _SmartButton.off(
                                  label: items[index].label,
                                  onTap: () {
                                    _value.value = index;
                                    onSelect?.call(index);
                                    items[index].onSelect?.call();
                                  }))))))));
}

enum _Mode { on, off }

class _SmartButton extends StatelessWidget {
  const _SmartButton({required this.onTap, required this.label, required this.mode});

  factory _SmartButton.on({required VoidCallback onTap, required String label}) =>
      _SmartButton(onTap: onTap, label: label, mode: _Mode.on);

  factory _SmartButton.off({required VoidCallback onTap, required String label}) =>
      _SmartButton(onTap: onTap, label: label, mode: _Mode.off);

  final VoidCallback onTap;
  final String label;
  final _Mode mode;

  ColorScheme _scheme(BuildContext context) => Theme.of(context).colorScheme;

  T _byMode<T>({required T on, required T off}) => mode == _Mode.on ? on : off;

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onTap,
      child: SizedBox(
          width: double.infinity,
          height: 40,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: _radius20,
                  color: _byMode(on: _scheme(context).primary, off: _scheme(context).secondary)),
              child: Center(
                  child: Text(label,
                      style: TextStyle(color: _byMode(on: Colors.white, off: _scheme(context).onPrimary)))))));
}
