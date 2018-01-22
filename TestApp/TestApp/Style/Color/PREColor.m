//
//  PREColor.m
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import "PREColor.h"

@implementation PREColor

#pragma mark - Constructors

+ (PREColor*)colorFromHex:(UInt32)col alpha:(CGFloat)alpha
{
	unsigned char r, g, b;
	b = col & 0xFF;
	g = (col >> 8) & 0xFF;
	r = (col >> 16) & 0xFF;

	return (PREColor*)[PREColor colorWithRed:(float)r / 255.0f green:(float)g / 255.0f blue:(float)b / 255.0f alpha:alpha];
}

+ (PREColor*)colorFromHex:(UInt32)col
{
	return (PREColor*)[PREColor colorFromHex:col alpha:1.];
}

+ (PREColor*)colorFromHexString:(NSString*)hexString
{
	unsigned rgbValue = 0;
	hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
	NSScanner* scanner = [NSScanner scannerWithString:hexString];
	[scanner scanHexInt:&rgbValue];

	return (PREColor*)[self colorWithR:((rgbValue & 0xFF0000) >> 16) G:((rgbValue & 0xFF00) >> 8) B:(rgbValue & 0xFF) A:1.0];
}
+ (PREColor*)colorFromRGBAArray:(NSArray*)rgbaArray
{
	if (rgbaArray.count < 4) {
		return (PREColor*)[self clearColor];
	}

	return (PREColor*)[self colorWithRed:[rgbaArray[0] floatValue]
								   green:[rgbaArray[1] floatValue]
									blue:[rgbaArray[2] floatValue]
								   alpha:[rgbaArray[3] floatValue]];
}

+ (PREColor*)colorFromRGBADictionary:(NSDictionary*)rgbaDict
{
	if (rgbaDict[kColoursRGBA_R] && rgbaDict[kColoursRGBA_G] && rgbaDict[kColoursRGBA_B] && rgbaDict[kColoursRGBA_A]) {
		return (PREColor*)[self colorWithRed:[rgbaDict[kColoursRGBA_R] floatValue]
									   green:[rgbaDict[kColoursRGBA_G] floatValue]
										blue:[rgbaDict[kColoursRGBA_B] floatValue]
									   alpha:[rgbaDict[kColoursRGBA_A] floatValue]];
	}

	return (PREColor*)[self clearColor];
}

#pragma mark - Color Info

+ (NSString*)hexStringFromColor:(PREColor*)color
{
	CGFloat r = 0, g = 0, b = 0, a = 0;
	if ([color respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
		[color getRed:&r green:&g blue:&b alpha:&a];
	} else {
		const CGFloat* components = CGColorGetComponents(color.CGColor);
		r = components[0];
		g = components[1];
		b = components[2];
		a = components[3];
	}

	NSArray* colorArray = @[ @(r), @(g), @(b), @(a) ];
	int r2 = [colorArray[0] floatValue] * 255;
	int g2 = [colorArray[1] floatValue] * 255;
	int b2 = [colorArray[2] floatValue] * 255;
	NSString* red = [NSString stringWithFormat:@"%02x", r2];
	NSString* green = [NSString stringWithFormat:@"%02x", g2];
	NSString* blue = [NSString stringWithFormat:@"%02x", b2];

	return [NSString stringWithFormat:@"#%@%@%@", red, green, blue];
}

- (NSString*)hexString
{
	NSArray* colorArray = [self rgbaArray];
	int r = [colorArray[0] floatValue] * 255;
	int g = [colorArray[1] floatValue] * 255;
	int b = [colorArray[2] floatValue] * 255;
	NSString* red = [NSString stringWithFormat:@"%02x", r];
	NSString* green = [NSString stringWithFormat:@"%02x", g];
	NSString* blue = [NSString stringWithFormat:@"%02x", b];

	return [NSString stringWithFormat:@"#%@%@%@", red, green, blue];
}

- (NSArray*)rgbaArray
{
	CGFloat r = 0, g = 0, b = 0, a = 0;

	if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
		[self getRed:&r green:&g blue:&b alpha:&a];
	} else {
		const CGFloat* components = CGColorGetComponents(self.CGColor);
		r = components[0];
		g = components[1];
		b = components[2];
		a = components[3];
	}

	return @[ @(r),
		@(g),
		@(b),
		@(a) ];
}

