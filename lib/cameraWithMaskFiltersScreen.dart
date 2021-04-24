import 'package:avatar_view/avatar_view.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';
import 'dart:io' as Platform;

class cameraWithMaskFiltersScreen extends StatefulWidget {
  @override
  _cameraWithMaskFiltersScreenState createState() => _cameraWithMaskFiltersScreenState();
}

class _cameraWithMaskFiltersScreenState extends State<cameraWithMaskFiltersScreen>
{
 CameraDeepArController cameraDeepArController;
 String platformVersion = "Unknown";
 int currentpage =0;
 final vp = PageController(viewportFraction: .24);
 Effects currentEffects = Effects.none;
 Filters currentFilters= Filters.none;
 Masks currentMasks= Masks.none;






  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black ,
        body: Stack(
          children: [
              //Deep Ar Camera
            CameraDeepAr(
              onCameraReady: (isReady){
                platformVersion = " Camera Status $isReady";
                print(platformVersion);
                setState(() {

                });
              },
              onImageCaptured: (path)
              {
                platformVersion = "Image save at $path";
                print(platformVersion);
                setState(() {

                });

              },

              androidLicenceKey: "DEEP_AR_API_KEY_ID",
              cameraDeepArCallback: (c) async
                {
                   cameraDeepArController = c ;
                   setState(() {

                   });
                },


            ),
            //Facemask Filters
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(  
                      padding: EdgeInsets.only(left: 28.0 , right: 28.0),
                      child: Expanded(
                         child: FlatButton(
                        child: Icon(Icons.camera_enhance),
                        color: Colors.white54,
                        padding: EdgeInsets.all(15.0),
                        onPressed: ()
                        {
                          if(null == cameraDeepArController){
                            return;
                          }
                          cameraDeepArController.snapPhoto();
                        },

                      ),
                      ),
                     
                    ),
                  
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(8, (page)
                        {
                          bool active = currentpage == page;

                          return Platform.Platform.isIOS
                              ? GestureDetector(
                                onTap: (){
                                  currentpage =page;
                                  cameraDeepArController.changeMask(page);
                                  setState(() {

                                  });
                                },
                                 child: AvatarView(
                                   radius: active ? 65 : 30,
                                   borderColor: Colors.yellow,
                                   borderWidth: 2,
                                   isOnlyText: false,
                                   avatarType: AvatarType.CIRCLE,
                                   imagePath: "assets/ios/${page.toString()}.jpg",
                                   placeHolder: Icon(Icons.person, size: 50,),
                                   errorWidget: Container(child:Icon(Icons.error, size: 50,),),

                                 ),

                               )
                              : GestureDetector(
                                  onTap: (){
                                    currentpage =page;
                                    cameraDeepArController.changeMask(page);
                                    setState(() {

                                    });
                                  },
                                  child: AvatarView(
                                    radius: active ? 45 : 28,
                                    borderColor: Colors.yellow,
                                    borderWidth: 2,
                                    isOnlyText: false,
                                    avatarType: AvatarType.CIRCLE,
                                    imagePath: "assets/android/${page.toString()}.jpg",
                                    placeHolder: Icon(Icons.person, size: 50,),
                                    errorWidget: Container(child:Icon(Icons.error, size: 50,),),

                                 ),
                             );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),


          ],

        ) ,
      ),

    );
  }
}
