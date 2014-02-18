//
//  ViewController.m
//  GAL
//
//  Created by Tsukasa Kamimura on 12/01/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define Hz 100 //動作周波数


@implementation ViewController

@synthesize backLight = backLight_;

-(IBAction)BackLigh:(id)sender{
 
    UIScreen* mainScreen = [UIScreen mainScreen];
    if(backLight_.isOn == YES){
        mainScreen.brightness = 0.6;
    }else{
        mainScreen.brightness = 0;
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View process
/*
-(IBAction)changeSlider{
    barLabel.text = [NSString stringWithFormat:@"%2.0f Hz",mySlider.value];
    Hz = mySlider.value;

}
 */
-(IBAction)tapStBtn{
    start.hidden = YES;
    end.hidden = NO;
    atFlg =  true;
    indexFlg = true; 
    
}

-(IBAction)tapEnBtn{
    start.hidden = NO;
    end.hidden = YES;
    atFlg = false;
}

-(IBAction)tapcalBtn{
    
    theta = atan((-accy/accz));
    thetaD = theta*(180/M_PI);
    
    Degree.text =  [NSString stringWithFormat:@"角度（%2.0f°）",
                    thetaD];
    
}
#pragma mark - data process


-(void)output:(NSTimer*)timer{
    /*
     double filter50[] = {0.00000000,0.00166228,0.00344176,0.00532626,0.00730224,0.00935489,0.01146832,0.01362567,0.01580929,0.01800096,0.02018205,0.02233370,0.02443706,0.02647348,0.02842470,0.03027307,0.03200171,0.03359474,0.03503743,0.03631635,0.03741957,0.03833674,0.03905923,0.03958022,0.03989481,0.04000000,0.03989481,0.03958022,0.03905923,0.03833674,0.03741957,0.03631635,0.03503743,0.03359474,0.03200171,0.03027307,0.02842470,0.02647348,0.02443706,0.02233370,0.02018205,0.01800096,0.01580929,0.01362567,0.01146832,0.00935489,0.00730224,0.00532626,0.00344176,0.00166228,0.00000000};

     //動作ごとに代入する　変更する必要ありと思われる
    dataHead  = (dataHead + 1) % 51;
    dataTail  = (dataTail + 1) % 51;
    MdataHead = (MdataHead + 1) % 5;
    MdataTail = (MdataTail + 1) % 5;
    
    accxData[dataHead] = accx;
    accyData[dataHead] = accy;
    acczData[dataHead] = accz;
    gyroxData[dataHead] = rx;
    gyroyData[dataHead] = ry;
    gyrozData[dataHead] = rz;
  
    for (int i =0; i <= 50; i++){
            //accxMData[MdataHead] += filter50[i] * accxData[MdataHead + i];
            accyMData[MdataHead] += filter50[i] * accyData[MdataHead + i];
            acczMData[MdataHead] += filter50[i] * acczData[MdataHead + i];
            //gyroxMData[MdataHead] += filter50[i] * gyroxData[MdataHead + i];
            gyroyMData[MdataHead] += filter50[i] * gyroyData[MdataHead + i];
            gyrozMData[MdataHead] += filter50[i] * gyrozData[MdataHead + i];
    }
    */              
    
    gyroX.text = [NSString stringWithFormat:@"Pitch(X) = %f",
                  rx];
    gyroY.text = [NSString stringWithFormat:@"Roll(Y) = %f",
                  ry];
    gyroZ.text = [NSString stringWithFormat:@"Yaw(Z) = %f",
                  rz];
    
    //int sisei;
    //double sum = 0;
    
    /*
    for(int i = 0; i <5 ; i++){
        sum+= gyroyMData[i];
    }
    
    if(sum > 1.5)
        sisei = 1;
    else if(sum < -1.5)
        sisei = 2;
    else 
        sisei = 3;
    
    int move;
    sum = 0;
    for(int i = 0; i <5 ; i++){
        sum += accyMData[i]; 
    }
        
    if(sum > 1)
        move = 1;
    else if(sum < -1)
        move = 2;
    else 
        move = 3;
    
    
    switch (sisei) {
        case 1:
            switch (move) {
                case 1:
                    kyodo.text = [NSString stringWithFormat:@"加速中"];
                    break;
                case 2:
                    kyodo.text = [NSString stringWithFormat:@"減速中"];
                    break;
                default:
                    kyodo.text = [NSString stringWithFormat:@"停止or定常走行"];
                    break;
            }
        case 2:
            switch (move) {
                case 1:
                    kyodo.text = [NSString stringWithFormat:@"右折立ち上がり"];
                    break;
                case 2:
                    kyodo.text = [NSString stringWithFormat:@"右折倒し込み"];
                    break;
                default:
                    kyodo.text = [NSString stringWithFormat:@"右折中"];
                    break;
            }    
            break;
        case 3:
            switch (move) {
                case 1:
                    kyodo.text = [NSString stringWithFormat:@"左折立ち上がり"];
                    break;
                case 2:
                    kyodo.text = [NSString stringWithFormat:@"左折倒し込み"];
                    break;
                default:
                    kyodo.text = [NSString stringWithFormat:@"左折中"];
                    break;
            }    
        default:
            kyodo.text = [NSString stringWithFormat:@"不明"];
            break;
    }
    */
    
    if(atFlg){
        
         
        //インデックスの出力
        if(indexFlg){
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"HH:mm:ss.SSS,";
            startTime = [NSDate date];
            NSString *startTimeStr = [dateFormatter stringFromDate:startTime];
            //NSString *GPStime2 = [dateFormatter stringFromDate:GPStime];
            indexFlg = FALSE;
            //NSString *indexLoc = [NSString stringWithFormat:@"\n%@lon,lat\n",startTimeStr];
            NSString *indexAcc = [NSString stringWithFormat:@"\n%@AccX,AccY,AccZ,AccX',AccY',AccZ',GyroX,GyroY,GyroZ,compass,Lat,Lon\n",startTimeStr];
            if(firstFlg){
                firstFlg = FALSE;
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
                NSString *documentDirectory = [paths objectAtIndex:0];
                NSString *fileName = [day stringByAppendingString:@"iOS.txt"];
                path1 = [documentDirectory stringByAppendingPathComponent:fileName];
                [[NSFileManager defaultManager ] createFileAtPath:path1 contents:nil attributes:nil];
                //fileName = [veh stringByAppendingString:[day stringByAppendingString:@"Loc.csv"]];
                //path2 = [documentDirectory stringByAppendingPathComponent:fileName];
                //[[NSFileManager defaultManager ] createFileAtPath:path2 contents:nil attributes:nil];
            }
            
            //NSData *indexLocData = [indexLoc dataUsingEncoding:NSUTF8StringEncoding];
            NSData *indexAccData = [indexAcc dataUsingEncoding:NSUTF8StringEncoding];
            //NSData *indexGPStime = [GPStime2 dataUsingEncoding:NSUTF8StringEncoding];
            
            NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:path1];
            [fh seekToEndOfFile];
            //[fh writeData:indexGPStime];
            [fh writeData:indexAccData];
            //fh = [NSFileHandle fileHandleForWritingAtPath:path2];
            //[fh seekToEndOfFile];
            //[fh writeData:indexGPStime];
            //[fh writeData:indexLocData];

        }
        
        //Locationにデータがないと落ちるため初期化！
        
        NSString *Gyro = [NSString stringWithFormat:@"¥t%f¥t%f¥t%f",rx,ry,rz];
        NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:startTime];
        NSString *now =  [NSString stringWithFormat:@"%f¥t",interval];
        lbltime.text = [NSString stringWithFormat:@"time:%f",
                      interval];

        //NSLog(@"\n\nnow--->%@\nLoc--->%@\nAcc--->%@\ngyro--->%@\nsurinuke--->%@\compass--->%@\n\n",now,Locations,Acc,Gyro,surinukeFlg,compassStr);
    
        //appendingの前後のNSStringにでーたがないと落ちるよ
        
        //NSString *outLocations = [now stringByAppendingString:Locations];
        NSString *outString = [now stringByAppendingString:Acc];
        outString = [outString stringByAppendingString:Gyro];
        outString = [outString stringByAppendingString:compassStr];
        outString = [outString stringByAppendingString:Locations];
        
        NSData *data = [outString dataUsingEncoding:NSUTF8StringEncoding];
        
        //加速度、ジャイロ出力
        NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:path1];
        [fh seekToEndOfFile];
        [fh writeData:data];
        //GPS情報出力
        /*
        data = [outLocations dataUsingEncoding:NSUTF8StringEncoding];
        fh = [NSFileHandle fileHandleForWritingAtPath:path2];
        [fh seekToEndOfFile];
        [fh writeData:data];
        */
        NSLog(@"Logging");
    }
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"ViewDidload");
    
    //各種初期化
    end.hidden = YES;
    Finish.hidden = YES;
    Acc = [NSString stringWithFormat:@"0¥t0¥t0¥t0¥t0"];
    compassStr = @"0";
    for(int i = 0;i <= 50; i++){
        accxData[i] = 0;
        accxData[i] = 0;
        accyData[i] = 0;
        acczData[i] = 0;
        gyroxData[i] = 0;
        gyroyData[i] = 0;
        gyrozData[i] = 0;
    }
    for(int i = 0;i <= 4; i++){
        accxMData[i] = 0;
        accxMData[i] = 0;
        accyMData[i] = 0;
        acczMData[i] = 0;
        gyroxMData[i] = 0;
        gyroyMData[i] = 0;
        gyrozMData[i] = 0;
    }
    
    dataHead = 50;
    dataTail = 0;
    MdataHead = 4;
    MdataTail = 0;
    
    //surinukeFlg = [NSString stringWithFormat:@",0"];
    atFlg = FALSE;
    firstFlg = TRUE;

    lm = [[CLLocationManager alloc] init];
    myDataLoc = [[NSMutableArray alloc] init];
    myDataAcc = [[NSMutableArray alloc] init];
    Acc = [NSString stringWithFormat:@"null"];
    
    
    NSDate* date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd_HH-mm-ss-";
    day = [dateFormatter stringFromDate:date];
    
    //GPS起動
    lm.delegate = self;//位置情報の通知先ココ
    lm.desiredAccuracy = kCLLocationAccuracyBest;//GPS精度　今回は最高レベル
    lm.distanceFilter = 1;//位置情報更新　今回は1m毎
    [lm startUpdatingLocation];
    [lm startUpdatingHeading];
    
    //AS起動
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.updateInterval = 1.0/Hz;
    accelerometer.delegate = self;
    
    //Gyro起動
    motionManager = [[CMMotionManager alloc] init];
    motionManager.gyroUpdateInterval = 1.0/Hz;
    if (motionManager.gyroAvailable) {
         opQ = [NSOperationQueue currentQueue];
        gyroHandler = ^ (CMGyroData *gyroData, NSError *error) {
          CMRotationRate rotate = gyroData.rotationRate;
            rx = rotate.x;
            ry = rotate.y; 
            rz = rotate.z;
        };
    } else {
        NSLog(@"No gyroscope on device.");
    }
    
    [motionManager startGyroUpdatesToQueue:opQ withHandler:gyroHandler];

    NSTimer *tm = [NSTimer scheduledTimerWithTimeInterval:1.0/Hz
                                                   target:self 
                                                 selector:@selector(output:) 
                                                 userInfo:nil
                                                  repeats:YES];
    
    [tm isValid];
    
	
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - sensor init


