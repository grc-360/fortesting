import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wger/providers/add_exercise_provider.dart';
import 'package:wger/providers/exercises.dart';

class DuplicatesAndVariationsStepContent extends StatelessWidget {
  final GlobalKey<FormState> formkey;

  const DuplicatesAndVariationsStepContent({required this.formkey});

  @override
  Widget build(BuildContext context) {
    final addExerciseProvider = context.read<AddExerciseProvider>();
    final exerciseProvider = context.read<ExercisesProvider>();

    return Form(
      key: formkey,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context).whatVariationsExist,
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Exercise bases with variations
                  ...exerciseProvider.exerciseBasesByVariation.keys
                      .map(
                        (key) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisSize: MainAxisSize.max,
                                children: [
                                  ...exerciseProvider.exerciseBasesByVariation[key]!
                                      .map(
                                        (base) => Text(
                                          base
                                              .getExercises(
                                                  Localizations.localeOf(context).languageCode)
                                              .name,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                      .toList(),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Consumer<AddExerciseProvider>(
                              builder: (ctx, provider, __) => Switch(
                                  value: provider.variationId == key,
                                  onChanged: (state) => provider.variationId = key),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  // Exercise bases without variations
                  ...exerciseProvider.bases
                      .where((b) => b.variationId == null)
                      .map(
                        (base) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    base
                                        .getExercises(Localizations.localeOf(context).languageCode)
                                        .name,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Consumer<AddExerciseProvider>(
                              builder: (ctx, provider, __) => Switch(
                                value: provider.newVariationForExercise == base.id,
                                onChanged: (state) => provider.newVariationForExercise = base.id,
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}