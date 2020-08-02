// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseModel on _BaseModel, Store {
  Computed<bool> _$isBusyComputed;

  @override
  bool get isBusy => (_$isBusyComputed ??=
          Computed<bool>(() => super.isBusy, name: '_BaseModel.isBusy'))
      .value;

  final _$_isBusyAtom = Atom(name: '_BaseModel._isBusy');

  @override
  bool get _isBusy {
    _$_isBusyAtom.reportRead();
    return super._isBusy;
  }

  @override
  set _isBusy(bool value) {
    _$_isBusyAtom.reportWrite(value, super._isBusy, () {
      super._isBusy = value;
    });
  }

  final _$_BaseModelActionController = ActionController(name: '_BaseModel');

  @override
  void setBusy(bool state) {
    final _$actionInfo =
        _$_BaseModelActionController.startAction(name: '_BaseModel.setBusy');
    try {
      return super.setBusy(state);
    } finally {
      _$_BaseModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isBusy: ${isBusy}
    ''';
  }
}
