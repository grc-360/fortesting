// Mocks generated by Mockito 5.0.15 from annotations
// in wger/test/gym_mode_screen_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;
import 'dart:ui' as _i11;

import 'package:mockito/mockito.dart' as _i1;
import 'package:wger/models/exercises/base.dart' as _i10;
import 'package:wger/models/exercises/category.dart' as _i4;
import 'package:wger/models/exercises/equipment.dart' as _i5;
import 'package:wger/models/exercises/exercise.dart' as _i3;
import 'package:wger/models/exercises/language.dart' as _i7;
import 'package:wger/models/exercises/muscle.dart' as _i6;
import 'package:wger/providers/base_provider.dart' as _i2;
import 'package:wger/providers/exercises.dart' as _i8;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeWgerBaseProvider_0 extends _i1.Fake implements _i2.WgerBaseProvider {
}

class _FakeExercise_1 extends _i1.Fake implements _i3.Exercise {}

class _FakeExerciseCategory_2 extends _i1.Fake implements _i4.ExerciseCategory {
}

class _FakeEquipment_3 extends _i1.Fake implements _i5.Equipment {}

class _FakeMuscle_4 extends _i1.Fake implements _i6.Muscle {}

class _FakeLanguage_5 extends _i1.Fake implements _i7.Language {}

/// A class which mocks [ExercisesProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockExercisesProvider extends _i1.Mock implements _i8.ExercisesProvider {
  MockExercisesProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.WgerBaseProvider get baseProvider =>
      (super.noSuchMethod(Invocation.getter(#baseProvider),
          returnValue: _FakeWgerBaseProvider_0()) as _i2.WgerBaseProvider);
  @override
  set exercises(List<_i3.Exercise>? exercises) =>
      super.noSuchMethod(Invocation.setter(#exercises, exercises),
          returnValueForMissingStub: null);
  @override
  set filteredExercises(List<_i3.Exercise>? newfilteredExercises) => super
      .noSuchMethod(Invocation.setter(#filteredExercises, newfilteredExercises),
          returnValueForMissingStub: null);
  @override
  List<_i3.Exercise> get items => (super.noSuchMethod(Invocation.getter(#items),
      returnValue: <_i3.Exercise>[]) as List<_i3.Exercise>);
  @override
  List<_i4.ExerciseCategory> get categories =>
      (super.noSuchMethod(Invocation.getter(#categories),
          returnValue: <_i4.ExerciseCategory>[]) as List<_i4.ExerciseCategory>);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i9.Future<void> setFilters(_i8.Filters? newFilters) =>
      (super.noSuchMethod(Invocation.method(#setFilters, [newFilters]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> findByFilters() =>
      (super.noSuchMethod(Invocation.method(#findByFilters, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  List<_i3.Exercise> findByCategory(_i4.ExerciseCategory? category) =>
      (super.noSuchMethod(Invocation.method(#findByCategory, [category]),
          returnValue: <_i3.Exercise>[]) as List<_i3.Exercise>);
  @override
  _i3.Exercise findExerciseById(int? id) =>
      (super.noSuchMethod(Invocation.method(#findExerciseById, [id]),
          returnValue: _FakeExercise_1()) as _i3.Exercise);
  @override
  _i4.ExerciseCategory findCategoryById(int? id) =>
      (super.noSuchMethod(Invocation.method(#findCategoryById, [id]),
          returnValue: _FakeExerciseCategory_2()) as _i4.ExerciseCategory);
  @override
  _i5.Equipment findEquipmentById(int? id) =>
      (super.noSuchMethod(Invocation.method(#findEquipmentById, [id]),
          returnValue: _FakeEquipment_3()) as _i5.Equipment);
  @override
  _i6.Muscle findMuscleById(int? id) =>
      (super.noSuchMethod(Invocation.method(#findMuscleById, [id]),
          returnValue: _FakeMuscle_4()) as _i6.Muscle);
  @override
  _i7.Language findLanguageById(int? id) =>
      (super.noSuchMethod(Invocation.method(#findLanguageById, [id]),
          returnValue: _FakeLanguage_5()) as _i7.Language);
  @override
  _i9.Future<void> fetchAndSetCategories() =>
      (super.noSuchMethod(Invocation.method(#fetchAndSetCategories, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> fetchAndSetMuscles() =>
      (super.noSuchMethod(Invocation.method(#fetchAndSetMuscles, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> fetchAndSetEquipment() =>
      (super.noSuchMethod(Invocation.method(#fetchAndSetEquipment, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> fetchAndSetLanguages() =>
      (super.noSuchMethod(Invocation.method(#fetchAndSetLanguages, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<_i3.Exercise> fetchAndSetExercise(int? exerciseId) =>
      (super.noSuchMethod(Invocation.method(#fetchAndSetExercise, [exerciseId]),
              returnValue: Future<_i3.Exercise>.value(_FakeExercise_1()))
          as _i9.Future<_i3.Exercise>);
  @override
  List<_i10.ExerciseBase> mapImages(
          dynamic data, List<_i10.ExerciseBase>? bases) =>
      (super.noSuchMethod(Invocation.method(#mapImages, [data, bases]),
          returnValue: <_i10.ExerciseBase>[]) as List<_i10.ExerciseBase>);
  @override
  List<_i10.ExerciseBase> setBaseData(
          dynamic data, List<_i3.Exercise>? exercises) =>
      (super.noSuchMethod(Invocation.method(#setBaseData, [data, exercises]),
          returnValue: <_i10.ExerciseBase>[]) as List<_i10.ExerciseBase>);
  @override
  List<dynamic> mapBases(
          List<_i10.ExerciseBase>? bases, List<_i3.Exercise>? exercises) =>
      (super.noSuchMethod(Invocation.method(#mapBases, [bases, exercises]),
          returnValue: <dynamic>[]) as List<dynamic>);
  @override
  List<_i3.Exercise> mapLanguages(List<_i3.Exercise>? exercises) =>
      (super.noSuchMethod(Invocation.method(#mapLanguages, [exercises]),
          returnValue: <_i3.Exercise>[]) as List<_i3.Exercise>);
  @override
  List<_i3.Exercise> mapAliases(dynamic data, List<_i3.Exercise>? exercises) =>
      (super.noSuchMethod(Invocation.method(#mapAliases, [data, exercises]),
          returnValue: <_i3.Exercise>[]) as List<_i3.Exercise>);
  @override
  List<_i3.Exercise> mapComments(dynamic data, List<_i3.Exercise>? exercises) =>
      (super.noSuchMethod(Invocation.method(#mapComments, [data, exercises]),
          returnValue: <_i3.Exercise>[]) as List<_i3.Exercise>);
  @override
  _i9.Future<void> fetchAndSetExercises() =>
      (super.noSuchMethod(Invocation.method(#fetchAndSetExercises, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<List<_i3.Exercise>> searchExercise(String? name,
          [String? languageCode = r'en']) =>
      (super.noSuchMethod(
              Invocation.method(#searchExercise, [name, languageCode]),
              returnValue: Future<List<_i3.Exercise>>.value(<_i3.Exercise>[]))
          as _i9.Future<List<_i3.Exercise>>);
  @override
  String toString() => super.toString();
  @override
  void addListener(_i11.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i11.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}
