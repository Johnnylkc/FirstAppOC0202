//
//  AppDelegate.m
//  FirstAppOC0202
//
//  Created by 劉坤昶 on 2016/2/2.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

#import "AppDelegate.h"
#import "LandingVC.h"
#import "MainTVC.h"
#import "TestVC.h"
#import "Backendless.h"

@interface AppDelegate ()

@property(strong,nonatomic)UITabBarController *tabBarController;
@property(strong,nonatomic)UIImage *tabBarIcon;
@property(strong,nonatomic)UIImage *selectedIcon;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *logOrNot = [userDefault objectForKey:@"loggedIn"];
    NSLog(@"%@",logOrNot);
    
    
    if ([logOrNot isEqualToString:@"YES"] )
    {

        MainTVC *onePage = [MainTVC new];
        UINavigationController *onePageNav = [[UINavigationController alloc] initWithRootViewController:onePage];
        self.tabBarIcon = [UIImage imageNamed:@"001"];
        self.selectedIcon = [UIImage imageNamed:@"001"];
        onePage.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:@"第一頁" image:self.tabBarIcon selectedImage:self.selectedIcon];
        
        TestVC *twoPage = [TestVC new];
        self.tabBarIcon = [UIImage imageNamed:@"002"];
        self.selectedIcon = [UIImage imageNamed:@"002"];
        twoPage.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:@"第二頁" image:self.tabBarIcon selectedImage:self.selectedIcon];
        
        
        NSArray *controllers = [[NSArray alloc] initWithObjects:onePageNav,twoPage, nil];
        self.tabBarController = [UITabBarController new];
        self.tabBarController.viewControllers = controllers;
        self.tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = self.tabBarController;
        [self.window makeKeyAndVisible];
        
        [backendless initApp:@"2C0B46F7-6928-C06A-FF9F-DA8AEA086800"
                      secret:@"0AD8D1B9-FBF2-C393-FF72-E07F251B1D00"
                     version:@"v1"];
   
    }
    else if([logOrNot isEqualToString:@"NO"] )
    {
       

        LandingVC *controller = [LandingVC new];
        UINavigationController *controllerNav =
        [[UINavigationController alloc] initWithRootViewController:controller];
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = controllerNav;
        [self.window makeKeyAndVisible];
        
        [backendless initApp:@"2C0B46F7-6928-C06A-FF9F-DA8AEA086800"
                      secret:@"0AD8D1B9-FBF2-C393-FF72-E07F251B1D00"
                     version:@"v1"];

    }
    else
    {
        LandingVC *controller = [LandingVC new];
        UINavigationController *controllerNav =
        [[UINavigationController alloc] initWithRootViewController:controller];
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = controllerNav;
        [self.window makeKeyAndVisible];
        
        [backendless initApp:@"2C0B46F7-6928-C06A-FF9F-DA8AEA086800"
                      secret:@"0AD8D1B9-FBF2-C393-FF72-E07F251B1D00"
                     version:@"v1"];
        

    }
        
        
        
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.johnnyketchup.FirstAppOC0202" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"FirstAppOC0202" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"FirstAppOC0202.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
