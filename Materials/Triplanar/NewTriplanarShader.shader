// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:3,spmd:0,trmd:0,grmd:1,uamb:True,mssp:True,bkdf:True,hqlp:True,rprd:True,enco:False,rmgx:True,imps:True,rpth:1,vtps:0,hqsc:True,nrmq:1,nrsp:2,vomd:1,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1098039,fgcg:0.5579802,fgcb:0.8117647,fgca:0,fgde:5E-05,fgrn:0,fgrf:30000,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33149,y:32716,varname:node_3138,prsc:2|diff-6590-OUT,spec-1438-OUT,gloss-2481-OUT,emission-754-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:3690,x:31868,y:32891,varname:node_3690,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:3114,x:31868,y:32668,prsc:2,pt:False;n:type:ShaderForge.SFN_Append,id:3804,x:32194,y:32791,varname:node_3804,prsc:2|A-3690-Y,B-3690-Z;n:type:ShaderForge.SFN_Append,id:2281,x:32194,y:32925,varname:node_2281,prsc:2|A-3690-X,B-3690-Z;n:type:ShaderForge.SFN_Append,id:9395,x:32194,y:33065,varname:node_9395,prsc:2|A-3690-X,B-3690-Y;n:type:ShaderForge.SFN_Abs,id:3758,x:32194,y:32659,varname:node_3758,prsc:2|IN-3114-OUT;n:type:ShaderForge.SFN_Multiply,id:5154,x:32379,y:32659,varname:node_5154,prsc:2|A-3758-OUT,B-3758-OUT;n:type:ShaderForge.SFN_Tex2d,id:1337,x:32402,y:32814,varname:node_1337,prsc:2,tex:2705afe39a557c04f90f31a7789b6f46,ntxv:0,isnm:False|UVIN-3804-OUT,TEX-508-TEX;n:type:ShaderForge.SFN_Tex2d,id:798,x:32402,y:33172,varname:node_798,prsc:2,tex:2705afe39a557c04f90f31a7789b6f46,ntxv:0,isnm:False|UVIN-9395-OUT,TEX-508-TEX;n:type:ShaderForge.SFN_FragmentPosition,id:6019,x:30739,y:33037,varname:node_6019,prsc:2;n:type:ShaderForge.SFN_Distance,id:3944,x:30914,y:33129,varname:node_3944,prsc:2|A-6019-XYZ,B-7649-XYZ;n:type:ShaderForge.SFN_Divide,id:1567,x:31113,y:33129,varname:node_1567,prsc:2|A-3944-OUT,B-4892-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4892,x:30914,y:33300,ptovrint:False,ptlb:TransitionDistance,ptin:_TransitionDistance,varname:node_4892,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:20;n:type:ShaderForge.SFN_Power,id:1641,x:31289,y:33129,varname:node_1641,prsc:2|VAL-1567-OUT,EXP-3197-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3197,x:31129,y:33300,ptovrint:False,ptlb:Faloff,ptin:_Faloff,varname:node_3197,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Clamp01,id:9240,x:31451,y:33129,varname:node_9240,prsc:2|IN-1641-OUT;n:type:ShaderForge.SFN_TexCoord,id:8939,x:31165,y:32813,varname:node_8939,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ValueProperty,id:1018,x:31153,y:32969,ptovrint:False,ptlb:BigTiling,ptin:_BigTiling,varname:node_1018,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:8437,x:31331,y:32851,varname:node_8437,prsc:2|A-8939-UVOUT,B-1018-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:7287,x:31165,y:32613,ptovrint:False,ptlb:Grass,ptin:_Grass,varname:node_7287,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1032,x:31489,y:32570,varname:node_1032,prsc:2,ntxv:0,isnm:False|TEX-7287-TEX;n:type:ShaderForge.SFN_Tex2d,id:7445,x:31489,y:32704,varname:node_7445,prsc:2,ntxv:0,isnm:False|UVIN-8437-OUT,TEX-7287-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:6091,x:31507,y:33297,ptovrint:False,ptlb:GrassNormal,ptin:_GrassNormal,varname:node_6091,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:968,x:31709,y:33125,varname:node_968,prsc:2,ntxv:0,isnm:False|TEX-6091-TEX;n:type:ShaderForge.SFN_Tex2d,id:4398,x:31709,y:33309,varname:node_4398,prsc:2,ntxv:0,isnm:False|UVIN-8437-OUT,TEX-6091-TEX;n:type:ShaderForge.SFN_ViewPosition,id:7649,x:30739,y:33190,varname:node_7649,prsc:2;n:type:ShaderForge.SFN_Slider,id:1438,x:32507,y:32642,ptovrint:False,ptlb:Specular,ptin:_Specular,varname:node_1438,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:2481,x:32493,y:32735,ptovrint:False,ptlb:Roughness,ptin:_Roughness,varname:node_2481,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:513,x:32402,y:32996,varname:node_513,prsc:2,ntxv:0,isnm:False|UVIN-2281-OUT,TEX-7287-TEX;n:type:ShaderForge.SFN_Multiply,id:754,x:32865,y:33020,varname:node_754,prsc:2|A-6590-OUT,B-5003-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5003,x:32705,y:33104,ptovrint:False,ptlb:EmissionAmount,ptin:_EmissionAmount,varname:node_5003,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.15;n:type:ShaderForge.SFN_Lerp,id:9512,x:31662,y:32716,varname:node_9512,prsc:2|A-1032-RGB,B-7445-RGB,T-9240-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:508,x:31694,y:32504,ptovrint:False,ptlb:Rock,ptin:_Rock,varname:node_508,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2705afe39a557c04f90f31a7789b6f46,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:7609,x:31934,y:33210,varname:node_7609,prsc:2|A-968-RGB,B-4398-RGB,T-9240-OUT;n:type:ShaderForge.SFN_If,id:6590,x:32865,y:32849,varname:node_6590,prsc:2|A-3690-Y,B-943-OUT,GT-6410-OUT,EQ-9451-RGB,LT-9451-RGB;n:type:ShaderForge.SFN_ValueProperty,id:943,x:32572,y:33104,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_943,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:-28;n:type:ShaderForge.SFN_ChannelBlend,id:6410,x:32608,y:32878,varname:node_6410,prsc:2,chbt:0|M-5154-OUT,R-1337-RGB,G-513-RGB,B-798-RGB;n:type:ShaderForge.SFN_Tex2d,id:9451,x:32598,y:33198,ptovrint:False,ptlb:Sand,ptin:_Sand,varname:node_9451,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:54e5848917bfbe2418a97527256be968,ntxv:0,isnm:False;proporder:4892-3197-1018-6091-1438-2481-5003-7287-508-943-9451;pass:END;sub:END;*/

