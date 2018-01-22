//
//  PREColor.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PREColorLumaMode) {
	PREColorLumaModeLight,
	PREColorLumaModeDark
};

#pragma mark - Static String Keys
static NSString* kColoursRGBA_R = @"RGBA-r";
static NSString* kColoursRGBA_G = @"RGBA-g";
static NSString* kColoursRGBA_B = @"RGBA-b";
static NSString* kColoursRGBA_A = @"RGBA-a";

@interface PREColor : UIColor

#pragma mark - Constructors

+ (PREColor*)colorFromHex:(UInt32)col;
+ (PREColor*)colorFromHex:(UInt32)col alpha:(CGFloat)alpha;
+ (PREColor*)colorFromHexString:(NSString*)hexString;
+ (PREColor*)colorFromRGBAArray:(NSArray*)rgbaArray;
+ (PREColor*)colorFromRGBADictionary:(NSDictionary*)rgbaDict;

#pragma mark - Color Info

+ (NSString*)hexStringFromColor:(PREColor*)color;
- (NSArray*)rgbaArray;
- (NSDictionary*)rgbaDictionary;

#pragma mark - System Colors

+ (PREColor*)systemInfoBlue;
+ (PREColor*)systemSuccess;
+ (PREColor*)systemWarning;
+ (PREColor*)systemError;

#pragma mark - Corporate Target Colors

// Whites
+ (PREColor*)corporateAlbescentWhite;
+ (PREColor*)corporateLinenWhite;
+ (PREColor*)corporatePolarWhite;
+ (PREColor*)corporateSeashellWhite;

// Grays
+ (PREColor*)corporateBattleshipGray;
+ (PREColor*)corporateRegentGray;
+ (PREColor*)corporateSilverChaliceGray;

// Blues
+ (PREColor*)corporateAzureBlue;
+ (PREColor*)corporateMatisseBlue;
+ (PREColor*)corporateKeppelBlue;
+ (PREColor*)corporateRegentStBlue;
+ (PREColor*)corporateCuttySarkBlue;
+ (PREColor*)corporateChathamsBlue;
+ (PREColor*)corporateVikingBlue;
+ (PREColor*)corporateDanubeBlue;
+ (PREColor*)corporateAnakiwaBlue;
+ (PREColor*)corporateSteelBlue;
+ (PREColor*)corporateIcebergBlue;
+ (PREColor*)corporateLimedSpruceBlue;
+ (PREColor*)corporateStTropazBlue;
+ (PREColor*)corporateDodgerBlue;
+ (PREColor*)corporateHavelockBlue;
+ (PREColor*)corporateCeruleanBlue;
+ (PREColor*)corporateCeruleanBlueBlue;
+ (PREColor*)corporateSmaltBlue;
+ (PREColor*)corporateToreaBayBlue;
+ (PREColor*)corporateFireflyBlue;
+ (PREColor*)corporateNileBlue;

// Greens
+ (PREColor*)corporateLimeGreen;
+ (PREColor*)corporateMimosaGreen;
+ (PREColor*)corporateSpringLeavesGreenColor;
+ (PREColor*)corporateAquamarineGreen;
+ (PREColor*)corporateChristiGreen;
+ (PREColor*)corporateVidaLocaGreen;
+ (PREColor*)corporateSuluGreen;
+ (PREColor*)corporateLimeadeGreen;
+ (PREColor*)corporateSnowFlurryGreen;

// Reds
+ (PREColor*)corporateMatrixRed;
+ (PREColor*)corporateCanCanRed;
+ (PREColor*)corporateCannonPink;
+ (PREColor*)corporateNewYorkPink;
+ (PREColor*)corporateAuChicoRed;
+ (PREColor*)corporateCarnationPink;
+ (PREColor*)corporateCinnabarRed;
+ (PREColor*)corporateWellReadRed;
+ (PREColor*)corporateShirazRed;

// Purples
+ (PREColor*)corporateAuberginePurple;

// Yellows
+ (PREColor*)corporateSaharaSandYellow;
+ (PREColor*)corporateCheninYellow;
+ (PREColor*)corporateWattleYellow;

// Oranges
+ (PREColor*)corporateNewOrleansOrange;
+ (PREColor*)corporatePomeGranateOrange;
+ (PREColor*)corporateCalicoOrange;
+ (PREColor*)corporateJaffaOrange;

// Browns
+ (PREColor*)corporateSandalBrown;
+ (PREColor*)corporateTemptressBrown;

#pragma mark - DowJones Target Colors

+ (PREColor*)dowJonesSeashellWhite;
+ (PREColor*)dowJonesCodGray;
+ (PREColor*)dowJonesTundoraGray;
+ (PREColor*)dowJonesDoveGray;
+ (PREColor*)dowJonesSilverChaliceGray;

#pragma mark - Color Modifications

- (PREColor*)colorByApplyingSaturation:(CGFloat)newSaturation brightness:(CGFloat)newBrightness;
- (PREColor*)colorByApplyingBrightness:(CGFloat)newBrightness;

+ (PREColor*)darkerColorForColor:(PREColor*)color;
+ (PREColor*)lighterColorForColor:(PREColor*)color;
+ (PREColor*)darkerColorForColor:(PREColor*)color withPercentage:(NSInteger)percentage;
+ (PREColor*)lighterColorForColor:(PREColor*)color withPercentage:(NSInteger)percentage;

#pragma mark - Color Contrasting

+ (PREColor*)blackOrWhiteContrastingColorForColor:(PREColor*)color;
+ (PREColorLumaMode)lumaModeForColor:(PREColor*)color;

#pragma mark - Color Basics

+ (PREColor*)clearColor;
+ (PREColor*)whiteColor;
+ (PREColor*)grayColor;
+ (PREColor*)darkGrayColor;
+ (PREColor*)lightGrayColor;
+ (PREColor*)gray10Color;
+ (PREColor*)gray20Color;
+ (PREColor*)gray30Color;
+ (PREColor*)gray40Color;
+ (PREColor*)gray50Color;
+ (PREColor*)gray60Color;
+ (PREColor*)gray70Color;
+ (PREColor*)gray80Color;
+ (PREColor*)gray90Color;
+ (PREColor*)blackColor;
+ (PREColor*)blueColor;
+ (PREColor*)brownColor;
+ (PREColor*)cyanColor;
+ (PREColor*)greenColor;
+ (PREColor*)magentaColor;
+ (PREColor*)orangeColor;
+ (PREColor*)purpleColor;
+ (PREColor*)redColor;

+ (PREColor*)yellowColor;

@end

@interface UIColor (Hex)

- (uint32_t)hexValue;
+ (uint32_t)hexFromString:(NSString*)string;

@end