- (NSDictionary*)rgbaDictionary
{
	CGFloat r = 0, g = 0, b = 0, a = 0;
	if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
		[self getRed:&r green:&g blue:&b alpha:&a];
	} else {
		const CGFloat* components = CGColorGetComponents(self.CGColor);
		r = components[0];
		g = components[1];
		b = components[2];
		a = components[3];
	}

	return @{ kColoursRGBA_R : @(r),
		kColoursRGBA_G : @(g),
		kColoursRGBA_B : @(b),
		kColoursRGBA_A : @(a) };
}

#pragma mark - Application Colors

+ (PREColor*)systemInfoBlue
{
	return [PREColor colorFromHex:0x2F70FF];
}
+ (PREColor*)systemSuccess
{
	return [PREColor colorFromHex:0x53D76A];
}
+ (PREColor*)systemWarning
{
	return [PREColor colorFromHex:0xDDAA3B];
}
+ (PREColor*)systemError
{
	return [PREColor colorFromHex:0xDD3B3B];
}

#pragma mark - -----> MUST READ <-----

/*****************************************************************
 * INFO: Color Naming can be obtained from hex in:
     http://chir.ag/projects/name-that-color/#6195ED
 ******************************************************************/

#pragma mark - Corporate Target Colors

// Whites
+ (PREColor*)corporateAlbescentWhite
{
	return [self colorFromHex:0xF5DBCA];
}
+ (PREColor*)corporateLinenWhite
{
	return [PREColor colorFromHex:0xfdfbf2];
}
+ (PREColor*)corporatePolarWhite
{
	return [PREColor colorFromHex:0xFBFDFE];
}
+ (PREColor*)corporateSeashellWhite
{
	return [PREColor colorFromHex:0xF1F1F1];
}

// Grays
+ (PREColor*)corporateBattleshipGray
{
	return [self colorFromHex:0x8A9170];
}
+ (PREColor*)corporateRegentGray
{
	return [self colorFromHex:0x8D9CA9];
}
+ (PREColor*)corporateSilverChaliceGray
{
	return [self colorFromHex:0xADAAAA];
}

// Blues
+ (PREColor*)corporateAzureBlue
{
	return [self colorFromHex:0x32679b];
}
+ (PREColor*)corporateMatisseBlue
{
	return [self colorFromHex:0x16699F];
}
+ (PREColor*)corporateCuttySarkBlue
{
	return [self colorFromHex:0x547980];
}
+ (PREColor*)corporateKeppelBlue
{
	return [self colorFromHex:0x45ADA8];
}
+ (PREColor*)corporateRegentStBlue
{
	return [self colorFromHex:0x9DCCE1];
}
+ (PREColor*)corporateVikingBlue
{
	return [self colorFromHex:0x54CFC9];
}
+ (PREColor*)corporateDanubeBlue
{
	return [self colorFromHex:0x7FAED7];
}
+ (PREColor*)corporateChathamsBlue
{
	return [self colorFromHex:0x175579];
}
+ (PREColor*)corporateAnakiwaBlue
{
	return [self colorFromHex:0xADCFFF];
}
+ (PREColor*)corporateStTropazBlue
{
	return [self colorFromHex:0x2B669B];
}
+ (PREColor*)corporateSteelBlue
{
	return [self colorFromHex:0x417CA8];
}
+ (PREColor*)corporateIcebergBlue
{
	return [self colorFromHex:0xD7F0F4];
}
+ (PREColor*)corporateLimedSpruceBlue
{
	return [self colorFromHex:0x2F484B];
}
+ (PREColor*)corporateDodgerBlue
{
	return [self colorFromHex:0x3478F6];
}
+ (PREColor*)corporateHavelockBlue
{
	return [self colorFromHex:0x509FD6];
}
+ (PREColor*)corporateCeruleanBlue
{
	return [self colorFromHex:0x00A7D4];
}
+ (PREColor*)corporateCeruleanBlueBlue
{
	return [self colorFromHex:0x2B57B6];
}
+ (PREColor*)corporateSmaltBlue
{
	return [self colorFromHex:0x4F7D87];
}
+ (PREColor*)corporateToreaBayBlue
{
	return [self colorFromHex:0x112FB6];
}
+ (PREColor*)corporateFireflyBlue
{
	return [self colorFromHex:0x0C2A31];
}
+ (PREColor*)corporateNileBlue
{
	return [self colorFromHex:0x1A4C56];
}

