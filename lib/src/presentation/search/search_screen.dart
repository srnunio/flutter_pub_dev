import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_package/src/application/search/search_view_model.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:flutter_package/src/presentation/core/custom_progress.dart';
import 'package:flutter_package/src/presentation/core/custom_refresh.dart';
import 'package:flutter_package/src/presentation/core/failure_message_view.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/presentation/packages/detail_package_screen.dart';
import 'package:flutter_package/src/presentation/search/search_item.dart';
import 'package:flutter_package/src/presentation/settings/config_builder.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/l18n.dart';

/// [SearchScreen]
class SearchScreen extends StatefulWidget {
  static const route = '/search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  final SearchViewModel _model = inject<SearchViewModel>();

  String _query = '';

  TextEditingController _editingController = new TextEditingController();

  bool get hasQuery => (_query.isNotEmpty);

  /// get error message
  String get _message => (!_model.hasError)
      ? 'no_results_found'
      : _model.failure!.when<String>(
          networkError: () => 'no_internet_access',
          empty: () => 'no_results_found',
          serverError: () => 'server_failure');

  /// viewing
  Widget _build() {
    return Observer(builder: (_) {
      /// when loading and data empty
      if (_model.isBusy && !_model.hasData)
        return Center(child: CustomProgress());

      /// when data empty and has error
      if (_model.hasError && !_model.hasData) {
        return FailureMessageView(
          isColor: true,
          sizeIcon: 80,
          message: _message.translate,
          onTap: () => _model.load(query: _query),
        );
      }

      /// when data empty
      if (!_model.hasData) {
        return FailureMessageView(
          isColor: true,
          sizeIcon: 80,
          message: _message.translate,
          onTap: _model.hasError ? () => _model.load(query: _query) : null,
        );
      }

      /// list results
      return CustomRefresh(
        refresh: _model.refresh,
        child: ListView.builder(
            key: Key('search-result'),
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

  /// update query
  void updateSearchQuery(String newQuery) {
    setState(() => _query = newQuery);
  }

  void onSubmitted(String value) =>
      _model.load(query: value, refresh: _model.hasData);

  /// search field
  _bodyField() {
    var hintText = I18n.text('search_desc');

    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextField(
            onSubmitted: onSubmitted,
            textInputAction: TextInputAction.search,
            controller: _editingController,
            autofocus: true,
            cursorColor: kIconColor,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: styleText(color: kSubtitleTextColor),
            ),
            style: styleText(color: kTitleTextColor),
            onChanged: updateSearchQuery,
          )),
          InkWell(
              child: Icon(
                Icons.cancel,
                color: (!hasQuery) ? Colors.grey[300] : null,
              ),
              onTap: (!hasQuery) ? null : _clearData),
        ],
      ),
    );
  }

  _clearData() {
    _model.clear();
    _editingController.clear();
    setState(() => _query = '');
  }

  @override
  Widget build(BuildContext context) {
    return ConfigBuilder(builder: (_, theme) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: AppBar(
              backgroundColor: kBackgroundColor,
              brightness: theme.brightness,
              elevation: 0,
              leading: BackButton(),
              automaticallyImplyLeading: false,
              title: _bodyField(),
            )),
        body: Container(
          child: _build(),
        ),
      );
    });
  }
}
