import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionFlow extends StatelessWidget {
  final Permission permission;
  final String rationale;
  final Widget childIfGranted;
  const PermissionFlow({
    super.key,
    required this.permission,
    required this.rationale,
    required this.childIfGranted,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: permission.status,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final status = snapshot.data as PermissionStatus? ?? PermissionStatus.denied;
        if (status.isGranted) return childIfGranted;
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(rationale, textAlign: TextAlign.center),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () async {
                    final res = await permission.request();
                    if (res.isPermanentlyDenied && context.mounted) {
                      openAppSettings();
                    }
                  },
                  child: const Text('Erlaubnis anfragen'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
