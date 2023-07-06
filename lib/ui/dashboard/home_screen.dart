import 'package:bebuzee/bloc/home/home_bloc.dart';
import 'package:bebuzee/model/home_feed_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/colors_utils.dart';
import '../../utils/common_loader.dart';
import '../../utils/images_utils.dart';
import 'package:readmore/readmore.dart';
import '../../utils/size_config.dart';
import '../../utils/standard_regular_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<HomePage> {
  late TextEditingController _searchMedicineController;

  HomeBloc homeBloc = HomeBloc();
  HomeFeedListModel homeFeedListModel = HomeFeedListModel();

  void initController() {
    _searchMedicineController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      homeBloc.add(GetHomeFeedListEvent());
    });
  }

  void disposeController() {
    _searchMedicineController.dispose();
  }

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disposeController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
        topHeader(),
        bottomContent(),
      ]),
    )));
  }

  Widget bottomContent() {
    return Container(
        transform: Matrix4.translationValues(0.0, -15.0, 0.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: whiteColor,
            ),
            color: whiteColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: BlocProvider(
          create: (context) => homeBloc,
          child: homeFeedListWidget(),
        ));
  }

  Widget topHeader() {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      padding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical! * 1,
          left: SizeConfig.safeBlockHorizontal! * 5,
          right: SizeConfig.safeBlockHorizontal! * 5),
      decoration: const BoxDecoration(
        color: primaryColor,
      ),
      child: Column(
        children: [
          Image.asset(
            appLogo,
            height: SizeConfig.safeBlockVertical! * 7.5,
            width: SizeConfig.safeBlockHorizontal! * 25,
          ),
          Row(
            children: [
              SvgPicture.asset(
                locationMarkerIcon,
                height: SizeConfig.safeBlockVertical! * 1.8,
                width: SizeConfig.safeBlockHorizontal! * 1.4,
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 1.7,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: StandardCustomText(
                  label: 'Surat',
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                  fontSize: SizeConfig.safeBlockVertical! * 1.8,
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 1.5,
              ),
              SvgPicture.asset(
                downArrowIcon,
                height: SizeConfig.safeBlockVertical! * 1.4,
                width: SizeConfig.safeBlockHorizontal! * 1.4,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget homeFeedListWidget() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .70,
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            bottomLeft: Radius.circular(0.0)),
      ),
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is OnHomeFeedListLoaded) {
              homeFeedListModel = state.homeFeedListModel;
            }
          },
          builder: (context, state) {
            return (state is HomeFeedLoadingState)
                ? Center(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * .70,
                        child: const Center(child: CustomLoader())),
                  )
                : ListView.builder(
                    itemCount: homeFeedListModel.data != null
                        ? homeFeedListModel.data!.length
                        : 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 5, 7, 5),
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                      color: whiteColor,
                                    ),
                                    color: whiteColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      5.0, 0.0, 5.0, 5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: homeFeedListModel.data![index]
                                                          .postLocation !=
                                                      null &&
                                                  homeFeedListModel.data![index]
                                                          .postLocation !=
                                                      ""
                                              ? Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      locationMarkerIcon,
                                                      color: primaryColor,
                                                      height: SizeConfig
                                                              .safeBlockVertical! *
                                                          1.8,
                                                      width: SizeConfig
                                                              .safeBlockHorizontal! *
                                                          1.4,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    StandardCustomText(
                                                      label: homeFeedListModel
                                                          .data![index]
                                                          .postLocation!,
                                                      maxlines: 2,
                                                      color: primaryColor,
                                                      align: TextAlign.start,
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox(),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional.center,
                                        child: homeFeedListModel.data![index]
                                                    .thumbnailUrl !=
                                                null
                                            ? Image(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    10,
                                                height: SizeConfig
                                                        .blockSizeVertical! *
                                                    30,
                                                image: NetworkImage(
                                                    homeFeedListModel
                                                        .data![index]
                                                        .thumbnailUrl!),
                                                fit: BoxFit.contain,
                                              )
                                            : Image(
                                                image:
                                                    const AssetImage(noImage),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    10,
                                                height: SizeConfig
                                                        .blockSizeVertical! *
                                                    30,
                                              ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Row(
                                              children: [
                                                homeFeedListModel.data![index]
                                                                .postTotalComments !=
                                                            null &&
                                                        homeFeedListModel
                                                                .data![index]
                                                                .postTotalComments
                                                                .toString() !=
                                                            ""
                                                    ? SvgPicture.asset(
                                                        commentIcon,
                                                        color: primaryColor,
                                                        height: SizeConfig
                                                                .safeBlockVertical! *
                                                            2.8,
                                                        width: SizeConfig
                                                                .safeBlockHorizontal! *
                                                            3.0,
                                                      )
                                                    : SizedBox(),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                homeFeedListModel.data![index]
                                                                .postTotalComments !=
                                                            null &&
                                                        homeFeedListModel
                                                                .data![index]
                                                                .postTotalComments
                                                                .toString() !=
                                                            ""
                                                    ? StandardCustomText(
                                                        label: homeFeedListModel
                                                            .data![index]
                                                            .postTotalComments
                                                            .toString(),
                                                        maxlines: 2,
                                                        color: primaryColor,
                                                        align: TextAlign.start,
                                                        // style: const TextStyle(
                                                        //     color: textColor,
                                                        //     fontWeight: FontWeight.w700,
                                                        //     fontSize: 12.0)
                                                      )
                                                    : SizedBox(),
                                                SizedBox(
                                                  width: homeFeedListModel
                                                                  .data![index]
                                                                  .postTotalLikes !=
                                                              null &&
                                                          homeFeedListModel
                                                                  .data![index]
                                                                  .postTotalLikes
                                                                  .toString() !=
                                                              ""
                                                      ? 5
                                                      : 0,
                                                ),
                                                homeFeedListModel.data![index]
                                                                .postTotalLikes !=
                                                            null &&
                                                        homeFeedListModel
                                                                .data![index]
                                                                .postTotalLikes
                                                                .toString() !=
                                                            ""
                                                    ? SvgPicture.asset(
                                                        likeIcon,
                                                        color: primaryColor,
                                                        height: SizeConfig
                                                                .safeBlockVertical! *
                                                            2.8,
                                                        width: SizeConfig
                                                                .safeBlockHorizontal! *
                                                            3.0,
                                                      )
                                                    : SizedBox(),
                                                SizedBox(
                                                  width: homeFeedListModel
                                                                  .data![index]
                                                                  .postTotalLikes !=
                                                              null &&
                                                          homeFeedListModel
                                                                  .data![index]
                                                                  .postTotalLikes
                                                                  .toString() !=
                                                              ""
                                                      ? 5
                                                      : 0,
                                                ),
                                                homeFeedListModel.data![index]
                                                                .postTotalLikes !=
                                                            null &&
                                                        homeFeedListModel
                                                                .data![index]
                                                                .postTotalLikes
                                                                .toString() !=
                                                            ""
                                                    ? StandardCustomText(
                                                        label: homeFeedListModel
                                                            .data![index]
                                                            .postTotalLikes
                                                            .toString(),
                                                        maxlines: 2,
                                                        color: primaryColor,
                                                        align: TextAlign.start,
                                                        // style: const TextStyle(
                                                        //     color: textColor,
                                                        //     fontWeight: FontWeight.w700,
                                                        //     fontSize: 12.0)
                                                      )
                                                    : SizedBox(),
                                              ],
                                            )),
                                      ),
                                      Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: ReadMoreText(
                                                homeFeedListModel.data![index]
                                                            .postContent !=
                                                        null
                                                    ? homeFeedListModel
                                                        .data![index]
                                                        .postContent!
                                                    : "",
                                                trimLines: 4,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: primaryColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                colorClickableText:
                                                    primaryColor,
                                                trimMode: TrimMode.Line,
                                                trimCollapsedText: ' Show more',
                                                trimExpandedText: ' Show less',
                                                lessStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: blackColor,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                moreStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: blackColor,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      StandardCustomText(
                                                          label: homeFeedListModel
                                                                      .data![
                                                                          index]
                                                                      .timeStamp !=
                                                                  null
                                                              ? homeFeedListModel
                                                                  .data![index]
                                                                  .timeStamp!
                                                              : "",
                                                          maxlines: 2,
                                                          color: greyColor,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 12.0),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ))),
                      );
                    });
          },
        ),
      )),
    );
  }
}
