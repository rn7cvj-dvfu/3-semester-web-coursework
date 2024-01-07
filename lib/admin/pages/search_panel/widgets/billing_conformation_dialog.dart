import 'package:flutter/material.dart';
import 'package:web_susch/admin/pages/search_panel/widgets/filters_search.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class BillingConformationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double formFieldWidth = 200;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${t.billingconformation.totalAmount}: 1000'),
        const SizedBox(height: appPaddingMedium),
        FilterItem(
            width: formFieldWidth,
            label: t.billingconformation.paidUsing,
            items: [
              t.billingconformation.creditCard,
              t.billingconformation.cash,
              t.billingconformation.voucher
            ]),
        const SizedBox(height: appPaddingMedium),
      ],
    );
  }
}
