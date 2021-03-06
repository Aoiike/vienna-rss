//
//  ArticleFilter.h
//  Vienna
//
//  Created by Steve on 3/24/06.
//  Copyright (c) 2004-2006 Steve Palmer. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

@import Foundation;

@interface ArticleFilter : NSObject {
	NSString * name;
	NSInteger tag;
	SEL comparator;
}

// Public functions
+(NSArray *)arrayOfFilters;
+(ArticleFilter *)filterByTag:(NSInteger)theTag;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) NSInteger tag;
@property (nonatomic, readonly) SEL comparator;
@end
