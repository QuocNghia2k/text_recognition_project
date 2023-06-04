import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:text_recognition_project/data/data.dart';
import 'package:text_recognition_project/extensions/extensions.dart';
import '../../../core/base/base.dart';
import '../../../blocs/blocs.dart';
import '../../../resources/resources.dart';
import '../../../router/router.dart';
import '../../../widgets/inkwell_wrapper.dart';

class HistoryPage extends StatefulWidget {
  final HistoryBloc bloc;
  const HistoryPage(this.bloc, {Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends BaseState<HistoryPage, HistoryBloc> {
  @override
  void initState() {
    FirebaseFirestore.instance.collection('historis').snapshots().listen((event) {
      bloc.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => widget.bloc.loadData(),
        color: AppColors.primaryBlack,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWellWrapper(
                color: AppColors.primaryBlack,
                child: Text(
                  "Get data",
                  style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  bloc.getData();
                },
                paddingChild: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
              ),
              SizedBox(
                height: 20,
              ),
              InkWellWrapper(
                color: AppColors.primaryBlack,
                child: Text(
                  "set data",
                  style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  // bloc.setData(HistoryModel(email: ));
                },
                paddingChild: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
              ),
              StreamBuilder<List<HistoryModel>?>(
                  stream: bloc.historyStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            var data = snapshot.data?[index];
                            return Text("name: ${data?.email} ---  time: ${data?.timeCreate?.convertDateFormat()}");
                          });
                    } else {
                      return Text(
                        "Not data",
                        style: theme.textTheme.titleSmall?.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.w400),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  HistoryBloc get bloc => widget.bloc;
}
