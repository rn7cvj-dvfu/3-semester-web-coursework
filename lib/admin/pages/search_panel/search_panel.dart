import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/shared/models/outbound.dart';
import 'package:web_susch/admin/pages/search_panel/widgets/action_row_search.dart';
import 'package:web_susch/admin/pages/search_panel/widgets/filters_search.dart';
import 'package:web_susch/admin/pages/search_panel/widgets/outbound_details_list.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/text_input.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class SearchPanel extends StatelessWidget {
  SearchPanel({super.key});

  final List<Outbound> mockOutbounds = [
    Outbound(
      from: "VLD",
      to: "MSC",
      date: DateTime.now(),
      flightNumber: 1479,
      cabinPrice: 320,
      numberOfStops: 1,
    ),
    Outbound(
      from: "VLD",
      to: "MSC",
      date: DateTime.now(),
      flightNumber: 1479,
      cabinPrice: 320,
      numberOfStops: 1,
    ),
    Outbound(
      from: "VLD",
      to: "MSC",
      date: DateTime.now(),
      flightNumber: 1479,
      cabinPrice: 320,
      numberOfStops: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const double formFieldWidth = 200;
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(
                top: appPaddingLarge,
                right: appPaddingLarge,
                left: appPaddingLarge,
              ),
              child: FilterSearch(
                formFieldWidth: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(appPaddingMedium),
              child: Row(children: [
                Text(t.searchpanel.ofd),
                // CheckBox
              ]),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: appPaddingLarge),
                child: OutboundDetailsList(
                  outbounds: mockOutbounds.asObservable(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(appPaddingMedium),
              child: Row(children: [
                Text(t.searchpanel.ofd),
                // CheckBox
              ]),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: appPaddingLarge),
                child: OutboundDetailsList(
                  outbounds: mockOutbounds.asObservable(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(appPaddingMedium),
              child: ActionRowSearch(),
            ),
          ],
        ),
      ),
    );
  }
}
