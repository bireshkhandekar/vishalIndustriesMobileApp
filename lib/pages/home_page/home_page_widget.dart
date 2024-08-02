import '/backend/api_requests/api_calls.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/navbar_widget.dart';
import '/components/server_down_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.connectionResult = await actions.checkInternetConnection();
      if (_model.connectionResult == true) {
        _model.apiTimeoutResult = await actions.handleApiTimeout(
          context,
          'http://4.186.24.61:8000/tag/all/',
          10,
        );
        if (true ==
            getJsonField(
              _model.apiTimeoutResult,
              r'''$.success''',
            )) {
          setState(() {});
          _model.apiResultgetproduct = await VIAPIsGroup.getProductCall.call(
            tagName: '',
          );
        } else {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: const ServerDownWidget(),
                ),
              );
            },
          ).then((value) => setState(() {}));
        }
      } else {
        context.goNamed('connectionLossPage');
      }
    });

    _model.textFieldSearchTextController ??= TextEditingController();
    _model.textFieldSearchFocusNode ??= FocusNode();
    _model.textFieldSearchFocusNode!.addListener(
      () async {
        setState(() {
          _model.textFieldSearchTextController?.clear();
        });
      },
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondary,
                            width: 0.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 8.0, 10.0, 8.0),
                          child: AnimatedDefaultTextStyle(
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'DM Serif Text',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 18.0,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w600,
                                ),
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeIn,
                            child: const Text(
                              'Vishal Industries',
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                    child: FutureBuilder<List<CountitemsRow>>(
                      future: SQLiteManager.instance.countitems(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitCircle(
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        final badgeCountitemsRowList = snapshot.data!;

                        return badges.Badge(
                          badgeContent: Text(
                            valueOrDefault<String>(
                              badgeCountitemsRowList.first.rowCount.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          showBadge: true,
                          shape: badges.BadgeShape.circle,
                          badgeColor: const Color(0xFFF74343),
                          elevation: 1.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              6.0, 6.0, 6.0, 6.0),
                          position: badges.BadgePosition.topEnd(),
                          animationType: badges.BadgeAnimationType.scale,
                          toAnimate: true,
                          child: FlutterFlowIconButton(
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              if (badgeCountitemsRowList.first.rowCount != 0) {
                                context.pushNamed('cartPage');
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: const Text('Your cart is empty.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              actions: const [],
              centerTitle: false,
              toolbarHeight: 46.0,
              elevation: 0.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 54.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 6.0),
                    child: Container(
                      height: 54.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0xF98C9AA0),
                            offset: Offset(
                              0.0,
                              0.0,
                            ),
                            spreadRadius: 0.1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(18.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: TextFormField(
                                controller:
                                    _model.textFieldSearchTextController,
                                focusNode: _model.textFieldSearchFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textFieldSearchTextController',
                                  const Duration(milliseconds: 10),
                                  () async {
                                    _model.apiResultsearch = await VIAPIsGroup
                                        .productSearchCall
                                        .call(
                                      product: _model
                                          .textFieldSearchTextController.text,
                                    );

                                    if ((_model.apiResultsearch?.succeeded ??
                                        true)) {
                                      FFAppState().ProductSearch = VIAPIsGroup
                                          .productSearchCall
                                          .product(
                                            (_model.apiResultsearch?.jsonBody ??
                                                ''),
                                          )!
                                          .toList()
                                          .cast<dynamic>();
                                      setState(() {});
                                    }

                                    setState(() {});
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  alignLabelWithHint: false,
                                  hintText: 'Search for brands and products',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF8A9D9D),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 1.0),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Color(0xFF8A9D9D),
                                    size: 24.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                validator: _model
                                    .textFieldSearchTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 16.0, 0.0),
                            child: Icon(
                              Icons.mic_none,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 60.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: VIAPIsGroup.getBannersCall.call(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitCircle(
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      final columnGetBannersResponse = snapshot.data!;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 2.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 102.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 0.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Builder(
                                              builder: (context) {
                                                final categories = functions
                                                        .listNull(getJsonField(
                                                          _model
                                                              .apiTimeoutResult,
                                                          r'''$.data.data''',
                                                          true,
                                                        ))
                                                        ?.toList() ??
                                                    [];

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: categories.length,
                                                  separatorBuilder: (_, __) =>
                                                      const SizedBox(width: 10.0),
                                                  itemBuilder: (context,
                                                      categoriesIndex) {
                                                    final categoriesItem =
                                                        categories[
                                                            categoriesIndex];
                                                    return Visibility(
                                                      visible:
                                                          'top 5 products' !=
                                                              getJsonField(
                                                                categoriesItem,
                                                                r'''$.name''',
                                                              ).toString(),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'productPage',
                                                              queryParameters: {
                                                                'tagName':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    categoriesItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    OctoImage(
                                                                  placeholderBuilder:
                                                                      (_) => const SizedBox
                                                                          .expand(
                                                                    child:
                                                                        Image(
                                                                      image: BlurHashImage(
                                                                          'LcS5-Lt7yYfRo~bGjFjFuPaeZ#kB'),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  image:
                                                                      NetworkImage(
                                                                    getJsonField(
                                                                      categoriesItem,
                                                                      r'''$.tag_img_url''',
                                                                    ).toString(),
                                                                  ),
                                                                  width: 60.0,
                                                                  height: 58.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      categoriesItem,
                                                                      r'''$.name''',
                                                                    )?.toString(),
                                                                    'name',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  decoration: const BoxDecoration(),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Stack(
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final images =
                                                VIAPIsGroup.getBannersCall
                                                        .images(
                                                          columnGetBannersResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];

                                            return SizedBox(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: CarouselSlider.builder(
                                                itemCount: images.length,
                                                itemBuilder:
                                                    (context, imagesIndex, _) {
                                                  final imagesItem =
                                                      images[imagesIndex];
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: OctoImage(
                                                      placeholderBuilder: (_) =>
                                                          const SizedBox.expand(
                                                        child: Image(
                                                          image: BlurHashImage(
                                                              'LcS5-Lt7yYfRo~bGjFjFuPaeZ#kB'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      image: NetworkImage(
                                                        getJsonField(
                                                          imagesItem,
                                                          r'''$.img_url''',
                                                        ).toString(),
                                                      ),
                                                      width: 300.0,
                                                      height: 200.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  );
                                                },
                                                carouselController: _model
                                                        .carouselController ??=
                                                    CarouselController(),
                                                options: CarouselOptions(
                                                  initialPage: max(
                                                      0,
                                                      min(1,
                                                          images.length - 1)),
                                                  viewportFraction: 1.0,
                                                  disableCenter: true,
                                                  enlargeCenterPage: true,
                                                  enlargeFactor: 0.16,
                                                  enableInfiniteScroll: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  autoPlay: true,
                                                  autoPlayAnimationDuration:
                                                      const Duration(
                                                          milliseconds: 900),
                                                  autoPlayInterval: const Duration(
                                                      milliseconds:
                                                          (900 + 900)),
                                                  autoPlayCurve: Curves.linear,
                                                  pauseAutoPlayInFiniteScroll:
                                                      true,
                                                  onPageChanged:
                                                      (index, _) async {
                                                    _model.carouselCurrentIndex =
                                                        index;
                                                    FFAppState().currentIndex =
                                                        valueOrDefault<int>(
                                                      _model
                                                          .carouselCurrentIndex,
                                                      1,
                                                    );
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 45.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: 16.0,
                                              child: custom_widgets
                                                  .CustomCarouselIndicator(
                                                width: double.infinity,
                                                height: 16.0,
                                                itemCount:
                                                    columnGetBannersResponse
                                                                .jsonBody !=
                                                            null
                                                        ? valueOrDefault<int>(
                                                            functions.listindexNull(
                                                                VIAPIsGroup
                                                                    .getBannersCall
                                                                    .images(
                                                                      columnGetBannersResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.map((e) =>
                                                                        e.toString())
                                                                    .toList()
                                                                    .toList()),
                                                            1,
                                                          )
                                                        : 1,
                                                currentIndex:
                                                    valueOrDefault<int>(
                                                  _model.carouselCurrentIndex,
                                                  1,
                                                ),
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                activeBorderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveBorderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                borderWidth: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                  height: 8.0,
                                  thickness: 8.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Top Sale Product',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'DM Serif Text',
                                                fontSize: 18.0,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 315.0,
                                  decoration: const BoxDecoration(),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Builder(
                                            builder: (context) {
                                              final products =
                                                  (VIAPIsGroup.getProductCall
                                                              .products(
                                                                (_model.apiResultgetproduct
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                              ?.toList() ??
                                                          [])
                                                      .take(5)
                                                      .toList();

                                              return ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  8.0,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: products.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 8.0),
                                                itemBuilder:
                                                    (context, productsIndex) {
                                                  final productsItem =
                                                      products[productsIndex];
                                                  return Material(
                                                    color: Colors.transparent,
                                                    elevation: 2.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      width: 170.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child:
                                                                      OctoImage(
                                                                    placeholderBuilder: (_) =>
                                                                        const SizedBox
                                                                            .expand(
                                                                      child:
                                                                          Image(
                                                                        image: BlurHashImage(
                                                                            'LcS5-Lt7yYfRo~bGjFjFuPaeZ#kB'),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    image:
                                                                        NetworkImage(
                                                                      getJsonField(
                                                                        productsItem,
                                                                        r'''$.prd_img_url''',
                                                                      ).toString(),
                                                                    ),
                                                                    width:
                                                                        140.0,
                                                                    height:
                                                                        146.0,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                        productsItem,
                                                                        r'''$.product_title''',
                                                                      ).toString(),
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                        productsItem,
                                                                        r'''$.weight''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          '₹ ${getJsonField(
                                                                            productsItem,
                                                                            r'''$.price''',
                                                                          ).toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '₹ ${getJsonField(
                                                                              productsItem,
                                                                              r'''$.mrp''',
                                                                            ).toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                  decoration: TextDecoration.lineThrough,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await SQLiteManager
                                                                          .instance
                                                                          .addCart(
                                                                        itemid:
                                                                            getJsonField(
                                                                          productsItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        productname:
                                                                            getJsonField(
                                                                          productsItem,
                                                                          r'''$.product_title''',
                                                                        ).toString(),
                                                                        weight:
                                                                            getJsonField(
                                                                          productsItem,
                                                                          r'''$.weight''',
                                                                        ).toString(),
                                                                        price:
                                                                            getJsonField(
                                                                          productsItem,
                                                                          r'''$.price''',
                                                                        ),
                                                                        quantity:
                                                                            1,
                                                                        image:
                                                                            getJsonField(
                                                                          productsItem,
                                                                          r'''$.prd_img_url''',
                                                                        ).toString(),
                                                                      );
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .clearSnackBars();
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            '1 item in cart',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              const Duration(milliseconds: 1000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).warning,
                                                                          action:
                                                                              SnackBarAction(
                                                                            label:
                                                                                'View cart',
                                                                            textColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            onPressed:
                                                                                () async {
                                                                              context.pushNamed('cartPage');
                                                                            },
                                                                          ),
                                                                        ),
                                                                      );

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'Add to cart',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          32.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          1.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navbarModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: const NavbarWidget(
                      pageName: 'home',
                    ),
                  ),
                ),
                if (_model.textFieldSearchTextController.text != '')
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 54.0, 12.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Builder(
                            builder: (context) {
                              final searchProduct =
                                  FFAppState().ProductSearch.toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: searchProduct.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 2.0),
                                itemBuilder: (context, searchProductIndex) {
                                  final searchProductItem =
                                      searchProduct[searchProductIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'productPage',
                                        queryParameters: {
                                          'tagName': serializeParam(
                                            functions.getfistitem((getJsonField(
                                              searchProductItem,
                                              r'''$.tags[:].name''',
                                              true,
                                            ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList()),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 16.0, 12.0, 16.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  searchProductItem,
                                                  r'''$.product_title''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