// Greens
+ (PREColor*)corporateLimeGreen
{
	return [self colorFromHex:0x8fdb36];
}
+ (PREColor*)corporateMimosaGreen
{
	return [self colorFromHex:0xE5FCC2];
}
+ (PREColor*)corporateSpringLeavesGreenColor
{
	return [self colorFromHex:0x5A8C5B];
}
+ (PREColor*)corporateAquamarineGreen
{
	return [self colorFromHex:0x9DFFEA];
}
+ (PREColor*)corporateChristiGreen
{
	return [self colorFromHex:0x70B611];
}
+ (PREColor*)corporateVidaLocaGreen
{
	return [self colorFromHex:0x5EA61C];
}
+ (PREColor*)corporateSuluGreen
{
	return [self colorFromHex:0xBFF28C];
}
+ (PREColor*)corporateLimeadeGreen
{
	return [self colorFromHex:0x6F9D02];
}
+ (PREColor*)corporateSnowFlurryGreen
{
	return [self colorFromHex:0xEAFFD1];
}

// Reds
+ (PREColor*)corporateMatrixRed
{
	return [self colorFromHex:0xA9575B];
}
+ (PREColor*)corporateCanCanRed
{
	return [self colorFromHex:0xD59595];
}
+ (PREColor*)corporateCannonPink
{
	return [self colorFromHex:0x80445E];
}
+ (PREColor*)corporateNewYorkPink
{
	return [self colorFromHex:0xDB8380];
}
+ (PREColor*)corporateAuChicoRed
{
	return [self colorFromHex:0x8C5D5A];
}
+ (PREColor*)corporateCarnationPink
{
	return [self colorFromHex:0xFFADC1];
}
+ (PREColor*)corporateCinnabarRed
{
	return [self colorFromHex:0xEB4E3D];
}
+ (PREColor*)corporateWellReadRed
{
	return [self colorFromHex:0xB63F32];
}
+ (PREColor*)corporateShirazRed
{
	return [self colorFromHex:0xB61137];
}

// Purples
+ (PREColor*)corporateAuberginePurple
{
	return [self colorFromHex:0x30050E];
}

// Yellows
+ (PREColor*)corporateSaharaSandYellow
{
	return [self colorFromHex:0xF3F092];
}
+ (PREColor*)corporateCheninYellow
{
	return [self colorFromHex:0xDBD680];
}
+ (PREColor*)corporateWattleYellow
{
	return [self colorFromHex:0xD3D73C];
}

// Oranges
+ (PREColor*)corporateNewOrleansOrange
{
	return [self colorFromHex:0xF3D692];
}
+ (PREColor*)corporatePomeGranateOrange
{
	return [self colorFromHex:0xED4113];
}
+ (PREColor*)corporateCalicoOrange
{
	return [self colorFromHex:0xDBB380];
}
+ (PREColor*)corporateJaffaOrange
{
	return [self colorFromHex:0xEF8633];
}

// Browns
+ (PREColor*)corporateTemptressBrown
{
	return [self colorFromHex:0x3C0100];
}
+ (PREColor*)corporateSandalBrown
{
	return [self colorFromHex:0xB08074];
}

#pragma mark - DowJones Target Colors

+ (PREColor*)dowJonesSeashellWhite
{
	return [PREColor colorFromHex:0xF1F1F1];
}

+ (PREColor*)dowJonesCodGray
{
	return [PREColor colorFromHex:0x141414];
}

