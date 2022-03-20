import 'package:chucker_flutter/src/models/api_response.dart';
import 'package:chucker_flutter/src/view/widgets/apis_listing_item.dart';
import 'package:flutter/material.dart';

///Shows the listing of api requests
class ApisListingTabView extends StatefulWidget {
  ///Shows the listing of all success api requests
  const ApisListingTabView({
    required this.apis,
    required this.onDelete,
    required this.onChecked,
    required this.showDelete,
    Key? key,
  }) : super(key: key);

  ///The list of [ApiResponse] that to be shown in this page
  final List<ApiResponse> apis;

  ///Callback to delete a request
  final void Function(String) onDelete;

  ///Callback to select a request
  final void Function(String) onChecked;

  ///Whether to hide or show delete button
  final bool showDelete;

  @override
  State<ApisListingTabView> createState() => _ApisListingTabViewState();
}

class _ApisListingTabViewState extends State<ApisListingTabView> {
  @override
  Widget build(BuildContext context) {
    if (widget.apis.isEmpty) {
      return const Center(
        child: Text('No api response found at the moment'),
      );
    }
    return ListView.separated(
      itemBuilder: (_, i) {
        final api = widget.apis[i];
        return ApisListingItemWidget(
          baseUrl: api.baseUrl,
          dateTime: api.requestTime,
          method: api.method,
          path: api.path,
          statusCode: api.statusCode,
          onDelete: widget.onDelete,
          checked: api.checked,
          onChecked: widget.onChecked,
          showDelete: widget.showDelete,
        );
      },
      separatorBuilder: (_, __) => const Divider(),
      itemCount: widget.apis.length,
    );
  }
}
