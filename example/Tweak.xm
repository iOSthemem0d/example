 // Import Cephei is a must if your are using Cephei manager
#import <UIKit/UIKit.h> // You definitely need to import UIKit every time you create tweaks
#import "Variable.h"
#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>

// You can use your variable here but in my case I rather to import them to
// keep my codes tidy and avoid any confusion also you can name it however you like and make sure there's .h extension


// I'm going to group it so I can init it when switch are enabled, you don't have to group it and take a look at example code below if you don't want to use group
%group examplehaptic

// This is where you hook the classes that you find on FLEXible or limenos website

%hook UITabBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 { // this is a method you can find on UITabBarButton class

  %orig; // Always call %orig; if you want to run your code

  if(hapticStrength == 0) { // Here will check the values of UISegment if the users pick light option

    gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];

    [gen impactOccurred]; // This is where you declare in your variable

  } else if (hapticStrength == 1) { // Here will check the values of UISegment if the users pick medium option

    gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];

    [gen impactOccurred]; // This is where you declare in your variable

  } else if (hapticStrength== 2) { // Here will check the values of UISegment if the users pick heavy option

    gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];

    [gen impactOccurred]; // This is where you declare in your variable
  }
}
%end
%end


/*
%hook UITabBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 { // this is a method you can find on UITabBarButton class

  %orig; // Always call %orig; if you want to run your code

  if(enableTweak){ // If you don't want to group tweak then you can use this option and won't need to init the group hook in ctor

  if(hapticStrength == 0) { // Here will check the values of UISegment if the users pick light option

    gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];

    [gen impactOccurred]; // This is where you declare in your variable

  } else if (hapticStrength == 1) { // Here will check the values of UISegment if the users pick medium option

    gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];

    [gen impactOccurred]; // This is where you declare in your variable

  } else if (hapticStrength== 2) { // Here will check the values of UISegment if the users pick heavy option

    gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];

    [gen impactOccurred]; // This is where you declare in your variable
  }
}
}
%end

*/



// This is constructor

%ctor {

// You will need to change the identifier with yours and make sure you name it exactly same as what you name your prefs, in my case it's exampleprefs then it will post notification to plist when enable or disable the tweak
  HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.iOSthemem0d.exampleprefs"];

  // You will need to register your variable for prefs switch to enable/disable the tweak
  [preferences registerBool:&enableTweak default:NO forKey:@"enableTweak"];

// You will need to register your variable for Integer for the UISegment
    [preferences registerInteger:&hapticStrength default:0 forKey:@"hapticStrength"];

	// Here you need to register any more variables you have added

    // This is where I init the group hook if the switch are enable then it will init the tweak. You won't need this if you add "if(enableTweak)" below the method of the hook class
	  if (enableTweak) {
      %init(examplehaptic);
  }

}
