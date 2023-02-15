import 'package:flutter_package/src/application/core/base_view_model.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/search/i_search_service.dart';
import 'package:mobx/mobx.dart';

part 'search_view_model.g.dart';

class SearchViewModel = _SearchViewModel with _$SearchViewModel;

abstract class _SearchViewModel extends BaseViewModel with Store {
  _SearchViewModel(this._service);

  final ISearchService _service;

  int _page = 1;

  @observable
  ObservableList<String> _results = ObservableList.of([]);

  @observable
  RequestFailure? failure;

  @computed
  bool get hasError => failure != null;

  @computed
  List<String> get results => _results.toList();

  @computed
  bool get hasData => _results.isNotEmpty;

  @action
  void setData(List<String> list, bool refresh) {
    if (list.isNotEmpty) {
      if (!hasData || refresh) {
        this._results = list.asObservable();
      } else {
        this._results.addAll(list.asObservable());
      }
    }
  }

  @action
  void clear() {
    if (results.isNotEmpty) {
      this._results = ObservableList.of([]);
    }
  }

  @action
  Future<void> load({required String query, bool refresh = false}) async {
    if (isBusy) return;
    if (refresh) {
      _page = 1;
      onRefresh(value: refresh);
    }

    setBusy(true);

    failure = null;

    final _response = await _service.searchPackage(page: _page, query: query);

    setBusy(false);

    if (refresh) onRefresh(value: false);

    _response.fold(
      (failure) => this.failure = failure,
      (data) {
        setData(data, refresh);
        _page++;
        if (results.length == 10) {
          load(query: query);
        }
      },
    );
  }
}
