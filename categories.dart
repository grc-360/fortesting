/*
 * This file is part of wger Workout Manager <https://github.com/wger-project>.
 * Copyright (C) 2020, 2021 wger Team
 *
 * wger Workout Manager is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * wger Workout Manager is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wger/providers/measurement.dart';
import 'package:wger/screens/form_screen.dart';
import 'package:wger/screens/measurement_entries_screen.dart';
import 'package:wger/widgets/core/charts.dart';

import 'forms.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<MeasurementProvider>(context, listen: false);

    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: _provider.categories.length,
      itemBuilder: (context, index) {
        final currentCategory = _provider.categories[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    currentCategory.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  height: 220,
                  child: MeasurementChartWidget(
                    currentCategory.entries
                        .map((e) => MeasurementChartEntry(e.value, e.date))
                        .toList(),
                    unit: currentCategory.unit,
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                          child: Text(AppLocalizations.of(context).goToDetailPage),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              MeasurementEntriesScreen.routeName,
                              arguments: currentCategory.id,
                            );
                          }),
                    ),
                    IconButton(
                      onPressed: () async {
                        await Navigator.pushNamed(
                          context,
                          FormScreen.routeName,
                          arguments: FormScreenArguments(
                            AppLocalizations.of(context).newEntry,
                            MeasurementEntryForm(currentCategory.id!),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
