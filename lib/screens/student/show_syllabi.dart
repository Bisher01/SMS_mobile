import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/components.dart';
import '../../providers/app_provider.dart';
import '../../services/api_response.dart';
import '../../utill/widget_size.dart';

class ShowSyllabi extends StatefulWidget {
  const ShowSyllabi({Key? key}) : super(key: key);

  @override
  State<ShowSyllabi> createState() => _ShowSyllabiState();
}

class _ShowSyllabiState extends State<ShowSyllabi> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, child) {
      if (provider.fSyllabiResponse != null) {
        switch (provider.fSyllabiResponse?.status) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.COMPLETED:
            return GridView.builder(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              itemCount: provider.fSyllabiResponse!.data!.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: widgetSize.getWidth(200, context) /
                    widgetSize.getHeight(300, context),
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: widgetSize.getWidth(200, context),
                    height: widgetSize.getHeight(400, context),
                    child: SyllabiCard(
                      syllabi:
                      provider.fSyllabiResponse!.data!.data![index],
                    ),
                  ),
                );
              },
            );
          case Status.ERROR:
            return Error(
              errorMsg: provider.fSyllabiResponse!.message!,
            );
          default:
            return Container();
        }
      }
      return Container();
    });
  }
}
