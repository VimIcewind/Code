#import <Foundation/Foundation.h>

@interface Newspaper : NSObject
{

}
@end

@interface Dog : NSObject
{

}
- (Newspaper *) goGetTheNewspaper;
@end

int main(int argc, const char *argv[])
{
	@autoreleasepool {
		Dog *fido = nil;
		Newspaper *daily = [fido goGetTheNewspaper];
		NSLog(@"daily is %@", daily);
	}
	return 0;
}
