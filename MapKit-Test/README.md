MapKit
==

## Current Location

Link frameworks: `CoreLocation.framework, MapKit.framework`


In `Info.plist` file must be following `KEYS` and enter string "Location is required to find out where you are" in `VALUE`

```objc
//Put this KEY to Info.plist
NSLocationWhenInUseUsageDescription - KEY
NSLocationAlwaysUsageDescription - KEY
```

Request authorization

```objc
[self.locationManager requestWhenInUseAuthorization]
[self.locationManager requestAlwaysAuthorization] // in Background
```

//Check location on simulator
Debug > Simulate Location > Moscow



## Map

1. Display user location

2. Display car location with custom annotations

3. Display route between user location and car location