#import "GeoJSONSerialization.h"
#import "UIView+Toast.h"
#import "ZLTestViewController.h"
#import "ZLCommonConst.h"
@import GoogleMaps;


@interface ZLTestViewController ()

//@property (nonatomic, weak) UIView *nightView;



@end

@implementation ZLTestViewController{

    
        GMSMapView *mapView;
        GMSTileLayer *layer;
    
    NSArray *last_shapes;
    BOOL _firstLocationUpdate;


    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //########### init location ##########
    
    
    NSArray *city = [NSArray arrayWithObjects:@"city", @"33.65992448007282", @"-117.91505813598633", @"13", nil];
    
    NSArray *county = [NSArray arrayWithObjects:@"county", @"33.693495", @"-117.793350", @"11", nil];
    
    NSArray *Newport_Beach = [NSArray arrayWithObjects:@"Newport_Beach", @"33.616478", @"-117.875748", @"13", nil];
    NSArray *Santa_Monica = [NSArray arrayWithObjects:@"Santa_Monica", @"34.023143", @"-118.475275", @"14", nil];
    
    NSArray *Los_Angeles = [NSArray arrayWithObjects:@"Los_Angeles", @"34.043556504127444", @"-118.24928283691406", @"11", nil];
    NSArray *San_Francisco = [NSArray arrayWithObjects:@"San_Francisco", @"37.77559951996456", @"-122.41722106933594", @"12", nil];
    NSArray *New_York = [NSArray arrayWithObjects:@"New_York", @"40.753499070431374", @"-73.98948669433594", @"11", nil];
    NSArray *Chicago = [NSArray arrayWithObjects:@"Chicago", @"41.874673839758024", @"-87.63175964355469", @"11", nil];
    NSArray *Denver = [NSArray arrayWithObjects:@"Denver", @"39.74336227378035", @"-104.99101638793945", @"12", nil];
    NSArray *Los_Angeles_County = [NSArray arrayWithObjects:@"Los_Angeles_County", @"34.05607276338366", @"-118.26370239257812", @"10", nil];
    NSArray *New_York_Bronx = [NSArray arrayWithObjects:@"New_York_Bronx", @"40.85537053192496", @"-73.87687683105469", @"13", nil];
    NSArray *New_York_Brooklyn = [NSArray arrayWithObjects:@"New_York_Brooklyn", @"40.65433643720422", @"-73.95206451416016", @"13", nil];
    NSArray *New_York_Manhattan = [NSArray arrayWithObjects:@"New_York_Manhattan", @"40.764421348741976", @"-73.97815704345703", @"13", nil];
    NSArray *New_York_Queens = [NSArray arrayWithObjects:@"New_York_Queens", @"40.72280306615735", @"-73.79997253417969", @"13", nil];
    NSArray *New_York_Staten_Island = [NSArray arrayWithObjects:@"New_York_Staten_Island", @"40.60300547512703", @"-74.1353988647461", @"13", nil];
    NSArray *Arura = [NSArray arrayWithObjects:@"Arura", @"39.723296392333026", @"-104.84081268310547", @"13", nil];
    NSArray *Bakersfield = [NSArray arrayWithObjects:@"Bakersfield", @"39.818557296839344", @"-104.501953125", @"13", nil];
    NSArray *Baltimore = [NSArray arrayWithObjects:@"Baltimore", @"35.44808511462123", @"-118.78177642822266", @"13", nil];
    NSArray *Orlando = [NSArray arrayWithObjects:@"Orlando", @"39.90657598772841", @"-104.59259033203125", @"13", nil];
    NSArray *Palo_Alto = [NSArray arrayWithObjects:@"Palo_Alto", @"37.4426999532675", @"-122.15492248535156", @"13", nil];
    NSArray *Philadelphia = [NSArray arrayWithObjects:@"Philadelphia", @"37.49529038649112", @"-122.10411071777344", @"13", nil];
    NSArray *Portland = [NSArray arrayWithObjects:@"Portland", @"40.13794057716276", @"-74.95491027832031", @"13", nil];
    NSArray *San_Jose = [NSArray arrayWithObjects:@"San_Jose", @"45.58473142874248", @"-122.46803283691406", @"13", nil];
    NSArray *Seattle = [NSArray arrayWithObjects:@"Seattle", @"37.45469273789926", @"-121.82052612304688", @"13", nil];
    NSArray *Shoreline = [NSArray arrayWithObjects:@"Shoreline", @"47.75479043701335", @"-122.34392166137695", @"13", nil];
    NSArray *Stockton = [NSArray arrayWithObjects:@"Stockton", @"47.77936670249429", @"-122.27182388305664", @"13", nil];
    NSArray *Washington_DC = [NSArray arrayWithObjects:@"Washington_DC", @"38.063635376296816", @"-121.18932723999023", @"13", nil];
    
    
    
    NSMutableDictionary *area_info= [[NSMutableDictionary alloc]init];
    
    [area_info setObject:city forKey:@"city"];
    [area_info setObject:county forKey:@"county"];
    [area_info setObject:Newport_Beach forKey:@"Newport_Beach"];
    [area_info setObject:Santa_Monica forKey:@"Santa_Monica"];
    [area_info setObject:Los_Angeles forKey:@"Los_Angeles"];
    [area_info setObject:San_Francisco forKey:@"San_Francisco"];
    [area_info setObject:New_York forKey:@"New_York"];
    [area_info setObject:Chicago forKey:@"Chicago"];
    [area_info setObject:Denver forKey:@"Denver"];
    [area_info setObject:Los_Angeles_County forKey:@"Los_Angeles_County"];
    [area_info setObject:New_York_Bronx forKey:@"New_York_Bronx"];
    [area_info setObject:New_York_Brooklyn forKey:@"New_York_Brooklyn"];
    [area_info setObject:New_York_Manhattan forKey:@"New_York_Manhattan"];
    [area_info setObject:New_York_Queens forKey:@"New_York_Queens"];
    [area_info setObject:New_York_Staten_Island forKey:@"New_York_Staten_Island"];
    [area_info setObject:Arura forKey:@"Arura"];
    [area_info setObject:Bakersfield forKey:@"Bakersfield"];
    [area_info setObject:Baltimore forKey:@"Baltimore"];
    [area_info setObject:Orlando forKey:@"Orlando"];
    [area_info setObject:Palo_Alto forKey:@"Palo_Alto"];
    [area_info setObject:Philadelphia forKey:@"Philadelphia"];
    [area_info setObject:Portland forKey:@"Portland"];
    [area_info setObject:San_Jose forKey:@"San_Jose"];
    [area_info setObject:Seattle forKey:@"Seattle"];
    [area_info setObject:Shoreline forKey:@"Shoreline"];
    [area_info setObject:Stockton forKey:@"Stockton"];
    [area_info setObject:Washington_DC forKey:@"Washington_DC"];
    
    
    
    //....... tile list .........
    
    
    NSArray *tileList = [NSArray arrayWithObjects:@"city_address",@"city_general_land_use",@"city_parcels",@"city_streets",@"city_zoning",@"Santa_Monica_Buildings",@"Santa_Monica_Parcels",@"Santa_Monica_Speed_Limit",@"Santa_Monica_Street_Sweeping",@"Santa_Monica_Streets",@"Santa_Monica_Zoning",@"Newport_Beach_Address",@"Newport_Beach_General_Land_Use",@"Newport_Beach_Parcels",@"Newport_Beach_Right_Of_Way",@"Newport_Beach_Streets",@"Newport_Beach_Zoning",@"county_parks",@"county_streets",@"county_address",@"Palo_Alto_Addresses",@"Palo_Alto_Building",@"Palo_Alto_Parcels",@"Palo_Alto_Right_of_way",@"Palo_Alto_Streets",@"Palo_Alto_Zoning",@"Shoreline_Address_Central",@"Shoreline_Buildings",@"Shoreline_Crosswalk_Driveways",@"Shoreline_Curb",@"Shoreline_Curb_Ramp",@"Shoreline_Encumbrance",@"Shoreline_Land_Use_Comp_Plan",@"Shoreline_Pavement",@"Shoreline_Pavement_Condition",@"Shoreline_Sidewalk",@"Shoreline_Street",@"Shoreline_Street_Light",@"Shoreline_Tax_Parcel_Central",@"Shoreline_Traffic_Pave_Striping",@"Shoreline_Zoning",@"New_York_Address",@"New_York_Building",@"New_York_Building_Demolition",@"New_York_Commercial_Zone",@"New_York_Manhattan_Zoning",@"New_York_Parks",@"New_York_Sidewalk",@"New_York_Streets",@"New_York_Zone_Districts",@"Chicago_Bike_Routes",@"Chicago_Buildings",@"Chicago_Curbs",@"Chicago_Major_Streets",@"Chicago_Parks",@"Chicago_Schools",@"Chicago_Streets_Sweeping",@"Chicago_Zoning",@"San_Francisco_Height_And_Bulk_Districts",@"San_Francisco_Parcels",@"San_Francisco_Streets",@"San_Francisco_Zoning_Districts",@"San_Francisco_Address",@"San_Francisco_Blocks",@"San_Francisco_Building_Footprint",@"San_Francisco_Curb_Island",@"San_Francisco_Downtown_Address",@"San_Francisco_Downtown_Land_Use",@"San_Francisco_Downtown_Zoning",@"Los_Angeles_County_Parcels",@"Los_Angeles_General_Land_Use",@"Los_Angeles_Zoning",
                         
                         nil];
    
    
    //###############  End  init location ##########
    
    
    
        
    
    
    
    
    
    
    //------------- google map ------------
    
    
    NSArray *_init_loc = area_info[_area];
    
    
    NSString *lat=[_init_loc objectAtIndex:1];
    NSString *lng=[_init_loc objectAtIndex:2];
    NSString *zom=[_init_loc objectAtIndex:3];
    
    CGFloat latitude = [lat floatValue];
    CGFloat longitude = [lng floatValue];
    CGFloat zoom = [zom floatValue];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitude
                                                            longitude:longitude
                                                                 zoom:zoom];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    mapView.settings.compassButton = YES;

    mapView.settings.myLocationButton = YES;
    
    
   
    
    
    // Listen to the myLocation property of GMSMapView.
    [mapView addObserver:self
              forKeyPath:@"myLocation"
                 options:NSKeyValueObservingOptionNew
                 context:NULL];
    
    
    mapView.mapType = kGMSTypeHybrid;
    
    mapView.delegate = self;
    
   
   
    mapView.indoorEnabled = NO;
    
    self.view = mapView;
    

    mapView.myLocationEnabled = YES;
    // Ask for My Location data after the map has already been added to the UI.
    dispatch_async(dispatch_get_main_queue(), ^{
        mapView.myLocationEnabled = YES;
    });

    
    
    //------------- End google map ------------
    
    
    
    
    
    
    
    // ----- title text ------------
    
    UITextView *mytext = [[UITextView alloc] initWithFrame:CGRectMake(100, 20, 400.0, 28.0)];
    mytext.backgroundColor = [UIColor clearColor];
    NSString *title = [_area stringByAppendingString:@" - "];
    title = [title stringByAppendingString:_subject];
    mytext.text = title;
    mytext.textColor = [UIColor blueColor];
    mytext.font = [UIFont systemFontOfSize:15];
    mytext.editable = NO;
    [self.view addSubview:mytext];
  
    
    
    
    //-------- back button ------
    
    UIButton *backbtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    backbtn.frame = CGRectMake(0, 20, 50, 18);
    [backbtn setTitle:@"< back" forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(backbtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backbtn];
    
    
    
    
    
    //------- add tiles ---------------
    
        Boolean _add_tile = NO;
    
       for (id element in tileList)
       {
           NSString *element_str = (NSString *)element;
           NSString *_area_subject = [NSString stringWithFormat:@"%@_%@",_area, _subject];
    
           if ([element_str isEqualToString:_area_subject]){
    
    
               _add_tile = YES;
    
    
               // NSLog(@"addtile^^^^^^^: %@", @"YESSSSSSSSSSSSSSSSSSS" );
                break;
    
           }
        
       }// for
    
        if (_add_tile){
    
    
    // Implement GMSTileURLConstructor
    // Returns a Tile based on the x,y,zoom coordinates, and the requested floor
    GMSTileURLConstructor urls = ^(NSUInteger x, NSUInteger y, NSUInteger zoom) {
        
     NSString *url = [NSString stringWithFormat:@"http://166.62.80.50:8887/v2/%@_%@/%lu/%lu/%lu.png", _area, _subject, (unsigned long)zoom, (unsigned long)x, (unsigned long)y];
        
  // not in use, instead use real ip,  domain name sometime cause tile not showing
      //  NSString *url = [NSString stringWithFormat:@"http://tile.transparentgov.net/v2/%@_%@/%lu/%lu/%lu.png", _area, _subject, (unsigned long)zoom, (unsigned long)x, (unsigned long)y];
        
       // NSLog(@"%@", url);
        
        return [NSURL URLWithString:url];
    };
    
    // Create the GMSTileLayer
    layer = [GMSURLTileLayer tileLayerWithURLConstructor:urls];
    
    // Display on the map at a specific zIndex, 0: under shape overlay, 1: above shape overlay
    layer.zIndex = 0;
   // layer.tileSize = 512;
    layer.opacity =0.6;
    
    
    layer.map = mapView;
    
    
    [layer clearTileCache];
    
        }// if add tile
    
    // ------------- End of ------- add tile ------------
    
    
    
    
    
    
    //---------------- add area boundary -------------
    
    
    
    
    NSString *const _url_arealimit = [NSString stringWithFormat:@"http://166.62.80.50:10/gis/api/maparealimit/%@/limit", _area];
    
    // _url_arealimit = [NSString stringWithFormat:@"http://166.62.80.50:10/gis/api/maparealimit/%@/limit", _area];
    
    
    
    [self add_area_boundary_geojson:_url_arealimit  toMap: mapView ];
    
    //-------------- end area boundary -------------------
    
    
    
}// end --- view did load-----



