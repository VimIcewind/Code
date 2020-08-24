#import <Foundation/Foundation.h>

int main(int argc, const char *argv[])
{
	@autoreleasepool {
		// This will be a runtime error: Segmentation fault
		// id delegate;
		id delegate = nil;
		NSLog(@"daily is %@", delegate);
	}
	return 0;
}
