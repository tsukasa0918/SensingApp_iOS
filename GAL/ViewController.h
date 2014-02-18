//
//  ViewController.h
//  GAL
//
//  Created by Tsukasa Kamimura on 12/01/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreMotion/CMDeviceMotion.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate,UIAccelerometerDelegate>{
    CLLocationManager *lm;
    IBOutlet UILabel *latLabel;
    IBOutlet UILabel *lngLabel;
    
    NSString *compassStr;
    IBOutlet UIImageView *compassImg;
    
    IBOutlet UILabel *lblx;
    IBOutlet UILabel *lbly;
    IBOutlet UILabel *lblz;
    
    IBOutlet UILabel *lbltime;
    
    IBOutlet UIButton *start;
    IBOutlet UIButton *end;
    IBOutlet UIButton *calibration;
    IBOutlet UIButton *FF;//Filtering Forward
    IBOutlet UIButton *Finish;
    
    IBOutlet UITextView *gyroDataTextView_;
    IBOutlet UILabel *gyroX;
    IBOutlet UILabel *gyroY;
    IBOutlet UILabel *gyroZ;
    
    IBOutlet UILabel *kyodo;
    
    IBOutlet UILabel *Degree;
    //IBOutlet UILabel *barLabel; 取得間隔変更事案凍結
    //IBOutlet UISlider *mySlider;
    
    double rx;
    double ry;
    double rz;
    
    double accx;
    double accy;
    double accz;
    
    double accyd;
    double acczd;
    
    double theta;
    double thetaD;
    
    int dataHead;
    int dataTail;
    int MdataHead;
    int MdataTail;
    
    double accxData[50];
    double accyData[50];
    double acczData[50];
    
    double gyroxData[50];
    double gyroyData[50];
    double gyrozData[50];
    
    double accxMData[4];
    double accyMData[4];
    double acczMData[4];
    
    double gyroxMData[4];
    double gyroyMData[4];
    double gyrozMData[4];
    
    double filter[50];
    
    //NSDate *GPStime;
    //int Hz;
    
    BOOL shaking;
    BOOL atFlg;
    BOOL indexFlg;
    BOOL firstFlg;
    NSString *surinukeFlg;
    NSString *path1;
    NSString *path2;
    CMMotionManager *motionManager;
    NSOperationQueue *opQ;
    CMGyroHandler gyroHandler;
    NSDate *startTime;
    
}
-(IBAction)changeSlider;
-(IBAction)tapStBtn;
-(IBAction)tapEnBtn;
-(IBAction)tapsurinukeBtn;
//-(IBAction)selectVehicle;
-(void)output:(NSTimer*)timer;

@property (nonatomic, retain) IBOutlet UISwitch *backLight;

@end
