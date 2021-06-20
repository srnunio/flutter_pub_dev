import 'package:customized/customized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_package/src/application/search/search_view_model.dart';
import 'package:flutter_package/src/domain/search/i_search_repository.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:flutter_package/src/presentation/core/custom_progress.dart';
import 'package:flutter_package/src/presentation/core/custom_refresh.dart';
import 'package:flutter_package/src/presentation/core/failure_message_view.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/presentation/core/svg_icon.dart';
import 'package:flutter_package/src/presentation/packages/detail_package_screen.dart';
import 'package:flutter_package/src/presentation/search/search_item.dart';
import 'package:flutter_package/src/utils/theme.dart';
import 'package:flutter_package/src/l18n.dart';
import 'package:flutter_package/src/utils/uihelper.dart';

class SearchScreen extends StatefulWidget {
  static const route = '/search_screen';

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  SearchViewModel _model = SearchViewModel(inject<ISearchRepository>());

  String _query = '';

  TextEditingController _editingController = new TextEditingController();

  bool get hasQuery => (_query != null && _query.isNotEmpty);

  @override
  void initState() {
    super.initState();
  }

  String get _message => (!_model.hasError)
      ? 'no_results_found'
      : _model.failure.when<String>(
          networkError: () => 'no_internet_access',
          empty: () => 'no_results_found',
          serverError: () => 'server_failure');

  _build() {
    return Observer(builder: (_) {
      if (_model.isBusy && !_model.hasData) {
        return Center(child: CustomProgress());
      }
      if (_model.hasError && !_model.hasData) {
        return FailureMessageView(
          isColor: true,
          sizeIcon: 80,
          message: _message,
          showButton: _model.hasError,
          onTap: () {
            _model.load(query: _query);
          },
        );
      }
      if (!_model.hasData) {
        return FailureMessageView(
          isColor: true,
          sizeIcon: 80,
          showButton: !_model.hasError,
          message: _message,
          onTap: () {
            _model.load(query: _query);
          },
        );
      }

      return CustomRefresh(
        refresh: _model.refresh,
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            itemCount: _model.results.length,
            itemBuilder: (context, index) {
              var name = _model.results[index];
              return Container(
                child: SearchItem(
                  onTap: () async {
                    _model.navigateToPushNamed(
                        routeName: DetailPackageScreen.route, arguments: name);
                  },
                  name: name,
                ),
              );
            }),
        enablePullDown: true,
        onRefresh: () => _model.load(refresh: true, query: _query),
        onLoading: () => _model.load(query: _query),
      );
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      _query = newQuery;
    });
  }

  _field() {
    var hintText = I18n.text('search_desc');

    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextField(
            onSubmitted: (value) {
              _model.load(query: value, refresh: _model.hasData);
            },
            textInputAction: TextInputAction.search,
            controller: _editingController,
            autofocus: true,
            cursorColor: CustomTheme.primary,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: styleText(color: CustomTheme.subtitleColor),
            ),
            style: styleText(color: CustomTheme.titleColor),
            onChanged: updateSearchQuery,
          )),
          InkWell(
              child: Icon(
                Icons.cancel,
                color: (!hasQuery) ? Colors.grey[300] : null,
              ),
              onTap: (!hasQuery)
                  ? null
                  : () {
                      _model.clear();
                      _editingController.clear();
                      setState(() => _query = '');
                    }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: AppBar(
            backgroundColor: CustomTheme.backgroundColor,
            brightness: CustomTheme.brightness,
            elevation: 0,
            leading: BackButton(),
            automaticallyImplyLeading: false,
            title: _field(),
          )),
      body: _build(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
