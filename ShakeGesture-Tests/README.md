Shake Gesture
==


#pragma mark - Shake Gesture 

- (BOOL)canBecomeFirstResponder {
return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
if (UIEventSubtypeMotionShake) {

NSLog(@"I'm shaking!");

[self.view bringSubviewToFront:_blueView];
}
}