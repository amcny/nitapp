import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'what_new_model.dart';
export 'what_new_model.dart';

class WhatNewWidget extends StatefulWidget {
  const WhatNewWidget({Key? key}) : super(key: key);

  @override
  _WhatNewWidgetState createState() => _WhatNewWidgetState();
}

class _WhatNewWidgetState extends State<WhatNewWidget> {
  late WhatNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WhatNewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            'What\'s New?',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.5,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<WhatNewRecord>>(
            stream: queryWhatNewRecord(
              queryBuilder: (whatNewRecord) =>
                  whatNewRecord.orderBy('created_time'),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: SpinKitThreeBounce(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 30.0,
                    ),
                  ),
                );
              }
              List<WhatNewRecord> columnWhatNewRecordList = snapshot.data!;
              return SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(columnWhatNewRecordList.length,
                          (columnIndex) {
                    final columnWhatNewRecord =
                        columnWhatNewRecordList[columnIndex];
                    return Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          constraints: BoxConstraints(
                            maxHeight: 650.0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF101010),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color(0x67616161),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: () {
                                          if (columnWhatNewRecord.type ==
                                              'New') {
                                            return FlutterFlowTheme.of(context)
                                                .success;
                                          } else if (columnWhatNewRecord.type ==
                                              'Bug Smash') {
                                            return FlutterFlowTheme.of(context)
                                                .warning;
                                          } else {
                                            return Color(0x00000000);
                                          }
                                        }(),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 3.0, 10.0, 3.0),
                                      child: Text(
                                        columnWhatNewRecord.type,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        columnWhatNewRecord.title,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        columnWhatNewRecord.description,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF95A1AC),
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (columnWhatNewRecord.image != null &&
                                    columnWhatNewRecord.image != '')
                                  Flexible(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 0),
                                        fadeOutDuration:
                                            Duration(milliseconds: 0),
                                        imageUrl: columnWhatNewRecord.image,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 175.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                              ].divide(SizedBox(height: 6.0)),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                      .divide(SizedBox(height: 15.0))
                      .addToStart(SizedBox(height: 10.0))
                      .addToEnd(SizedBox(height: 10.0)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