//========== my location ============



- (void)dealloc {
    [mapView removeObserver:self
                 forKeyPath:@"myLocation"
                    context:NULL];
}

#pragma mark - KVO updates

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    
    
    
    if (!_firstLocationUpdate) {
        // If the first location update has not yet been recieved, then jump to that
        // location.
        _firstLocationUpdate = YES;
        CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
        mapView.camera = [GMSCameraPosition cameraWithTarget:location.coordinate
                                                        zoom:14];
    }//if
}// method






// ========== End ======= my location ==========





// =============== add geojson layer ===========

- (void) add_geojson_layer:(NSString*)_url toMap:(GMSMapView *)mapview_{
    
    
    
    NSLog(@"*****  URL  ****: %@", _url);
    
    
    NSURL *msgURL = [NSURL URLWithString:_url];
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    
    
    NSURLSessionTask *messageTask = [session dataTaskWithURL:msgURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        
        NSString *retString = [NSString stringWithUTF8String:[data bytes]];
        
        
        NSLog(@"    #####json#####    : %@", retString);
        
        if (retString.length < 20){
            
            // return total number
            
            // bug too slow, un-sync
          //  NSString *hint_str = [NSString stringWithFormat:@"Found (%@) zoom in for details ", retString];
          //   [mapview_ makeToast:hint_str];
            
            
           
           [self clear_last_shapes:last_shapes];

            
        
            
        }
        
        
        
        else{
            // return geojson
            
            
            
            [self clear_last_shapes:last_shapes];
            
            NSDictionary *geoJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *shapes = [GeoJSONSerialization shapesFromGeoJSONFeatureCollection:geoJSON error:nil];
            
            
           // for (GMSOverlay *shape in [shapes copy]) {
                for (GMSOverlay *shape in shapes) {
                shape.map = mapview_;
                
            }// for shapes
            
            last_shapes = shapes;
            
            
            
        }//else
    }];// message session task
    [messageTask resume];
    
    
    
}// add geojson method






