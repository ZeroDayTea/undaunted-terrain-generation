// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

Shader "Skybox/Night Sky" {
	Properties{
		//Procedural Sky things
		[KeywordEnum(None, Simple, High Quality)] _SunDisk("Sun", Int) = 2
		_SunSize("Sun Size", Range(0,1)) = 0.04
		_SunSizeConvergence("Sun Size Convergence", Range(1,10)) = 5

		_AtmosphereThickness("Atmosphere Thickness", Range(0,5)) = 1.0
		_SkyTint("Sky Tint", Color) = (.5, .5, .5, 1)
		_GroundColor("Ground", Color) = (.369, .349, .341, 1)

		_Exposure("Exposure", Range(0, 8)) = 1.3

		//NIGHT SKY PROPERTIES
		_BlendValue("Blend", Range(0.0, 1.0)) = 0.0
		_Seed("Seed", float) = 68.89
		_NightSkyColor("Night Sky color", Color) = (0.0, 0.06, 0.12, 1.0)

		[Header(Single star settings)]
		_Color("Stars color", Color) = (1.0, 1.0, 1.0, 1.0)
		[MinMax(0.4, 3.0)] _StarSizeRange("Star size range", Vector) = (0.6, 0.9, 0.0, 0.0)

		[Header(Density settings)]
		_Layers("Layers", Range(1.0, 5.0)) = 5
		_Density("Density", Range(0.5, 4.0)) = 2.28
		_DensityMod("Density modulation", Range(1.1, 3.0)) = 1.95

		[Header(Brightness settings)]
		_Brightness("Contrast", Range(0.0, 3.0)) = 2.89
		_BrightnessMod("Brightness modulation", Range(1.01, 4.0)) = 3.0

		[Header(Background fog settings)]
		[Toggle(ENABLE_BACKGROUND_NOISE)] _EnableBackgroundNoise("Enable galaxy noise", Int) = 1
		[Space] _SkyFogColor("Sky fog color", Color) = (0.0, 0.33, 0.34, 1.0)
		_NoiseDensity("Noise density", Range(1.0, 30.0)) = 8.6

		//x - iterations, y - alpha mod, z - size mod
		[Space][NoiseParameters] _NoiseParams("Background noise parameters", Vector) = (0.75, 6.0, 0.795, 2.08)

		//x - scale, y - iterations, z - alpha mod, w - size mod
		[Space][NoiseParameters] _NoiseMaskParams("Background mask parameters", Vector) = (0.33, 6.0, 0.628, 2.11)

		//x,y - smoothstep, z - border, w - power
		[Space][NoiseCutParameters] _NoiseMaskParams2("Background cut parameters", Vector) = (0.07, -0.001, 0.51, 2.5)


		[Header(Moon settings)]
		[Toggle(ENABLE_MOON)] _EnableMoon("Enable moon", Int) = 1
		_MoonTex("Moon texture", 2D) = "black" {}
		_MoonTint("Moon tint color", Color) = (1.0, 1.0, 1.0, 1.0)
		//x,y - smoothstep, w - power, z - strength
		[Space][BloomParameters] _MoonBloomParams("Moon blooming parameters", Vector) = (10.0, -1.0, 0.3, 5.3)
		[Space] _MoonSize("Moon size", Range(0.0, 1.0)) = 0.095


		//Musi byc w skyboxie bo inaczej Unity krzyczyyyyyy xD
		//[HideInInspector] _SunDisk("Sun", Int) = 2

		

	}

		SubShader{
			Tags { "Queue" = "Background" "RenderType" = "Background" "PreviewType" = "Skybox" }
			Cull Off ZWrite Off

			Pass {

				CGPROGRAM
				//#pragma target 4.0
				#pragma vertex vert
				#pragma fragment frag

				//NIGHT SKY FEATURES
				#pragma shader_feature _ ENABLE_BACKGROUND_NOISE
				#pragma shader_feature _ ENABLE_MOON

				#include "UnityCG.cginc"
				#include "Lighting.cginc"
				#include "Includes/Utils.cginc"

				//NIGHT SKY VARIABLES AND FUNCTIONS
				struct vertexData
				{
					float4 vertex : POSITION;
				};

				struct fragmentData
				{
					float4  clipPos : SV_POSITION;
					float3  worldPos : TEXCOORD0;
				};

				fragmentData vert(vertexData vd)
				{
					fragmentData fd;
					fd.clipPos = UnityObjectToClipPos(vd.vertex);
					fd.worldPos = mul(unity_ObjectToWorld, vd.vertex).xyz;

					return fd;
				}

				#define PI 3.141592653589793238462

				float4 _Color;
				float4 _NightSkyColor;

				float2 _StarSizeRange;
				float _Density;
				float _Layers;
				float _DensityMod;
				float _BrightnessMod;
				float _Brightness;
				float _Seed;
				float _BlendValue;

				#if defined(ENABLE_BACKGROUND_NOISE)
					float4 _SkyFogColor;
					float _NoiseDensity;
					float4 _NoiseParams;
					float4 _NoiseMaskParams;
					float4 _NoiseMaskParams2;
				#endif

				#if defined(ENABLE_MOON)
					float _MoonSize;
					float4 _MoonTint;
					float4 _MoonBloomParams;
					sampler2D _MoonTex;
				#endif

				float stars(float3 rayDir, float sphereRadius, float sizeMod)
				{
					float3 spherePoint = rayDir * sphereRadius;

					float upAtan = atan2(spherePoint.y, length(spherePoint.xz)) + 4.0 * PI;

					float starSpaces = 1.0 / sphereRadius;
					float starSize = (sphereRadius * 0.0015) * fwidth(upAtan) * 1000.0 * sizeMod;
					upAtan -= fmod(upAtan, starSpaces) - starSpaces * 0.5;

					float numberOfStars = floor(sqrt(pow(sphereRadius, 2.0) * (1.0 - pow(sin(upAtan), 2.0))) * 3.0);

					float planeAngle = atan2(spherePoint.z, spherePoint.x) + 4.0 * PI;
					planeAngle = planeAngle - fmod(planeAngle, PI / numberOfStars);

					float2 randomPosition = hash22(float2(planeAngle, upAtan) + _Seed);

					float starLevel = sin(upAtan + starSpaces * (randomPosition.y - 0.5) * (1.0 - starSize)) * sphereRadius;
					float starDistanceToYAxis = sqrt(sphereRadius * sphereRadius - starLevel * starLevel);
					float starAngle = planeAngle + (PI * (randomPosition.x * (1.0 - starSize) + starSize * 0.5) / numberOfStars);
					float3 starCenter = float3(cos(starAngle) * starDistanceToYAxis, starLevel, sin(starAngle) * starDistanceToYAxis);

					float star = smoothstep(starSize, 0.0, distance(starCenter, spherePoint));

					return star;
				}

				float starModFromI(float i)
				{
					return lerp(_StarSizeRange.y, _StarSizeRange.x, smoothstep(1.0, _Layers, i));
				}

				//PROCEDURAL SKY THINGS
				#pragma multi_compile_local _SUNDISK_NONE _SUNDISK_SIMPLE _SUNDISK_HIGH_QUALITY
				

				uniform half _Exposure;     // HDR exposure
				uniform half3 _GroundColor;
				uniform half _SunSize;
				uniform half _SunSizeConvergence;
				uniform half3 _SkyTint;
				uniform half _AtmosphereThickness;

			#if defined(UNITY_COLORSPACE_GAMMA)
				#define GAMMA 2
				#define COLOR_2_GAMMA(color) color
				#define COLOR_2_LINEAR(color) color*color
				#define LINEAR_2_OUTPUT(color) sqrt(color)
			#else
				#define GAMMA 2.2
				// HACK: to get gfx-tests in Gamma mode to agree until UNITY_ACTIVE_COLORSPACE_IS_GAMMA is working properly
				#define COLOR_2_GAMMA(color) ((unity_ColorSpaceDouble.r>2.0) ? pow(color,1.0/GAMMA) : color)
				#define COLOR_2_LINEAR(color) color
				#define LINEAR_2_LINEAR(color) color
			#endif

				// RGB wavelengths
				// .35 (.62=158), .43 (.68=174), .525 (.75=190)
				static const float3 kDefaultScatteringWavelength = float3(.65, .57, .475);
				static const float3 kVariableRangeForScatteringWavelength = float3(.15, .15, .15);

				#define OUTER_RADIUS 1.025
				static const float kOuterRadius = OUTER_RADIUS;
				static const float kOuterRadius2 = OUTER_RADIUS * OUTER_RADIUS;
				static const float kInnerRadius = 1.0;
				static const float kInnerRadius2 = 1.0;

				static const float kCameraHeight = 0.0001;

				#define kRAYLEIGH (lerp(0.0, 0.0025, pow(_AtmosphereThickness,2.5)))      // Rayleigh constant
				#define kMIE 0.0010             // Mie constant
				#define kSUN_BRIGHTNESS 20.0    // Sun brightness

				#define kMAX_SCATTER 50.0 // Maximum scattering value, to prevent math overflows on Adrenos

				static const half kHDSundiskIntensityFactor = 15.0;
				static const half kSimpleSundiskIntensityFactor = 27.0;

				static const half kSunScale = 400.0 * kSUN_BRIGHTNESS;
				static const float kKmESun = kMIE * kSUN_BRIGHTNESS;
				static const float kKm4PI = kMIE * 4.0 * 3.14159265;
				static const float kScale = 1.0 / (OUTER_RADIUS - 1.0);
				static const float kScaleDepth = 0.25;
				static const float kScaleOverScaleDepth = (1.0 / (OUTER_RADIUS - 1.0)) / 0.25;
				static const float kSamples = 2.0; // THIS IS UNROLLED MANUALLY, DON'T TOUCH

				#define MIE_G (-0.990)
				#define MIE_G2 0.9801

				#define SKY_GROUND_THRESHOLD 0.02



				// fine tuning of performance. You can override defines here if you want some specific setup
				// or keep as is and allow later code to set it according to target api

				// if set vprog will output color in final color space (instead of linear always)
				// in case of rendering in gamma mode that means that we will do lerps in gamma mode too, so there will be tiny difference around horizon
				// #define SKYBOX_COLOR_IN_TARGET_COLOR_SPACE 0

				// sun disk rendering:
				// no sun disk - the fastest option
				#define SKYBOX_SUNDISK_NONE 0
				// simplistic sun disk - without mie phase function
				#define SKYBOX_SUNDISK_SIMPLE 1
				// full calculation - uses mie phase function
				#define SKYBOX_SUNDISK_HQ 2

				// uncomment this line and change SKYBOX_SUNDISK_SIMPLE to override material settings
				// #define SKYBOX_SUNDISK SKYBOX_SUNDISK_SIMPLE

			#ifndef SKYBOX_SUNDISK
				#if defined(_SUNDISK_NONE)
					#define SKYBOX_SUNDISK SKYBOX_SUNDISK_NONE
				#elif defined(_SUNDISK_SIMPLE)
					#define SKYBOX_SUNDISK SKYBOX_SUNDISK_SIMPLE
				#else
					#define SKYBOX_SUNDISK SKYBOX_SUNDISK_HQ
				#endif
			#endif

			#ifndef SKYBOX_COLOR_IN_TARGET_COLOR_SPACE
				#if defined(SHADER_API_MOBILE)
					#define SKYBOX_COLOR_IN_TARGET_COLOR_SPACE 1
				#else
					#define SKYBOX_COLOR_IN_TARGET_COLOR_SPACE 0
				#endif
			#endif

				// Calculates the Rayleigh phase function
				half getRayleighPhase(half eyeCos2)
				{
					return 0.75 + 0.75*eyeCos2;
				}
				half getRayleighPhase(half3 light, half3 ray)
				{
					half eyeCos = dot(light, ray);
					return getRayleighPhase(eyeCos * eyeCos);
				}


				struct appdata_t
				{
					float4 vertex : POSITION;
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					float4  pos             : SV_POSITION;

				#if SKYBOX_SUNDISK == SKYBOX_SUNDISK_HQ
					// for HQ sun disk, we need vertex itself to calculate ray-dir per-pixel
					float3  vertex          : TEXCOORD0;
				#elif SKYBOX_SUNDISK == SKYBOX_SUNDISK_SIMPLE
					half3   rayDir          : TEXCOORD0;
				#else
					// as we dont need sun disk we need just rayDir.y (sky/ground threshold)
					half    skyGroundFactor : TEXCOORD0;
				#endif

					// calculate sky colors in vprog
					half3   groundColor     : TEXCOORD1;
					half3   skyColor        : TEXCOORD2;

				#if SKYBOX_SUNDISK != SKYBOX_SUNDISK_NONE
					half3   sunColor        : TEXCOORD3;
				#endif

					UNITY_VERTEX_OUTPUT_STEREO
				};


				float scale(float inCos)
				{
					float x = 1.0 - inCos;
					return 0.25 * exp(-0.00287 + x * (0.459 + x * (3.83 + x * (-6.80 + x * 5.25))));
				}

				v2f vert(appdata_t v)
				{
					v2f OUT;
					UNITY_SETUP_INSTANCE_ID(v);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(OUT);
					OUT.pos = UnityObjectToClipPos(v.vertex);

					float3 kSkyTintInGammaSpace = COLOR_2_GAMMA(_SkyTint); // convert tint from Linear back to Gamma
					float3 kScatteringWavelength = lerp(
						kDefaultScatteringWavelength - kVariableRangeForScatteringWavelength,
						kDefaultScatteringWavelength + kVariableRangeForScatteringWavelength,
						half3(1,1,1) - kSkyTintInGammaSpace); // using Tint in sRGB gamma allows for more visually linear interpolation and to keep (.5) at (128, gray in sRGB) point
					float3 kInvWavelength = 1.0 / pow(kScatteringWavelength, 4);

					float kKrESun = kRAYLEIGH * kSUN_BRIGHTNESS;
					float kKr4PI = kRAYLEIGH * 4.0 * 3.14159265;

					float3 cameraPos = float3(0,kInnerRadius + kCameraHeight,0);    // The camera's current position

					// Get the ray from the camera to the vertex and its length (which is the far point of the ray passing through the atmosphere)
					float3 eyeRay = normalize(mul((float3x3)unity_ObjectToWorld, v.vertex.xyz));

					float far = 0.0;
					half3 cIn, cOut;

					if (eyeRay.y >= 0.0)
					{
						// Sky
						// Calculate the length of the "atmosphere"
						far = sqrt(kOuterRadius2 + kInnerRadius2 * eyeRay.y * eyeRay.y - kInnerRadius2) - kInnerRadius * eyeRay.y;

						float3 pos = cameraPos + far * eyeRay;

						// Calculate the ray's starting position, then calculate its scattering offset
						float height = kInnerRadius + kCameraHeight;
						float depth = exp(kScaleOverScaleDepth * (-kCameraHeight));
						float startAngle = dot(eyeRay, cameraPos) / height;
						float startOffset = depth * scale(startAngle);


						// Initialize the scattering loop variables
						float sampleLength = far / kSamples;
						float scaledLength = sampleLength * kScale;
						float3 sampleRay = eyeRay * sampleLength;
						float3 samplePoint = cameraPos + sampleRay * 0.5;

						// Now loop through the sample rays
						float3 frontColor = float3(0.0, 0.0, 0.0);
						// Weird workaround: WP8 and desktop FL_9_3 do not like the for loop here
						// (but an almost identical loop is perfectly fine in the ground calculations below)
						// Just unrolling this manually seems to make everything fine again.
		//              for(int i=0; i<int(kSamples); i++)
						{
							float height = length(samplePoint);
							float depth = exp(kScaleOverScaleDepth * (kInnerRadius - height));
							float lightAngle = dot(_WorldSpaceLightPos0.xyz, samplePoint) / height;
							float cameraAngle = dot(eyeRay, samplePoint) / height;
							float scatter = (startOffset + depth * (scale(lightAngle) - scale(cameraAngle)));
							float3 attenuate = exp(-clamp(scatter, 0.0, kMAX_SCATTER) * (kInvWavelength * kKr4PI + kKm4PI));

							frontColor += attenuate * (depth * scaledLength);
							samplePoint += sampleRay;
						}
						{
							float height = length(samplePoint);
							float depth = exp(kScaleOverScaleDepth * (kInnerRadius - height));
							float lightAngle = dot(_WorldSpaceLightPos0.xyz, samplePoint) / height;
							float cameraAngle = dot(eyeRay, samplePoint) / height;
							float scatter = (startOffset + depth * (scale(lightAngle) - scale(cameraAngle)));
							float3 attenuate = exp(-clamp(scatter, 0.0, kMAX_SCATTER) * (kInvWavelength * kKr4PI + kKm4PI));

							frontColor += attenuate * (depth * scaledLength);
							samplePoint += sampleRay;
						}



						// Finally, scale the Mie and Rayleigh colors and set up the varying variables for the pixel shader
						cIn = frontColor * (kInvWavelength * kKrESun);
						cOut = frontColor * kKmESun;
					}
					else
					{
						// Ground
						far = ((-kCameraHeight) / (min(-0.001, eyeRay.y)));

						float3 pos = cameraPos + far * eyeRay;

						// Calculate the ray's starting position, then calculate its scattering offset
						float depth = exp((-kCameraHeight) * (1.0 / kScaleDepth));
						float cameraAngle = dot(-eyeRay, pos);
						float lightAngle = dot(_WorldSpaceLightPos0.xyz, pos);
						float cameraScale = scale(cameraAngle);
						float lightScale = scale(lightAngle);
						float cameraOffset = depth * cameraScale;
						float temp = (lightScale + cameraScale);

						// Initialize the scattering loop variables
						float sampleLength = far / kSamples;
						float scaledLength = sampleLength * kScale;
						float3 sampleRay = eyeRay * sampleLength;
						float3 samplePoint = cameraPos + sampleRay * 0.5;

						// Now loop through the sample rays
						float3 frontColor = float3(0.0, 0.0, 0.0);
						float3 attenuate;
						//              for(int i=0; i<int(kSamples); i++) // Loop removed because we kept hitting SM2.0 temp variable limits. Doesn't affect the image too much.
										{
											float height = length(samplePoint);
											float depth = exp(kScaleOverScaleDepth * (kInnerRadius - height));
											float scatter = depth * temp - cameraOffset;
											attenuate = exp(-clamp(scatter, 0.0, kMAX_SCATTER) * (kInvWavelength * kKr4PI + kKm4PI));
											frontColor += attenuate * (depth * scaledLength);
											samplePoint += sampleRay;
										}

										cIn = frontColor * (kInvWavelength * kKrESun + kKmESun);
										cOut = clamp(attenuate, 0.0, 1.0);
									}

								#if SKYBOX_SUNDISK == SKYBOX_SUNDISK_HQ
									OUT.vertex = -v.vertex;
								#elif SKYBOX_SUNDISK == SKYBOX_SUNDISK_SIMPLE
									OUT.rayDir = half3(-eyeRay);
								#else
									OUT.skyGroundFactor = -eyeRay.y / SKY_GROUND_THRESHOLD;
								#endif

									// if we want to calculate color in vprog:
									// 1. in case of linear: multiply by _Exposure in here (even in case of lerp it will be common multiplier, so we can skip mul in fshader)
									// 2. in case of gamma and SKYBOX_COLOR_IN_TARGET_COLOR_SPACE: do sqrt right away instead of doing that in fshader

									OUT.groundColor = _Exposure * (cIn + COLOR_2_LINEAR(_GroundColor) * cOut);
									OUT.skyColor = _Exposure * (cIn * getRayleighPhase(_WorldSpaceLightPos0.xyz, -eyeRay));

								#if SKYBOX_SUNDISK != SKYBOX_SUNDISK_NONE
									// The sun should have a stable intensity in its course in the sky. Moreover it should match the highlight of a purely specular material.
									// This matching was done using the standard shader BRDF1 on the 5/31/2017
									// Finally we want the sun to be always bright even in LDR thus the normalization of the lightColor for low intensity.
									half lightColorIntensity = clamp(length(_LightColor0.xyz), 0.25, 1);
									#if SKYBOX_SUNDISK == SKYBOX_SUNDISK_SIMPLE
										OUT.sunColor = kSimpleSundiskIntensityFactor * saturate(cOut * kSunScale) * _LightColor0.xyz / lightColorIntensity;
									#else // SKYBOX_SUNDISK_HQ
										OUT.sunColor = kHDSundiskIntensityFactor * saturate(cOut) * _LightColor0.xyz / lightColorIntensity;
									#endif

								#endif

								#if defined(UNITY_COLORSPACE_GAMMA) && SKYBOX_COLOR_IN_TARGET_COLOR_SPACE
									OUT.groundColor = sqrt(OUT.groundColor);
									OUT.skyColor = sqrt(OUT.skyColor);
									#if SKYBOX_SUNDISK != SKYBOX_SUNDISK_NONE
										OUT.sunColor = sqrt(OUT.sunColor);
									#endif
								#endif

									return OUT;
								}


				// Calculates the Mie phase function
				half getMiePhase(half eyeCos, half eyeCos2)
				{
					half temp = 1.0 + MIE_G2 - 2.0 * MIE_G * eyeCos;
					temp = pow(temp, pow(_SunSize,0.65) * 10);
					temp = max(temp,1.0e-4); // prevent division by zero, esp. in half precision
					temp = 1.5 * ((1.0 - MIE_G2) / (2.0 + MIE_G2)) * (1.0 + eyeCos2) / temp;
					#if defined(UNITY_COLORSPACE_GAMMA) && SKYBOX_COLOR_IN_TARGET_COLOR_SPACE
						temp = pow(temp, .454545);
					#endif
					return temp;
				}

				// Calculates the sun shape
				half calcSunAttenuation(half3 lightPos, half3 ray)
				{
				#if SKYBOX_SUNDISK == SKYBOX_SUNDISK_SIMPLE
					half3 delta = lightPos - ray;
					half dist = length(delta);
					half spot = 1.0 - smoothstep(0.0, _SunSize, dist);
					return spot * spot;
				#else // SKYBOX_SUNDISK_HQ
					half focusedEyeCos = pow(saturate(dot(lightPos, ray)), _SunSizeConvergence);
					return getMiePhase(-focusedEyeCos, focusedEyeCos * focusedEyeCos);
				#endif
				}

				


				half4 frag (v2f IN, fragmentData fd) : SV_Target
				{
					half3 col = half3(0.0, 0.0, 0.0);

					// if y > 1 [eyeRay.y < -SKY_GROUND_THRESHOLD] - ground
					// if y >= 0 and < 1 [eyeRay.y <= 0 and > -SKY_GROUND_THRESHOLD] - horizon
					// if y < 0 [eyeRay.y > 0] - sky
					#if SKYBOX_SUNDISK == SKYBOX_SUNDISK_HQ
						half3 ray = normalize(mul((float3x3)unity_ObjectToWorld, IN.vertex));
						half y = ray.y / SKY_GROUND_THRESHOLD;
					#elif SKYBOX_SUNDISK == SKYBOX_SUNDISK_SIMPLE
						half3 ray = IN.rayDir.xyz;
						half y = ray.y / SKY_GROUND_THRESHOLD;
					#else
						half y = IN.skyGroundFactor;
					#endif

						// if we did precalculate color in vprog: just do lerp between them
						col = lerp(IN.skyColor, IN.groundColor, saturate(y));

					#if SKYBOX_SUNDISK != SKYBOX_SUNDISK_NONE
						if (y < 0.0)
						{
							col += IN.sunColor * calcSunAttenuation(_WorldSpaceLightPos0.xyz, -ray);
						}
					#endif

					#if defined(UNITY_COLORSPACE_GAMMA) && !SKYBOX_COLOR_IN_TARGET_COLOR_SPACE
						col = LINEAR_2_OUTPUT(col);
					#endif
					//col is the variable of the day sky color

					//NIGHT SKY CALCULATIONS
					float3 rayDir = normalize(fd.worldPos);

					float star = 0.0;
					for (float i = 1.0; i <= _Layers; i += 1.0)
					{
						star += stars(rayDir, _Density * pow(_DensityMod, i), starModFromI(i)) * (1.0 / pow(_BrightnessMod, i));
					}

					half4 nightskyColor = _NightSkyColor;

					#if defined(ENABLE_BACKGROUND_NOISE)
						float3 p = rayDir * _NoiseDensity + _Seed;
						float noise = layeredNoise13(p * _NoiseParams.x, _NoiseParams.y, _NoiseParams.z, _NoiseParams.w);
						float noise2 = layeredNoise13(p * _NoiseMaskParams.x * 0.05 + 21.32, _NoiseMaskParams.y, _NoiseMaskParams.z, _NoiseMaskParams.w);
						noise2 = pow(smoothstep(_NoiseMaskParams2.x, _NoiseMaskParams2.y, abs(noise2 - _NoiseMaskParams2.z)), _NoiseMaskParams2.w);
						nightskyColor += _SkyFogColor * noise2 * noise;
					#endif

						float4 sky = _Color * star * _Brightness + nightskyColor;

					#if defined(ENABLE_MOON)
						float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);
						float3 rightLightDir = -normalize(cross(lightDir, float3(0.0, 1.0, 0.0)));
						float3 upLightDir = -normalize(cross(rightLightDir, lightDir));

						float3x3 moonMatrix = float3x3(rightLightDir, upLightDir, lightDir);

						float3 moonUV = (mul(moonMatrix, rayDir)) / _MoonSize + float3(0.5, 0.5, 0.0);

						float4 moonCol = float4(0, 0, 0, 0);
						float moonBloom = pow(smoothstep(_MoonBloomParams.x, _MoonBloomParams.y, length(moonUV.xy - 0.5)), _MoonBloomParams.w) * _MoonBloomParams.z * (dot(rayDir, lightDir) * 0.5 + 0.5);

						if (moonUV.x > 0.0 && moonUV.x < 1.0 && moonUV.y > 0.0 && moonUV.y < 1.0 && moonUV.z > 0.0)
						{
							moonCol = tex2D(_MoonTex, moonUV.xy) * _MoonTint;
						}

						sky = lerp(sky, moonCol, moonCol.a) + moonBloom * _MoonTint;
					#endif
					//sky is the name of the variable of the night sky color

						
					//THE COLOR WE ARE RETURNING FOR GIVEN PIXEL
					half4 finaldaycolor = half4(col,1.0);
					half4 finalnightskycolor = half4(sky + _WorldSpaceLightPos0.w);
					
					half4 finalcolor = lerp(finaldaycolor, finalnightskycolor, _BlendValue);
					return finalcolor;

					}
					ENDCG
				}
	}


		Fallback Off
						CustomEditor "NightSkyEditor"
}