#import <Foundation/Foundation.h>

int main(int argc, const char *argv[])
{
	@autoreleasepool {
		NSDate *now = [NSDate date];
		NSLog(@"This NSDate object lives at %p", now);
		NSLog(@"The date is %@", now);

		double seconds = [now timeIntervalSince1970];
		NSLog(@"It has been %f seconds since the start of 1970.", seconds);
	}
	return 0;
}