-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    if(shaking) return;
    shaking = TRUE;
    
    accx = acceleration.x;
    accy = acceleration.y;
    accz = acceleration.z;
    
    accyd = accy * cos(theta) + accz * sin(theta);
    acczd = -accy * sin(theta) + accz * cos(theta);
    
    NSString *logs;
    
    logs = [NSString stringWithFormat:@"Log = %f,%f",
     accyd,acczd];
    
    
    Acc = [NSString stringWithFormat:@"%f¥t%f¥t%f¥t%f¥t%f",accx,accy,accz,accyd,acczd];
    
    lblx.text = [NSString stringWithFormat:@"Acc(X)= %f",
                 accx];
    lbly.text = [NSString stringWithFormat:@"Acc(Y)= %f",
                 accyd];
    lblz.text = [NSString stringWithFormat:@"Acc(Z)= %f",
                 acczd];
    shaking = FALSE;
    
}

-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    //位置情報が取得されると行う処理
    
    lngLabel.text = [NSString stringWithFormat:@"Longitude＝%g",newLocation.coordinate.longitude];
    latLabel.text = [NSString stringWithFormat:@"Latitude＝%g",newLocation.coordinate.latitude];
    
    //GPStime = newLocation.timestamp;

    
    Locations = [NSString stringWithFormat:@"¥t%f¥t%f\n",newLocation.coordinate.latitude,newLocation.coordinate.longitude];
    
}

-(void) locationManager:(CLLocationManager *)manegaer didUpdateHeading:(CLHeading *)newHeading{
    //方角情報が取得されたら行う処理
    compassStr = [NSString stringWithFormat:@"¥t%g",newHeading.magneticHeading];
    compassImg.transform = CGAffineTransformMakeRotation(-newHeading.magneticHeading * M_PI/180);
}


@end
