#import <Foundation/Foundation.h>

int main(int argc, const char *argv[])
{
	@autoreleasepool {
		NSDate *now = [NSDate date];
		NSDate *now1 = [[NSDate alloc] init];
		NSLog(@"This NSDate object lives at %p", now);
		NSLog(@"The date is %@", now);
		NSLog(@"This NSDate object lives at %p", now1);
		NSLog(@"The date is %@", now1);

		double seconds = [now timeIntervalSince1970];
		double seconds1 = [[NSDate date] timeIntervalSince1970];
		NSLog(@"It has benn %f seconds since the start of 1970.", seconds);
		NSLog(@"It has benn %f seconds since the start of 1970.", seconds1);

		NSDate *later = [now dateByAddingTimeInterval:100000];
		NSLog(@"In 100,000 seconds it will be %@", later);

		NSCalendar *cal = [NSCalendar currentCalendar];
		NSLog(@"My calendar is %@", [cal calendarIdentifier]);

		unsigned long day = [cal ordinalityOfUnit:NSDayCalendarUnit
						   inUnit:NSMonthCalendarUnit
						  forDate:now];
		NSLog(@"This is day %lu of the month", day);
	}

	return 0;
}
