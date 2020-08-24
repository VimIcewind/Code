#import <Foundation/Foundation.h>

int main(int argc, const char *argv[])
{
	@autoreleasepool {
		NSDate *now = [NSDate date];
		NSLog(@"This NSDate object lives at %p", now);
		NSLog(@"The date is %@", now);

		double seconds = [now timeIntervalSince1970];
		NSLog(@"It has benn %f seconds since the start of 1970.", seconds);

		NSDate *later = [now dateByAddingTimeInterval:100000];
		NSLog(@"In 100,000 seconds it will be %@", later);
	}

	return 0;
}