- (void) add_area_boundary_geojson:(NSString*)_url toMap:(GMSMapView *)mapview_{
    
    
    
    NSURL *msgURL = [NSURL URLWithString:_url];
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    
    
    NSURLSessionTask *messageTask = [session dataTaskWithURL:msgURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
            NSDictionary *geoJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *shapes = [GeoJSONSerialization shapesFromGeoJSONFeatureCollection:geoJSON error:nil];
            
            
            // for (GMSOverlay *shape in [shapes copy]) {
            for (GMSOverlay *shape in shapes) {
                shape.map = mapview_;
                
            }// for shapes
            
        
            
            
        
    }];// message session task
    [messageTask resume];
    
    
    
}// add area boundary






-(void)clear_last_shapes:(NSArray*) last_overlay_shapes{

// ::::clear old last time geojson overlay
//[mapview_ clear];

for (GMSOverlay *shape in last_overlay_shapes) {
    shape.map = nil;
    
}// for shapes

// ::::End clear old last time geojson overlay
    
}

// =========== End add geojson layer ==================


















- (void)backbtnPressed:(UIButton *)button {
    //NSLog(@"Button Pressed");
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// ----- set portrait view orientation

//- (BOOL) shouldAutorotate {
//    return NO;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    
//    return (UIInterfaceOrientationPortrait|UIInterfaceOrientationPortraitUpsideDown);
//    
//}

// ----- END  ----set portrait view orientation



// +++++++ Event handling +++++++++++++

#pragma mark - GMSMapViewDelegate


- (void)mapView:(GMSMapView *)map_View didTapOverlay:(GMSOverlay *)overlay {
    
    
    
   // NSLog(@"+++++++++++tap overlay  %@", @"************** overlay tapped *************");
    
    // When a polygon is tapped, randomly change its fill color to a new hue.
    if ([overlay isKindOfClass:[GMSPolygon class]]) {
        GMSPolygon *polygon = (GMSPolygon *)overlay;
        CGFloat hue = (((float)arc4random()/0x100000000)*1.0f);
        polygon.fillColor =
        [UIColor colorWithHue:hue saturation:1 brightness:1 alpha:0.5];
        
        polygon.strokeWidth = 3;
        
        
       // NSLog(@"+++++++++++Polygon click %@", polygon.title);
        
        [map_View makeToast:polygon.title
                   duration:2.0
                   position:CSToastPositionBottom
                      title:@""
                      image:[UIImage imageNamed:@"toast.png"]
                      style:nil
                 completion:^(BOOL didTap) {
                     if (didTap) {
                          NSLog(@"completion from tap");
                     } else {
                          NSLog(@"completion without tap");
                     }
                 }
         
         ];
        
        // toggle "tap to dismiss" functionality
        [CSToastManager setTapToDismissEnabled:YES];
        
        // toggle queueing behavior
        [CSToastManager setQueueEnabled:YES];
        
        
        
    }// if polygon
    
    
    
    if ([overlay isKindOfClass:[GMSPolyline class]]) {
        GMSPolyline *polyline = (GMSPolyline *)overlay;
        CGFloat hue = (((float)arc4random()/0x100000000)*1.0f);
        polyline.strokeColor =
        [UIColor colorWithHue:hue saturation:1 brightness:1 alpha:0.5];
        
        polyline.strokeWidth = 3;
        
        // NSLog(@"+++++++++++Polyline click %@", polyline.title);
        [map_View makeToast:polyline.title
         
                   duration:2.0
                   position:CSToastPositionBottom
                      title:@""
                      image:[UIImage imageNamed:@"toast.png"]
                      style:nil
                 completion:^(BOOL didTap) {
                     if (didTap) {
                          NSLog(@"completion from tap");
                     } else {
                         NSLog(@"completion without tap");
                     }
                 }
         
         ];
        
        // toggle "tap to dismiss" functionality
        [CSToastManager setTapToDismissEnabled:YES];
        
        // toggle queueing behavior
        [CSToastManager setQueueEnabled:YES];
        
        
    }// if polyline
    
    
    
}// did tap overlay



- (BOOL)mapView:(GMSMapView *)map_View didTapMarker:(GMSMarker *)marker {
    
    CGFloat hue = (((float)arc4random()/0x100000000)*1.0f);
    marker.icon = [GMSMarker markerImageWithColor:[UIColor colorWithHue:hue saturation:1 brightness:1 alpha:1]];
    
    
    
    [map_View setSelectedMarker:nil];
    [map_View makeToast:marker.title
               duration:2.0
               position:CSToastPositionBottom
                  title:@""
                  image:[UIImage imageNamed:@"toast.png"]
                  style:nil
             completion:^(BOOL didTap) {
                 if (didTap) {
                     // NSLog(@"completion from tap");
                 } else {
                     // NSLog(@"completion without tap");
                 }
             }
     
     ];
    
    // toggle "tap to dismiss" functionality
    [CSToastManager setTapToDismissEnabled:YES];
    
    // toggle queueing behavior
    [CSToastManager setQueueEnabled:YES];
    
    
    return YES;
    
}



//- (void)mapView:(GMSMapView *)mapView
//didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
//    NSLog(@"You tapped at %f,%f", coordinate.latitude, coordinate.longitude);
//}
//
//
//- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture {
//   // [mapView clear];
//}

- (void)mapView:(GMSMapView *)_mapView
idleAtCameraPosition:(GMSCameraPosition *)cameraPosition {
    
    
    
    
     //NSLog(@"idle at %f,%f", cameraPosition.target.latitude, cameraPosition.target.longitude);
    
    
    // show current map view bound
    GMSVisibleRegion visibleRegion = [_mapView.projection visibleRegion];
    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc]initWithRegion:visibleRegion];
    
    CLLocationCoordinate2D northEast = bounds.northEast;
    CLLocationCoordinate2D northWest = CLLocationCoordinate2DMake(bounds.northEast.latitude, bounds.southWest.longitude);
    CLLocationCoordinate2D southEast = CLLocationCoordinate2DMake(bounds.southWest.latitude, bounds.northEast.longitude);
    CLLocationCoordinate2D  southWest = bounds.southWest;
    
    