+ (PREColor*)dowJonesTundoraGray
{
	return [PREColor colorFromHex:0x464646];
}

+ (PREColor*)dowJonesDoveGray
{
	return [PREColor colorFromHex:0x666666];
}

+ (PREColor*)dowJonesSilverChaliceGray
{
	return [PREColor colorFromHex:0xADAAAA];
}

#pragma mark - Color Modifications

- (PREColor*)colorByApplyingSaturation:(CGFloat)newSaturation brightness:(CGFloat)newBrightness
{
	CGFloat hue, saturation, brightness, alpha;
	[self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];

	return (PREColor*)[PREColor colorWithHue:hue saturation:newSaturation brightness:newBrightness alpha:alpha];
}

- (PREColor*)colorByApplyingBrightness:(CGFloat)newBrightness
{
	CGFloat hue, saturation, brightness, alpha;
	[self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];

	return (PREColor*)[PREColor colorWithHue:hue saturation:saturation brightness:newBrightness alpha:alpha];
}

+ (PREColor*)darkerColorForColor:(PREColor*)color
{
	return [[self class] darkerColorForColor:color withPercentage:20];
}

+ (PREColor*)lighterColorForColor:(PREColor*)color
{
	return [[self class] lighterColorForColor:color withPercentage:20];
}

+ (PREColor*)darkerColorForColor:(PREColor*)color withPercentage:(NSInteger)percentage
{
	CGFloat ratio = percentage / 100.f;
	ratio = MIN(ratio, 1);
	ratio = MAX(ratio, 0);

	CGFloat r, g, b, a;

	[color getRed:&r green:&g blue:&b alpha:&a];

	return (PREColor*)[PREColor colorWithRed:MAX(r - ratio, 0.0)
									   green:MAX(g - ratio, 0.0)
										blue:MAX(b - ratio, 0.0)
									   alpha:a];
}

+ (PREColor*)lighterColorForColor:(PREColor*)color withPercentage:(NSInteger)percentage
{
	CGFloat ratio = percentage / 100.f;
	ratio = MIN(ratio, 1);
	ratio = MAX(ratio, 0);

	CGFloat r, g, b, a;

	[color getRed:&r green:&g blue:&b alpha:&a];

	return (PREColor*)[PREColor colorWithRed:MIN(r + ratio, 1.0)
									   green:MIN(g + ratio, 1.0)
										blue:MIN(b + ratio, 1.0)
									   alpha:a];
}

#pragma mark - Color Contrasting

//https://en.wikipedia.org/wiki/Luma_%28video%29
+ (PREColor*)blackOrWhiteContrastingColorForColor:(PREColor*)color
{
	CGFloat r = 0, g = 0, b = 0, a = 0;

	if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
		[color getRed:&r green:&g blue:&b alpha:&a];
	} else {
		const CGFloat* components = CGColorGetComponents(color.CGColor);
		r = components[0];
		g = components[1];
		b = components[2];
		a = components[3];
	}

	NSArray* rgbaArray = @[ @(r), @(g), @(b), @(a) ];

	double m = 1 - ((0.299 * [rgbaArray[0] doubleValue]) + (0.587 * [rgbaArray[1] doubleValue]) + (0.114 * [rgbaArray[2] doubleValue]));

	return (PREColor*)(m < 0.5 ? [[self class] blackColor] : [[self class] whiteColor]);
}

+ (PREColorLumaMode)lumaModeForColor:(PREColor*)color;
{
	PREColor* lumaColor = [[self class] blackOrWhiteContrastingColorForColor:color];

	if (CGColorEqualToColor(lumaColor.CGColor, [[self class] blackColor].CGColor))
		return PREColorLumaModeDark;
	else
		return PREColorLumaModeLight;
}

#pragma mark - Color Basics

