#import <Foundation/Foundation.h>

int main(int argc, const char *argv[])
{
	@autoreleasepool {
		NSDate *now = [NSDate date];
		NSLog(@"This NSDate object lives at %p", now);
	}
	return 0;
}
