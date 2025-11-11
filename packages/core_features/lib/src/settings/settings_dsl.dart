import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef SettingWidgetBuilder = Widget Function(BuildContext, WidgetRef);

class SettingItem {
  final String title;
  final String? subtitle;
  final SettingWidgetBuilder builder;
  SettingItem({required this.title, this.subtitle, required this.builder});
}

class SettingsPage extends ConsumerWidget {
  final List<SettingItem> items;
  const SettingsPage({super.key, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (c, i) {
        final it = items[i];
        return ListTile(
          title: Text(it.title),
          subtitle: it.subtitle != null ? Text(it.subtitle!) : null,
          trailing: it.builder(context, ref),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
      itemCount: items.length,
    );
  }
}
