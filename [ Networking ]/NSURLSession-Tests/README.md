NSURLSession-Tests
==

В проект добавлен AFNetworkActivityLogger - логгер сети.

Добавляется в application:didFinishLaunchingWithOptions:
```
[[AFNetworkActivityLogger sharedLogger] startLogging];
```

## getJSON

- (IBAction)getJSonWasPressed:(id)sender
{
    NSURLSession *session = [NSURLSession sharedSession];

    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"];

    NSURLSessionDataTask *task = [session dataTaskWithURL:url
completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"%@", json);

}];

    [task resume];
}

## downloadFile

- (IBAction)downloadFileWasPressed:(id)sender 
{

}

## postJSON

- (IBAction)postJsonWasPressed:(id)sender
{

}
