import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((_) => 0);

class SampleScreen extends ConsumerWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Sample Feature')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Counter: $c'),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => ref.read(counterProvider.notifier).state++,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
