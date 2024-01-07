import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_susch/admin/pages/search_panel/widgets/billing_conformation_dialog.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class ActionRowBooking extends StatelessWidget {
  const ActionRowBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          onPressed: () {},
          label: Text(t.passengerpanel.backToSearch),
          icon: const Icon(Icons.restart_alt),
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.titleMedium),
          ),
        ),
        TextButton.icon(
          onPressed: () => openBillingConformationDialog(context),
          label: Text(t.passengerpanel.confirmBooking),
          icon: const Icon(Icons.check),
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.titleMedium),
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          label: Text(t.passengerpanel.removePassenger),
          icon: const Icon(Icons.crop_square_sharp),
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.titleMedium),
          ),
        ),
      ],
    );
  }

  void openBillingConformationDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: BillingConformationDialog(),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text(t.billingconformation.issueTickets),
            ),
            ElevatedButton(
              onPressed: context.pop,
              child: Text(t.common.cancel),
            ),
          ],
        ),
      );

//   void openImportChangesDialog(BuildContext context) => showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text(t.managepanel.importChanges),
//       content:ImportChangesDialog(),
//       actions: [
//         ElevatedButton(
//           onPressed: () {},
//           child: Text(t.managepanel.import),
//         ),
//       ],
//     ),
//   );
}