Shader "Shader Forge/NewTriplanarShader" {
    Properties {
        _TransitionDistance ("TransitionDistance", Float ) = 20
        _Faloff ("Faloff", Float ) = 1
        _BigTiling ("BigTiling", Float ) = 0.5
        _GrassNormal ("GrassNormal", 2D) = "white" {}
        _Specular ("Specular", Range(0, 1)) = 0
        _Roughness ("Roughness", Range(0, 1)) = 1
        _EmissionAmount ("EmissionAmount", Float ) = 0.15
        _Grass ("Grass", 2D) = "white" {}
        _Rock ("Rock", 2D) = "white" {}
        _Height ("Height", Float ) = -28
        _Sand ("Sand", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "DEFERRED"
            Tags {
                "LightMode"="Deferred"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_DEFERRED
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile ___ UNITY_HDR_ON
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Grass; uniform float4 _Grass_ST;
            uniform float _Specular;
            uniform float _Roughness;
            uniform float _EmissionAmount;
            uniform sampler2D _Rock; uniform float4 _Rock_ST;
            uniform float _Height;
            uniform sampler2D _Sand; uniform float4 _Sand_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD7;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            void frag(
                VertexOutput i,
                out half4 outDiffuse : SV_Target0,
                out half4 outSpecSmoothness : SV_Target1,
                out half4 outNormal : SV_Target2,
                out half4 outEmission : SV_Target3 )
            {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = 1.0 - _Roughness; // Convert roughness to gloss
                float perceptualRoughness = _Roughness;
                float roughness = perceptualRoughness * perceptualRoughness;
/////// GI Data:
                UnityLight light; // Dummy light
                light.color = 0;
                light.dir = half3(0,1,0);
                light.ndotl = max(0,dot(normalDirection,light.dir));
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = 1;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
////// Specular:
                float3 specularColor = float3(_Specular,_Specular,_Specular);
                float specularMonochrome;
                float node_6590_if_leA = step(i.posWorld.g,_Height);
                float node_6590_if_leB = step(_Height,i.posWorld.g);
                float4 _Sand_var = tex2D(_Sand,TRANSFORM_TEX(i.uv0, _Sand));
                float3 node_3758 = abs(i.normalDir);
                float3 node_5154 = (node_3758*node_3758);
                float2 node_3804 = float2(i.posWorld.g,i.posWorld.b);
                float4 node_1337 = tex2D(_Rock,TRANSFORM_TEX(node_3804, _Rock));
                float2 node_2281 = float2(i.posWorld.r,i.posWorld.b);
                float4 node_513 = tex2D(_Grass,TRANSFORM_TEX(node_2281, _Grass));
                float2 node_9395 = float2(i.posWorld.r,i.posWorld.g);
                float4 node_798 = tex2D(_Rock,TRANSFORM_TEX(node_9395, _Rock));
                float3 node_6590 = lerp((node_6590_if_leA*_Sand_var.rgb)+(node_6590_if_leB*(node_5154.r*node_1337.rgb + node_5154.g*node_513.rgb + node_5154.b*node_798.rgb)),_Sand_var.rgb,node_6590_if_leA*node_6590_if_leB);
                float3 diffuseColor = node_6590; // Need this for specular when using metallic
                diffuseColor = EnergyConservationBetweenDiffuseAndSpecular(diffuseColor, specularColor, specularMonochrome);
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
/////// Diffuse:
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                diffuseColor *= 1-specularMonochrome;
////// Emissive:
                float3 emissive = (node_6590*_EmissionAmount);
/// Final Color:
                outDiffuse = half4( diffuseColor, 1 );
                outSpecSmoothness = half4( specularColor, gloss );
                outNormal = half4( normalDirection * 0.5 + 0.5, 1 );
                outEmission = half4( (node_6590*_EmissionAmount), 1 );
                outEmission.rgb += indirectSpecular * 1;
                outEmission.rgb += indirectDiffuse * diffuseColor;
                #ifndef UNITY_HDR_ON
                    outEmission.rgb = exp2(-outEmission.rgb);
                #endif
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Grass; uniform float4 _Grass_ST;
            uniform float _Specular;
            uniform float _Roughness;
            uniform float _EmissionAmount;
            uniform sampler2D _Rock; uniform float4 _Rock_ST;
            uniform float _Height;
            uniform sampler2D _Sand; uniform float4 _Sand_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = 1.0 - _Roughness; // Convert roughness to gloss
                float perceptualRoughness = _Roughness;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float3 specularColor = float3(_Specular,_Specular,_Specular);
                float specularMonochrome;
                float node_6590_if_leA = step(i.posWorld.g,_Height);
                float node_6590_if_leB = step(_Height,i.posWorld.g);
                float4 _Sand_var = tex2D(_Sand,TRANSFORM_TEX(i.uv0, _Sand));
                float3 node_3758 = abs(i.normalDir);
                float3 node_5154 = (node_3758*node_3758);
                float2 node_3804 = float2(i.posWorld.g,i.posWorld.b);
                float4 node_1337 = tex2D(_Rock,TRANSFORM_TEX(node_3804, _Rock));
                float2 node_2281 = float2(i.posWorld.r,i.posWorld.b);
                float4 node_513 = tex2D(_Grass,TRANSFORM_TEX(node_2281, _Grass));
                float2 node_9395 = float2(i.posWorld.r,i.posWorld.g);
                float4 node_798 = tex2D(_Rock,TRANSFORM_TEX(node_9395, _Rock));
                float3 node_6590 = lerp((node_6590_if_leA*_Sand_var.rgb)+(node_6590_if_leB*(node_5154.r*node_1337.rgb + node_5154.g*node_513.rgb + node_5154.b*node_798.rgb)),_Sand_var.rgb,node_6590_if_leA*node_6590_if_leB);
                float3 diffuseColor = node_6590; // Need this for specular when using metallic
                diffuseColor = EnergyConservationBetweenDiffuseAndSpecular(diffuseColor, specularColor, specularMonochrome);
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                half surfaceReduction;
                #ifdef UNITY_COLORSPACE_GAMMA
                    surfaceReduction = 1.0-0.28*roughness*perceptualRoughness;
                #else
                    surfaceReduction = 1.0/(roughness*roughness + 1.0);
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                indirectSpecular *= surfaceReduction;
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                diffuseColor *= 1-specularMonochrome;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = (node_6590*_EmissionAmount);
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Grass; uniform float4 _Grass_ST;
            uniform float _Specular;
            uniform float _Roughness;
            uniform float _EmissionAmount;
            uniform sampler2D _Rock; uniform float4 _Rock_ST;
            uniform float _Height;
            uniform sampler2D _Sand; uniform float4 _Sand_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float node_6590_if_leA = step(i.posWorld.g,_Height);
                float node_6590_if_leB = step(_Height,i.posWorld.g);
                float4 _Sand_var = tex2D(_Sand,TRANSFORM_TEX(i.uv0, _Sand));
                float3 node_3758 = abs(i.normalDir);
                float3 node_5154 = (node_3758*node_3758);
                float2 node_3804 = float2(i.posWorld.g,i.posWorld.b);
                float4 node_1337 = tex2D(_Rock,TRANSFORM_TEX(node_3804, _Rock));
                float2 node_2281 = float2(i.posWorld.r,i.posWorld.b);
                float4 node_513 = tex2D(_Grass,TRANSFORM_TEX(node_2281, _Grass));
                float2 node_9395 = float2(i.posWorld.r,i.posWorld.g);
                float4 node_798 = tex2D(_Rock,TRANSFORM_TEX(node_9395, _Rock));
                float3 node_6590 = lerp((node_6590_if_leA*_Sand_var.rgb)+(node_6590_if_leB*(node_5154.r*node_1337.rgb + node_5154.g*node_513.rgb + node_5154.b*node_798.rgb)),_Sand_var.rgb,node_6590_if_leA*node_6590_if_leB);
                o.Emission = (node_6590*_EmissionAmount);
                
                float3 diffColor = node_6590;
                float3 specColor = float3(_Specular,_Specular,_Specular);
                float specularMonochrome = max(max(specColor.r, specColor.g),specColor.b);
                diffColor *= (1.0-specularMonochrome);
                float roughness = _Roughness;
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