+ (PREColor*)clearColor
{
	return (PREColor*)[UIColor clearColor];
}
+ (PREColor*)whiteColor
{
	return (PREColor*)[self colorFromHex:0xFFFFFF];
}
+ (PREColor*)blackColor
{
	return (PREColor*)[self colorFromHex:0x000000];
}
+ (PREColor*)blueColor
{
	return (PREColor*)[self colorFromHex:0x0000FF];
}
+ (PREColor*)brownColor
{
	return (PREColor*)[self colorFromHex:0xA52A2A];
}
+ (PREColor*)cyanColor
{
	return (PREColor*)[self colorFromHex:0x00FFFF];
}
+ (PREColor*)gray10Color
{
	return (PREColor*)[self colorFromHex:0x191919];
}
+ (PREColor*)gray20Color
{
	return (PREColor*)[self colorFromHex:0x333333];
}
+ (PREColor*)gray30Color
{
	return (PREColor*)[self colorFromHex:0x4C4C4C];
}
+ (PREColor*)gray40Color
{
	return (PREColor*)[self colorFromHex:0x666666];
}
+ (PREColor*)gray50Color
{
	return (PREColor*)[self colorFromHex:0x7F7F7F];
}
+ (PREColor*)gray60Color
{
	return (PREColor*)[self colorFromHex:0x999999];
}
+ (PREColor*)gray70Color
{
	return (PREColor*)[self colorFromHex:0xB2B2B2];
}
+ (PREColor*)gray80Color
{
	return (PREColor*)[self colorFromHex:0xCCCCCC];
}
+ (PREColor*)gray90Color
{
	return (PREColor*)[self colorFromHex:0xE5E5E5];
}
+ (PREColor*)grayColor
{
	return [self gray50Color];
}
+ (PREColor*)lightGrayColor
{
	return [self gray30Color];
}
+ (PREColor*)darkGrayColor
{
	return [self gray70Color];
}
+ (PREColor*)greenColor
{
	return (PREColor*)[self colorFromHex:0x00FF00];
}
+ (PREColor*)magentaColor
{
	return (PREColor*)[self colorFromHex:0xFF00FF];
}
+ (PREColor*)orangeColor
{
	return (PREColor*)[self colorFromHex:0xFF8000];
}
+ (PREColor*)purpleColor
{
	return (PREColor*)[self colorFromHex:0x800080];
}
+ (PREColor*)redColor
{
	return (PREColor*)[self colorFromHex:0xFF0000];
}
+ (PREColor*)yellowColor
{
	return (PREColor*)[self colorFromHex:0xFFFF00];
}

#pragma mark - RGBA Helper method
+ (PREColor*)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha
{
	return (PREColor*)[[self class] colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:alpha];
}

@end

@implementation UIColor (Hex)

- (uint32_t)hexValue
{
	const CGFloat* rgba = CGColorGetComponents(self.CGColor);
	uint8_t red = rgba[0] * 255;
	uint8_t green = rgba[1] * 255;
	uint8_t blue = rgba[2] * 255;
	return (red << 16) + (green << 8) + blue;
}

+ (uint32_t)hexFromString:(NSString*)string
{
	uint32_t hex = 0;

	if ([string length] > 0) {
		if ([string length] == 9 && [[string substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"#"]) {
			string = [string stringByReplacingOccurrencesOfString:@"#" withString:@""];
			string = [string substringToIndex:[string length] - 2];
		} else {
			NSArray* components = [string componentsSeparatedByString:@","];

			float r = 0.0;
			float g = 0.0;
			float b = 0.0;

			if ([components count] >= 1) {
				NSString* s = components[0];
				if (s.length) {
					s = [s substringFromIndex:1];
					r = s.floatValue;
				}
				if ([components count] >= 2) {
					g = ((NSString*)components[1]).floatValue;

					if ([components count] >= 3) {
						b = ((NSString*)components[2]).floatValue;
					}
				}
			}

			int red = (int)(255.0 * r);
			int green = (int)(255.0 * g);
			int blue = (int)(255.0 * b);

			string = [NSString stringWithFormat:@"%02x%02x%02x", red, green, blue];
		}
	}

	NSScanner* scanner = [NSScanner scannerWithString:string];
	unsigned hexNum;
	if ([scanner scanHexInt:&hexNum]) {
		hex = hexNum;
	}

	return hex;
}

@end