//        NSLog(@"NORTH-EST: %.5f",northEast.latitude);
//        NSLog(@"NORTH-EST: %.5f",northEast.longitude);
//    
//        NSLog(@"NORTH-WEST: %.5f",northWest.latitude);
//        NSLog(@"NORTH-WEST: %.5f",northWest.longitude);
//    
//        NSLog(@"South-EST: %.5f",southEast.longitude);
//        NSLog(@"South-EST: %.5f",southEast.latitude);
//    
//        NSLog(@"SOUTH-WEST: %.5f",southWest.latitude);
//        NSLog(@"SOUTH-WEST: %.5f",southWest.longitude);
    
    // asp.net
    //  NSString *url_str = [NSString stringWithFormat:@"http://166.62.80.50/api/geojson/feature_mobile/%@/%@/%.9f/%.9f/%.9f/%.9f/", southWest.longitude, southWest.latitude,northEast.longitude,northEast.latitude];
    
    
    
    //php
    NSString *url_str = [NSString stringWithFormat:@"http://166.62.80.50:10/gis/api/loadall_mobile/%@/%@/%.9f/%.9f/%.9f/%.9f/", _area, _subject,southWest.longitude, southWest.latitude,northEast.longitude,northEast.latitude];
    
    
    
    
    [self add_geojson_layer:url_str  toMap: _mapView ];

    
    
}


//+++++++++++++++++ End +++++ Event handling +++++++++++++++++++






//- (IBAction)btnClick:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
