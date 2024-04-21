#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_FLAG_IS_NORMAL_MAP normalTex
NGS_FLAG_IS_NORMAL_MAP detailNormalTex
NGS_BACKEND_SHADER_FLAGS_END__
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
    return 0;
}
}
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_SampleTexture
        #define sc_SampleTexture sc_SampleTextureBiasOrLevel
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler baseTexSmpSC 2:20
//sampler sampler detailNormalTexSmpSC 2:21
//sampler sampler intensityTextureSmpSC 2:22
//sampler sampler normalTexSmpSC 2:23
//sampler sampler opacityTexSmpSC 2:24
//sampler sampler sc_EnvmapDiffuseSmpSC 2:25
//sampler sampler sc_EnvmapSpecularSmpSC 2:26
//sampler sampler sc_SSAOTextureSmpSC 2:28
//sampler sampler sc_ScreenTextureSmpSC 2:29
//sampler sampler sc_ShadowTextureSmpSC 2:30
//texture texture2D baseTex 2:1:2:20
//texture texture2D detailNormalTex 2:2:2:21
//texture texture2D intensityTexture 2:3:2:22
//texture texture2D normalTex 2:4:2:23
//texture texture2D opacityTex 2:5:2:24
//texture texture2D sc_EnvmapDiffuse 2:6:2:25
//texture texture2D sc_EnvmapSpecular 2:7:2:26
//texture texture2D sc_SSAOTexture 2:16:2:28
//texture texture2D sc_ScreenTexture 2:17:2:29
//texture texture2D sc_ShadowTexture 2:18:2:30
//ubo int UserUniforms 2:32:4720 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[3]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 336:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 432
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1024
//float4 sc_EnvmapDiffuseDims 1040
//float4 sc_EnvmapDiffuseView 1056
//float4 sc_EnvmapSpecularSize 1072
//float4 sc_EnvmapSpecularDims 1088
//float4 sc_EnvmapSpecularView 1104
//float3 sc_EnvmapRotation 1120
//float sc_EnvmapExposure 1136
//float3 sc_Sh 1152:[9]:16
//float sc_ShIntensity 1296
//float4 sc_Time 1312
//float4 sc_UniformConstants 1328
//float4 sc_GeometryInfo 1344
//float4x4 sc_ModelViewProjectionMatrixArray 1360:[2]:64
//float4x4 sc_ModelViewProjectionMatrixInverseArray 1488:[2]:64
//float4x4 sc_ViewProjectionMatrixArray 1616:[2]:64
//float4x4 sc_ViewProjectionMatrixInverseArray 1744:[2]:64
//float4x4 sc_ModelViewMatrixArray 1872:[2]:64
//float4x4 sc_ModelViewMatrixInverseArray 2000:[2]:64
//float3x3 sc_ViewNormalMatrixArray 2128:[2]:48
//float3x3 sc_ViewNormalMatrixInverseArray 2224:[2]:48
//float4x4 sc_ProjectionMatrixArray 2320:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2448:[2]:64
//float4x4 sc_ViewMatrixArray 2576:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2704:[2]:64
//float4x4 sc_ModelMatrix 2832
//float4x4 sc_ModelMatrixInverse 2896
//float3x3 sc_NormalMatrix 2960
//float3x3 sc_NormalMatrixInverse 3008
//float3 sc_LocalAabbMin 3056
//float3 sc_LocalAabbMax 3072
//float3 sc_WorldAabbMin 3088
//float3 sc_WorldAabbMax 3104
//float4 sc_WindowToViewportTransform 3120
//sc_Camera_t sc_Camera 3136
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3168
//float4 sc_ShadowColor 3184
//float4x4 sc_ProjectorMatrix 3200
//float _sc_GetFramebufferColorInvalidUsageMarker 3264
//float shaderComplexityValue 3268
//float sc_DisableFrustumCullingMarker 3272
//float4 weights0 3280
//float4 weights1 3296
//float4 weights2 3312
//float4 sc_StereoClipPlanes 3328:[2]:16
//int sc_FallbackInstanceID 3360
//float _sc_framebufferFetchMarker 3364
//float2 sc_TAAJitterOffset 3368
//float strandWidth 3376
//float strandTaper 3380
//float4 sc_StrandDataMapTextureSize 3392
//float clumpInstanceCount 3408
//float clumpRadius 3412
//float clumpTipScale 3416
//float hairstyleInstanceCount 3420
//float hairstyleNoise 3424
//float4 sc_ScreenTextureSize 3440
//float4 sc_ScreenTextureDims 3456
//float4 sc_ScreenTextureView 3472
//float correctedIntensity 3488
//float4 intensityTextureSize 3504
//float4 intensityTextureDims 3520
//float4 intensityTextureView 3536
//float3x3 intensityTextureTransform 3552
//float4 intensityTextureUvMinMax 3600
//float4 intensityTextureBorderColor 3616
//float reflBlurWidth 3632
//float reflBlurMinRough 3636
//float reflBlurMaxRough 3640
//int overrideTimeEnabled 3644
//float overrideTimeElapsed 3648
//float overrideTimeDelta 3652
//int PreviewEnabled 3656
//int PreviewNodeID 3660
//float alphaTestThreshold 3664
//float3 recolorRed 3680
//float4 baseColor 3696
//float4 baseTexSize 3712
//float4 baseTexDims 3728
//float4 baseTexView 3744
//float3x3 baseTexTransform 3760
//float4 baseTexUvMinMax 3808
//float4 baseTexBorderColor 3824
//float2 uv2Scale 3840
//float2 uv2Offset 3848
//float2 uv3Scale 3856
//float2 uv3Offset 3864
//float3 recolorGreen 3872
//float3 recolorBlue 3888
//float4 opacityTexSize 3904
//float4 opacityTexDims 3920
//float4 opacityTexView 3936
//float3x3 opacityTexTransform 3952
//float4 opacityTexUvMinMax 4000
//float4 opacityTexBorderColor 4016
//float4 normalTexSize 4032
//float4 normalTexDims 4048
//float4 normalTexView 4064
//float3x3 normalTexTransform 4080
//float4 normalTexUvMinMax 4128
//float4 normalTexBorderColor 4144
//float4 detailNormalTexSize 4160
//float4 detailNormalTexDims 4176
//float4 detailNormalTexView 4192
//float3x3 detailNormalTexTransform 4208
//float4 detailNormalTexUvMinMax 4256
//float4 detailNormalTexBorderColor 4272
//float4 Port_Import_N042 4288
//float Port_Input1_N044 4304
//float Port_Import_N088 4308
//float3 Port_Import_N089 4320
//float4 Port_Import_N384 4336
//float Port_Import_N307 4352
//float Port_Import_N201 4356
//float Port_Import_N012 4360
//float Port_Import_N010 4364
//float Port_Import_N007 4368
//float2 Port_Import_N008 4376
//float2 Port_Import_N009 4384
//float Port_Speed_N022 4392
//float2 Port_Import_N254 4400
//float Port_Import_N065 4408
//float Port_Import_N055 4412
//float Port_Import_N056 4416
//float2 Port_Import_N000 4424
//float2 Port_Import_N060 4432
//float2 Port_Import_N061 4440
//float Port_Speed_N063 4448
//float2 Port_Import_N255 4456
//float4 Port_Default_N369 4464
//float4 Port_Import_N092 4480
//float3 Port_Import_N090 4496
//float3 Port_Import_N091 4512
//float3 Port_Import_N144 4528
//float Port_Value2_N073 4544
//float4 Port_Import_N166 4560
//float Port_Import_N206 4576
//float Port_Import_N043 4580
//float2 Port_Import_N151 4584
//float2 Port_Import_N155 4592
//float Port_Default_N204 4600
//float Port_Import_N047 4604
//float Port_Input1_N002 4608
//float Port_Input2_N072 4612
//float Port_Import_N336 4616
//float Port_Import_N160 4620
//float2 Port_Import_N167 4624
//float2 Port_Import_N207 4632
//float Port_Strength1_N200 4640
//float Port_Import_N095 4644
//float Port_Import_N108 4648
//float3 Port_Default_N113 4656
//float Port_Strength2_N200 4672
//float3 Port_Emissive_N036 4688
//float3 Port_AO_N036 4704
//}
//ubo float sc_BonesUBO 2:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//spec_const bool BLEND_MODE_AVERAGE 1000
//spec_const bool BLEND_MODE_BRIGHT 1001
//spec_const bool BLEND_MODE_COLOR_BURN 1002
//spec_const bool BLEND_MODE_COLOR_DODGE 1003
//spec_const bool BLEND_MODE_COLOR 1004
//spec_const bool BLEND_MODE_DARKEN 1005
//spec_const bool BLEND_MODE_DIFFERENCE 1006
//spec_const bool BLEND_MODE_DIVIDE 1007
//spec_const bool BLEND_MODE_DIVISION 1008
//spec_const bool BLEND_MODE_EXCLUSION 1009
//spec_const bool BLEND_MODE_FORGRAY 1010
//spec_const bool BLEND_MODE_HARD_GLOW 1011
//spec_const bool BLEND_MODE_HARD_LIGHT 1012
//spec_const bool BLEND_MODE_HARD_MIX 1013
//spec_const bool BLEND_MODE_HARD_PHOENIX 1014
//spec_const bool BLEND_MODE_HARD_REFLECT 1015
//spec_const bool BLEND_MODE_HUE 1016
//spec_const bool BLEND_MODE_INTENSE 1017
//spec_const bool BLEND_MODE_LIGHTEN 1018
//spec_const bool BLEND_MODE_LINEAR_LIGHT 1019
//spec_const bool BLEND_MODE_LUMINOSITY 1020
//spec_const bool BLEND_MODE_NEGATION 1021
//spec_const bool BLEND_MODE_NOTBRIGHT 1022
//spec_const bool BLEND_MODE_OVERLAY 1023
//spec_const bool BLEND_MODE_PIN_LIGHT 1024
//spec_const bool BLEND_MODE_REALISTIC 1025
//spec_const bool BLEND_MODE_SATURATION 1026
//spec_const bool BLEND_MODE_SOFT_LIGHT 1027
//spec_const bool BLEND_MODE_SUBTRACT 1028
//spec_const bool BLEND_MODE_VIVID_LIGHT 1029
//spec_const bool ENABLE_BASE_TEX 1030
//spec_const bool ENABLE_DETAIL_NORMAL 1031
//spec_const bool ENABLE_NORMALMAP 1032
//spec_const bool ENABLE_OPACITY_TEX 1033
//spec_const bool ENABLE_RECOLOR 1034
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 1035
//spec_const bool ENABLE_UV2_ANIMATION 1036
//spec_const bool ENABLE_UV2 1037
//spec_const bool ENABLE_UV3_ANIMATION 1038
//spec_const bool ENABLE_UV3 1039
//spec_const bool SC_GL_FRAGMENT_PRECISION_HIGH 1040
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 1041
//spec_const bool SC_USE_CLAMP_TO_BORDER_detailNormalTex 1042
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 1043
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 1044
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 1045
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 1046
//spec_const bool SC_USE_UV_MIN_MAX_detailNormalTex 1047
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 1048
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 1049
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 1050
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 1051
//spec_const bool SC_USE_UV_TRANSFORM_detailNormalTex 1052
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 1053
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 1054
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 1055
//spec_const bool UseViewSpaceDepthVariant 1056
//spec_const bool baseTexHasSwappedViews 1057
//spec_const bool detailNormalTexHasSwappedViews 1058
//spec_const bool intensityTextureHasSwappedViews 1059
//spec_const bool normalTexHasSwappedViews 1060
//spec_const bool opacityTexHasSwappedViews 1061
//spec_const bool sc_BlendMode_AddWithAlphaFactor 1062
//spec_const bool sc_BlendMode_Add 1063
//spec_const bool sc_BlendMode_AlphaTest 1064
//spec_const bool sc_BlendMode_AlphaToCoverage 1065
//spec_const bool sc_BlendMode_ColoredGlass 1066
//spec_const bool sc_BlendMode_Custom 1067
//spec_const bool sc_BlendMode_Max 1068
//spec_const bool sc_BlendMode_Min 1069
//spec_const bool sc_BlendMode_MultiplyOriginal 1070
//spec_const bool sc_BlendMode_Multiply 1071
//spec_const bool sc_BlendMode_Normal 1072
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 1073
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 1074
//spec_const bool sc_BlendMode_PremultipliedAlpha 1075
//spec_const bool sc_BlendMode_Screen 1076
//spec_const bool sc_DepthOnly 1077
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 1078
//spec_const bool sc_EnvmapSpecularHasSwappedViews 1079
//spec_const bool sc_FramebufferFetch 1080
//spec_const bool sc_HasDiffuseEnvmap 1081
//spec_const bool sc_LightEstimation 1082
//spec_const bool sc_OITCompositingPass 1083
//spec_const bool sc_OITDepthBoundsPass 1084
//spec_const bool sc_OITDepthGatherPass 1085
//spec_const bool sc_ProjectiveShadowsCaster 1086
//spec_const bool sc_ProjectiveShadowsReceiver 1087
//spec_const bool sc_RenderAlphaToColor 1088
//spec_const bool sc_SSAOEnabled 1089
//spec_const bool sc_ScreenTextureHasSwappedViews 1090
//spec_const bool sc_ShaderComplexityAnalyzer 1091
//spec_const bool sc_UseFramebufferFetchMarker 1092
//spec_const bool sc_VertexBlendingUseNormals 1093
//spec_const bool sc_VertexBlending 1094
//spec_const int NODE_13_DROPLIST_ITEM 1095
//spec_const int NODE_181_DROPLIST_ITEM 1096
//spec_const int NODE_184_DROPLIST_ITEM 1097
//spec_const int NODE_27_DROPLIST_ITEM 1098
//spec_const int NODE_38_DROPLIST_ITEM 1099
//spec_const int NODE_49_DROPLIST_ITEM 1100
//spec_const int NODE_69_DROPLIST_ITEM 1101
//spec_const int SC_DEVICE_CLASS 1102
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 1103
//spec_const int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex 1104
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 1105
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 1106
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 1107
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 1108
//spec_const int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex 1109
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 1110
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 1111
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 1112
//spec_const int baseTexLayout 1113
//spec_const int detailNormalTexLayout 1114
//spec_const int intensityTextureLayout 1115
//spec_const int normalTexLayout 1116
//spec_const int opacityTexLayout 1117
//spec_const int sc_AmbientLightMode0 1118
//spec_const int sc_AmbientLightMode1 1119
//spec_const int sc_AmbientLightMode2 1120
//spec_const int sc_AmbientLightMode_Constant 1121
//spec_const int sc_AmbientLightMode_EnvironmentMap 1122
//spec_const int sc_AmbientLightMode_FromCamera 1123
//spec_const int sc_AmbientLightMode_SphericalHarmonics 1124
//spec_const int sc_AmbientLightsCount 1125
//spec_const int sc_DepthBufferMode 1126
//spec_const int sc_DirectionalLightsCount 1127
//spec_const int sc_EnvLightMode 1128
//spec_const int sc_EnvmapDiffuseLayout 1129
//spec_const int sc_EnvmapSpecularLayout 1130
//spec_const int sc_LightEstimationSGCount 1131
//spec_const int sc_MaxTextureImageUnits 1132
//spec_const int sc_PointLightsCount 1133
//spec_const int sc_RenderingSpace 1134
//spec_const int sc_ScreenTextureLayout 1135
//spec_const int sc_SkinBonesCount 1136
//spec_const int sc_StereoRenderingMode 1137
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 1138
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(1000)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1001)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(1002)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(1003)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(1004)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(1005)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(1006)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(1007)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(1008)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(1009)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(1010)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(1011)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(1012)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(1013)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(1014)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(1015)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(1016)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(1017)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(1018)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(1019)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(1020)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(1021)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(1022)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(1023)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(1024)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(1025)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(1026)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(1027)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(1028)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(1029)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_BASE_TEX [[function_constant(1030)]];
constant bool ENABLE_BASE_TEX_tmp = is_function_constant_defined(ENABLE_BASE_TEX) ? ENABLE_BASE_TEX : false;
constant bool ENABLE_DETAIL_NORMAL [[function_constant(1031)]];
constant bool ENABLE_DETAIL_NORMAL_tmp = is_function_constant_defined(ENABLE_DETAIL_NORMAL) ? ENABLE_DETAIL_NORMAL : false;
constant bool ENABLE_NORMALMAP [[function_constant(1032)]];
constant bool ENABLE_NORMALMAP_tmp = is_function_constant_defined(ENABLE_NORMALMAP) ? ENABLE_NORMALMAP : false;
constant bool ENABLE_OPACITY_TEX [[function_constant(1033)]];
constant bool ENABLE_OPACITY_TEX_tmp = is_function_constant_defined(ENABLE_OPACITY_TEX) ? ENABLE_OPACITY_TEX : false;
constant bool ENABLE_RECOLOR [[function_constant(1034)]];
constant bool ENABLE_RECOLOR_tmp = is_function_constant_defined(ENABLE_RECOLOR) ? ENABLE_RECOLOR : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(1035)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool ENABLE_UV2_ANIMATION [[function_constant(1036)]];
constant bool ENABLE_UV2_ANIMATION_tmp = is_function_constant_defined(ENABLE_UV2_ANIMATION) ? ENABLE_UV2_ANIMATION : false;
constant bool ENABLE_UV2 [[function_constant(1037)]];
constant bool ENABLE_UV2_tmp = is_function_constant_defined(ENABLE_UV2) ? ENABLE_UV2 : false;
constant bool ENABLE_UV3_ANIMATION [[function_constant(1038)]];
constant bool ENABLE_UV3_ANIMATION_tmp = is_function_constant_defined(ENABLE_UV3_ANIMATION) ? ENABLE_UV3_ANIMATION : false;
constant bool ENABLE_UV3 [[function_constant(1039)]];
constant bool ENABLE_UV3_tmp = is_function_constant_defined(ENABLE_UV3) ? ENABLE_UV3 : false;
constant bool SC_GL_FRAGMENT_PRECISION_HIGH [[function_constant(1040)]];
constant bool SC_GL_FRAGMENT_PRECISION_HIGH_tmp = is_function_constant_defined(SC_GL_FRAGMENT_PRECISION_HIGH) ? SC_GL_FRAGMENT_PRECISION_HIGH : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(1041)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex [[function_constant(1042)]];
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_detailNormalTex) ? SC_USE_CLAMP_TO_BORDER_detailNormalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(1043)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTex [[function_constant(1044)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTex) ? SC_USE_CLAMP_TO_BORDER_normalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex [[function_constant(1045)]];
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_opacityTex) ? SC_USE_CLAMP_TO_BORDER_opacityTex : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(1046)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_detailNormalTex [[function_constant(1047)]];
constant bool SC_USE_UV_MIN_MAX_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_detailNormalTex) ? SC_USE_UV_MIN_MAX_detailNormalTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(1048)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_normalTex [[function_constant(1049)]];
constant bool SC_USE_UV_MIN_MAX_normalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTex) ? SC_USE_UV_MIN_MAX_normalTex : false;
constant bool SC_USE_UV_MIN_MAX_opacityTex [[function_constant(1050)]];
constant bool SC_USE_UV_MIN_MAX_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_opacityTex) ? SC_USE_UV_MIN_MAX_opacityTex : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(1051)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_detailNormalTex [[function_constant(1052)]];
constant bool SC_USE_UV_TRANSFORM_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_detailNormalTex) ? SC_USE_UV_TRANSFORM_detailNormalTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(1053)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_normalTex [[function_constant(1054)]];
constant bool SC_USE_UV_TRANSFORM_normalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTex) ? SC_USE_UV_TRANSFORM_normalTex : false;
constant bool SC_USE_UV_TRANSFORM_opacityTex [[function_constant(1055)]];
constant bool SC_USE_UV_TRANSFORM_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_opacityTex) ? SC_USE_UV_TRANSFORM_opacityTex : false;
constant bool UseViewSpaceDepthVariant [[function_constant(1056)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(1057)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool detailNormalTexHasSwappedViews [[function_constant(1058)]];
constant bool detailNormalTexHasSwappedViews_tmp = is_function_constant_defined(detailNormalTexHasSwappedViews) ? detailNormalTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(1059)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool normalTexHasSwappedViews [[function_constant(1060)]];
constant bool normalTexHasSwappedViews_tmp = is_function_constant_defined(normalTexHasSwappedViews) ? normalTexHasSwappedViews : false;
constant bool opacityTexHasSwappedViews [[function_constant(1061)]];
constant bool opacityTexHasSwappedViews_tmp = is_function_constant_defined(opacityTexHasSwappedViews) ? opacityTexHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(1062)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(1063)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(1064)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(1065)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(1066)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(1067)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(1068)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(1069)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(1070)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(1071)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(1072)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(1073)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(1074)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(1075)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(1076)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(1077)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(1078)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(1079)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(1080)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(1081)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(1082)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_OITCompositingPass [[function_constant(1083)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(1084)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(1085)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(1086)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(1087)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(1088)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(1089)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(1090)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(1091)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(1092)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(1093)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(1094)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int NODE_13_DROPLIST_ITEM [[function_constant(1095)]];
constant int NODE_13_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_13_DROPLIST_ITEM) ? NODE_13_DROPLIST_ITEM : 0;
constant int NODE_181_DROPLIST_ITEM [[function_constant(1096)]];
constant int NODE_181_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_181_DROPLIST_ITEM) ? NODE_181_DROPLIST_ITEM : 0;
constant int NODE_184_DROPLIST_ITEM [[function_constant(1097)]];
constant int NODE_184_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_184_DROPLIST_ITEM) ? NODE_184_DROPLIST_ITEM : 0;
constant int NODE_27_DROPLIST_ITEM [[function_constant(1098)]];
constant int NODE_27_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_27_DROPLIST_ITEM) ? NODE_27_DROPLIST_ITEM : 0;
constant int NODE_38_DROPLIST_ITEM [[function_constant(1099)]];
constant int NODE_38_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_38_DROPLIST_ITEM) ? NODE_38_DROPLIST_ITEM : 0;
constant int NODE_49_DROPLIST_ITEM [[function_constant(1100)]];
constant int NODE_49_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_49_DROPLIST_ITEM) ? NODE_49_DROPLIST_ITEM : 0;
constant int NODE_69_DROPLIST_ITEM [[function_constant(1101)]];
constant int NODE_69_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_69_DROPLIST_ITEM) ? NODE_69_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(1102)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(1103)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex [[function_constant(1104)]];
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_U_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(1105)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(1106)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex [[function_constant(1107)]];
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_opacityTex) ? SC_SOFTWARE_WRAP_MODE_U_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(1108)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex [[function_constant(1109)]];
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_V_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(1110)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(1111)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex [[function_constant(1112)]];
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_opacityTex) ? SC_SOFTWARE_WRAP_MODE_V_opacityTex : -1;
constant int baseTexLayout [[function_constant(1113)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int detailNormalTexLayout [[function_constant(1114)]];
constant int detailNormalTexLayout_tmp = is_function_constant_defined(detailNormalTexLayout) ? detailNormalTexLayout : 0;
constant int intensityTextureLayout [[function_constant(1115)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int normalTexLayout [[function_constant(1116)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int opacityTexLayout [[function_constant(1117)]];
constant int opacityTexLayout_tmp = is_function_constant_defined(opacityTexLayout) ? opacityTexLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(1118)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(1119)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(1120)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(1121)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(1122)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(1123)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(1124)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(1125)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(1126)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(1127)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(1128)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(1129)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(1130)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(1131)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(1132)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(1133)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RenderingSpace [[function_constant(1134)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(1135)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_SkinBonesCount [[function_constant(1136)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(1137)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(1138)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[3];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float3 recolorRed;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N012;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float4 Port_Import_N166;
float Port_Import_N206;
float Port_Import_N043;
float2 Port_Import_N151;
float2 Port_Import_N155;
float Port_Default_N204;
float Port_Import_N047;
float Port_Input1_N002;
float Port_Input2_N072;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float3 Port_Emissive_N036;
float3 Port_AO_N036;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
};
struct sc_AmbientLightCompatibility_t
{
float3 color;
};
struct sc_Set2
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> baseTex [[id(1)]];
texture2d<float> detailNormalTex [[id(2)]];
texture2d<float> intensityTexture [[id(3)]];
texture2d<float> normalTex [[id(4)]];
texture2d<float> opacityTex [[id(5)]];
texture2d<float> sc_EnvmapDiffuse [[id(6)]];
texture2d<float> sc_EnvmapSpecular [[id(7)]];
texture2d<float> sc_SSAOTexture [[id(16)]];
texture2d<float> sc_ScreenTexture [[id(17)]];
texture2d<float> sc_ShadowTexture [[id(18)]];
sampler baseTexSmpSC [[id(20)]];
sampler detailNormalTexSmpSC [[id(21)]];
sampler intensityTextureSmpSC [[id(22)]];
sampler normalTexSmpSC [[id(23)]];
sampler opacityTexSmpSC [[id(24)]];
sampler sc_EnvmapDiffuseSmpSC [[id(25)]];
sampler sc_EnvmapSpecularSmpSC [[id(26)]];
sampler sc_SSAOTextureSmpSC [[id(28)]];
sampler sc_ScreenTextureSmpSC [[id(29)]];
sampler sc_ShadowTextureSmpSC [[id(30)]];
constant userUniformsObj* UserUniforms [[id(32)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
sc_Vertex_t l9_2=param;
float Dummy1;
float2 Dummy2;
float3 Dummy3;
float4 Dummy4;
ssGlobals tempGlobals;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_3=l9_2;
float3 l9_4=in.blendShape0Pos;
float3 l9_5=in.blendShape0Normal;
float l9_6=(*sc_set2.UserUniforms).weights0.x;
sc_Vertex_t l9_7=l9_3;
float3 l9_8=l9_4;
float l9_9=l9_6;
float3 l9_10=l9_7.position.xyz+(l9_8*l9_9);
l9_7.position=float4(l9_10.x,l9_10.y,l9_10.z,l9_7.position.w);
l9_3=l9_7;
l9_3.normal+=(l9_5*l9_6);
l9_2=l9_3;
sc_Vertex_t l9_11=l9_2;
float3 l9_12=in.blendShape1Pos;
float3 l9_13=in.blendShape1Normal;
float l9_14=(*sc_set2.UserUniforms).weights0.y;
sc_Vertex_t l9_15=l9_11;
float3 l9_16=l9_12;
float l9_17=l9_14;
float3 l9_18=l9_15.position.xyz+(l9_16*l9_17);
l9_15.position=float4(l9_18.x,l9_18.y,l9_18.z,l9_15.position.w);
l9_11=l9_15;
l9_11.normal+=(l9_13*l9_14);
l9_2=l9_11;
sc_Vertex_t l9_19=l9_2;
float3 l9_20=in.blendShape2Pos;
float3 l9_21=in.blendShape2Normal;
float l9_22=(*sc_set2.UserUniforms).weights0.z;
sc_Vertex_t l9_23=l9_19;
float3 l9_24=l9_20;
float l9_25=l9_22;
float3 l9_26=l9_23.position.xyz+(l9_24*l9_25);
l9_23.position=float4(l9_26.x,l9_26.y,l9_26.z,l9_23.position.w);
l9_19=l9_23;
l9_19.normal+=(l9_21*l9_22);
l9_2=l9_19;
}
else
{
sc_Vertex_t l9_27=l9_2;
float3 l9_28=in.blendShape0Pos;
float l9_29=(*sc_set2.UserUniforms).weights0.x;
float3 l9_30=l9_27.position.xyz+(l9_28*l9_29);
l9_27.position=float4(l9_30.x,l9_30.y,l9_30.z,l9_27.position.w);
l9_2=l9_27;
sc_Vertex_t l9_31=l9_2;
float3 l9_32=in.blendShape1Pos;
float l9_33=(*sc_set2.UserUniforms).weights0.y;
float3 l9_34=l9_31.position.xyz+(l9_32*l9_33);
l9_31.position=float4(l9_34.x,l9_34.y,l9_34.z,l9_31.position.w);
l9_2=l9_31;
sc_Vertex_t l9_35=l9_2;
float3 l9_36=in.blendShape2Pos;
float l9_37=(*sc_set2.UserUniforms).weights0.z;
float3 l9_38=l9_35.position.xyz+(l9_36*l9_37);
l9_35.position=float4(l9_38.x,l9_38.y,l9_38.z,l9_35.position.w);
l9_2=l9_35;
sc_Vertex_t l9_39=l9_2;
float3 l9_40=in.blendShape3Pos;
float l9_41=(*sc_set2.UserUniforms).weights0.w;
float3 l9_42=l9_39.position.xyz+(l9_40*l9_41);
l9_39.position=float4(l9_42.x,l9_42.y,l9_42.z,l9_39.position.w);
l9_2=l9_39;
sc_Vertex_t l9_43=l9_2;
float3 l9_44=in.blendShape4Pos;
float l9_45=(*sc_set2.UserUniforms).weights1.x;
float3 l9_46=l9_43.position.xyz+(l9_44*l9_45);
l9_43.position=float4(l9_46.x,l9_46.y,l9_46.z,l9_43.position.w);
l9_2=l9_43;
sc_Vertex_t l9_47=l9_2;
float3 l9_48=in.blendShape5Pos;
float l9_49=(*sc_set2.UserUniforms).weights1.y;
float3 l9_50=l9_47.position.xyz+(l9_48*l9_49);
l9_47.position=float4(l9_50.x,l9_50.y,l9_50.z,l9_47.position.w);
l9_2=l9_47;
}
}
param=l9_2;
sc_Vertex_t l9_51=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_52=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_52=float4(1.0,fract(in.boneData.yzw));
l9_52.x-=dot(l9_52.yzw,float3(1.0));
}
float4 l9_53=l9_52;
float4 l9_54=l9_53;
int l9_55=0;
int l9_56=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_56=int(in.boneData[l9_55]);
}
int l9_57=l9_56;
int l9_58=l9_57;
int l9_59=1;
int l9_60=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_60=int(in.boneData[l9_59]);
}
int l9_61=l9_60;
int l9_62=l9_61;
int l9_63=2;
int l9_64=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_64=int(in.boneData[l9_63]);
}
int l9_65=l9_64;
int l9_66=l9_65;
int l9_67=3;
int l9_68=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_68=int(in.boneData[l9_67]);
}
int l9_69=l9_68;
int l9_70=l9_69;
int l9_71=l9_58;
float4 l9_72=l9_51.position;
float3 l9_73;
if (sc_SkinBonesCount_tmp>0)
{
int l9_74=l9_71;
float4 l9_75=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[0];
float4 l9_76=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[1];
float4 l9_77=(*sc_set2.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[2];
float4x3 l9_78=float4x3(float3(l9_75.x,l9_76.x,l9_77.x),float3(l9_75.y,l9_76.y,l9_77.y),float3(l9_75.z,l9_76.z,l9_77.z),float3(l9_75.w,l9_76.w,l9_77.w));
l9_73=l9_78*l9_72;
}
else
{
l9_73=l9_72.xyz;
}
float3 l9_79=l9_73;
float3 l9_80=l9_79;
float l9_81=l9_54.x;
int l9_82=l9_62;
float4 l9_83=l9_51.position;
float3 l9_84;
if (sc_SkinBonesCount_tmp>0)
{
int l9_85=l9_82;
float4 l9_86=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[0];
float4 l9_87=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[1];
float4 l9_88=(*sc_set2.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[2];
float4x3 l9_89=float4x3(float3(l9_86.x,l9_87.x,l9_88.x),float3(l9_86.y,l9_87.y,l9_88.y),float3(l9_86.z,l9_87.z,l9_88.z),float3(l9_86.w,l9_87.w,l9_88.w));
l9_84=l9_89*l9_83;
}
else
{
l9_84=l9_83.xyz;
}
float3 l9_90=l9_84;
float3 l9_91=l9_90;
float l9_92=l9_54.y;
int l9_93=l9_66;
float4 l9_94=l9_51.position;
float3 l9_95;
if (sc_SkinBonesCount_tmp>0)
{
int l9_96=l9_93;
float4 l9_97=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[0];
float4 l9_98=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[1];
float4 l9_99=(*sc_set2.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[2];
float4x3 l9_100=float4x3(float3(l9_97.x,l9_98.x,l9_99.x),float3(l9_97.y,l9_98.y,l9_99.y),float3(l9_97.z,l9_98.z,l9_99.z),float3(l9_97.w,l9_98.w,l9_99.w));
l9_95=l9_100*l9_94;
}
else
{
l9_95=l9_94.xyz;
}
float3 l9_101=l9_95;
float3 l9_102=l9_101;
float l9_103=l9_54.z;
int l9_104=l9_70;
float4 l9_105=l9_51.position;
float3 l9_106;
if (sc_SkinBonesCount_tmp>0)
{
int l9_107=l9_104;
float4 l9_108=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[0];
float4 l9_109=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[1];
float4 l9_110=(*sc_set2.sc_BonesUBO).sc_Bones[l9_107].boneMatrix[2];
float4x3 l9_111=float4x3(float3(l9_108.x,l9_109.x,l9_110.x),float3(l9_108.y,l9_109.y,l9_110.y),float3(l9_108.z,l9_109.z,l9_110.z),float3(l9_108.w,l9_109.w,l9_110.w));
l9_106=l9_111*l9_105;
}
else
{
l9_106=l9_105.xyz;
}
float3 l9_112=l9_106;
float3 l9_113=(((l9_80*l9_81)+(l9_91*l9_92))+(l9_102*l9_103))+(l9_112*l9_54.w);
l9_51.position=float4(l9_113.x,l9_113.y,l9_113.z,l9_51.position.w);
int l9_114=l9_58;
float3x3 l9_115=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[2].xyz));
float3x3 l9_116=l9_115;
float3x3 l9_117=l9_116;
int l9_118=l9_62;
float3x3 l9_119=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_118].normalMatrix[2].xyz));
float3x3 l9_120=l9_119;
float3x3 l9_121=l9_120;
int l9_122=l9_66;
float3x3 l9_123=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_122].normalMatrix[2].xyz));
float3x3 l9_124=l9_123;
float3x3 l9_125=l9_124;
int l9_126=l9_70;
float3x3 l9_127=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_126].normalMatrix[2].xyz));
float3x3 l9_128=l9_127;
float3x3 l9_129=l9_128;
l9_51.normal=((((l9_117*l9_51.normal)*l9_54.x)+((l9_121*l9_51.normal)*l9_54.y))+((l9_125*l9_51.normal)*l9_54.z))+((l9_129*l9_51.normal)*l9_54.w);
l9_51.tangent=((((l9_117*l9_51.tangent)*l9_54.x)+((l9_121*l9_51.tangent)*l9_54.y))+((l9_125*l9_51.tangent)*l9_54.z))+((l9_129*l9_51.tangent)*l9_54.w);
}
param=l9_51;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param.position.xyz;
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set2.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varNormal=(*sc_set2.UserUniforms).sc_NormalMatrix*param.normal;
float3 l9_130=(*sc_set2.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_130.x,l9_130.y,l9_130.z,out.varTangent.w);
}
}
}
}
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
float l9_131;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_131=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_131=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_131;
float l9_132;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_132=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_132=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_132;
float4 ScreenPosition=float4(0.0);
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_1=v;
float3 param_2=WorldPosition;
float3 param_3=WorldNormal;
float3 param_4=WorldTangent;
float4 param_5=v.position;
out.varPos=param_2;
out.varNormal=normalize(param_3);
float3 l9_133=normalize(param_4);
out.varTangent=float4(l9_133.x,l9_133.y,l9_133.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_134=param_1.position;
float4 l9_135;
if (sc_RenderingSpace_tmp==3)
{
int l9_136;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=gl_InstanceIndex%2;
}
int l9_137=l9_136;
l9_135=(*sc_set2.UserUniforms).sc_ProjectionMatrixInverseArray[l9_137]*l9_134;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_138;
if (sc_StereoRenderingMode_tmp==0)
{
l9_138=0;
}
else
{
l9_138=gl_InstanceIndex%2;
}
int l9_139=l9_138;
l9_135=(*sc_set2.UserUniforms).sc_ViewMatrixArray[l9_139]*l9_134;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_140;
if (sc_StereoRenderingMode_tmp==0)
{
l9_140=0;
}
else
{
l9_140=gl_InstanceIndex%2;
}
int l9_141=l9_140;
l9_135=(*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_141]*l9_134;
}
else
{
l9_135=l9_134;
}
}
}
float4 l9_142=l9_135;
out.varViewSpaceDepth=-l9_142.z;
}
float4 l9_143=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_143=param_5;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_144;
if (sc_StereoRenderingMode_tmp==0)
{
l9_144=0;
}
else
{
l9_144=gl_InstanceIndex%2;
}
int l9_145=l9_144;
l9_143=((*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_145]*param_1.position)*float4(1.0/(*sc_set2.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_146;
if (sc_StereoRenderingMode_tmp==0)
{
l9_146=0;
}
else
{
l9_146=gl_InstanceIndex%2;
}
int l9_147=l9_146;
l9_143=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_147]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_148;
if (sc_StereoRenderingMode_tmp==0)
{
l9_148=0;
}
else
{
l9_148=gl_InstanceIndex%2;
}
int l9_149=l9_148;
l9_143=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_149]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_1.texture0,param_1.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_150=param_1.position;
float4 l9_151=l9_150;
if (sc_RenderingSpace_tmp==1)
{
l9_151=(*sc_set2.UserUniforms).sc_ModelMatrix*l9_150;
}
float4 l9_152=(*sc_set2.UserUniforms).sc_ProjectorMatrix*l9_151;
float2 l9_153=((l9_152.xy/float2(l9_152.w))*0.5)+float2(0.5);
out.varShadowTex=l9_153;
}
float4 l9_154=l9_143;
if (sc_DepthBufferMode_tmp==1)
{
float l9_155=2.0/log2((*sc_set2.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_154.z=((log2(fast::max((*sc_set2.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_154.w))*l9_155)-1.0)*l9_154.w;
}
float4 l9_156=l9_154;
l9_143=l9_156;
float4 l9_157=l9_143;
float4 l9_158=l9_157;
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_159=l9_158;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_160=dot(l9_159,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_161=l9_160;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
float l9_162=l9_161;
}
else
{
out.varClipDistance=l9_161;
}
}
float4 l9_163=float4(l9_158.x,-l9_158.y,(l9_158.z*0.5)+(l9_158.w*0.5),l9_158.w);
out.gl_Position=l9_163;
v=param_1;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float4 VertexColor;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float2 gScreenCoord;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[3];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float3 recolorRed;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N012;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float4 Port_Import_N166;
float Port_Import_N206;
float Port_Import_N043;
float2 Port_Import_N151;
float2 Port_Import_N155;
float Port_Default_N204;
float Port_Import_N047;
float Port_Input1_N002;
float Port_Input2_N072;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float3 Port_Emissive_N036;
float3 Port_AO_N036;
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_AmbientLightCompatibility_t
{
float3 color;
};
struct sc_Set2
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> baseTex [[id(1)]];
texture2d<float> detailNormalTex [[id(2)]];
texture2d<float> intensityTexture [[id(3)]];
texture2d<float> normalTex [[id(4)]];
texture2d<float> opacityTex [[id(5)]];
texture2d<float> sc_EnvmapDiffuse [[id(6)]];
texture2d<float> sc_EnvmapSpecular [[id(7)]];
texture2d<float> sc_SSAOTexture [[id(16)]];
texture2d<float> sc_ScreenTexture [[id(17)]];
texture2d<float> sc_ShadowTexture [[id(18)]];
sampler baseTexSmpSC [[id(20)]];
sampler detailNormalTexSmpSC [[id(21)]];
sampler intensityTextureSmpSC [[id(22)]];
sampler normalTexSmpSC [[id(23)]];
sampler opacityTexSmpSC [[id(24)]];
sampler sc_EnvmapDiffuseSmpSC [[id(25)]];
sampler sc_EnvmapSpecularSmpSC [[id(26)]];
sampler sc_SSAOTextureSmpSC [[id(28)]];
sampler sc_ScreenTextureSmpSC [[id(29)]];
sampler sc_ShadowTextureSmpSC [[id(30)]];
constant userUniformsObj* UserUniforms [[id(32)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
int l9_0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V)
{
float r=fast::max(surfaceProperties.roughness,0.03);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=l9_5/(l9_8+1e-07);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_10=param_6;
float l9_11=param_8;
float l9_12=l9_11+1.0;
l9_12=(l9_12*l9_12)*0.125;
float l9_13=(l9_10*(1.0-l9_12))+l9_12;
float l9_14=param_7;
float l9_15=param_8;
float l9_16=l9_15+1.0;
l9_16=(l9_16*l9_16)*0.125;
float l9_17=(l9_14*(1.0-l9_16))+l9_16;
float l9_18=1.0/(l9_13*l9_17);
float param_9=VdotH;
float3 param_10=F0;
float l9_19=param_9;
float3 l9_20=param_10;
float3 l9_21=float3(1.0);
float l9_22=1.0-l9_19;
float l9_23=l9_22*l9_22;
float l9_24=(l9_23*l9_23)*l9_22;
float3 l9_25=l9_20+((l9_21-l9_20)*l9_24);
float3 l9_26=l9_25;
return l9_26*(((l9_9*l9_18)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_27=param_11;
float3 l9_28=param_12;
float3 l9_29=float3(1.0);
float l9_30=1.0-l9_27;
float l9_31=l9_30*l9_30;
float l9_32=(l9_31*l9_31)*l9_30;
float3 l9_33=l9_28+((l9_29-l9_28)*l9_32);
float3 l9_34=l9_33;
return ((l9_34*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float3 linearToneMapping(thread const float3& x)
{
float a=1.8;
float b=1.4;
float c=0.5;
float d=1.5;
if ((int(SC_GL_FRAGMENT_PRECISION_HIGH_tmp)!=0))
{
return (x*((x*a)+float3(b)))/((x*((x*a)+float3(c)))+float3(d));
}
else
{
return (x*((x*a)+float3(b)))/fast::min(float3(1000.0),(x*((x*a)+float3(c)))+float3(d));
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.454545);
}
else
{
return sqrt(x);
}
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.666667);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.333333);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res;
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
float3 tmpColor;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.666667);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.333333);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.666667);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.333333);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.666667);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.333333);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.666667);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.333333);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.666667);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.333333);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.666667);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.333333);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.666667);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.333333);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.666667);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.333333);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.299*l9_223.x)+(0.587*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
float2 l9_228=UserUniforms.intensityTextureDims.xy;
float2 l9_229=l9_228;
int l9_230;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_231;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_230=1-l9_232;
}
else
{
int l9_233;
if (sc_StereoRenderingMode_tmp==0)
{
l9_233=0;
}
else
{
l9_233=varStereoViewID;
}
int l9_234=l9_233;
l9_230=l9_234;
}
int l9_235=l9_230;
float2 l9_236=l9_229;
int l9_237=intensityTextureLayout_tmp;
int l9_238=l9_235;
float2 l9_239=float2(l9_227,0.5);
bool l9_240=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_241=UserUniforms.intensityTextureTransform;
int2 l9_242=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_243=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_244=UserUniforms.intensityTextureUvMinMax;
bool l9_245=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_246=UserUniforms.intensityTextureBorderColor;
float l9_247=0.0;
bool l9_248=l9_245&&(!l9_243);
float l9_249=1.0;
float l9_250=l9_239.x;
int l9_251=l9_242.x;
if (l9_251==1)
{
l9_250=fract(l9_250);
}
else
{
if (l9_251==2)
{
float l9_252=fract(l9_250);
float l9_253=l9_250-l9_252;
float l9_254=step(0.25,fract(l9_253*0.5));
l9_250=mix(l9_252,1.0-l9_252,fast::clamp(l9_254,0.0,1.0));
}
}
l9_239.x=l9_250;
float l9_255=l9_239.y;
int l9_256=l9_242.y;
if (l9_256==1)
{
l9_255=fract(l9_255);
}
else
{
if (l9_256==2)
{
float l9_257=fract(l9_255);
float l9_258=l9_255-l9_257;
float l9_259=step(0.25,fract(l9_258*0.5));
l9_255=mix(l9_257,1.0-l9_257,fast::clamp(l9_259,0.0,1.0));
}
}
l9_239.y=l9_255;
if (l9_243)
{
bool l9_260=l9_245;
bool l9_261;
if (l9_260)
{
l9_261=l9_242.x==3;
}
else
{
l9_261=l9_260;
}
float l9_262=l9_239.x;
float l9_263=l9_244.x;
float l9_264=l9_244.z;
bool l9_265=l9_261;
float l9_266=l9_249;
float l9_267=fast::clamp(l9_262,l9_263,l9_264);
float l9_268=step(abs(l9_262-l9_267),1e-05);
l9_266*=(l9_268+((1.0-float(l9_265))*(1.0-l9_268)));
l9_262=l9_267;
l9_239.x=l9_262;
l9_249=l9_266;
bool l9_269=l9_245;
bool l9_270;
if (l9_269)
{
l9_270=l9_242.y==3;
}
else
{
l9_270=l9_269;
}
float l9_271=l9_239.y;
float l9_272=l9_244.y;
float l9_273=l9_244.w;
bool l9_274=l9_270;
float l9_275=l9_249;
float l9_276=fast::clamp(l9_271,l9_272,l9_273);
float l9_277=step(abs(l9_271-l9_276),1e-05);
l9_275*=(l9_277+((1.0-float(l9_274))*(1.0-l9_277)));
l9_271=l9_276;
l9_239.y=l9_271;
l9_249=l9_275;
}
float2 l9_278=l9_239;
bool l9_279=l9_240;
float3x3 l9_280=l9_241;
if (l9_279)
{
l9_278=float2((l9_280*float3(l9_278,1.0)).xy);
}
float2 l9_281=l9_278;
float2 l9_282=l9_281;
float2 l9_283=l9_282;
l9_239=l9_283;
float l9_284=l9_239.x;
int l9_285=l9_242.x;
bool l9_286=l9_248;
float l9_287=l9_249;
if ((l9_285==0)||(l9_285==3))
{
float l9_288=l9_284;
float l9_289=0.0;
float l9_290=1.0;
bool l9_291=l9_286;
float l9_292=l9_287;
float l9_293=fast::clamp(l9_288,l9_289,l9_290);
float l9_294=step(abs(l9_288-l9_293),1e-05);
l9_292*=(l9_294+((1.0-float(l9_291))*(1.0-l9_294)));
l9_288=l9_293;
l9_284=l9_288;
l9_287=l9_292;
}
l9_239.x=l9_284;
l9_249=l9_287;
float l9_295=l9_239.y;
int l9_296=l9_242.y;
bool l9_297=l9_248;
float l9_298=l9_249;
if ((l9_296==0)||(l9_296==3))
{
float l9_299=l9_295;
float l9_300=0.0;
float l9_301=1.0;
bool l9_302=l9_297;
float l9_303=l9_298;
float l9_304=fast::clamp(l9_299,l9_300,l9_301);
float l9_305=step(abs(l9_299-l9_304),1e-05);
l9_303*=(l9_305+((1.0-float(l9_302))*(1.0-l9_305)));
l9_299=l9_304;
l9_295=l9_299;
l9_298=l9_303;
}
l9_239.y=l9_295;
l9_249=l9_298;
float2 l9_306=l9_236;
float2 l9_307=l9_239;
int l9_308=l9_237;
int l9_309=l9_238;
float l9_310=l9_247;
float2 l9_311=l9_307;
int l9_312=l9_308;
int l9_313=l9_309;
float3 l9_314;
if (l9_312==0)
{
l9_314=float3(l9_311,0.0);
}
else
{
if (l9_312==1)
{
l9_314=float3(l9_311.x,(l9_311.y*0.5)+(0.5-(float(l9_313)*0.5)),0.0);
}
else
{
l9_314=float3(l9_311,float(l9_313));
}
}
float3 l9_315=l9_314;
float3 l9_316=l9_315;
float2 l9_317=l9_306;
float2 l9_318=l9_316.xy;
float l9_319=l9_310;
float4 l9_320=intensityTexture.sample(intensityTextureSmpSC,l9_318,bias(l9_319));
float4 l9_321=l9_320;
float4 l9_322=l9_321;
if (l9_245)
{
l9_322=mix(l9_246,l9_322,float4(l9_249));
}
float4 l9_323=l9_322;
float4 l9_324=l9_323;
float3 l9_325=l9_323.xyz;
float3 l9_326=l9_325;
float l9_327=16.0;
float l9_328=((((l9_326.x*256.0)+l9_326.y)+(l9_326.z/256.0))/257.004)*l9_327;
float l9_329=l9_328;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_329=fast::max(l9_329,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_329=fast::min(l9_329,1.0);
}
float l9_330=l9_225;
float3 l9_331=param_8;
float3 l9_332=param_9;
float l9_333=l9_226;
float l9_334=l9_329;
float3 l9_335=transformColor(l9_330,l9_331,l9_332,l9_333,l9_334);
return l9_335;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
ssPreviewInfo PreviewInfo;
float Dummy1;
float2 Dummy2;
float3 Dummy3;
float4 Dummy4;
ssGlobals tempGlobals;
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
float l9_0;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set2.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexColor=in.varColor;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
float4 l9_2=gl_FragCoord;
float2 l9_3=(l9_2.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_4=l9_3;
float2 l9_5;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_6=float3(l9_4,0.0);
int l9_7=1;
int l9_8;
if (sc_StereoRenderingMode_tmp==0)
{
l9_8=0;
}
else
{
l9_8=in.varStereoViewID;
}
int l9_9=l9_8;
int l9_10=l9_9;
float3 l9_11=float3(l9_4,0.0);
int l9_12=l9_7;
int l9_13=l9_10;
if (l9_12==1)
{
l9_11.y=((2.0*l9_11.y)+float(l9_13))-1.0;
}
float2 l9_14=l9_11.xy;
l9_5=l9_14;
}
else
{
l9_5=l9_4;
}
float2 l9_15=l9_5;
float2 l9_16=l9_15;
float2 l9_17=l9_16;
Globals.gScreenCoord=l9_17;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
float4 Result_N363=float4(0.0);
float param=0.0;
float4 param_1=float4(0.0);
float4 param_2=float4(0.0);
ssGlobals param_4=Globals;
float4 param_3;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_18=float4(0.0);
l9_18=param_4.VertexColor;
float3 l9_19=float3(0.0);
float l9_20=0.0;
float3 l9_21=float3(0.0);
float3 l9_22=float3(0.0);
ssGlobals l9_23=param_4;
float3 l9_24;
if ((int(ENABLE_RECOLOR_tmp)!=0))
{
float3 l9_25=float3(0.0);
ssGlobals l9_26=l9_23;
float3 l9_27=(*sc_set2.UserUniforms).recolorRed;
l9_25=l9_27;
float3 l9_28=float3(0.0);
l9_28=l9_25;
float4 l9_29=float4(0.0);
ssGlobals l9_30=l9_23;
float4 l9_31=(*sc_set2.UserUniforms).baseColor;
l9_29=l9_31;
float4 l9_32=float4(0.0);
l9_32=l9_29;
float4 l9_33=float4(0.0);
float l9_34=0.0;
float4 l9_35=float4(0.0);
float4 l9_36=(*sc_set2.UserUniforms).Port_Default_N369;
ssGlobals l9_37=l9_23;
float4 l9_38;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_39=float2(0.0);
float l9_40=0.0;
float2 l9_41=float2(0.0);
float2 l9_42=float2(0.0);
float2 l9_43=float2(0.0);
float2 l9_44=float2(0.0);
float2 l9_45=float2(0.0);
ssGlobals l9_46=l9_37;
float2 l9_47;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_48=float2(0.0);
l9_48=l9_46.Surface_UVCoord0;
l9_41=l9_48;
l9_47=l9_41;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_49=float2(0.0);
l9_49=l9_46.Surface_UVCoord1;
l9_42=l9_49;
l9_47=l9_42;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_50=float2(0.0);
float l9_51=0.0;
float2 l9_52=float2(0.0);
float2 l9_53=float2(0.0);
ssGlobals l9_54=l9_46;
float2 l9_55;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_56=float2(0.0);
float l9_57=0.0;
float2 l9_58=float2(0.0);
float2 l9_59=float2(0.0);
ssGlobals l9_60=l9_54;
float2 l9_61;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_62=float2(0.0);
float l9_63=0.0;
float2 l9_64=float2(0.0);
float2 l9_65=float2(0.0);
float2 l9_66=float2(0.0);
float2 l9_67=float2(0.0);
ssGlobals l9_68=l9_60;
float2 l9_69;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_70=float2(0.0);
l9_70=l9_68.Surface_UVCoord0;
l9_64=l9_70;
l9_69=l9_64;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_71=float2(0.0);
l9_71=l9_68.Surface_UVCoord1;
l9_65=l9_71;
l9_69=l9_65;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_72=float2(0.0);
l9_72=l9_68.gScreenCoord;
l9_66=l9_72;
l9_69=l9_66;
}
else
{
float2 l9_73=float2(0.0);
l9_73=l9_68.Surface_UVCoord0;
l9_67=l9_73;
l9_69=l9_67;
}
}
}
l9_62=l9_69;
float2 l9_74=float2(0.0);
ssGlobals l9_75=l9_60;
float2 l9_76=(*sc_set2.UserUniforms).uv2Scale;
l9_74=l9_76;
float2 l9_77=float2(0.0);
l9_77=l9_74;
float2 l9_78=float2(0.0);
ssGlobals l9_79=l9_60;
float2 l9_80=(*sc_set2.UserUniforms).uv2Offset;
l9_78=l9_80;
float2 l9_81=float2(0.0);
l9_81=l9_78;
float2 l9_82=float2(0.0);
l9_82=(l9_62*l9_77)+l9_81;
float2 l9_83=float2(0.0);
l9_83=l9_82+(l9_81*(l9_60.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_58=l9_83;
l9_61=l9_58;
}
else
{
float2 l9_84=float2(0.0);
float l9_85=0.0;
float2 l9_86=float2(0.0);
float2 l9_87=float2(0.0);
float2 l9_88=float2(0.0);
float2 l9_89=float2(0.0);
ssGlobals l9_90=l9_60;
float2 l9_91;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_92=float2(0.0);
l9_92=l9_90.Surface_UVCoord0;
l9_86=l9_92;
l9_91=l9_86;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_93=float2(0.0);
l9_93=l9_90.Surface_UVCoord1;
l9_87=l9_93;
l9_91=l9_87;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_94=float2(0.0);
l9_94=l9_90.gScreenCoord;
l9_88=l9_94;
l9_91=l9_88;
}
else
{
float2 l9_95=float2(0.0);
l9_95=l9_90.Surface_UVCoord0;
l9_89=l9_95;
l9_91=l9_89;
}
}
}
l9_84=l9_91;
float2 l9_96=float2(0.0);
ssGlobals l9_97=l9_60;
float2 l9_98=(*sc_set2.UserUniforms).uv2Scale;
l9_96=l9_98;
float2 l9_99=float2(0.0);
l9_99=l9_96;
float2 l9_100=float2(0.0);
ssGlobals l9_101=l9_60;
float2 l9_102=(*sc_set2.UserUniforms).uv2Offset;
l9_100=l9_102;
float2 l9_103=float2(0.0);
l9_103=l9_100;
float2 l9_104=float2(0.0);
l9_104=(l9_84*l9_99)+l9_103;
l9_59=l9_104;
l9_61=l9_59;
}
l9_56=l9_61;
l9_52=l9_56;
l9_55=l9_52;
}
else
{
float2 l9_105=float2(0.0);
l9_105=l9_54.Surface_UVCoord0;
l9_53=l9_105;
l9_55=l9_53;
}
l9_50=l9_55;
float2 l9_106=float2(0.0);
l9_106=l9_50;
float2 l9_107=float2(0.0);
l9_107=l9_106;
l9_43=l9_107;
l9_47=l9_43;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_108=float2(0.0);
float l9_109=0.0;
float2 l9_110=float2(0.0);
float2 l9_111=float2(0.0);
ssGlobals l9_112=l9_46;
float2 l9_113;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_114=float2(0.0);
float l9_115=0.0;
float2 l9_116=float2(0.0);
float2 l9_117=float2(0.0);
ssGlobals l9_118=l9_112;
float2 l9_119;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_120=float2(0.0);
float l9_121=0.0;
float2 l9_122=float2(0.0);
float2 l9_123=float2(0.0);
float2 l9_124=float2(0.0);
float2 l9_125=float2(0.0);
float2 l9_126=float2(0.0);
ssGlobals l9_127=l9_118;
float2 l9_128;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_129=float2(0.0);
l9_129=l9_127.Surface_UVCoord0;
l9_122=l9_129;
l9_128=l9_122;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_130=float2(0.0);
l9_130=l9_127.Surface_UVCoord1;
l9_123=l9_130;
l9_128=l9_123;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_131=float2(0.0);
l9_131=l9_127.gScreenCoord;
l9_124=l9_131;
l9_128=l9_124;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_132=float2(0.0);
float l9_133=0.0;
float2 l9_134=float2(0.0);
float2 l9_135=float2(0.0);
ssGlobals l9_136=l9_127;
float2 l9_137;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_138=float2(0.0);
float l9_139=0.0;
float2 l9_140=float2(0.0);
float2 l9_141=float2(0.0);
ssGlobals l9_142=l9_136;
float2 l9_143;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_144=float2(0.0);
float l9_145=0.0;
float2 l9_146=float2(0.0);
float2 l9_147=float2(0.0);
float2 l9_148=float2(0.0);
float2 l9_149=float2(0.0);
ssGlobals l9_150=l9_142;
float2 l9_151;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_152=float2(0.0);
l9_152=l9_150.Surface_UVCoord0;
l9_146=l9_152;
l9_151=l9_146;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_153=float2(0.0);
l9_153=l9_150.Surface_UVCoord1;
l9_147=l9_153;
l9_151=l9_147;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_154=float2(0.0);
l9_154=l9_150.gScreenCoord;
l9_148=l9_154;
l9_151=l9_148;
}
else
{
float2 l9_155=float2(0.0);
l9_155=l9_150.Surface_UVCoord0;
l9_149=l9_155;
l9_151=l9_149;
}
}
}
l9_144=l9_151;
float2 l9_156=float2(0.0);
ssGlobals l9_157=l9_142;
float2 l9_158=(*sc_set2.UserUniforms).uv2Scale;
l9_156=l9_158;
float2 l9_159=float2(0.0);
l9_159=l9_156;
float2 l9_160=float2(0.0);
ssGlobals l9_161=l9_142;
float2 l9_162=(*sc_set2.UserUniforms).uv2Offset;
l9_160=l9_162;
float2 l9_163=float2(0.0);
l9_163=l9_160;
float2 l9_164=float2(0.0);
l9_164=(l9_144*l9_159)+l9_163;
float2 l9_165=float2(0.0);
l9_165=l9_164+(l9_163*(l9_142.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_140=l9_165;
l9_143=l9_140;
}
else
{
float2 l9_166=float2(0.0);
float l9_167=0.0;
float2 l9_168=float2(0.0);
float2 l9_169=float2(0.0);
float2 l9_170=float2(0.0);
float2 l9_171=float2(0.0);
ssGlobals l9_172=l9_142;
float2 l9_173;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_174=float2(0.0);
l9_174=l9_172.Surface_UVCoord0;
l9_168=l9_174;
l9_173=l9_168;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_175=float2(0.0);
l9_175=l9_172.Surface_UVCoord1;
l9_169=l9_175;
l9_173=l9_169;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_176=float2(0.0);
l9_176=l9_172.gScreenCoord;
l9_170=l9_176;
l9_173=l9_170;
}
else
{
float2 l9_177=float2(0.0);
l9_177=l9_172.Surface_UVCoord0;
l9_171=l9_177;
l9_173=l9_171;
}
}
}
l9_166=l9_173;
float2 l9_178=float2(0.0);
ssGlobals l9_179=l9_142;
float2 l9_180=(*sc_set2.UserUniforms).uv2Scale;
l9_178=l9_180;
float2 l9_181=float2(0.0);
l9_181=l9_178;
float2 l9_182=float2(0.0);
ssGlobals l9_183=l9_142;
float2 l9_184=(*sc_set2.UserUniforms).uv2Offset;
l9_182=l9_184;
float2 l9_185=float2(0.0);
l9_185=l9_182;
float2 l9_186=float2(0.0);
l9_186=(l9_166*l9_181)+l9_185;
l9_141=l9_186;
l9_143=l9_141;
}
l9_138=l9_143;
l9_134=l9_138;
l9_137=l9_134;
}
else
{
float2 l9_187=float2(0.0);
l9_187=l9_136.Surface_UVCoord0;
l9_135=l9_187;
l9_137=l9_135;
}
l9_132=l9_137;
float2 l9_188=float2(0.0);
l9_188=l9_132;
float2 l9_189=float2(0.0);
l9_189=l9_188;
l9_125=l9_189;
l9_128=l9_125;
}
else
{
float2 l9_190=float2(0.0);
l9_190=l9_127.Surface_UVCoord0;
l9_126=l9_190;
l9_128=l9_126;
}
}
}
}
l9_120=l9_128;
float2 l9_191=float2(0.0);
ssGlobals l9_192=l9_118;
float2 l9_193=(*sc_set2.UserUniforms).uv3Scale;
l9_191=l9_193;
float2 l9_194=float2(0.0);
l9_194=l9_191;
float2 l9_195=float2(0.0);
ssGlobals l9_196=l9_118;
float2 l9_197=(*sc_set2.UserUniforms).uv3Offset;
l9_195=l9_197;
float2 l9_198=float2(0.0);
l9_198=l9_195;
float2 l9_199=float2(0.0);
l9_199=(l9_120*l9_194)+l9_198;
float2 l9_200=float2(0.0);
l9_200=l9_199+(l9_198*(l9_118.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_116=l9_200;
l9_119=l9_116;
}
else
{
float2 l9_201=float2(0.0);
float l9_202=0.0;
float2 l9_203=float2(0.0);
float2 l9_204=float2(0.0);
float2 l9_205=float2(0.0);
float2 l9_206=float2(0.0);
float2 l9_207=float2(0.0);
ssGlobals l9_208=l9_118;
float2 l9_209;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_210=float2(0.0);
l9_210=l9_208.Surface_UVCoord0;
l9_203=l9_210;
l9_209=l9_203;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_211=float2(0.0);
l9_211=l9_208.Surface_UVCoord1;
l9_204=l9_211;
l9_209=l9_204;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_212=float2(0.0);
l9_212=l9_208.gScreenCoord;
l9_205=l9_212;
l9_209=l9_205;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_213=float2(0.0);
float l9_214=0.0;
float2 l9_215=float2(0.0);
float2 l9_216=float2(0.0);
ssGlobals l9_217=l9_208;
float2 l9_218;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_219=float2(0.0);
float l9_220=0.0;
float2 l9_221=float2(0.0);
float2 l9_222=float2(0.0);
ssGlobals l9_223=l9_217;
float2 l9_224;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_225=float2(0.0);
float l9_226=0.0;
float2 l9_227=float2(0.0);
float2 l9_228=float2(0.0);
float2 l9_229=float2(0.0);
float2 l9_230=float2(0.0);
ssGlobals l9_231=l9_223;
float2 l9_232;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_233=float2(0.0);
l9_233=l9_231.Surface_UVCoord0;
l9_227=l9_233;
l9_232=l9_227;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_234=float2(0.0);
l9_234=l9_231.Surface_UVCoord1;
l9_228=l9_234;
l9_232=l9_228;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_235=float2(0.0);
l9_235=l9_231.gScreenCoord;
l9_229=l9_235;
l9_232=l9_229;
}
else
{
float2 l9_236=float2(0.0);
l9_236=l9_231.Surface_UVCoord0;
l9_230=l9_236;
l9_232=l9_230;
}
}
}
l9_225=l9_232;
float2 l9_237=float2(0.0);
ssGlobals l9_238=l9_223;
float2 l9_239=(*sc_set2.UserUniforms).uv2Scale;
l9_237=l9_239;
float2 l9_240=float2(0.0);
l9_240=l9_237;
float2 l9_241=float2(0.0);
ssGlobals l9_242=l9_223;
float2 l9_243=(*sc_set2.UserUniforms).uv2Offset;
l9_241=l9_243;
float2 l9_244=float2(0.0);
l9_244=l9_241;
float2 l9_245=float2(0.0);
l9_245=(l9_225*l9_240)+l9_244;
float2 l9_246=float2(0.0);
l9_246=l9_245+(l9_244*(l9_223.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_221=l9_246;
l9_224=l9_221;
}
else
{
float2 l9_247=float2(0.0);
float l9_248=0.0;
float2 l9_249=float2(0.0);
float2 l9_250=float2(0.0);
float2 l9_251=float2(0.0);
float2 l9_252=float2(0.0);
ssGlobals l9_253=l9_223;
float2 l9_254;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_255=float2(0.0);
l9_255=l9_253.Surface_UVCoord0;
l9_249=l9_255;
l9_254=l9_249;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_256=float2(0.0);
l9_256=l9_253.Surface_UVCoord1;
l9_250=l9_256;
l9_254=l9_250;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_257=float2(0.0);
l9_257=l9_253.gScreenCoord;
l9_251=l9_257;
l9_254=l9_251;
}
else
{
float2 l9_258=float2(0.0);
l9_258=l9_253.Surface_UVCoord0;
l9_252=l9_258;
l9_254=l9_252;
}
}
}
l9_247=l9_254;
float2 l9_259=float2(0.0);
ssGlobals l9_260=l9_223;
float2 l9_261=(*sc_set2.UserUniforms).uv2Scale;
l9_259=l9_261;
float2 l9_262=float2(0.0);
l9_262=l9_259;
float2 l9_263=float2(0.0);
ssGlobals l9_264=l9_223;
float2 l9_265=(*sc_set2.UserUniforms).uv2Offset;
l9_263=l9_265;
float2 l9_266=float2(0.0);
l9_266=l9_263;
float2 l9_267=float2(0.0);
l9_267=(l9_247*l9_262)+l9_266;
l9_222=l9_267;
l9_224=l9_222;
}
l9_219=l9_224;
l9_215=l9_219;
l9_218=l9_215;
}
else
{
float2 l9_268=float2(0.0);
l9_268=l9_217.Surface_UVCoord0;
l9_216=l9_268;
l9_218=l9_216;
}
l9_213=l9_218;
float2 l9_269=float2(0.0);
l9_269=l9_213;
float2 l9_270=float2(0.0);
l9_270=l9_269;
l9_206=l9_270;
l9_209=l9_206;
}
else
{
float2 l9_271=float2(0.0);
l9_271=l9_208.Surface_UVCoord0;
l9_207=l9_271;
l9_209=l9_207;
}
}
}
}
l9_201=l9_209;
float2 l9_272=float2(0.0);
ssGlobals l9_273=l9_118;
float2 l9_274=(*sc_set2.UserUniforms).uv3Scale;
l9_272=l9_274;
float2 l9_275=float2(0.0);
l9_275=l9_272;
float2 l9_276=float2(0.0);
ssGlobals l9_277=l9_118;
float2 l9_278=(*sc_set2.UserUniforms).uv3Offset;
l9_276=l9_278;
float2 l9_279=float2(0.0);
l9_279=l9_276;
float2 l9_280=float2(0.0);
l9_280=(l9_201*l9_275)+l9_279;
l9_117=l9_280;
l9_119=l9_117;
}
l9_114=l9_119;
l9_110=l9_114;
l9_113=l9_110;
}
else
{
float2 l9_281=float2(0.0);
l9_281=l9_112.Surface_UVCoord0;
l9_111=l9_281;
l9_113=l9_111;
}
l9_108=l9_113;
float2 l9_282=float2(0.0);
l9_282=l9_108;
float2 l9_283=float2(0.0);
l9_283=l9_282;
l9_44=l9_283;
l9_47=l9_44;
}
else
{
float2 l9_284=float2(0.0);
l9_284=l9_46.Surface_UVCoord0;
l9_45=l9_284;
l9_47=l9_45;
}
}
}
}
l9_39=l9_47;
float4 l9_285=float4(0.0);
float2 l9_286=(*sc_set2.UserUniforms).baseTexDims.xy;
float2 l9_287=l9_286;
int l9_288;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_289;
if (sc_StereoRenderingMode_tmp==0)
{
l9_289=0;
}
else
{
l9_289=in.varStereoViewID;
}
int l9_290=l9_289;
l9_288=1-l9_290;
}
else
{
int l9_291;
if (sc_StereoRenderingMode_tmp==0)
{
l9_291=0;
}
else
{
l9_291=in.varStereoViewID;
}
int l9_292=l9_291;
l9_288=l9_292;
}
int l9_293=l9_288;
float2 l9_294=l9_287;
int l9_295=baseTexLayout_tmp;
int l9_296=l9_293;
float2 l9_297=l9_39;
bool l9_298=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_299=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_300=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_301=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_302=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_303=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_304=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_305=0.0;
bool l9_306=l9_303&&(!l9_301);
float l9_307=1.0;
float l9_308=l9_297.x;
int l9_309=l9_300.x;
if (l9_309==1)
{
l9_308=fract(l9_308);
}
else
{
if (l9_309==2)
{
float l9_310=fract(l9_308);
float l9_311=l9_308-l9_310;
float l9_312=step(0.25,fract(l9_311*0.5));
l9_308=mix(l9_310,1.0-l9_310,fast::clamp(l9_312,0.0,1.0));
}
}
l9_297.x=l9_308;
float l9_313=l9_297.y;
int l9_314=l9_300.y;
if (l9_314==1)
{
l9_313=fract(l9_313);
}
else
{
if (l9_314==2)
{
float l9_315=fract(l9_313);
float l9_316=l9_313-l9_315;
float l9_317=step(0.25,fract(l9_316*0.5));
l9_313=mix(l9_315,1.0-l9_315,fast::clamp(l9_317,0.0,1.0));
}
}
l9_297.y=l9_313;
if (l9_301)
{
bool l9_318=l9_303;
bool l9_319;
if (l9_318)
{
l9_319=l9_300.x==3;
}
else
{
l9_319=l9_318;
}
float l9_320=l9_297.x;
float l9_321=l9_302.x;
float l9_322=l9_302.z;
bool l9_323=l9_319;
float l9_324=l9_307;
float l9_325=fast::clamp(l9_320,l9_321,l9_322);
float l9_326=step(abs(l9_320-l9_325),1e-05);
l9_324*=(l9_326+((1.0-float(l9_323))*(1.0-l9_326)));
l9_320=l9_325;
l9_297.x=l9_320;
l9_307=l9_324;
bool l9_327=l9_303;
bool l9_328;
if (l9_327)
{
l9_328=l9_300.y==3;
}
else
{
l9_328=l9_327;
}
float l9_329=l9_297.y;
float l9_330=l9_302.y;
float l9_331=l9_302.w;
bool l9_332=l9_328;
float l9_333=l9_307;
float l9_334=fast::clamp(l9_329,l9_330,l9_331);
float l9_335=step(abs(l9_329-l9_334),1e-05);
l9_333*=(l9_335+((1.0-float(l9_332))*(1.0-l9_335)));
l9_329=l9_334;
l9_297.y=l9_329;
l9_307=l9_333;
}
float2 l9_336=l9_297;
bool l9_337=l9_298;
float3x3 l9_338=l9_299;
if (l9_337)
{
l9_336=float2((l9_338*float3(l9_336,1.0)).xy);
}
float2 l9_339=l9_336;
float2 l9_340=l9_339;
float2 l9_341=l9_340;
l9_297=l9_341;
float l9_342=l9_297.x;
int l9_343=l9_300.x;
bool l9_344=l9_306;
float l9_345=l9_307;
if ((l9_343==0)||(l9_343==3))
{
float l9_346=l9_342;
float l9_347=0.0;
float l9_348=1.0;
bool l9_349=l9_344;
float l9_350=l9_345;
float l9_351=fast::clamp(l9_346,l9_347,l9_348);
float l9_352=step(abs(l9_346-l9_351),1e-05);
l9_350*=(l9_352+((1.0-float(l9_349))*(1.0-l9_352)));
l9_346=l9_351;
l9_342=l9_346;
l9_345=l9_350;
}
l9_297.x=l9_342;
l9_307=l9_345;
float l9_353=l9_297.y;
int l9_354=l9_300.y;
bool l9_355=l9_306;
float l9_356=l9_307;
if ((l9_354==0)||(l9_354==3))
{
float l9_357=l9_353;
float l9_358=0.0;
float l9_359=1.0;
bool l9_360=l9_355;
float l9_361=l9_356;
float l9_362=fast::clamp(l9_357,l9_358,l9_359);
float l9_363=step(abs(l9_357-l9_362),1e-05);
l9_361*=(l9_363+((1.0-float(l9_360))*(1.0-l9_363)));
l9_357=l9_362;
l9_353=l9_357;
l9_356=l9_361;
}
l9_297.y=l9_353;
l9_307=l9_356;
float2 l9_364=l9_294;
float2 l9_365=l9_297;
int l9_366=l9_295;
int l9_367=l9_296;
float l9_368=l9_305;
float2 l9_369=l9_365;
int l9_370=l9_366;
int l9_371=l9_367;
float3 l9_372;
if (l9_370==0)
{
l9_372=float3(l9_369,0.0);
}
else
{
if (l9_370==1)
{
l9_372=float3(l9_369.x,(l9_369.y*0.5)+(0.5-(float(l9_371)*0.5)),0.0);
}
else
{
l9_372=float3(l9_369,float(l9_371));
}
}
float3 l9_373=l9_372;
float3 l9_374=l9_373;
float2 l9_375=l9_364;
float2 l9_376=l9_374.xy;
float l9_377=l9_368;
float4 l9_378=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_376,bias(l9_377));
float4 l9_379=l9_378;
float4 l9_380=l9_379;
if (l9_303)
{
l9_380=mix(l9_304,l9_380,float4(l9_307));
}
float4 l9_381=l9_380;
float4 l9_382=l9_381;
l9_285=l9_381;
l9_35=l9_285;
l9_38=l9_35;
}
else
{
l9_38=l9_36;
}
l9_33=l9_38;
float4 l9_383=float4(0.0);
l9_383=l9_32*l9_33;
float4 l9_384=float4(0.0);
l9_384=l9_383;
float4 l9_385=float4(0.0);
l9_385=l9_384;
float l9_386=0.0;
float l9_387=0.0;
float l9_388=0.0;
float3 l9_389=l9_385.xyz;
ssGlobals l9_390=l9_23;
float l9_391=l9_389.x;
float l9_392=l9_389.y;
float l9_393=l9_389.z;
l9_386=l9_391;
l9_387=l9_392;
l9_388=l9_393;
float3 l9_394=float3(0.0);
l9_394=l9_28*float3(l9_386);
float3 l9_395=float3(0.0);
ssGlobals l9_396=l9_23;
float3 l9_397=(*sc_set2.UserUniforms).recolorGreen;
l9_395=l9_397;
float3 l9_398=float3(0.0);
l9_398=l9_395;
float3 l9_399=float3(0.0);
l9_399=l9_398*float3(l9_387);
float3 l9_400=float3(0.0);
ssGlobals l9_401=l9_23;
float3 l9_402=(*sc_set2.UserUniforms).recolorBlue;
l9_400=l9_402;
float3 l9_403=float3(0.0);
l9_403=l9_400;
float3 l9_404=float3(0.0);
l9_404=l9_403*float3(l9_388);
float3 l9_405=float3(0.0);
l9_405=(l9_394+l9_399)+l9_404;
l9_21=l9_405;
l9_24=l9_21;
}
else
{
float4 l9_406=float4(0.0);
ssGlobals l9_407=l9_23;
float4 l9_408=(*sc_set2.UserUniforms).baseColor;
l9_406=l9_408;
float4 l9_409=float4(0.0);
l9_409=l9_406;
float4 l9_410=float4(0.0);
float l9_411=0.0;
float4 l9_412=float4(0.0);
float4 l9_413=(*sc_set2.UserUniforms).Port_Default_N369;
ssGlobals l9_414=l9_23;
float4 l9_415;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_416=float2(0.0);
float l9_417=0.0;
float2 l9_418=float2(0.0);
float2 l9_419=float2(0.0);
float2 l9_420=float2(0.0);
float2 l9_421=float2(0.0);
float2 l9_422=float2(0.0);
ssGlobals l9_423=l9_414;
float2 l9_424;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_425=float2(0.0);
l9_425=l9_423.Surface_UVCoord0;
l9_418=l9_425;
l9_424=l9_418;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_426=float2(0.0);
l9_426=l9_423.Surface_UVCoord1;
l9_419=l9_426;
l9_424=l9_419;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_427=float2(0.0);
float l9_428=0.0;
float2 l9_429=float2(0.0);
float2 l9_430=float2(0.0);
ssGlobals l9_431=l9_423;
float2 l9_432;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_433=float2(0.0);
float l9_434=0.0;
float2 l9_435=float2(0.0);
float2 l9_436=float2(0.0);
ssGlobals l9_437=l9_431;
float2 l9_438;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_439=float2(0.0);
float l9_440=0.0;
float2 l9_441=float2(0.0);
float2 l9_442=float2(0.0);
float2 l9_443=float2(0.0);
float2 l9_444=float2(0.0);
ssGlobals l9_445=l9_437;
float2 l9_446;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_447=float2(0.0);
l9_447=l9_445.Surface_UVCoord0;
l9_441=l9_447;
l9_446=l9_441;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_448=float2(0.0);
l9_448=l9_445.Surface_UVCoord1;
l9_442=l9_448;
l9_446=l9_442;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_449=float2(0.0);
l9_449=l9_445.gScreenCoord;
l9_443=l9_449;
l9_446=l9_443;
}
else
{
float2 l9_450=float2(0.0);
l9_450=l9_445.Surface_UVCoord0;
l9_444=l9_450;
l9_446=l9_444;
}
}
}
l9_439=l9_446;
float2 l9_451=float2(0.0);
ssGlobals l9_452=l9_437;
float2 l9_453=(*sc_set2.UserUniforms).uv2Scale;
l9_451=l9_453;
float2 l9_454=float2(0.0);
l9_454=l9_451;
float2 l9_455=float2(0.0);
ssGlobals l9_456=l9_437;
float2 l9_457=(*sc_set2.UserUniforms).uv2Offset;
l9_455=l9_457;
float2 l9_458=float2(0.0);
l9_458=l9_455;
float2 l9_459=float2(0.0);
l9_459=(l9_439*l9_454)+l9_458;
float2 l9_460=float2(0.0);
l9_460=l9_459+(l9_458*(l9_437.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_435=l9_460;
l9_438=l9_435;
}
else
{
float2 l9_461=float2(0.0);
float l9_462=0.0;
float2 l9_463=float2(0.0);
float2 l9_464=float2(0.0);
float2 l9_465=float2(0.0);
float2 l9_466=float2(0.0);
ssGlobals l9_467=l9_437;
float2 l9_468;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_469=float2(0.0);
l9_469=l9_467.Surface_UVCoord0;
l9_463=l9_469;
l9_468=l9_463;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_470=float2(0.0);
l9_470=l9_467.Surface_UVCoord1;
l9_464=l9_470;
l9_468=l9_464;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_471=float2(0.0);
l9_471=l9_467.gScreenCoord;
l9_465=l9_471;
l9_468=l9_465;
}
else
{
float2 l9_472=float2(0.0);
l9_472=l9_467.Surface_UVCoord0;
l9_466=l9_472;
l9_468=l9_466;
}
}
}
l9_461=l9_468;
float2 l9_473=float2(0.0);
ssGlobals l9_474=l9_437;
float2 l9_475=(*sc_set2.UserUniforms).uv2Scale;
l9_473=l9_475;
float2 l9_476=float2(0.0);
l9_476=l9_473;
float2 l9_477=float2(0.0);
ssGlobals l9_478=l9_437;
float2 l9_479=(*sc_set2.UserUniforms).uv2Offset;
l9_477=l9_479;
float2 l9_480=float2(0.0);
l9_480=l9_477;
float2 l9_481=float2(0.0);
l9_481=(l9_461*l9_476)+l9_480;
l9_436=l9_481;
l9_438=l9_436;
}
l9_433=l9_438;
l9_429=l9_433;
l9_432=l9_429;
}
else
{
float2 l9_482=float2(0.0);
l9_482=l9_431.Surface_UVCoord0;
l9_430=l9_482;
l9_432=l9_430;
}
l9_427=l9_432;
float2 l9_483=float2(0.0);
l9_483=l9_427;
float2 l9_484=float2(0.0);
l9_484=l9_483;
l9_420=l9_484;
l9_424=l9_420;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_485=float2(0.0);
float l9_486=0.0;
float2 l9_487=float2(0.0);
float2 l9_488=float2(0.0);
ssGlobals l9_489=l9_423;
float2 l9_490;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_491=float2(0.0);
float l9_492=0.0;
float2 l9_493=float2(0.0);
float2 l9_494=float2(0.0);
ssGlobals l9_495=l9_489;
float2 l9_496;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_497=float2(0.0);
float l9_498=0.0;
float2 l9_499=float2(0.0);
float2 l9_500=float2(0.0);
float2 l9_501=float2(0.0);
float2 l9_502=float2(0.0);
float2 l9_503=float2(0.0);
ssGlobals l9_504=l9_495;
float2 l9_505;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_506=float2(0.0);
l9_506=l9_504.Surface_UVCoord0;
l9_499=l9_506;
l9_505=l9_499;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_507=float2(0.0);
l9_507=l9_504.Surface_UVCoord1;
l9_500=l9_507;
l9_505=l9_500;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_508=float2(0.0);
l9_508=l9_504.gScreenCoord;
l9_501=l9_508;
l9_505=l9_501;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_509=float2(0.0);
float l9_510=0.0;
float2 l9_511=float2(0.0);
float2 l9_512=float2(0.0);
ssGlobals l9_513=l9_504;
float2 l9_514;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_515=float2(0.0);
float l9_516=0.0;
float2 l9_517=float2(0.0);
float2 l9_518=float2(0.0);
ssGlobals l9_519=l9_513;
float2 l9_520;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_521=float2(0.0);
float l9_522=0.0;
float2 l9_523=float2(0.0);
float2 l9_524=float2(0.0);
float2 l9_525=float2(0.0);
float2 l9_526=float2(0.0);
ssGlobals l9_527=l9_519;
float2 l9_528;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_529=float2(0.0);
l9_529=l9_527.Surface_UVCoord0;
l9_523=l9_529;
l9_528=l9_523;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_530=float2(0.0);
l9_530=l9_527.Surface_UVCoord1;
l9_524=l9_530;
l9_528=l9_524;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_531=float2(0.0);
l9_531=l9_527.gScreenCoord;
l9_525=l9_531;
l9_528=l9_525;
}
else
{
float2 l9_532=float2(0.0);
l9_532=l9_527.Surface_UVCoord0;
l9_526=l9_532;
l9_528=l9_526;
}
}
}
l9_521=l9_528;
float2 l9_533=float2(0.0);
ssGlobals l9_534=l9_519;
float2 l9_535=(*sc_set2.UserUniforms).uv2Scale;
l9_533=l9_535;
float2 l9_536=float2(0.0);
l9_536=l9_533;
float2 l9_537=float2(0.0);
ssGlobals l9_538=l9_519;
float2 l9_539=(*sc_set2.UserUniforms).uv2Offset;
l9_537=l9_539;
float2 l9_540=float2(0.0);
l9_540=l9_537;
float2 l9_541=float2(0.0);
l9_541=(l9_521*l9_536)+l9_540;
float2 l9_542=float2(0.0);
l9_542=l9_541+(l9_540*(l9_519.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_517=l9_542;
l9_520=l9_517;
}
else
{
float2 l9_543=float2(0.0);
float l9_544=0.0;
float2 l9_545=float2(0.0);
float2 l9_546=float2(0.0);
float2 l9_547=float2(0.0);
float2 l9_548=float2(0.0);
ssGlobals l9_549=l9_519;
float2 l9_550;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_551=float2(0.0);
l9_551=l9_549.Surface_UVCoord0;
l9_545=l9_551;
l9_550=l9_545;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_552=float2(0.0);
l9_552=l9_549.Surface_UVCoord1;
l9_546=l9_552;
l9_550=l9_546;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_553=float2(0.0);
l9_553=l9_549.gScreenCoord;
l9_547=l9_553;
l9_550=l9_547;
}
else
{
float2 l9_554=float2(0.0);
l9_554=l9_549.Surface_UVCoord0;
l9_548=l9_554;
l9_550=l9_548;
}
}
}
l9_543=l9_550;
float2 l9_555=float2(0.0);
ssGlobals l9_556=l9_519;
float2 l9_557=(*sc_set2.UserUniforms).uv2Scale;
l9_555=l9_557;
float2 l9_558=float2(0.0);
l9_558=l9_555;
float2 l9_559=float2(0.0);
ssGlobals l9_560=l9_519;
float2 l9_561=(*sc_set2.UserUniforms).uv2Offset;
l9_559=l9_561;
float2 l9_562=float2(0.0);
l9_562=l9_559;
float2 l9_563=float2(0.0);
l9_563=(l9_543*l9_558)+l9_562;
l9_518=l9_563;
l9_520=l9_518;
}
l9_515=l9_520;
l9_511=l9_515;
l9_514=l9_511;
}
else
{
float2 l9_564=float2(0.0);
l9_564=l9_513.Surface_UVCoord0;
l9_512=l9_564;
l9_514=l9_512;
}
l9_509=l9_514;
float2 l9_565=float2(0.0);
l9_565=l9_509;
float2 l9_566=float2(0.0);
l9_566=l9_565;
l9_502=l9_566;
l9_505=l9_502;
}
else
{
float2 l9_567=float2(0.0);
l9_567=l9_504.Surface_UVCoord0;
l9_503=l9_567;
l9_505=l9_503;
}
}
}
}
l9_497=l9_505;
float2 l9_568=float2(0.0);
ssGlobals l9_569=l9_495;
float2 l9_570=(*sc_set2.UserUniforms).uv3Scale;
l9_568=l9_570;
float2 l9_571=float2(0.0);
l9_571=l9_568;
float2 l9_572=float2(0.0);
ssGlobals l9_573=l9_495;
float2 l9_574=(*sc_set2.UserUniforms).uv3Offset;
l9_572=l9_574;
float2 l9_575=float2(0.0);
l9_575=l9_572;
float2 l9_576=float2(0.0);
l9_576=(l9_497*l9_571)+l9_575;
float2 l9_577=float2(0.0);
l9_577=l9_576+(l9_575*(l9_495.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_493=l9_577;
l9_496=l9_493;
}
else
{
float2 l9_578=float2(0.0);
float l9_579=0.0;
float2 l9_580=float2(0.0);
float2 l9_581=float2(0.0);
float2 l9_582=float2(0.0);
float2 l9_583=float2(0.0);
float2 l9_584=float2(0.0);
ssGlobals l9_585=l9_495;
float2 l9_586;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_587=float2(0.0);
l9_587=l9_585.Surface_UVCoord0;
l9_580=l9_587;
l9_586=l9_580;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_588=float2(0.0);
l9_588=l9_585.Surface_UVCoord1;
l9_581=l9_588;
l9_586=l9_581;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_589=float2(0.0);
l9_589=l9_585.gScreenCoord;
l9_582=l9_589;
l9_586=l9_582;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_590=float2(0.0);
float l9_591=0.0;
float2 l9_592=float2(0.0);
float2 l9_593=float2(0.0);
ssGlobals l9_594=l9_585;
float2 l9_595;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_596=float2(0.0);
float l9_597=0.0;
float2 l9_598=float2(0.0);
float2 l9_599=float2(0.0);
ssGlobals l9_600=l9_594;
float2 l9_601;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_602=float2(0.0);
float l9_603=0.0;
float2 l9_604=float2(0.0);
float2 l9_605=float2(0.0);
float2 l9_606=float2(0.0);
float2 l9_607=float2(0.0);
ssGlobals l9_608=l9_600;
float2 l9_609;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_610=float2(0.0);
l9_610=l9_608.Surface_UVCoord0;
l9_604=l9_610;
l9_609=l9_604;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_611=float2(0.0);
l9_611=l9_608.Surface_UVCoord1;
l9_605=l9_611;
l9_609=l9_605;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_612=float2(0.0);
l9_612=l9_608.gScreenCoord;
l9_606=l9_612;
l9_609=l9_606;
}
else
{
float2 l9_613=float2(0.0);
l9_613=l9_608.Surface_UVCoord0;
l9_607=l9_613;
l9_609=l9_607;
}
}
}
l9_602=l9_609;
float2 l9_614=float2(0.0);
ssGlobals l9_615=l9_600;
float2 l9_616=(*sc_set2.UserUniforms).uv2Scale;
l9_614=l9_616;
float2 l9_617=float2(0.0);
l9_617=l9_614;
float2 l9_618=float2(0.0);
ssGlobals l9_619=l9_600;
float2 l9_620=(*sc_set2.UserUniforms).uv2Offset;
l9_618=l9_620;
float2 l9_621=float2(0.0);
l9_621=l9_618;
float2 l9_622=float2(0.0);
l9_622=(l9_602*l9_617)+l9_621;
float2 l9_623=float2(0.0);
l9_623=l9_622+(l9_621*(l9_600.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_598=l9_623;
l9_601=l9_598;
}
else
{
float2 l9_624=float2(0.0);
float l9_625=0.0;
float2 l9_626=float2(0.0);
float2 l9_627=float2(0.0);
float2 l9_628=float2(0.0);
float2 l9_629=float2(0.0);
ssGlobals l9_630=l9_600;
float2 l9_631;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_632=float2(0.0);
l9_632=l9_630.Surface_UVCoord0;
l9_626=l9_632;
l9_631=l9_626;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_633=float2(0.0);
l9_633=l9_630.Surface_UVCoord1;
l9_627=l9_633;
l9_631=l9_627;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_634=float2(0.0);
l9_634=l9_630.gScreenCoord;
l9_628=l9_634;
l9_631=l9_628;
}
else
{
float2 l9_635=float2(0.0);
l9_635=l9_630.Surface_UVCoord0;
l9_629=l9_635;
l9_631=l9_629;
}
}
}
l9_624=l9_631;
float2 l9_636=float2(0.0);
ssGlobals l9_637=l9_600;
float2 l9_638=(*sc_set2.UserUniforms).uv2Scale;
l9_636=l9_638;
float2 l9_639=float2(0.0);
l9_639=l9_636;
float2 l9_640=float2(0.0);
ssGlobals l9_641=l9_600;
float2 l9_642=(*sc_set2.UserUniforms).uv2Offset;
l9_640=l9_642;
float2 l9_643=float2(0.0);
l9_643=l9_640;
float2 l9_644=float2(0.0);
l9_644=(l9_624*l9_639)+l9_643;
l9_599=l9_644;
l9_601=l9_599;
}
l9_596=l9_601;
l9_592=l9_596;
l9_595=l9_592;
}
else
{
float2 l9_645=float2(0.0);
l9_645=l9_594.Surface_UVCoord0;
l9_593=l9_645;
l9_595=l9_593;
}
l9_590=l9_595;
float2 l9_646=float2(0.0);
l9_646=l9_590;
float2 l9_647=float2(0.0);
l9_647=l9_646;
l9_583=l9_647;
l9_586=l9_583;
}
else
{
float2 l9_648=float2(0.0);
l9_648=l9_585.Surface_UVCoord0;
l9_584=l9_648;
l9_586=l9_584;
}
}
}
}
l9_578=l9_586;
float2 l9_649=float2(0.0);
ssGlobals l9_650=l9_495;
float2 l9_651=(*sc_set2.UserUniforms).uv3Scale;
l9_649=l9_651;
float2 l9_652=float2(0.0);
l9_652=l9_649;
float2 l9_653=float2(0.0);
ssGlobals l9_654=l9_495;
float2 l9_655=(*sc_set2.UserUniforms).uv3Offset;
l9_653=l9_655;
float2 l9_656=float2(0.0);
l9_656=l9_653;
float2 l9_657=float2(0.0);
l9_657=(l9_578*l9_652)+l9_656;
l9_494=l9_657;
l9_496=l9_494;
}
l9_491=l9_496;
l9_487=l9_491;
l9_490=l9_487;
}
else
{
float2 l9_658=float2(0.0);
l9_658=l9_489.Surface_UVCoord0;
l9_488=l9_658;
l9_490=l9_488;
}
l9_485=l9_490;
float2 l9_659=float2(0.0);
l9_659=l9_485;
float2 l9_660=float2(0.0);
l9_660=l9_659;
l9_421=l9_660;
l9_424=l9_421;
}
else
{
float2 l9_661=float2(0.0);
l9_661=l9_423.Surface_UVCoord0;
l9_422=l9_661;
l9_424=l9_422;
}
}
}
}
l9_416=l9_424;
float4 l9_662=float4(0.0);
float2 l9_663=(*sc_set2.UserUniforms).baseTexDims.xy;
float2 l9_664=l9_663;
int l9_665;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_666;
if (sc_StereoRenderingMode_tmp==0)
{
l9_666=0;
}
else
{
l9_666=in.varStereoViewID;
}
int l9_667=l9_666;
l9_665=1-l9_667;
}
else
{
int l9_668;
if (sc_StereoRenderingMode_tmp==0)
{
l9_668=0;
}
else
{
l9_668=in.varStereoViewID;
}
int l9_669=l9_668;
l9_665=l9_669;
}
int l9_670=l9_665;
float2 l9_671=l9_664;
int l9_672=baseTexLayout_tmp;
int l9_673=l9_670;
float2 l9_674=l9_416;
bool l9_675=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_676=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_677=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_678=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_679=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_680=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_681=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_682=0.0;
bool l9_683=l9_680&&(!l9_678);
float l9_684=1.0;
float l9_685=l9_674.x;
int l9_686=l9_677.x;
if (l9_686==1)
{
l9_685=fract(l9_685);
}
else
{
if (l9_686==2)
{
float l9_687=fract(l9_685);
float l9_688=l9_685-l9_687;
float l9_689=step(0.25,fract(l9_688*0.5));
l9_685=mix(l9_687,1.0-l9_687,fast::clamp(l9_689,0.0,1.0));
}
}
l9_674.x=l9_685;
float l9_690=l9_674.y;
int l9_691=l9_677.y;
if (l9_691==1)
{
l9_690=fract(l9_690);
}
else
{
if (l9_691==2)
{
float l9_692=fract(l9_690);
float l9_693=l9_690-l9_692;
float l9_694=step(0.25,fract(l9_693*0.5));
l9_690=mix(l9_692,1.0-l9_692,fast::clamp(l9_694,0.0,1.0));
}
}
l9_674.y=l9_690;
if (l9_678)
{
bool l9_695=l9_680;
bool l9_696;
if (l9_695)
{
l9_696=l9_677.x==3;
}
else
{
l9_696=l9_695;
}
float l9_697=l9_674.x;
float l9_698=l9_679.x;
float l9_699=l9_679.z;
bool l9_700=l9_696;
float l9_701=l9_684;
float l9_702=fast::clamp(l9_697,l9_698,l9_699);
float l9_703=step(abs(l9_697-l9_702),1e-05);
l9_701*=(l9_703+((1.0-float(l9_700))*(1.0-l9_703)));
l9_697=l9_702;
l9_674.x=l9_697;
l9_684=l9_701;
bool l9_704=l9_680;
bool l9_705;
if (l9_704)
{
l9_705=l9_677.y==3;
}
else
{
l9_705=l9_704;
}
float l9_706=l9_674.y;
float l9_707=l9_679.y;
float l9_708=l9_679.w;
bool l9_709=l9_705;
float l9_710=l9_684;
float l9_711=fast::clamp(l9_706,l9_707,l9_708);
float l9_712=step(abs(l9_706-l9_711),1e-05);
l9_710*=(l9_712+((1.0-float(l9_709))*(1.0-l9_712)));
l9_706=l9_711;
l9_674.y=l9_706;
l9_684=l9_710;
}
float2 l9_713=l9_674;
bool l9_714=l9_675;
float3x3 l9_715=l9_676;
if (l9_714)
{
l9_713=float2((l9_715*float3(l9_713,1.0)).xy);
}
float2 l9_716=l9_713;
float2 l9_717=l9_716;
float2 l9_718=l9_717;
l9_674=l9_718;
float l9_719=l9_674.x;
int l9_720=l9_677.x;
bool l9_721=l9_683;
float l9_722=l9_684;
if ((l9_720==0)||(l9_720==3))
{
float l9_723=l9_719;
float l9_724=0.0;
float l9_725=1.0;
bool l9_726=l9_721;
float l9_727=l9_722;
float l9_728=fast::clamp(l9_723,l9_724,l9_725);
float l9_729=step(abs(l9_723-l9_728),1e-05);
l9_727*=(l9_729+((1.0-float(l9_726))*(1.0-l9_729)));
l9_723=l9_728;
l9_719=l9_723;
l9_722=l9_727;
}
l9_674.x=l9_719;
l9_684=l9_722;
float l9_730=l9_674.y;
int l9_731=l9_677.y;
bool l9_732=l9_683;
float l9_733=l9_684;
if ((l9_731==0)||(l9_731==3))
{
float l9_734=l9_730;
float l9_735=0.0;
float l9_736=1.0;
bool l9_737=l9_732;
float l9_738=l9_733;
float l9_739=fast::clamp(l9_734,l9_735,l9_736);
float l9_740=step(abs(l9_734-l9_739),1e-05);
l9_738*=(l9_740+((1.0-float(l9_737))*(1.0-l9_740)));
l9_734=l9_739;
l9_730=l9_734;
l9_733=l9_738;
}
l9_674.y=l9_730;
l9_684=l9_733;
float2 l9_741=l9_671;
float2 l9_742=l9_674;
int l9_743=l9_672;
int l9_744=l9_673;
float l9_745=l9_682;
float2 l9_746=l9_742;
int l9_747=l9_743;
int l9_748=l9_744;
float3 l9_749;
if (l9_747==0)
{
l9_749=float3(l9_746,0.0);
}
else
{
if (l9_747==1)
{
l9_749=float3(l9_746.x,(l9_746.y*0.5)+(0.5-(float(l9_748)*0.5)),0.0);
}
else
{
l9_749=float3(l9_746,float(l9_748));
}
}
float3 l9_750=l9_749;
float3 l9_751=l9_750;
float2 l9_752=l9_741;
float2 l9_753=l9_751.xy;
float l9_754=l9_745;
float4 l9_755=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_753,bias(l9_754));
float4 l9_756=l9_755;
float4 l9_757=l9_756;
if (l9_680)
{
l9_757=mix(l9_681,l9_757,float4(l9_684));
}
float4 l9_758=l9_757;
float4 l9_759=l9_758;
l9_662=l9_758;
l9_412=l9_662;
l9_415=l9_412;
}
else
{
l9_415=l9_413;
}
l9_410=l9_415;
float4 l9_760=float4(0.0);
l9_760=l9_409*l9_410;
float4 l9_761=float4(0.0);
l9_761=l9_760;
float4 l9_762=float4(0.0);
l9_762=l9_761;
l9_22=l9_762.xyz;
l9_24=l9_22;
}
l9_19=l9_24;
float3 l9_763=float3(0.0);
l9_763=l9_19;
float3 l9_764=float3(0.0);
l9_764=l9_763;
float4 l9_765=float4(0.0);
l9_765=float4(l9_764.x,l9_764.y,l9_764.z,l9_765.w);
l9_765.w=(*sc_set2.UserUniforms).Port_Value2_N073;
float4 l9_766=float4(0.0);
l9_766=l9_18*l9_765;
param_1=l9_766;
param_3=param_1;
}
else
{
float3 l9_767=float3(0.0);
float l9_768=0.0;
float3 l9_769=float3(0.0);
float3 l9_770=float3(0.0);
ssGlobals l9_771=param_4;
float3 l9_772;
if ((int(ENABLE_RECOLOR_tmp)!=0))
{
float3 l9_773=float3(0.0);
ssGlobals l9_774=l9_771;
float3 l9_775=(*sc_set2.UserUniforms).recolorRed;
l9_773=l9_775;
float3 l9_776=float3(0.0);
l9_776=l9_773;
float4 l9_777=float4(0.0);
ssGlobals l9_778=l9_771;
float4 l9_779=(*sc_set2.UserUniforms).baseColor;
l9_777=l9_779;
float4 l9_780=float4(0.0);
l9_780=l9_777;
float4 l9_781=float4(0.0);
float l9_782=0.0;
float4 l9_783=float4(0.0);
float4 l9_784=(*sc_set2.UserUniforms).Port_Default_N369;
ssGlobals l9_785=l9_771;
float4 l9_786;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_787=float2(0.0);
float l9_788=0.0;
float2 l9_789=float2(0.0);
float2 l9_790=float2(0.0);
float2 l9_791=float2(0.0);
float2 l9_792=float2(0.0);
float2 l9_793=float2(0.0);
ssGlobals l9_794=l9_785;
float2 l9_795;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_796=float2(0.0);
l9_796=l9_794.Surface_UVCoord0;
l9_789=l9_796;
l9_795=l9_789;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_797=float2(0.0);
l9_797=l9_794.Surface_UVCoord1;
l9_790=l9_797;
l9_795=l9_790;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_798=float2(0.0);
float l9_799=0.0;
float2 l9_800=float2(0.0);
float2 l9_801=float2(0.0);
ssGlobals l9_802=l9_794;
float2 l9_803;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_804=float2(0.0);
float l9_805=0.0;
float2 l9_806=float2(0.0);
float2 l9_807=float2(0.0);
ssGlobals l9_808=l9_802;
float2 l9_809;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_810=float2(0.0);
float l9_811=0.0;
float2 l9_812=float2(0.0);
float2 l9_813=float2(0.0);
float2 l9_814=float2(0.0);
float2 l9_815=float2(0.0);
ssGlobals l9_816=l9_808;
float2 l9_817;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_818=float2(0.0);
l9_818=l9_816.Surface_UVCoord0;
l9_812=l9_818;
l9_817=l9_812;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_819=float2(0.0);
l9_819=l9_816.Surface_UVCoord1;
l9_813=l9_819;
l9_817=l9_813;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_820=float2(0.0);
l9_820=l9_816.gScreenCoord;
l9_814=l9_820;
l9_817=l9_814;
}
else
{
float2 l9_821=float2(0.0);
l9_821=l9_816.Surface_UVCoord0;
l9_815=l9_821;
l9_817=l9_815;
}
}
}
l9_810=l9_817;
float2 l9_822=float2(0.0);
ssGlobals l9_823=l9_808;
float2 l9_824=(*sc_set2.UserUniforms).uv2Scale;
l9_822=l9_824;
float2 l9_825=float2(0.0);
l9_825=l9_822;
float2 l9_826=float2(0.0);
ssGlobals l9_827=l9_808;
float2 l9_828=(*sc_set2.UserUniforms).uv2Offset;
l9_826=l9_828;
float2 l9_829=float2(0.0);
l9_829=l9_826;
float2 l9_830=float2(0.0);
l9_830=(l9_810*l9_825)+l9_829;
float2 l9_831=float2(0.0);
l9_831=l9_830+(l9_829*(l9_808.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_806=l9_831;
l9_809=l9_806;
}
else
{
float2 l9_832=float2(0.0);
float l9_833=0.0;
float2 l9_834=float2(0.0);
float2 l9_835=float2(0.0);
float2 l9_836=float2(0.0);
float2 l9_837=float2(0.0);
ssGlobals l9_838=l9_808;
float2 l9_839;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_840=float2(0.0);
l9_840=l9_838.Surface_UVCoord0;
l9_834=l9_840;
l9_839=l9_834;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_841=float2(0.0);
l9_841=l9_838.Surface_UVCoord1;
l9_835=l9_841;
l9_839=l9_835;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_842=float2(0.0);
l9_842=l9_838.gScreenCoord;
l9_836=l9_842;
l9_839=l9_836;
}
else
{
float2 l9_843=float2(0.0);
l9_843=l9_838.Surface_UVCoord0;
l9_837=l9_843;
l9_839=l9_837;
}
}
}
l9_832=l9_839;
float2 l9_844=float2(0.0);
ssGlobals l9_845=l9_808;
float2 l9_846=(*sc_set2.UserUniforms).uv2Scale;
l9_844=l9_846;
float2 l9_847=float2(0.0);
l9_847=l9_844;
float2 l9_848=float2(0.0);
ssGlobals l9_849=l9_808;
float2 l9_850=(*sc_set2.UserUniforms).uv2Offset;
l9_848=l9_850;
float2 l9_851=float2(0.0);
l9_851=l9_848;
float2 l9_852=float2(0.0);
l9_852=(l9_832*l9_847)+l9_851;
l9_807=l9_852;
l9_809=l9_807;
}
l9_804=l9_809;
l9_800=l9_804;
l9_803=l9_800;
}
else
{
float2 l9_853=float2(0.0);
l9_853=l9_802.Surface_UVCoord0;
l9_801=l9_853;
l9_803=l9_801;
}
l9_798=l9_803;
float2 l9_854=float2(0.0);
l9_854=l9_798;
float2 l9_855=float2(0.0);
l9_855=l9_854;
l9_791=l9_855;
l9_795=l9_791;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_856=float2(0.0);
float l9_857=0.0;
float2 l9_858=float2(0.0);
float2 l9_859=float2(0.0);
ssGlobals l9_860=l9_794;
float2 l9_861;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_862=float2(0.0);
float l9_863=0.0;
float2 l9_864=float2(0.0);
float2 l9_865=float2(0.0);
ssGlobals l9_866=l9_860;
float2 l9_867;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_868=float2(0.0);
float l9_869=0.0;
float2 l9_870=float2(0.0);
float2 l9_871=float2(0.0);
float2 l9_872=float2(0.0);
float2 l9_873=float2(0.0);
float2 l9_874=float2(0.0);
ssGlobals l9_875=l9_866;
float2 l9_876;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_877=float2(0.0);
l9_877=l9_875.Surface_UVCoord0;
l9_870=l9_877;
l9_876=l9_870;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_878=float2(0.0);
l9_878=l9_875.Surface_UVCoord1;
l9_871=l9_878;
l9_876=l9_871;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_879=float2(0.0);
l9_879=l9_875.gScreenCoord;
l9_872=l9_879;
l9_876=l9_872;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_880=float2(0.0);
float l9_881=0.0;
float2 l9_882=float2(0.0);
float2 l9_883=float2(0.0);
ssGlobals l9_884=l9_875;
float2 l9_885;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_886=float2(0.0);
float l9_887=0.0;
float2 l9_888=float2(0.0);
float2 l9_889=float2(0.0);
ssGlobals l9_890=l9_884;
float2 l9_891;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_892=float2(0.0);
float l9_893=0.0;
float2 l9_894=float2(0.0);
float2 l9_895=float2(0.0);
float2 l9_896=float2(0.0);
float2 l9_897=float2(0.0);
ssGlobals l9_898=l9_890;
float2 l9_899;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_900=float2(0.0);
l9_900=l9_898.Surface_UVCoord0;
l9_894=l9_900;
l9_899=l9_894;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_901=float2(0.0);
l9_901=l9_898.Surface_UVCoord1;
l9_895=l9_901;
l9_899=l9_895;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_902=float2(0.0);
l9_902=l9_898.gScreenCoord;
l9_896=l9_902;
l9_899=l9_896;
}
else
{
float2 l9_903=float2(0.0);
l9_903=l9_898.Surface_UVCoord0;
l9_897=l9_903;
l9_899=l9_897;
}
}
}
l9_892=l9_899;
float2 l9_904=float2(0.0);
ssGlobals l9_905=l9_890;
float2 l9_906=(*sc_set2.UserUniforms).uv2Scale;
l9_904=l9_906;
float2 l9_907=float2(0.0);
l9_907=l9_904;
float2 l9_908=float2(0.0);
ssGlobals l9_909=l9_890;
float2 l9_910=(*sc_set2.UserUniforms).uv2Offset;
l9_908=l9_910;
float2 l9_911=float2(0.0);
l9_911=l9_908;
float2 l9_912=float2(0.0);
l9_912=(l9_892*l9_907)+l9_911;
float2 l9_913=float2(0.0);
l9_913=l9_912+(l9_911*(l9_890.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_888=l9_913;
l9_891=l9_888;
}
else
{
float2 l9_914=float2(0.0);
float l9_915=0.0;
float2 l9_916=float2(0.0);
float2 l9_917=float2(0.0);
float2 l9_918=float2(0.0);
float2 l9_919=float2(0.0);
ssGlobals l9_920=l9_890;
float2 l9_921;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_922=float2(0.0);
l9_922=l9_920.Surface_UVCoord0;
l9_916=l9_922;
l9_921=l9_916;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_923=float2(0.0);
l9_923=l9_920.Surface_UVCoord1;
l9_917=l9_923;
l9_921=l9_917;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_924=float2(0.0);
l9_924=l9_920.gScreenCoord;
l9_918=l9_924;
l9_921=l9_918;
}
else
{
float2 l9_925=float2(0.0);
l9_925=l9_920.Surface_UVCoord0;
l9_919=l9_925;
l9_921=l9_919;
}
}
}
l9_914=l9_921;
float2 l9_926=float2(0.0);
ssGlobals l9_927=l9_890;
float2 l9_928=(*sc_set2.UserUniforms).uv2Scale;
l9_926=l9_928;
float2 l9_929=float2(0.0);
l9_929=l9_926;
float2 l9_930=float2(0.0);
ssGlobals l9_931=l9_890;
float2 l9_932=(*sc_set2.UserUniforms).uv2Offset;
l9_930=l9_932;
float2 l9_933=float2(0.0);
l9_933=l9_930;
float2 l9_934=float2(0.0);
l9_934=(l9_914*l9_929)+l9_933;
l9_889=l9_934;
l9_891=l9_889;
}
l9_886=l9_891;
l9_882=l9_886;
l9_885=l9_882;
}
else
{
float2 l9_935=float2(0.0);
l9_935=l9_884.Surface_UVCoord0;
l9_883=l9_935;
l9_885=l9_883;
}
l9_880=l9_885;
float2 l9_936=float2(0.0);
l9_936=l9_880;
float2 l9_937=float2(0.0);
l9_937=l9_936;
l9_873=l9_937;
l9_876=l9_873;
}
else
{
float2 l9_938=float2(0.0);
l9_938=l9_875.Surface_UVCoord0;
l9_874=l9_938;
l9_876=l9_874;
}
}
}
}
l9_868=l9_876;
float2 l9_939=float2(0.0);
ssGlobals l9_940=l9_866;
float2 l9_941=(*sc_set2.UserUniforms).uv3Scale;
l9_939=l9_941;
float2 l9_942=float2(0.0);
l9_942=l9_939;
float2 l9_943=float2(0.0);
ssGlobals l9_944=l9_866;
float2 l9_945=(*sc_set2.UserUniforms).uv3Offset;
l9_943=l9_945;
float2 l9_946=float2(0.0);
l9_946=l9_943;
float2 l9_947=float2(0.0);
l9_947=(l9_868*l9_942)+l9_946;
float2 l9_948=float2(0.0);
l9_948=l9_947+(l9_946*(l9_866.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_864=l9_948;
l9_867=l9_864;
}
else
{
float2 l9_949=float2(0.0);
float l9_950=0.0;
float2 l9_951=float2(0.0);
float2 l9_952=float2(0.0);
float2 l9_953=float2(0.0);
float2 l9_954=float2(0.0);
float2 l9_955=float2(0.0);
ssGlobals l9_956=l9_866;
float2 l9_957;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_958=float2(0.0);
l9_958=l9_956.Surface_UVCoord0;
l9_951=l9_958;
l9_957=l9_951;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_959=float2(0.0);
l9_959=l9_956.Surface_UVCoord1;
l9_952=l9_959;
l9_957=l9_952;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_960=float2(0.0);
l9_960=l9_956.gScreenCoord;
l9_953=l9_960;
l9_957=l9_953;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_961=float2(0.0);
float l9_962=0.0;
float2 l9_963=float2(0.0);
float2 l9_964=float2(0.0);
ssGlobals l9_965=l9_956;
float2 l9_966;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_967=float2(0.0);
float l9_968=0.0;
float2 l9_969=float2(0.0);
float2 l9_970=float2(0.0);
ssGlobals l9_971=l9_965;
float2 l9_972;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_973=float2(0.0);
float l9_974=0.0;
float2 l9_975=float2(0.0);
float2 l9_976=float2(0.0);
float2 l9_977=float2(0.0);
float2 l9_978=float2(0.0);
ssGlobals l9_979=l9_971;
float2 l9_980;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_981=float2(0.0);
l9_981=l9_979.Surface_UVCoord0;
l9_975=l9_981;
l9_980=l9_975;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_982=float2(0.0);
l9_982=l9_979.Surface_UVCoord1;
l9_976=l9_982;
l9_980=l9_976;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_983=float2(0.0);
l9_983=l9_979.gScreenCoord;
l9_977=l9_983;
l9_980=l9_977;
}
else
{
float2 l9_984=float2(0.0);
l9_984=l9_979.Surface_UVCoord0;
l9_978=l9_984;
l9_980=l9_978;
}
}
}
l9_973=l9_980;
float2 l9_985=float2(0.0);
ssGlobals l9_986=l9_971;
float2 l9_987=(*sc_set2.UserUniforms).uv2Scale;
l9_985=l9_987;
float2 l9_988=float2(0.0);
l9_988=l9_985;
float2 l9_989=float2(0.0);
ssGlobals l9_990=l9_971;
float2 l9_991=(*sc_set2.UserUniforms).uv2Offset;
l9_989=l9_991;
float2 l9_992=float2(0.0);
l9_992=l9_989;
float2 l9_993=float2(0.0);
l9_993=(l9_973*l9_988)+l9_992;
float2 l9_994=float2(0.0);
l9_994=l9_993+(l9_992*(l9_971.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_969=l9_994;
l9_972=l9_969;
}
else
{
float2 l9_995=float2(0.0);
float l9_996=0.0;
float2 l9_997=float2(0.0);
float2 l9_998=float2(0.0);
float2 l9_999=float2(0.0);
float2 l9_1000=float2(0.0);
ssGlobals l9_1001=l9_971;
float2 l9_1002;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1003=float2(0.0);
l9_1003=l9_1001.Surface_UVCoord0;
l9_997=l9_1003;
l9_1002=l9_997;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1004=float2(0.0);
l9_1004=l9_1001.Surface_UVCoord1;
l9_998=l9_1004;
l9_1002=l9_998;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1005=float2(0.0);
l9_1005=l9_1001.gScreenCoord;
l9_999=l9_1005;
l9_1002=l9_999;
}
else
{
float2 l9_1006=float2(0.0);
l9_1006=l9_1001.Surface_UVCoord0;
l9_1000=l9_1006;
l9_1002=l9_1000;
}
}
}
l9_995=l9_1002;
float2 l9_1007=float2(0.0);
ssGlobals l9_1008=l9_971;
float2 l9_1009=(*sc_set2.UserUniforms).uv2Scale;
l9_1007=l9_1009;
float2 l9_1010=float2(0.0);
l9_1010=l9_1007;
float2 l9_1011=float2(0.0);
ssGlobals l9_1012=l9_971;
float2 l9_1013=(*sc_set2.UserUniforms).uv2Offset;
l9_1011=l9_1013;
float2 l9_1014=float2(0.0);
l9_1014=l9_1011;
float2 l9_1015=float2(0.0);
l9_1015=(l9_995*l9_1010)+l9_1014;
l9_970=l9_1015;
l9_972=l9_970;
}
l9_967=l9_972;
l9_963=l9_967;
l9_966=l9_963;
}
else
{
float2 l9_1016=float2(0.0);
l9_1016=l9_965.Surface_UVCoord0;
l9_964=l9_1016;
l9_966=l9_964;
}
l9_961=l9_966;
float2 l9_1017=float2(0.0);
l9_1017=l9_961;
float2 l9_1018=float2(0.0);
l9_1018=l9_1017;
l9_954=l9_1018;
l9_957=l9_954;
}
else
{
float2 l9_1019=float2(0.0);
l9_1019=l9_956.Surface_UVCoord0;
l9_955=l9_1019;
l9_957=l9_955;
}
}
}
}
l9_949=l9_957;
float2 l9_1020=float2(0.0);
ssGlobals l9_1021=l9_866;
float2 l9_1022=(*sc_set2.UserUniforms).uv3Scale;
l9_1020=l9_1022;
float2 l9_1023=float2(0.0);
l9_1023=l9_1020;
float2 l9_1024=float2(0.0);
ssGlobals l9_1025=l9_866;
float2 l9_1026=(*sc_set2.UserUniforms).uv3Offset;
l9_1024=l9_1026;
float2 l9_1027=float2(0.0);
l9_1027=l9_1024;
float2 l9_1028=float2(0.0);
l9_1028=(l9_949*l9_1023)+l9_1027;
l9_865=l9_1028;
l9_867=l9_865;
}
l9_862=l9_867;
l9_858=l9_862;
l9_861=l9_858;
}
else
{
float2 l9_1029=float2(0.0);
l9_1029=l9_860.Surface_UVCoord0;
l9_859=l9_1029;
l9_861=l9_859;
}
l9_856=l9_861;
float2 l9_1030=float2(0.0);
l9_1030=l9_856;
float2 l9_1031=float2(0.0);
l9_1031=l9_1030;
l9_792=l9_1031;
l9_795=l9_792;
}
else
{
float2 l9_1032=float2(0.0);
l9_1032=l9_794.Surface_UVCoord0;
l9_793=l9_1032;
l9_795=l9_793;
}
}
}
}
l9_787=l9_795;
float4 l9_1033=float4(0.0);
float2 l9_1034=(*sc_set2.UserUniforms).baseTexDims.xy;
float2 l9_1035=l9_1034;
int l9_1036;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1037;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1037=0;
}
else
{
l9_1037=in.varStereoViewID;
}
int l9_1038=l9_1037;
l9_1036=1-l9_1038;
}
else
{
int l9_1039;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1039=0;
}
else
{
l9_1039=in.varStereoViewID;
}
int l9_1040=l9_1039;
l9_1036=l9_1040;
}
int l9_1041=l9_1036;
float2 l9_1042=l9_1035;
int l9_1043=baseTexLayout_tmp;
int l9_1044=l9_1041;
float2 l9_1045=l9_787;
bool l9_1046=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1047=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_1048=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1049=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1050=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_1051=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1052=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_1053=0.0;
bool l9_1054=l9_1051&&(!l9_1049);
float l9_1055=1.0;
float l9_1056=l9_1045.x;
int l9_1057=l9_1048.x;
if (l9_1057==1)
{
l9_1056=fract(l9_1056);
}
else
{
if (l9_1057==2)
{
float l9_1058=fract(l9_1056);
float l9_1059=l9_1056-l9_1058;
float l9_1060=step(0.25,fract(l9_1059*0.5));
l9_1056=mix(l9_1058,1.0-l9_1058,fast::clamp(l9_1060,0.0,1.0));
}
}
l9_1045.x=l9_1056;
float l9_1061=l9_1045.y;
int l9_1062=l9_1048.y;
if (l9_1062==1)
{
l9_1061=fract(l9_1061);
}
else
{
if (l9_1062==2)
{
float l9_1063=fract(l9_1061);
float l9_1064=l9_1061-l9_1063;
float l9_1065=step(0.25,fract(l9_1064*0.5));
l9_1061=mix(l9_1063,1.0-l9_1063,fast::clamp(l9_1065,0.0,1.0));
}
}
l9_1045.y=l9_1061;
if (l9_1049)
{
bool l9_1066=l9_1051;
bool l9_1067;
if (l9_1066)
{
l9_1067=l9_1048.x==3;
}
else
{
l9_1067=l9_1066;
}
float l9_1068=l9_1045.x;
float l9_1069=l9_1050.x;
float l9_1070=l9_1050.z;
bool l9_1071=l9_1067;
float l9_1072=l9_1055;
float l9_1073=fast::clamp(l9_1068,l9_1069,l9_1070);
float l9_1074=step(abs(l9_1068-l9_1073),1e-05);
l9_1072*=(l9_1074+((1.0-float(l9_1071))*(1.0-l9_1074)));
l9_1068=l9_1073;
l9_1045.x=l9_1068;
l9_1055=l9_1072;
bool l9_1075=l9_1051;
bool l9_1076;
if (l9_1075)
{
l9_1076=l9_1048.y==3;
}
else
{
l9_1076=l9_1075;
}
float l9_1077=l9_1045.y;
float l9_1078=l9_1050.y;
float l9_1079=l9_1050.w;
bool l9_1080=l9_1076;
float l9_1081=l9_1055;
float l9_1082=fast::clamp(l9_1077,l9_1078,l9_1079);
float l9_1083=step(abs(l9_1077-l9_1082),1e-05);
l9_1081*=(l9_1083+((1.0-float(l9_1080))*(1.0-l9_1083)));
l9_1077=l9_1082;
l9_1045.y=l9_1077;
l9_1055=l9_1081;
}
float2 l9_1084=l9_1045;
bool l9_1085=l9_1046;
float3x3 l9_1086=l9_1047;
if (l9_1085)
{
l9_1084=float2((l9_1086*float3(l9_1084,1.0)).xy);
}
float2 l9_1087=l9_1084;
float2 l9_1088=l9_1087;
float2 l9_1089=l9_1088;
l9_1045=l9_1089;
float l9_1090=l9_1045.x;
int l9_1091=l9_1048.x;
bool l9_1092=l9_1054;
float l9_1093=l9_1055;
if ((l9_1091==0)||(l9_1091==3))
{
float l9_1094=l9_1090;
float l9_1095=0.0;
float l9_1096=1.0;
bool l9_1097=l9_1092;
float l9_1098=l9_1093;
float l9_1099=fast::clamp(l9_1094,l9_1095,l9_1096);
float l9_1100=step(abs(l9_1094-l9_1099),1e-05);
l9_1098*=(l9_1100+((1.0-float(l9_1097))*(1.0-l9_1100)));
l9_1094=l9_1099;
l9_1090=l9_1094;
l9_1093=l9_1098;
}
l9_1045.x=l9_1090;
l9_1055=l9_1093;
float l9_1101=l9_1045.y;
int l9_1102=l9_1048.y;
bool l9_1103=l9_1054;
float l9_1104=l9_1055;
if ((l9_1102==0)||(l9_1102==3))
{
float l9_1105=l9_1101;
float l9_1106=0.0;
float l9_1107=1.0;
bool l9_1108=l9_1103;
float l9_1109=l9_1104;
float l9_1110=fast::clamp(l9_1105,l9_1106,l9_1107);
float l9_1111=step(abs(l9_1105-l9_1110),1e-05);
l9_1109*=(l9_1111+((1.0-float(l9_1108))*(1.0-l9_1111)));
l9_1105=l9_1110;
l9_1101=l9_1105;
l9_1104=l9_1109;
}
l9_1045.y=l9_1101;
l9_1055=l9_1104;
float2 l9_1112=l9_1042;
float2 l9_1113=l9_1045;
int l9_1114=l9_1043;
int l9_1115=l9_1044;
float l9_1116=l9_1053;
float2 l9_1117=l9_1113;
int l9_1118=l9_1114;
int l9_1119=l9_1115;
float3 l9_1120;
if (l9_1118==0)
{
l9_1120=float3(l9_1117,0.0);
}
else
{
if (l9_1118==1)
{
l9_1120=float3(l9_1117.x,(l9_1117.y*0.5)+(0.5-(float(l9_1119)*0.5)),0.0);
}
else
{
l9_1120=float3(l9_1117,float(l9_1119));
}
}
float3 l9_1121=l9_1120;
float3 l9_1122=l9_1121;
float2 l9_1123=l9_1112;
float2 l9_1124=l9_1122.xy;
float l9_1125=l9_1116;
float4 l9_1126=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_1124,bias(l9_1125));
float4 l9_1127=l9_1126;
float4 l9_1128=l9_1127;
if (l9_1051)
{
l9_1128=mix(l9_1052,l9_1128,float4(l9_1055));
}
float4 l9_1129=l9_1128;
float4 l9_1130=l9_1129;
l9_1033=l9_1129;
l9_783=l9_1033;
l9_786=l9_783;
}
else
{
l9_786=l9_784;
}
l9_781=l9_786;
float4 l9_1131=float4(0.0);
l9_1131=l9_780*l9_781;
float4 l9_1132=float4(0.0);
l9_1132=l9_1131;
float4 l9_1133=float4(0.0);
l9_1133=l9_1132;
float l9_1134=0.0;
float l9_1135=0.0;
float l9_1136=0.0;
float3 l9_1137=l9_1133.xyz;
ssGlobals l9_1138=l9_771;
float l9_1139=l9_1137.x;
float l9_1140=l9_1137.y;
float l9_1141=l9_1137.z;
l9_1134=l9_1139;
l9_1135=l9_1140;
l9_1136=l9_1141;
float3 l9_1142=float3(0.0);
l9_1142=l9_776*float3(l9_1134);
float3 l9_1143=float3(0.0);
ssGlobals l9_1144=l9_771;
float3 l9_1145=(*sc_set2.UserUniforms).recolorGreen;
l9_1143=l9_1145;
float3 l9_1146=float3(0.0);
l9_1146=l9_1143;
float3 l9_1147=float3(0.0);
l9_1147=l9_1146*float3(l9_1135);
float3 l9_1148=float3(0.0);
ssGlobals l9_1149=l9_771;
float3 l9_1150=(*sc_set2.UserUniforms).recolorBlue;
l9_1148=l9_1150;
float3 l9_1151=float3(0.0);
l9_1151=l9_1148;
float3 l9_1152=float3(0.0);
l9_1152=l9_1151*float3(l9_1136);
float3 l9_1153=float3(0.0);
l9_1153=(l9_1142+l9_1147)+l9_1152;
l9_769=l9_1153;
l9_772=l9_769;
}
else
{
float4 l9_1154=float4(0.0);
ssGlobals l9_1155=l9_771;
float4 l9_1156=(*sc_set2.UserUniforms).baseColor;
l9_1154=l9_1156;
float4 l9_1157=float4(0.0);
l9_1157=l9_1154;
float4 l9_1158=float4(0.0);
float l9_1159=0.0;
float4 l9_1160=float4(0.0);
float4 l9_1161=(*sc_set2.UserUniforms).Port_Default_N369;
ssGlobals l9_1162=l9_771;
float4 l9_1163;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_1164=float2(0.0);
float l9_1165=0.0;
float2 l9_1166=float2(0.0);
float2 l9_1167=float2(0.0);
float2 l9_1168=float2(0.0);
float2 l9_1169=float2(0.0);
float2 l9_1170=float2(0.0);
ssGlobals l9_1171=l9_1162;
float2 l9_1172;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_1173=float2(0.0);
l9_1173=l9_1171.Surface_UVCoord0;
l9_1166=l9_1173;
l9_1172=l9_1166;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_1174=float2(0.0);
l9_1174=l9_1171.Surface_UVCoord1;
l9_1167=l9_1174;
l9_1172=l9_1167;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_1175=float2(0.0);
float l9_1176=0.0;
float2 l9_1177=float2(0.0);
float2 l9_1178=float2(0.0);
ssGlobals l9_1179=l9_1171;
float2 l9_1180;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1181=float2(0.0);
float l9_1182=0.0;
float2 l9_1183=float2(0.0);
float2 l9_1184=float2(0.0);
ssGlobals l9_1185=l9_1179;
float2 l9_1186;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1187=float2(0.0);
float l9_1188=0.0;
float2 l9_1189=float2(0.0);
float2 l9_1190=float2(0.0);
float2 l9_1191=float2(0.0);
float2 l9_1192=float2(0.0);
ssGlobals l9_1193=l9_1185;
float2 l9_1194;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1195=float2(0.0);
l9_1195=l9_1193.Surface_UVCoord0;
l9_1189=l9_1195;
l9_1194=l9_1189;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1196=float2(0.0);
l9_1196=l9_1193.Surface_UVCoord1;
l9_1190=l9_1196;
l9_1194=l9_1190;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1197=float2(0.0);
l9_1197=l9_1193.gScreenCoord;
l9_1191=l9_1197;
l9_1194=l9_1191;
}
else
{
float2 l9_1198=float2(0.0);
l9_1198=l9_1193.Surface_UVCoord0;
l9_1192=l9_1198;
l9_1194=l9_1192;
}
}
}
l9_1187=l9_1194;
float2 l9_1199=float2(0.0);
ssGlobals l9_1200=l9_1185;
float2 l9_1201=(*sc_set2.UserUniforms).uv2Scale;
l9_1199=l9_1201;
float2 l9_1202=float2(0.0);
l9_1202=l9_1199;
float2 l9_1203=float2(0.0);
ssGlobals l9_1204=l9_1185;
float2 l9_1205=(*sc_set2.UserUniforms).uv2Offset;
l9_1203=l9_1205;
float2 l9_1206=float2(0.0);
l9_1206=l9_1203;
float2 l9_1207=float2(0.0);
l9_1207=(l9_1187*l9_1202)+l9_1206;
float2 l9_1208=float2(0.0);
l9_1208=l9_1207+(l9_1206*(l9_1185.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1183=l9_1208;
l9_1186=l9_1183;
}
else
{
float2 l9_1209=float2(0.0);
float l9_1210=0.0;
float2 l9_1211=float2(0.0);
float2 l9_1212=float2(0.0);
float2 l9_1213=float2(0.0);
float2 l9_1214=float2(0.0);
ssGlobals l9_1215=l9_1185;
float2 l9_1216;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1217=float2(0.0);
l9_1217=l9_1215.Surface_UVCoord0;
l9_1211=l9_1217;
l9_1216=l9_1211;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1218=float2(0.0);
l9_1218=l9_1215.Surface_UVCoord1;
l9_1212=l9_1218;
l9_1216=l9_1212;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1219=float2(0.0);
l9_1219=l9_1215.gScreenCoord;
l9_1213=l9_1219;
l9_1216=l9_1213;
}
else
{
float2 l9_1220=float2(0.0);
l9_1220=l9_1215.Surface_UVCoord0;
l9_1214=l9_1220;
l9_1216=l9_1214;
}
}
}
l9_1209=l9_1216;
float2 l9_1221=float2(0.0);
ssGlobals l9_1222=l9_1185;
float2 l9_1223=(*sc_set2.UserUniforms).uv2Scale;
l9_1221=l9_1223;
float2 l9_1224=float2(0.0);
l9_1224=l9_1221;
float2 l9_1225=float2(0.0);
ssGlobals l9_1226=l9_1185;
float2 l9_1227=(*sc_set2.UserUniforms).uv2Offset;
l9_1225=l9_1227;
float2 l9_1228=float2(0.0);
l9_1228=l9_1225;
float2 l9_1229=float2(0.0);
l9_1229=(l9_1209*l9_1224)+l9_1228;
l9_1184=l9_1229;
l9_1186=l9_1184;
}
l9_1181=l9_1186;
l9_1177=l9_1181;
l9_1180=l9_1177;
}
else
{
float2 l9_1230=float2(0.0);
l9_1230=l9_1179.Surface_UVCoord0;
l9_1178=l9_1230;
l9_1180=l9_1178;
}
l9_1175=l9_1180;
float2 l9_1231=float2(0.0);
l9_1231=l9_1175;
float2 l9_1232=float2(0.0);
l9_1232=l9_1231;
l9_1168=l9_1232;
l9_1172=l9_1168;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_1233=float2(0.0);
float l9_1234=0.0;
float2 l9_1235=float2(0.0);
float2 l9_1236=float2(0.0);
ssGlobals l9_1237=l9_1171;
float2 l9_1238;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_1239=float2(0.0);
float l9_1240=0.0;
float2 l9_1241=float2(0.0);
float2 l9_1242=float2(0.0);
ssGlobals l9_1243=l9_1237;
float2 l9_1244;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_1245=float2(0.0);
float l9_1246=0.0;
float2 l9_1247=float2(0.0);
float2 l9_1248=float2(0.0);
float2 l9_1249=float2(0.0);
float2 l9_1250=float2(0.0);
float2 l9_1251=float2(0.0);
ssGlobals l9_1252=l9_1243;
float2 l9_1253;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1254=float2(0.0);
l9_1254=l9_1252.Surface_UVCoord0;
l9_1247=l9_1254;
l9_1253=l9_1247;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1255=float2(0.0);
l9_1255=l9_1252.Surface_UVCoord1;
l9_1248=l9_1255;
l9_1253=l9_1248;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1256=float2(0.0);
l9_1256=l9_1252.gScreenCoord;
l9_1249=l9_1256;
l9_1253=l9_1249;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1257=float2(0.0);
float l9_1258=0.0;
float2 l9_1259=float2(0.0);
float2 l9_1260=float2(0.0);
ssGlobals l9_1261=l9_1252;
float2 l9_1262;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1263=float2(0.0);
float l9_1264=0.0;
float2 l9_1265=float2(0.0);
float2 l9_1266=float2(0.0);
ssGlobals l9_1267=l9_1261;
float2 l9_1268;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1269=float2(0.0);
float l9_1270=0.0;
float2 l9_1271=float2(0.0);
float2 l9_1272=float2(0.0);
float2 l9_1273=float2(0.0);
float2 l9_1274=float2(0.0);
ssGlobals l9_1275=l9_1267;
float2 l9_1276;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1277=float2(0.0);
l9_1277=l9_1275.Surface_UVCoord0;
l9_1271=l9_1277;
l9_1276=l9_1271;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1278=float2(0.0);
l9_1278=l9_1275.Surface_UVCoord1;
l9_1272=l9_1278;
l9_1276=l9_1272;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1279=float2(0.0);
l9_1279=l9_1275.gScreenCoord;
l9_1273=l9_1279;
l9_1276=l9_1273;
}
else
{
float2 l9_1280=float2(0.0);
l9_1280=l9_1275.Surface_UVCoord0;
l9_1274=l9_1280;
l9_1276=l9_1274;
}
}
}
l9_1269=l9_1276;
float2 l9_1281=float2(0.0);
ssGlobals l9_1282=l9_1267;
float2 l9_1283=(*sc_set2.UserUniforms).uv2Scale;
l9_1281=l9_1283;
float2 l9_1284=float2(0.0);
l9_1284=l9_1281;
float2 l9_1285=float2(0.0);
ssGlobals l9_1286=l9_1267;
float2 l9_1287=(*sc_set2.UserUniforms).uv2Offset;
l9_1285=l9_1287;
float2 l9_1288=float2(0.0);
l9_1288=l9_1285;
float2 l9_1289=float2(0.0);
l9_1289=(l9_1269*l9_1284)+l9_1288;
float2 l9_1290=float2(0.0);
l9_1290=l9_1289+(l9_1288*(l9_1267.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1265=l9_1290;
l9_1268=l9_1265;
}
else
{
float2 l9_1291=float2(0.0);
float l9_1292=0.0;
float2 l9_1293=float2(0.0);
float2 l9_1294=float2(0.0);
float2 l9_1295=float2(0.0);
float2 l9_1296=float2(0.0);
ssGlobals l9_1297=l9_1267;
float2 l9_1298;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1299=float2(0.0);
l9_1299=l9_1297.Surface_UVCoord0;
l9_1293=l9_1299;
l9_1298=l9_1293;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1300=float2(0.0);
l9_1300=l9_1297.Surface_UVCoord1;
l9_1294=l9_1300;
l9_1298=l9_1294;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1301=float2(0.0);
l9_1301=l9_1297.gScreenCoord;
l9_1295=l9_1301;
l9_1298=l9_1295;
}
else
{
float2 l9_1302=float2(0.0);
l9_1302=l9_1297.Surface_UVCoord0;
l9_1296=l9_1302;
l9_1298=l9_1296;
}
}
}
l9_1291=l9_1298;
float2 l9_1303=float2(0.0);
ssGlobals l9_1304=l9_1267;
float2 l9_1305=(*sc_set2.UserUniforms).uv2Scale;
l9_1303=l9_1305;
float2 l9_1306=float2(0.0);
l9_1306=l9_1303;
float2 l9_1307=float2(0.0);
ssGlobals l9_1308=l9_1267;
float2 l9_1309=(*sc_set2.UserUniforms).uv2Offset;
l9_1307=l9_1309;
float2 l9_1310=float2(0.0);
l9_1310=l9_1307;
float2 l9_1311=float2(0.0);
l9_1311=(l9_1291*l9_1306)+l9_1310;
l9_1266=l9_1311;
l9_1268=l9_1266;
}
l9_1263=l9_1268;
l9_1259=l9_1263;
l9_1262=l9_1259;
}
else
{
float2 l9_1312=float2(0.0);
l9_1312=l9_1261.Surface_UVCoord0;
l9_1260=l9_1312;
l9_1262=l9_1260;
}
l9_1257=l9_1262;
float2 l9_1313=float2(0.0);
l9_1313=l9_1257;
float2 l9_1314=float2(0.0);
l9_1314=l9_1313;
l9_1250=l9_1314;
l9_1253=l9_1250;
}
else
{
float2 l9_1315=float2(0.0);
l9_1315=l9_1252.Surface_UVCoord0;
l9_1251=l9_1315;
l9_1253=l9_1251;
}
}
}
}
l9_1245=l9_1253;
float2 l9_1316=float2(0.0);
ssGlobals l9_1317=l9_1243;
float2 l9_1318=(*sc_set2.UserUniforms).uv3Scale;
l9_1316=l9_1318;
float2 l9_1319=float2(0.0);
l9_1319=l9_1316;
float2 l9_1320=float2(0.0);
ssGlobals l9_1321=l9_1243;
float2 l9_1322=(*sc_set2.UserUniforms).uv3Offset;
l9_1320=l9_1322;
float2 l9_1323=float2(0.0);
l9_1323=l9_1320;
float2 l9_1324=float2(0.0);
l9_1324=(l9_1245*l9_1319)+l9_1323;
float2 l9_1325=float2(0.0);
l9_1325=l9_1324+(l9_1323*(l9_1243.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_1241=l9_1325;
l9_1244=l9_1241;
}
else
{
float2 l9_1326=float2(0.0);
float l9_1327=0.0;
float2 l9_1328=float2(0.0);
float2 l9_1329=float2(0.0);
float2 l9_1330=float2(0.0);
float2 l9_1331=float2(0.0);
float2 l9_1332=float2(0.0);
ssGlobals l9_1333=l9_1243;
float2 l9_1334;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1335=float2(0.0);
l9_1335=l9_1333.Surface_UVCoord0;
l9_1328=l9_1335;
l9_1334=l9_1328;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1336=float2(0.0);
l9_1336=l9_1333.Surface_UVCoord1;
l9_1329=l9_1336;
l9_1334=l9_1329;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1337=float2(0.0);
l9_1337=l9_1333.gScreenCoord;
l9_1330=l9_1337;
l9_1334=l9_1330;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1338=float2(0.0);
float l9_1339=0.0;
float2 l9_1340=float2(0.0);
float2 l9_1341=float2(0.0);
ssGlobals l9_1342=l9_1333;
float2 l9_1343;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1344=float2(0.0);
float l9_1345=0.0;
float2 l9_1346=float2(0.0);
float2 l9_1347=float2(0.0);
ssGlobals l9_1348=l9_1342;
float2 l9_1349;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1350=float2(0.0);
float l9_1351=0.0;
float2 l9_1352=float2(0.0);
float2 l9_1353=float2(0.0);
float2 l9_1354=float2(0.0);
float2 l9_1355=float2(0.0);
ssGlobals l9_1356=l9_1348;
float2 l9_1357;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1358=float2(0.0);
l9_1358=l9_1356.Surface_UVCoord0;
l9_1352=l9_1358;
l9_1357=l9_1352;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1359=float2(0.0);
l9_1359=l9_1356.Surface_UVCoord1;
l9_1353=l9_1359;
l9_1357=l9_1353;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1360=float2(0.0);
l9_1360=l9_1356.gScreenCoord;
l9_1354=l9_1360;
l9_1357=l9_1354;
}
else
{
float2 l9_1361=float2(0.0);
l9_1361=l9_1356.Surface_UVCoord0;
l9_1355=l9_1361;
l9_1357=l9_1355;
}
}
}
l9_1350=l9_1357;
float2 l9_1362=float2(0.0);
ssGlobals l9_1363=l9_1348;
float2 l9_1364=(*sc_set2.UserUniforms).uv2Scale;
l9_1362=l9_1364;
float2 l9_1365=float2(0.0);
l9_1365=l9_1362;
float2 l9_1366=float2(0.0);
ssGlobals l9_1367=l9_1348;
float2 l9_1368=(*sc_set2.UserUniforms).uv2Offset;
l9_1366=l9_1368;
float2 l9_1369=float2(0.0);
l9_1369=l9_1366;
float2 l9_1370=float2(0.0);
l9_1370=(l9_1350*l9_1365)+l9_1369;
float2 l9_1371=float2(0.0);
l9_1371=l9_1370+(l9_1369*(l9_1348.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1346=l9_1371;
l9_1349=l9_1346;
}
else
{
float2 l9_1372=float2(0.0);
float l9_1373=0.0;
float2 l9_1374=float2(0.0);
float2 l9_1375=float2(0.0);
float2 l9_1376=float2(0.0);
float2 l9_1377=float2(0.0);
ssGlobals l9_1378=l9_1348;
float2 l9_1379;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1380=float2(0.0);
l9_1380=l9_1378.Surface_UVCoord0;
l9_1374=l9_1380;
l9_1379=l9_1374;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1381=float2(0.0);
l9_1381=l9_1378.Surface_UVCoord1;
l9_1375=l9_1381;
l9_1379=l9_1375;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1382=float2(0.0);
l9_1382=l9_1378.gScreenCoord;
l9_1376=l9_1382;
l9_1379=l9_1376;
}
else
{
float2 l9_1383=float2(0.0);
l9_1383=l9_1378.Surface_UVCoord0;
l9_1377=l9_1383;
l9_1379=l9_1377;
}
}
}
l9_1372=l9_1379;
float2 l9_1384=float2(0.0);
ssGlobals l9_1385=l9_1348;
float2 l9_1386=(*sc_set2.UserUniforms).uv2Scale;
l9_1384=l9_1386;
float2 l9_1387=float2(0.0);
l9_1387=l9_1384;
float2 l9_1388=float2(0.0);
ssGlobals l9_1389=l9_1348;
float2 l9_1390=(*sc_set2.UserUniforms).uv2Offset;
l9_1388=l9_1390;
float2 l9_1391=float2(0.0);
l9_1391=l9_1388;
float2 l9_1392=float2(0.0);
l9_1392=(l9_1372*l9_1387)+l9_1391;
l9_1347=l9_1392;
l9_1349=l9_1347;
}
l9_1344=l9_1349;
l9_1340=l9_1344;
l9_1343=l9_1340;
}
else
{
float2 l9_1393=float2(0.0);
l9_1393=l9_1342.Surface_UVCoord0;
l9_1341=l9_1393;
l9_1343=l9_1341;
}
l9_1338=l9_1343;
float2 l9_1394=float2(0.0);
l9_1394=l9_1338;
float2 l9_1395=float2(0.0);
l9_1395=l9_1394;
l9_1331=l9_1395;
l9_1334=l9_1331;
}
else
{
float2 l9_1396=float2(0.0);
l9_1396=l9_1333.Surface_UVCoord0;
l9_1332=l9_1396;
l9_1334=l9_1332;
}
}
}
}
l9_1326=l9_1334;
float2 l9_1397=float2(0.0);
ssGlobals l9_1398=l9_1243;
float2 l9_1399=(*sc_set2.UserUniforms).uv3Scale;
l9_1397=l9_1399;
float2 l9_1400=float2(0.0);
l9_1400=l9_1397;
float2 l9_1401=float2(0.0);
ssGlobals l9_1402=l9_1243;
float2 l9_1403=(*sc_set2.UserUniforms).uv3Offset;
l9_1401=l9_1403;
float2 l9_1404=float2(0.0);
l9_1404=l9_1401;
float2 l9_1405=float2(0.0);
l9_1405=(l9_1326*l9_1400)+l9_1404;
l9_1242=l9_1405;
l9_1244=l9_1242;
}
l9_1239=l9_1244;
l9_1235=l9_1239;
l9_1238=l9_1235;
}
else
{
float2 l9_1406=float2(0.0);
l9_1406=l9_1237.Surface_UVCoord0;
l9_1236=l9_1406;
l9_1238=l9_1236;
}
l9_1233=l9_1238;
float2 l9_1407=float2(0.0);
l9_1407=l9_1233;
float2 l9_1408=float2(0.0);
l9_1408=l9_1407;
l9_1169=l9_1408;
l9_1172=l9_1169;
}
else
{
float2 l9_1409=float2(0.0);
l9_1409=l9_1171.Surface_UVCoord0;
l9_1170=l9_1409;
l9_1172=l9_1170;
}
}
}
}
l9_1164=l9_1172;
float4 l9_1410=float4(0.0);
float2 l9_1411=(*sc_set2.UserUniforms).baseTexDims.xy;
float2 l9_1412=l9_1411;
int l9_1413;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1414;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1414=0;
}
else
{
l9_1414=in.varStereoViewID;
}
int l9_1415=l9_1414;
l9_1413=1-l9_1415;
}
else
{
int l9_1416;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1416=0;
}
else
{
l9_1416=in.varStereoViewID;
}
int l9_1417=l9_1416;
l9_1413=l9_1417;
}
int l9_1418=l9_1413;
float2 l9_1419=l9_1412;
int l9_1420=baseTexLayout_tmp;
int l9_1421=l9_1418;
float2 l9_1422=l9_1164;
bool l9_1423=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1424=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_1425=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1426=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1427=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_1428=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1429=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_1430=0.0;
bool l9_1431=l9_1428&&(!l9_1426);
float l9_1432=1.0;
float l9_1433=l9_1422.x;
int l9_1434=l9_1425.x;
if (l9_1434==1)
{
l9_1433=fract(l9_1433);
}
else
{
if (l9_1434==2)
{
float l9_1435=fract(l9_1433);
float l9_1436=l9_1433-l9_1435;
float l9_1437=step(0.25,fract(l9_1436*0.5));
l9_1433=mix(l9_1435,1.0-l9_1435,fast::clamp(l9_1437,0.0,1.0));
}
}
l9_1422.x=l9_1433;
float l9_1438=l9_1422.y;
int l9_1439=l9_1425.y;
if (l9_1439==1)
{
l9_1438=fract(l9_1438);
}
else
{
if (l9_1439==2)
{
float l9_1440=fract(l9_1438);
float l9_1441=l9_1438-l9_1440;
float l9_1442=step(0.25,fract(l9_1441*0.5));
l9_1438=mix(l9_1440,1.0-l9_1440,fast::clamp(l9_1442,0.0,1.0));
}
}
l9_1422.y=l9_1438;
if (l9_1426)
{
bool l9_1443=l9_1428;
bool l9_1444;
if (l9_1443)
{
l9_1444=l9_1425.x==3;
}
else
{
l9_1444=l9_1443;
}
float l9_1445=l9_1422.x;
float l9_1446=l9_1427.x;
float l9_1447=l9_1427.z;
bool l9_1448=l9_1444;
float l9_1449=l9_1432;
float l9_1450=fast::clamp(l9_1445,l9_1446,l9_1447);
float l9_1451=step(abs(l9_1445-l9_1450),1e-05);
l9_1449*=(l9_1451+((1.0-float(l9_1448))*(1.0-l9_1451)));
l9_1445=l9_1450;
l9_1422.x=l9_1445;
l9_1432=l9_1449;
bool l9_1452=l9_1428;
bool l9_1453;
if (l9_1452)
{
l9_1453=l9_1425.y==3;
}
else
{
l9_1453=l9_1452;
}
float l9_1454=l9_1422.y;
float l9_1455=l9_1427.y;
float l9_1456=l9_1427.w;
bool l9_1457=l9_1453;
float l9_1458=l9_1432;
float l9_1459=fast::clamp(l9_1454,l9_1455,l9_1456);
float l9_1460=step(abs(l9_1454-l9_1459),1e-05);
l9_1458*=(l9_1460+((1.0-float(l9_1457))*(1.0-l9_1460)));
l9_1454=l9_1459;
l9_1422.y=l9_1454;
l9_1432=l9_1458;
}
float2 l9_1461=l9_1422;
bool l9_1462=l9_1423;
float3x3 l9_1463=l9_1424;
if (l9_1462)
{
l9_1461=float2((l9_1463*float3(l9_1461,1.0)).xy);
}
float2 l9_1464=l9_1461;
float2 l9_1465=l9_1464;
float2 l9_1466=l9_1465;
l9_1422=l9_1466;
float l9_1467=l9_1422.x;
int l9_1468=l9_1425.x;
bool l9_1469=l9_1431;
float l9_1470=l9_1432;
if ((l9_1468==0)||(l9_1468==3))
{
float l9_1471=l9_1467;
float l9_1472=0.0;
float l9_1473=1.0;
bool l9_1474=l9_1469;
float l9_1475=l9_1470;
float l9_1476=fast::clamp(l9_1471,l9_1472,l9_1473);
float l9_1477=step(abs(l9_1471-l9_1476),1e-05);
l9_1475*=(l9_1477+((1.0-float(l9_1474))*(1.0-l9_1477)));
l9_1471=l9_1476;
l9_1467=l9_1471;
l9_1470=l9_1475;
}
l9_1422.x=l9_1467;
l9_1432=l9_1470;
float l9_1478=l9_1422.y;
int l9_1479=l9_1425.y;
bool l9_1480=l9_1431;
float l9_1481=l9_1432;
if ((l9_1479==0)||(l9_1479==3))
{
float l9_1482=l9_1478;
float l9_1483=0.0;
float l9_1484=1.0;
bool l9_1485=l9_1480;
float l9_1486=l9_1481;
float l9_1487=fast::clamp(l9_1482,l9_1483,l9_1484);
float l9_1488=step(abs(l9_1482-l9_1487),1e-05);
l9_1486*=(l9_1488+((1.0-float(l9_1485))*(1.0-l9_1488)));
l9_1482=l9_1487;
l9_1478=l9_1482;
l9_1481=l9_1486;
}
l9_1422.y=l9_1478;
l9_1432=l9_1481;
float2 l9_1489=l9_1419;
float2 l9_1490=l9_1422;
int l9_1491=l9_1420;
int l9_1492=l9_1421;
float l9_1493=l9_1430;
float2 l9_1494=l9_1490;
int l9_1495=l9_1491;
int l9_1496=l9_1492;
float3 l9_1497;
if (l9_1495==0)
{
l9_1497=float3(l9_1494,0.0);
}
else
{
if (l9_1495==1)
{
l9_1497=float3(l9_1494.x,(l9_1494.y*0.5)+(0.5-(float(l9_1496)*0.5)),0.0);
}
else
{
l9_1497=float3(l9_1494,float(l9_1496));
}
}
float3 l9_1498=l9_1497;
float3 l9_1499=l9_1498;
float2 l9_1500=l9_1489;
float2 l9_1501=l9_1499.xy;
float l9_1502=l9_1493;
float4 l9_1503=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_1501,bias(l9_1502));
float4 l9_1504=l9_1503;
float4 l9_1505=l9_1504;
if (l9_1428)
{
l9_1505=mix(l9_1429,l9_1505,float4(l9_1432));
}
float4 l9_1506=l9_1505;
float4 l9_1507=l9_1506;
l9_1410=l9_1506;
l9_1160=l9_1410;
l9_1163=l9_1160;
}
else
{
l9_1163=l9_1161;
}
l9_1158=l9_1163;
float4 l9_1508=float4(0.0);
l9_1508=l9_1157*l9_1158;
float4 l9_1509=float4(0.0);
l9_1509=l9_1508;
float4 l9_1510=float4(0.0);
l9_1510=l9_1509;
l9_770=l9_1510.xyz;
l9_772=l9_770;
}
l9_767=l9_772;
float3 l9_1511=float3(0.0);
l9_1511=l9_767;
float3 l9_1512=float3(0.0);
l9_1512=l9_1511;
float4 l9_1513=float4(0.0);
l9_1513=float4(l9_1512.x,l9_1512.y,l9_1512.z,l9_1513.w);
l9_1513.w=(*sc_set2.UserUniforms).Port_Value2_N073;
param_2=l9_1513;
param_3=param_2;
}
Result_N363=param_3;
float4 Export_N364=float4(0.0);
Export_N364=Result_N363;
float4 Output_N5=float4(0.0);
ssGlobals param_6=Globals;
float4 param_5=(*sc_set2.UserUniforms).baseColor;
Output_N5=param_5;
float4 Value_N384=float4(0.0);
Value_N384=Output_N5;
float4 Result_N369=float4(0.0);
float param_7=0.0;
float4 param_8=float4(0.0);
float4 param_9=(*sc_set2.UserUniforms).Port_Default_N369;
ssGlobals param_11=Globals;
float4 param_10;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_1514=float2(0.0);
float l9_1515=0.0;
float2 l9_1516=float2(0.0);
float2 l9_1517=float2(0.0);
float2 l9_1518=float2(0.0);
float2 l9_1519=float2(0.0);
float2 l9_1520=float2(0.0);
ssGlobals l9_1521=param_11;
float2 l9_1522;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_1523=float2(0.0);
l9_1523=l9_1521.Surface_UVCoord0;
l9_1516=l9_1523;
l9_1522=l9_1516;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_1524=float2(0.0);
l9_1524=l9_1521.Surface_UVCoord1;
l9_1517=l9_1524;
l9_1522=l9_1517;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_1525=float2(0.0);
float l9_1526=0.0;
float2 l9_1527=float2(0.0);
float2 l9_1528=float2(0.0);
ssGlobals l9_1529=l9_1521;
float2 l9_1530;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1531=float2(0.0);
float l9_1532=0.0;
float2 l9_1533=float2(0.0);
float2 l9_1534=float2(0.0);
ssGlobals l9_1535=l9_1529;
float2 l9_1536;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1537=float2(0.0);
float l9_1538=0.0;
float2 l9_1539=float2(0.0);
float2 l9_1540=float2(0.0);
float2 l9_1541=float2(0.0);
float2 l9_1542=float2(0.0);
ssGlobals l9_1543=l9_1535;
float2 l9_1544;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1545=float2(0.0);
l9_1545=l9_1543.Surface_UVCoord0;
l9_1539=l9_1545;
l9_1544=l9_1539;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1546=float2(0.0);
l9_1546=l9_1543.Surface_UVCoord1;
l9_1540=l9_1546;
l9_1544=l9_1540;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1547=float2(0.0);
l9_1547=l9_1543.gScreenCoord;
l9_1541=l9_1547;
l9_1544=l9_1541;
}
else
{
float2 l9_1548=float2(0.0);
l9_1548=l9_1543.Surface_UVCoord0;
l9_1542=l9_1548;
l9_1544=l9_1542;
}
}
}
l9_1537=l9_1544;
float2 l9_1549=float2(0.0);
ssGlobals l9_1550=l9_1535;
float2 l9_1551=(*sc_set2.UserUniforms).uv2Scale;
l9_1549=l9_1551;
float2 l9_1552=float2(0.0);
l9_1552=l9_1549;
float2 l9_1553=float2(0.0);
ssGlobals l9_1554=l9_1535;
float2 l9_1555=(*sc_set2.UserUniforms).uv2Offset;
l9_1553=l9_1555;
float2 l9_1556=float2(0.0);
l9_1556=l9_1553;
float2 l9_1557=float2(0.0);
l9_1557=(l9_1537*l9_1552)+l9_1556;
float2 l9_1558=float2(0.0);
l9_1558=l9_1557+(l9_1556*(l9_1535.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1533=l9_1558;
l9_1536=l9_1533;
}
else
{
float2 l9_1559=float2(0.0);
float l9_1560=0.0;
float2 l9_1561=float2(0.0);
float2 l9_1562=float2(0.0);
float2 l9_1563=float2(0.0);
float2 l9_1564=float2(0.0);
ssGlobals l9_1565=l9_1535;
float2 l9_1566;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1567=float2(0.0);
l9_1567=l9_1565.Surface_UVCoord0;
l9_1561=l9_1567;
l9_1566=l9_1561;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1568=float2(0.0);
l9_1568=l9_1565.Surface_UVCoord1;
l9_1562=l9_1568;
l9_1566=l9_1562;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1569=float2(0.0);
l9_1569=l9_1565.gScreenCoord;
l9_1563=l9_1569;
l9_1566=l9_1563;
}
else
{
float2 l9_1570=float2(0.0);
l9_1570=l9_1565.Surface_UVCoord0;
l9_1564=l9_1570;
l9_1566=l9_1564;
}
}
}
l9_1559=l9_1566;
float2 l9_1571=float2(0.0);
ssGlobals l9_1572=l9_1535;
float2 l9_1573=(*sc_set2.UserUniforms).uv2Scale;
l9_1571=l9_1573;
float2 l9_1574=float2(0.0);
l9_1574=l9_1571;
float2 l9_1575=float2(0.0);
ssGlobals l9_1576=l9_1535;
float2 l9_1577=(*sc_set2.UserUniforms).uv2Offset;
l9_1575=l9_1577;
float2 l9_1578=float2(0.0);
l9_1578=l9_1575;
float2 l9_1579=float2(0.0);
l9_1579=(l9_1559*l9_1574)+l9_1578;
l9_1534=l9_1579;
l9_1536=l9_1534;
}
l9_1531=l9_1536;
l9_1527=l9_1531;
l9_1530=l9_1527;
}
else
{
float2 l9_1580=float2(0.0);
l9_1580=l9_1529.Surface_UVCoord0;
l9_1528=l9_1580;
l9_1530=l9_1528;
}
l9_1525=l9_1530;
float2 l9_1581=float2(0.0);
l9_1581=l9_1525;
float2 l9_1582=float2(0.0);
l9_1582=l9_1581;
l9_1518=l9_1582;
l9_1522=l9_1518;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_1583=float2(0.0);
float l9_1584=0.0;
float2 l9_1585=float2(0.0);
float2 l9_1586=float2(0.0);
ssGlobals l9_1587=l9_1521;
float2 l9_1588;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_1589=float2(0.0);
float l9_1590=0.0;
float2 l9_1591=float2(0.0);
float2 l9_1592=float2(0.0);
ssGlobals l9_1593=l9_1587;
float2 l9_1594;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_1595=float2(0.0);
float l9_1596=0.0;
float2 l9_1597=float2(0.0);
float2 l9_1598=float2(0.0);
float2 l9_1599=float2(0.0);
float2 l9_1600=float2(0.0);
float2 l9_1601=float2(0.0);
ssGlobals l9_1602=l9_1593;
float2 l9_1603;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1604=float2(0.0);
l9_1604=l9_1602.Surface_UVCoord0;
l9_1597=l9_1604;
l9_1603=l9_1597;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1605=float2(0.0);
l9_1605=l9_1602.Surface_UVCoord1;
l9_1598=l9_1605;
l9_1603=l9_1598;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1606=float2(0.0);
l9_1606=l9_1602.gScreenCoord;
l9_1599=l9_1606;
l9_1603=l9_1599;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1607=float2(0.0);
float l9_1608=0.0;
float2 l9_1609=float2(0.0);
float2 l9_1610=float2(0.0);
ssGlobals l9_1611=l9_1602;
float2 l9_1612;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1613=float2(0.0);
float l9_1614=0.0;
float2 l9_1615=float2(0.0);
float2 l9_1616=float2(0.0);
ssGlobals l9_1617=l9_1611;
float2 l9_1618;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1619=float2(0.0);
float l9_1620=0.0;
float2 l9_1621=float2(0.0);
float2 l9_1622=float2(0.0);
float2 l9_1623=float2(0.0);
float2 l9_1624=float2(0.0);
ssGlobals l9_1625=l9_1617;
float2 l9_1626;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1627=float2(0.0);
l9_1627=l9_1625.Surface_UVCoord0;
l9_1621=l9_1627;
l9_1626=l9_1621;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1628=float2(0.0);
l9_1628=l9_1625.Surface_UVCoord1;
l9_1622=l9_1628;
l9_1626=l9_1622;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1629=float2(0.0);
l9_1629=l9_1625.gScreenCoord;
l9_1623=l9_1629;
l9_1626=l9_1623;
}
else
{
float2 l9_1630=float2(0.0);
l9_1630=l9_1625.Surface_UVCoord0;
l9_1624=l9_1630;
l9_1626=l9_1624;
}
}
}
l9_1619=l9_1626;
float2 l9_1631=float2(0.0);
ssGlobals l9_1632=l9_1617;
float2 l9_1633=(*sc_set2.UserUniforms).uv2Scale;
l9_1631=l9_1633;
float2 l9_1634=float2(0.0);
l9_1634=l9_1631;
float2 l9_1635=float2(0.0);
ssGlobals l9_1636=l9_1617;
float2 l9_1637=(*sc_set2.UserUniforms).uv2Offset;
l9_1635=l9_1637;
float2 l9_1638=float2(0.0);
l9_1638=l9_1635;
float2 l9_1639=float2(0.0);
l9_1639=(l9_1619*l9_1634)+l9_1638;
float2 l9_1640=float2(0.0);
l9_1640=l9_1639+(l9_1638*(l9_1617.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1615=l9_1640;
l9_1618=l9_1615;
}
else
{
float2 l9_1641=float2(0.0);
float l9_1642=0.0;
float2 l9_1643=float2(0.0);
float2 l9_1644=float2(0.0);
float2 l9_1645=float2(0.0);
float2 l9_1646=float2(0.0);
ssGlobals l9_1647=l9_1617;
float2 l9_1648;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1649=float2(0.0);
l9_1649=l9_1647.Surface_UVCoord0;
l9_1643=l9_1649;
l9_1648=l9_1643;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1650=float2(0.0);
l9_1650=l9_1647.Surface_UVCoord1;
l9_1644=l9_1650;
l9_1648=l9_1644;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1651=float2(0.0);
l9_1651=l9_1647.gScreenCoord;
l9_1645=l9_1651;
l9_1648=l9_1645;
}
else
{
float2 l9_1652=float2(0.0);
l9_1652=l9_1647.Surface_UVCoord0;
l9_1646=l9_1652;
l9_1648=l9_1646;
}
}
}
l9_1641=l9_1648;
float2 l9_1653=float2(0.0);
ssGlobals l9_1654=l9_1617;
float2 l9_1655=(*sc_set2.UserUniforms).uv2Scale;
l9_1653=l9_1655;
float2 l9_1656=float2(0.0);
l9_1656=l9_1653;
float2 l9_1657=float2(0.0);
ssGlobals l9_1658=l9_1617;
float2 l9_1659=(*sc_set2.UserUniforms).uv2Offset;
l9_1657=l9_1659;
float2 l9_1660=float2(0.0);
l9_1660=l9_1657;
float2 l9_1661=float2(0.0);
l9_1661=(l9_1641*l9_1656)+l9_1660;
l9_1616=l9_1661;
l9_1618=l9_1616;
}
l9_1613=l9_1618;
l9_1609=l9_1613;
l9_1612=l9_1609;
}
else
{
float2 l9_1662=float2(0.0);
l9_1662=l9_1611.Surface_UVCoord0;
l9_1610=l9_1662;
l9_1612=l9_1610;
}
l9_1607=l9_1612;
float2 l9_1663=float2(0.0);
l9_1663=l9_1607;
float2 l9_1664=float2(0.0);
l9_1664=l9_1663;
l9_1600=l9_1664;
l9_1603=l9_1600;
}
else
{
float2 l9_1665=float2(0.0);
l9_1665=l9_1602.Surface_UVCoord0;
l9_1601=l9_1665;
l9_1603=l9_1601;
}
}
}
}
l9_1595=l9_1603;
float2 l9_1666=float2(0.0);
ssGlobals l9_1667=l9_1593;
float2 l9_1668=(*sc_set2.UserUniforms).uv3Scale;
l9_1666=l9_1668;
float2 l9_1669=float2(0.0);
l9_1669=l9_1666;
float2 l9_1670=float2(0.0);
ssGlobals l9_1671=l9_1593;
float2 l9_1672=(*sc_set2.UserUniforms).uv3Offset;
l9_1670=l9_1672;
float2 l9_1673=float2(0.0);
l9_1673=l9_1670;
float2 l9_1674=float2(0.0);
l9_1674=(l9_1595*l9_1669)+l9_1673;
float2 l9_1675=float2(0.0);
l9_1675=l9_1674+(l9_1673*(l9_1593.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_1591=l9_1675;
l9_1594=l9_1591;
}
else
{
float2 l9_1676=float2(0.0);
float l9_1677=0.0;
float2 l9_1678=float2(0.0);
float2 l9_1679=float2(0.0);
float2 l9_1680=float2(0.0);
float2 l9_1681=float2(0.0);
float2 l9_1682=float2(0.0);
ssGlobals l9_1683=l9_1593;
float2 l9_1684;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1685=float2(0.0);
l9_1685=l9_1683.Surface_UVCoord0;
l9_1678=l9_1685;
l9_1684=l9_1678;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1686=float2(0.0);
l9_1686=l9_1683.Surface_UVCoord1;
l9_1679=l9_1686;
l9_1684=l9_1679;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1687=float2(0.0);
l9_1687=l9_1683.gScreenCoord;
l9_1680=l9_1687;
l9_1684=l9_1680;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1688=float2(0.0);
float l9_1689=0.0;
float2 l9_1690=float2(0.0);
float2 l9_1691=float2(0.0);
ssGlobals l9_1692=l9_1683;
float2 l9_1693;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1694=float2(0.0);
float l9_1695=0.0;
float2 l9_1696=float2(0.0);
float2 l9_1697=float2(0.0);
ssGlobals l9_1698=l9_1692;
float2 l9_1699;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1700=float2(0.0);
float l9_1701=0.0;
float2 l9_1702=float2(0.0);
float2 l9_1703=float2(0.0);
float2 l9_1704=float2(0.0);
float2 l9_1705=float2(0.0);
ssGlobals l9_1706=l9_1698;
float2 l9_1707;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1708=float2(0.0);
l9_1708=l9_1706.Surface_UVCoord0;
l9_1702=l9_1708;
l9_1707=l9_1702;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1709=float2(0.0);
l9_1709=l9_1706.Surface_UVCoord1;
l9_1703=l9_1709;
l9_1707=l9_1703;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1710=float2(0.0);
l9_1710=l9_1706.gScreenCoord;
l9_1704=l9_1710;
l9_1707=l9_1704;
}
else
{
float2 l9_1711=float2(0.0);
l9_1711=l9_1706.Surface_UVCoord0;
l9_1705=l9_1711;
l9_1707=l9_1705;
}
}
}
l9_1700=l9_1707;
float2 l9_1712=float2(0.0);
ssGlobals l9_1713=l9_1698;
float2 l9_1714=(*sc_set2.UserUniforms).uv2Scale;
l9_1712=l9_1714;
float2 l9_1715=float2(0.0);
l9_1715=l9_1712;
float2 l9_1716=float2(0.0);
ssGlobals l9_1717=l9_1698;
float2 l9_1718=(*sc_set2.UserUniforms).uv2Offset;
l9_1716=l9_1718;
float2 l9_1719=float2(0.0);
l9_1719=l9_1716;
float2 l9_1720=float2(0.0);
l9_1720=(l9_1700*l9_1715)+l9_1719;
float2 l9_1721=float2(0.0);
l9_1721=l9_1720+(l9_1719*(l9_1698.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1696=l9_1721;
l9_1699=l9_1696;
}
else
{
float2 l9_1722=float2(0.0);
float l9_1723=0.0;
float2 l9_1724=float2(0.0);
float2 l9_1725=float2(0.0);
float2 l9_1726=float2(0.0);
float2 l9_1727=float2(0.0);
ssGlobals l9_1728=l9_1698;
float2 l9_1729;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1730=float2(0.0);
l9_1730=l9_1728.Surface_UVCoord0;
l9_1724=l9_1730;
l9_1729=l9_1724;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1731=float2(0.0);
l9_1731=l9_1728.Surface_UVCoord1;
l9_1725=l9_1731;
l9_1729=l9_1725;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1732=float2(0.0);
l9_1732=l9_1728.gScreenCoord;
l9_1726=l9_1732;
l9_1729=l9_1726;
}
else
{
float2 l9_1733=float2(0.0);
l9_1733=l9_1728.Surface_UVCoord0;
l9_1727=l9_1733;
l9_1729=l9_1727;
}
}
}
l9_1722=l9_1729;
float2 l9_1734=float2(0.0);
ssGlobals l9_1735=l9_1698;
float2 l9_1736=(*sc_set2.UserUniforms).uv2Scale;
l9_1734=l9_1736;
float2 l9_1737=float2(0.0);
l9_1737=l9_1734;
float2 l9_1738=float2(0.0);
ssGlobals l9_1739=l9_1698;
float2 l9_1740=(*sc_set2.UserUniforms).uv2Offset;
l9_1738=l9_1740;
float2 l9_1741=float2(0.0);
l9_1741=l9_1738;
float2 l9_1742=float2(0.0);
l9_1742=(l9_1722*l9_1737)+l9_1741;
l9_1697=l9_1742;
l9_1699=l9_1697;
}
l9_1694=l9_1699;
l9_1690=l9_1694;
l9_1693=l9_1690;
}
else
{
float2 l9_1743=float2(0.0);
l9_1743=l9_1692.Surface_UVCoord0;
l9_1691=l9_1743;
l9_1693=l9_1691;
}
l9_1688=l9_1693;
float2 l9_1744=float2(0.0);
l9_1744=l9_1688;
float2 l9_1745=float2(0.0);
l9_1745=l9_1744;
l9_1681=l9_1745;
l9_1684=l9_1681;
}
else
{
float2 l9_1746=float2(0.0);
l9_1746=l9_1683.Surface_UVCoord0;
l9_1682=l9_1746;
l9_1684=l9_1682;
}
}
}
}
l9_1676=l9_1684;
float2 l9_1747=float2(0.0);
ssGlobals l9_1748=l9_1593;
float2 l9_1749=(*sc_set2.UserUniforms).uv3Scale;
l9_1747=l9_1749;
float2 l9_1750=float2(0.0);
l9_1750=l9_1747;
float2 l9_1751=float2(0.0);
ssGlobals l9_1752=l9_1593;
float2 l9_1753=(*sc_set2.UserUniforms).uv3Offset;
l9_1751=l9_1753;
float2 l9_1754=float2(0.0);
l9_1754=l9_1751;
float2 l9_1755=float2(0.0);
l9_1755=(l9_1676*l9_1750)+l9_1754;
l9_1592=l9_1755;
l9_1594=l9_1592;
}
l9_1589=l9_1594;
l9_1585=l9_1589;
l9_1588=l9_1585;
}
else
{
float2 l9_1756=float2(0.0);
l9_1756=l9_1587.Surface_UVCoord0;
l9_1586=l9_1756;
l9_1588=l9_1586;
}
l9_1583=l9_1588;
float2 l9_1757=float2(0.0);
l9_1757=l9_1583;
float2 l9_1758=float2(0.0);
l9_1758=l9_1757;
l9_1519=l9_1758;
l9_1522=l9_1519;
}
else
{
float2 l9_1759=float2(0.0);
l9_1759=l9_1521.Surface_UVCoord0;
l9_1520=l9_1759;
l9_1522=l9_1520;
}
}
}
}
l9_1514=l9_1522;
float4 l9_1760=float4(0.0);
float2 l9_1761=(*sc_set2.UserUniforms).baseTexDims.xy;
float2 l9_1762=l9_1761;
int l9_1763;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1764;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1764=0;
}
else
{
l9_1764=in.varStereoViewID;
}
int l9_1765=l9_1764;
l9_1763=1-l9_1765;
}
else
{
int l9_1766;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1766=0;
}
else
{
l9_1766=in.varStereoViewID;
}
int l9_1767=l9_1766;
l9_1763=l9_1767;
}
int l9_1768=l9_1763;
float2 l9_1769=l9_1762;
int l9_1770=baseTexLayout_tmp;
int l9_1771=l9_1768;
float2 l9_1772=l9_1514;
bool l9_1773=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1774=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_1775=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1776=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1777=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_1778=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1779=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_1780=0.0;
bool l9_1781=l9_1778&&(!l9_1776);
float l9_1782=1.0;
float l9_1783=l9_1772.x;
int l9_1784=l9_1775.x;
if (l9_1784==1)
{
l9_1783=fract(l9_1783);
}
else
{
if (l9_1784==2)
{
float l9_1785=fract(l9_1783);
float l9_1786=l9_1783-l9_1785;
float l9_1787=step(0.25,fract(l9_1786*0.5));
l9_1783=mix(l9_1785,1.0-l9_1785,fast::clamp(l9_1787,0.0,1.0));
}
}
l9_1772.x=l9_1783;
float l9_1788=l9_1772.y;
int l9_1789=l9_1775.y;
if (l9_1789==1)
{
l9_1788=fract(l9_1788);
}
else
{
if (l9_1789==2)
{
float l9_1790=fract(l9_1788);
float l9_1791=l9_1788-l9_1790;
float l9_1792=step(0.25,fract(l9_1791*0.5));
l9_1788=mix(l9_1790,1.0-l9_1790,fast::clamp(l9_1792,0.0,1.0));
}
}
l9_1772.y=l9_1788;
if (l9_1776)
{
bool l9_1793=l9_1778;
bool l9_1794;
if (l9_1793)
{
l9_1794=l9_1775.x==3;
}
else
{
l9_1794=l9_1793;
}
float l9_1795=l9_1772.x;
float l9_1796=l9_1777.x;
float l9_1797=l9_1777.z;
bool l9_1798=l9_1794;
float l9_1799=l9_1782;
float l9_1800=fast::clamp(l9_1795,l9_1796,l9_1797);
float l9_1801=step(abs(l9_1795-l9_1800),1e-05);
l9_1799*=(l9_1801+((1.0-float(l9_1798))*(1.0-l9_1801)));
l9_1795=l9_1800;
l9_1772.x=l9_1795;
l9_1782=l9_1799;
bool l9_1802=l9_1778;
bool l9_1803;
if (l9_1802)
{
l9_1803=l9_1775.y==3;
}
else
{
l9_1803=l9_1802;
}
float l9_1804=l9_1772.y;
float l9_1805=l9_1777.y;
float l9_1806=l9_1777.w;
bool l9_1807=l9_1803;
float l9_1808=l9_1782;
float l9_1809=fast::clamp(l9_1804,l9_1805,l9_1806);
float l9_1810=step(abs(l9_1804-l9_1809),1e-05);
l9_1808*=(l9_1810+((1.0-float(l9_1807))*(1.0-l9_1810)));
l9_1804=l9_1809;
l9_1772.y=l9_1804;
l9_1782=l9_1808;
}
float2 l9_1811=l9_1772;
bool l9_1812=l9_1773;
float3x3 l9_1813=l9_1774;
if (l9_1812)
{
l9_1811=float2((l9_1813*float3(l9_1811,1.0)).xy);
}
float2 l9_1814=l9_1811;
float2 l9_1815=l9_1814;
float2 l9_1816=l9_1815;
l9_1772=l9_1816;
float l9_1817=l9_1772.x;
int l9_1818=l9_1775.x;
bool l9_1819=l9_1781;
float l9_1820=l9_1782;
if ((l9_1818==0)||(l9_1818==3))
{
float l9_1821=l9_1817;
float l9_1822=0.0;
float l9_1823=1.0;
bool l9_1824=l9_1819;
float l9_1825=l9_1820;
float l9_1826=fast::clamp(l9_1821,l9_1822,l9_1823);
float l9_1827=step(abs(l9_1821-l9_1826),1e-05);
l9_1825*=(l9_1827+((1.0-float(l9_1824))*(1.0-l9_1827)));
l9_1821=l9_1826;
l9_1817=l9_1821;
l9_1820=l9_1825;
}
l9_1772.x=l9_1817;
l9_1782=l9_1820;
float l9_1828=l9_1772.y;
int l9_1829=l9_1775.y;
bool l9_1830=l9_1781;
float l9_1831=l9_1782;
if ((l9_1829==0)||(l9_1829==3))
{
float l9_1832=l9_1828;
float l9_1833=0.0;
float l9_1834=1.0;
bool l9_1835=l9_1830;
float l9_1836=l9_1831;
float l9_1837=fast::clamp(l9_1832,l9_1833,l9_1834);
float l9_1838=step(abs(l9_1832-l9_1837),1e-05);
l9_1836*=(l9_1838+((1.0-float(l9_1835))*(1.0-l9_1838)));
l9_1832=l9_1837;
l9_1828=l9_1832;
l9_1831=l9_1836;
}
l9_1772.y=l9_1828;
l9_1782=l9_1831;
float2 l9_1839=l9_1769;
float2 l9_1840=l9_1772;
int l9_1841=l9_1770;
int l9_1842=l9_1771;
float l9_1843=l9_1780;
float2 l9_1844=l9_1840;
int l9_1845=l9_1841;
int l9_1846=l9_1842;
float3 l9_1847;
if (l9_1845==0)
{
l9_1847=float3(l9_1844,0.0);
}
else
{
if (l9_1845==1)
{
l9_1847=float3(l9_1844.x,(l9_1844.y*0.5)+(0.5-(float(l9_1846)*0.5)),0.0);
}
else
{
l9_1847=float3(l9_1844,float(l9_1846));
}
}
float3 l9_1848=l9_1847;
float3 l9_1849=l9_1848;
float2 l9_1850=l9_1839;
float2 l9_1851=l9_1849.xy;
float l9_1852=l9_1843;
float4 l9_1853=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_1851,bias(l9_1852));
float4 l9_1854=l9_1853;
float4 l9_1855=l9_1854;
if (l9_1778)
{
l9_1855=mix(l9_1779,l9_1855,float4(l9_1782));
}
float4 l9_1856=l9_1855;
float4 l9_1857=l9_1856;
l9_1760=l9_1856;
param_8=l9_1760;
param_10=param_8;
}
else
{
param_10=param_9;
}
Result_N369=param_10;
float4 Output_N148=float4(0.0);
Output_N148=Value_N384*Result_N369;
float4 Export_N385=float4(0.0);
Export_N385=Output_N148;
float4 Value_N166=float4(0.0);
Value_N166=Export_N385;
float Output_N168=0.0;
Output_N168=Value_N166.w;
float Result_N204=0.0;
float param_12=0.0;
float param_13=0.0;
float param_14=(*sc_set2.UserUniforms).Port_Default_N204;
ssGlobals param_16=Globals;
float param_15;
if ((int(ENABLE_OPACITY_TEX_tmp)!=0))
{
float2 l9_1858=float2(0.0);
float l9_1859=0.0;
float2 l9_1860=float2(0.0);
float2 l9_1861=float2(0.0);
float2 l9_1862=float2(0.0);
float2 l9_1863=float2(0.0);
float2 l9_1864=float2(0.0);
ssGlobals l9_1865=param_16;
float2 l9_1866;
if (NODE_69_DROPLIST_ITEM_tmp==0)
{
float2 l9_1867=float2(0.0);
l9_1867=l9_1865.Surface_UVCoord0;
l9_1860=l9_1867;
l9_1866=l9_1860;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==1)
{
float2 l9_1868=float2(0.0);
l9_1868=l9_1865.Surface_UVCoord1;
l9_1861=l9_1868;
l9_1866=l9_1861;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==2)
{
float2 l9_1869=float2(0.0);
float l9_1870=0.0;
float2 l9_1871=float2(0.0);
float2 l9_1872=float2(0.0);
ssGlobals l9_1873=l9_1865;
float2 l9_1874;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1875=float2(0.0);
float l9_1876=0.0;
float2 l9_1877=float2(0.0);
float2 l9_1878=float2(0.0);
ssGlobals l9_1879=l9_1873;
float2 l9_1880;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1881=float2(0.0);
float l9_1882=0.0;
float2 l9_1883=float2(0.0);
float2 l9_1884=float2(0.0);
float2 l9_1885=float2(0.0);
float2 l9_1886=float2(0.0);
ssGlobals l9_1887=l9_1879;
float2 l9_1888;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1889=float2(0.0);
l9_1889=l9_1887.Surface_UVCoord0;
l9_1883=l9_1889;
l9_1888=l9_1883;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1890=float2(0.0);
l9_1890=l9_1887.Surface_UVCoord1;
l9_1884=l9_1890;
l9_1888=l9_1884;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1891=float2(0.0);
l9_1891=l9_1887.gScreenCoord;
l9_1885=l9_1891;
l9_1888=l9_1885;
}
else
{
float2 l9_1892=float2(0.0);
l9_1892=l9_1887.Surface_UVCoord0;
l9_1886=l9_1892;
l9_1888=l9_1886;
}
}
}
l9_1881=l9_1888;
float2 l9_1893=float2(0.0);
ssGlobals l9_1894=l9_1879;
float2 l9_1895=(*sc_set2.UserUniforms).uv2Scale;
l9_1893=l9_1895;
float2 l9_1896=float2(0.0);
l9_1896=l9_1893;
float2 l9_1897=float2(0.0);
ssGlobals l9_1898=l9_1879;
float2 l9_1899=(*sc_set2.UserUniforms).uv2Offset;
l9_1897=l9_1899;
float2 l9_1900=float2(0.0);
l9_1900=l9_1897;
float2 l9_1901=float2(0.0);
l9_1901=(l9_1881*l9_1896)+l9_1900;
float2 l9_1902=float2(0.0);
l9_1902=l9_1901+(l9_1900*(l9_1879.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1877=l9_1902;
l9_1880=l9_1877;
}
else
{
float2 l9_1903=float2(0.0);
float l9_1904=0.0;
float2 l9_1905=float2(0.0);
float2 l9_1906=float2(0.0);
float2 l9_1907=float2(0.0);
float2 l9_1908=float2(0.0);
ssGlobals l9_1909=l9_1879;
float2 l9_1910;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1911=float2(0.0);
l9_1911=l9_1909.Surface_UVCoord0;
l9_1905=l9_1911;
l9_1910=l9_1905;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1912=float2(0.0);
l9_1912=l9_1909.Surface_UVCoord1;
l9_1906=l9_1912;
l9_1910=l9_1906;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1913=float2(0.0);
l9_1913=l9_1909.gScreenCoord;
l9_1907=l9_1913;
l9_1910=l9_1907;
}
else
{
float2 l9_1914=float2(0.0);
l9_1914=l9_1909.Surface_UVCoord0;
l9_1908=l9_1914;
l9_1910=l9_1908;
}
}
}
l9_1903=l9_1910;
float2 l9_1915=float2(0.0);
ssGlobals l9_1916=l9_1879;
float2 l9_1917=(*sc_set2.UserUniforms).uv2Scale;
l9_1915=l9_1917;
float2 l9_1918=float2(0.0);
l9_1918=l9_1915;
float2 l9_1919=float2(0.0);
ssGlobals l9_1920=l9_1879;
float2 l9_1921=(*sc_set2.UserUniforms).uv2Offset;
l9_1919=l9_1921;
float2 l9_1922=float2(0.0);
l9_1922=l9_1919;
float2 l9_1923=float2(0.0);
l9_1923=(l9_1903*l9_1918)+l9_1922;
l9_1878=l9_1923;
l9_1880=l9_1878;
}
l9_1875=l9_1880;
l9_1871=l9_1875;
l9_1874=l9_1871;
}
else
{
float2 l9_1924=float2(0.0);
l9_1924=l9_1873.Surface_UVCoord0;
l9_1872=l9_1924;
l9_1874=l9_1872;
}
l9_1869=l9_1874;
float2 l9_1925=float2(0.0);
l9_1925=l9_1869;
float2 l9_1926=float2(0.0);
l9_1926=l9_1925;
l9_1862=l9_1926;
l9_1866=l9_1862;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==3)
{
float2 l9_1927=float2(0.0);
float l9_1928=0.0;
float2 l9_1929=float2(0.0);
float2 l9_1930=float2(0.0);
ssGlobals l9_1931=l9_1865;
float2 l9_1932;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_1933=float2(0.0);
float l9_1934=0.0;
float2 l9_1935=float2(0.0);
float2 l9_1936=float2(0.0);
ssGlobals l9_1937=l9_1931;
float2 l9_1938;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_1939=float2(0.0);
float l9_1940=0.0;
float2 l9_1941=float2(0.0);
float2 l9_1942=float2(0.0);
float2 l9_1943=float2(0.0);
float2 l9_1944=float2(0.0);
float2 l9_1945=float2(0.0);
ssGlobals l9_1946=l9_1937;
float2 l9_1947;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1948=float2(0.0);
l9_1948=l9_1946.Surface_UVCoord0;
l9_1941=l9_1948;
l9_1947=l9_1941;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1949=float2(0.0);
l9_1949=l9_1946.Surface_UVCoord1;
l9_1942=l9_1949;
l9_1947=l9_1942;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1950=float2(0.0);
l9_1950=l9_1946.gScreenCoord;
l9_1943=l9_1950;
l9_1947=l9_1943;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1951=float2(0.0);
float l9_1952=0.0;
float2 l9_1953=float2(0.0);
float2 l9_1954=float2(0.0);
ssGlobals l9_1955=l9_1946;
float2 l9_1956;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1957=float2(0.0);
float l9_1958=0.0;
float2 l9_1959=float2(0.0);
float2 l9_1960=float2(0.0);
ssGlobals l9_1961=l9_1955;
float2 l9_1962;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1963=float2(0.0);
float l9_1964=0.0;
float2 l9_1965=float2(0.0);
float2 l9_1966=float2(0.0);
float2 l9_1967=float2(0.0);
float2 l9_1968=float2(0.0);
ssGlobals l9_1969=l9_1961;
float2 l9_1970;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1971=float2(0.0);
l9_1971=l9_1969.Surface_UVCoord0;
l9_1965=l9_1971;
l9_1970=l9_1965;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1972=float2(0.0);
l9_1972=l9_1969.Surface_UVCoord1;
l9_1966=l9_1972;
l9_1970=l9_1966;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1973=float2(0.0);
l9_1973=l9_1969.gScreenCoord;
l9_1967=l9_1973;
l9_1970=l9_1967;
}
else
{
float2 l9_1974=float2(0.0);
l9_1974=l9_1969.Surface_UVCoord0;
l9_1968=l9_1974;
l9_1970=l9_1968;
}
}
}
l9_1963=l9_1970;
float2 l9_1975=float2(0.0);
ssGlobals l9_1976=l9_1961;
float2 l9_1977=(*sc_set2.UserUniforms).uv2Scale;
l9_1975=l9_1977;
float2 l9_1978=float2(0.0);
l9_1978=l9_1975;
float2 l9_1979=float2(0.0);
ssGlobals l9_1980=l9_1961;
float2 l9_1981=(*sc_set2.UserUniforms).uv2Offset;
l9_1979=l9_1981;
float2 l9_1982=float2(0.0);
l9_1982=l9_1979;
float2 l9_1983=float2(0.0);
l9_1983=(l9_1963*l9_1978)+l9_1982;
float2 l9_1984=float2(0.0);
l9_1984=l9_1983+(l9_1982*(l9_1961.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1959=l9_1984;
l9_1962=l9_1959;
}
else
{
float2 l9_1985=float2(0.0);
float l9_1986=0.0;
float2 l9_1987=float2(0.0);
float2 l9_1988=float2(0.0);
float2 l9_1989=float2(0.0);
float2 l9_1990=float2(0.0);
ssGlobals l9_1991=l9_1961;
float2 l9_1992;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1993=float2(0.0);
l9_1993=l9_1991.Surface_UVCoord0;
l9_1987=l9_1993;
l9_1992=l9_1987;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1994=float2(0.0);
l9_1994=l9_1991.Surface_UVCoord1;
l9_1988=l9_1994;
l9_1992=l9_1988;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1995=float2(0.0);
l9_1995=l9_1991.gScreenCoord;
l9_1989=l9_1995;
l9_1992=l9_1989;
}
else
{
float2 l9_1996=float2(0.0);
l9_1996=l9_1991.Surface_UVCoord0;
l9_1990=l9_1996;
l9_1992=l9_1990;
}
}
}
l9_1985=l9_1992;
float2 l9_1997=float2(0.0);
ssGlobals l9_1998=l9_1961;
float2 l9_1999=(*sc_set2.UserUniforms).uv2Scale;
l9_1997=l9_1999;
float2 l9_2000=float2(0.0);
l9_2000=l9_1997;
float2 l9_2001=float2(0.0);
ssGlobals l9_2002=l9_1961;
float2 l9_2003=(*sc_set2.UserUniforms).uv2Offset;
l9_2001=l9_2003;
float2 l9_2004=float2(0.0);
l9_2004=l9_2001;
float2 l9_2005=float2(0.0);
l9_2005=(l9_1985*l9_2000)+l9_2004;
l9_1960=l9_2005;
l9_1962=l9_1960;
}
l9_1957=l9_1962;
l9_1953=l9_1957;
l9_1956=l9_1953;
}
else
{
float2 l9_2006=float2(0.0);
l9_2006=l9_1955.Surface_UVCoord0;
l9_1954=l9_2006;
l9_1956=l9_1954;
}
l9_1951=l9_1956;
float2 l9_2007=float2(0.0);
l9_2007=l9_1951;
float2 l9_2008=float2(0.0);
l9_2008=l9_2007;
l9_1944=l9_2008;
l9_1947=l9_1944;
}
else
{
float2 l9_2009=float2(0.0);
l9_2009=l9_1946.Surface_UVCoord0;
l9_1945=l9_2009;
l9_1947=l9_1945;
}
}
}
}
l9_1939=l9_1947;
float2 l9_2010=float2(0.0);
ssGlobals l9_2011=l9_1937;
float2 l9_2012=(*sc_set2.UserUniforms).uv3Scale;
l9_2010=l9_2012;
float2 l9_2013=float2(0.0);
l9_2013=l9_2010;
float2 l9_2014=float2(0.0);
ssGlobals l9_2015=l9_1937;
float2 l9_2016=(*sc_set2.UserUniforms).uv3Offset;
l9_2014=l9_2016;
float2 l9_2017=float2(0.0);
l9_2017=l9_2014;
float2 l9_2018=float2(0.0);
l9_2018=(l9_1939*l9_2013)+l9_2017;
float2 l9_2019=float2(0.0);
l9_2019=l9_2018+(l9_2017*(l9_1937.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_1935=l9_2019;
l9_1938=l9_1935;
}
else
{
float2 l9_2020=float2(0.0);
float l9_2021=0.0;
float2 l9_2022=float2(0.0);
float2 l9_2023=float2(0.0);
float2 l9_2024=float2(0.0);
float2 l9_2025=float2(0.0);
float2 l9_2026=float2(0.0);
ssGlobals l9_2027=l9_1937;
float2 l9_2028;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2029=float2(0.0);
l9_2029=l9_2027.Surface_UVCoord0;
l9_2022=l9_2029;
l9_2028=l9_2022;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2030=float2(0.0);
l9_2030=l9_2027.Surface_UVCoord1;
l9_2023=l9_2030;
l9_2028=l9_2023;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2031=float2(0.0);
l9_2031=l9_2027.gScreenCoord;
l9_2024=l9_2031;
l9_2028=l9_2024;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2032=float2(0.0);
float l9_2033=0.0;
float2 l9_2034=float2(0.0);
float2 l9_2035=float2(0.0);
ssGlobals l9_2036=l9_2027;
float2 l9_2037;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2038=float2(0.0);
float l9_2039=0.0;
float2 l9_2040=float2(0.0);
float2 l9_2041=float2(0.0);
ssGlobals l9_2042=l9_2036;
float2 l9_2043;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2044=float2(0.0);
float l9_2045=0.0;
float2 l9_2046=float2(0.0);
float2 l9_2047=float2(0.0);
float2 l9_2048=float2(0.0);
float2 l9_2049=float2(0.0);
ssGlobals l9_2050=l9_2042;
float2 l9_2051;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2052=float2(0.0);
l9_2052=l9_2050.Surface_UVCoord0;
l9_2046=l9_2052;
l9_2051=l9_2046;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2053=float2(0.0);
l9_2053=l9_2050.Surface_UVCoord1;
l9_2047=l9_2053;
l9_2051=l9_2047;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2054=float2(0.0);
l9_2054=l9_2050.gScreenCoord;
l9_2048=l9_2054;
l9_2051=l9_2048;
}
else
{
float2 l9_2055=float2(0.0);
l9_2055=l9_2050.Surface_UVCoord0;
l9_2049=l9_2055;
l9_2051=l9_2049;
}
}
}
l9_2044=l9_2051;
float2 l9_2056=float2(0.0);
ssGlobals l9_2057=l9_2042;
float2 l9_2058=(*sc_set2.UserUniforms).uv2Scale;
l9_2056=l9_2058;
float2 l9_2059=float2(0.0);
l9_2059=l9_2056;
float2 l9_2060=float2(0.0);
ssGlobals l9_2061=l9_2042;
float2 l9_2062=(*sc_set2.UserUniforms).uv2Offset;
l9_2060=l9_2062;
float2 l9_2063=float2(0.0);
l9_2063=l9_2060;
float2 l9_2064=float2(0.0);
l9_2064=(l9_2044*l9_2059)+l9_2063;
float2 l9_2065=float2(0.0);
l9_2065=l9_2064+(l9_2063*(l9_2042.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2040=l9_2065;
l9_2043=l9_2040;
}
else
{
float2 l9_2066=float2(0.0);
float l9_2067=0.0;
float2 l9_2068=float2(0.0);
float2 l9_2069=float2(0.0);
float2 l9_2070=float2(0.0);
float2 l9_2071=float2(0.0);
ssGlobals l9_2072=l9_2042;
float2 l9_2073;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2074=float2(0.0);
l9_2074=l9_2072.Surface_UVCoord0;
l9_2068=l9_2074;
l9_2073=l9_2068;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2075=float2(0.0);
l9_2075=l9_2072.Surface_UVCoord1;
l9_2069=l9_2075;
l9_2073=l9_2069;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2076=float2(0.0);
l9_2076=l9_2072.gScreenCoord;
l9_2070=l9_2076;
l9_2073=l9_2070;
}
else
{
float2 l9_2077=float2(0.0);
l9_2077=l9_2072.Surface_UVCoord0;
l9_2071=l9_2077;
l9_2073=l9_2071;
}
}
}
l9_2066=l9_2073;
float2 l9_2078=float2(0.0);
ssGlobals l9_2079=l9_2042;
float2 l9_2080=(*sc_set2.UserUniforms).uv2Scale;
l9_2078=l9_2080;
float2 l9_2081=float2(0.0);
l9_2081=l9_2078;
float2 l9_2082=float2(0.0);
ssGlobals l9_2083=l9_2042;
float2 l9_2084=(*sc_set2.UserUniforms).uv2Offset;
l9_2082=l9_2084;
float2 l9_2085=float2(0.0);
l9_2085=l9_2082;
float2 l9_2086=float2(0.0);
l9_2086=(l9_2066*l9_2081)+l9_2085;
l9_2041=l9_2086;
l9_2043=l9_2041;
}
l9_2038=l9_2043;
l9_2034=l9_2038;
l9_2037=l9_2034;
}
else
{
float2 l9_2087=float2(0.0);
l9_2087=l9_2036.Surface_UVCoord0;
l9_2035=l9_2087;
l9_2037=l9_2035;
}
l9_2032=l9_2037;
float2 l9_2088=float2(0.0);
l9_2088=l9_2032;
float2 l9_2089=float2(0.0);
l9_2089=l9_2088;
l9_2025=l9_2089;
l9_2028=l9_2025;
}
else
{
float2 l9_2090=float2(0.0);
l9_2090=l9_2027.Surface_UVCoord0;
l9_2026=l9_2090;
l9_2028=l9_2026;
}
}
}
}
l9_2020=l9_2028;
float2 l9_2091=float2(0.0);
ssGlobals l9_2092=l9_1937;
float2 l9_2093=(*sc_set2.UserUniforms).uv3Scale;
l9_2091=l9_2093;
float2 l9_2094=float2(0.0);
l9_2094=l9_2091;
float2 l9_2095=float2(0.0);
ssGlobals l9_2096=l9_1937;
float2 l9_2097=(*sc_set2.UserUniforms).uv3Offset;
l9_2095=l9_2097;
float2 l9_2098=float2(0.0);
l9_2098=l9_2095;
float2 l9_2099=float2(0.0);
l9_2099=(l9_2020*l9_2094)+l9_2098;
l9_1936=l9_2099;
l9_1938=l9_1936;
}
l9_1933=l9_1938;
l9_1929=l9_1933;
l9_1932=l9_1929;
}
else
{
float2 l9_2100=float2(0.0);
l9_2100=l9_1931.Surface_UVCoord0;
l9_1930=l9_2100;
l9_1932=l9_1930;
}
l9_1927=l9_1932;
float2 l9_2101=float2(0.0);
l9_2101=l9_1927;
float2 l9_2102=float2(0.0);
l9_2102=l9_2101;
l9_1863=l9_2102;
l9_1866=l9_1863;
}
else
{
float2 l9_2103=float2(0.0);
l9_2103=l9_1865.Surface_UVCoord0;
l9_1864=l9_2103;
l9_1866=l9_1864;
}
}
}
}
l9_1858=l9_1866;
float4 l9_2104=float4(0.0);
float2 l9_2105=(*sc_set2.UserUniforms).opacityTexDims.xy;
float2 l9_2106=l9_2105;
int l9_2107;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_2108;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2108=0;
}
else
{
l9_2108=in.varStereoViewID;
}
int l9_2109=l9_2108;
l9_2107=1-l9_2109;
}
else
{
int l9_2110;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2110=0;
}
else
{
l9_2110=in.varStereoViewID;
}
int l9_2111=l9_2110;
l9_2107=l9_2111;
}
int l9_2112=l9_2107;
float2 l9_2113=l9_2106;
int l9_2114=opacityTexLayout_tmp;
int l9_2115=l9_2112;
float2 l9_2116=l9_1858;
bool l9_2117=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_2118=(*sc_set2.UserUniforms).opacityTexTransform;
int2 l9_2119=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_2120=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_2121=(*sc_set2.UserUniforms).opacityTexUvMinMax;
bool l9_2122=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_2123=(*sc_set2.UserUniforms).opacityTexBorderColor;
float l9_2124=0.0;
bool l9_2125=l9_2122&&(!l9_2120);
float l9_2126=1.0;
float l9_2127=l9_2116.x;
int l9_2128=l9_2119.x;
if (l9_2128==1)
{
l9_2127=fract(l9_2127);
}
else
{
if (l9_2128==2)
{
float l9_2129=fract(l9_2127);
float l9_2130=l9_2127-l9_2129;
float l9_2131=step(0.25,fract(l9_2130*0.5));
l9_2127=mix(l9_2129,1.0-l9_2129,fast::clamp(l9_2131,0.0,1.0));
}
}
l9_2116.x=l9_2127;
float l9_2132=l9_2116.y;
int l9_2133=l9_2119.y;
if (l9_2133==1)
{
l9_2132=fract(l9_2132);
}
else
{
if (l9_2133==2)
{
float l9_2134=fract(l9_2132);
float l9_2135=l9_2132-l9_2134;
float l9_2136=step(0.25,fract(l9_2135*0.5));
l9_2132=mix(l9_2134,1.0-l9_2134,fast::clamp(l9_2136,0.0,1.0));
}
}
l9_2116.y=l9_2132;
if (l9_2120)
{
bool l9_2137=l9_2122;
bool l9_2138;
if (l9_2137)
{
l9_2138=l9_2119.x==3;
}
else
{
l9_2138=l9_2137;
}
float l9_2139=l9_2116.x;
float l9_2140=l9_2121.x;
float l9_2141=l9_2121.z;
bool l9_2142=l9_2138;
float l9_2143=l9_2126;
float l9_2144=fast::clamp(l9_2139,l9_2140,l9_2141);
float l9_2145=step(abs(l9_2139-l9_2144),1e-05);
l9_2143*=(l9_2145+((1.0-float(l9_2142))*(1.0-l9_2145)));
l9_2139=l9_2144;
l9_2116.x=l9_2139;
l9_2126=l9_2143;
bool l9_2146=l9_2122;
bool l9_2147;
if (l9_2146)
{
l9_2147=l9_2119.y==3;
}
else
{
l9_2147=l9_2146;
}
float l9_2148=l9_2116.y;
float l9_2149=l9_2121.y;
float l9_2150=l9_2121.w;
bool l9_2151=l9_2147;
float l9_2152=l9_2126;
float l9_2153=fast::clamp(l9_2148,l9_2149,l9_2150);
float l9_2154=step(abs(l9_2148-l9_2153),1e-05);
l9_2152*=(l9_2154+((1.0-float(l9_2151))*(1.0-l9_2154)));
l9_2148=l9_2153;
l9_2116.y=l9_2148;
l9_2126=l9_2152;
}
float2 l9_2155=l9_2116;
bool l9_2156=l9_2117;
float3x3 l9_2157=l9_2118;
if (l9_2156)
{
l9_2155=float2((l9_2157*float3(l9_2155,1.0)).xy);
}
float2 l9_2158=l9_2155;
float2 l9_2159=l9_2158;
float2 l9_2160=l9_2159;
l9_2116=l9_2160;
float l9_2161=l9_2116.x;
int l9_2162=l9_2119.x;
bool l9_2163=l9_2125;
float l9_2164=l9_2126;
if ((l9_2162==0)||(l9_2162==3))
{
float l9_2165=l9_2161;
float l9_2166=0.0;
float l9_2167=1.0;
bool l9_2168=l9_2163;
float l9_2169=l9_2164;
float l9_2170=fast::clamp(l9_2165,l9_2166,l9_2167);
float l9_2171=step(abs(l9_2165-l9_2170),1e-05);
l9_2169*=(l9_2171+((1.0-float(l9_2168))*(1.0-l9_2171)));
l9_2165=l9_2170;
l9_2161=l9_2165;
l9_2164=l9_2169;
}
l9_2116.x=l9_2161;
l9_2126=l9_2164;
float l9_2172=l9_2116.y;
int l9_2173=l9_2119.y;
bool l9_2174=l9_2125;
float l9_2175=l9_2126;
if ((l9_2173==0)||(l9_2173==3))
{
float l9_2176=l9_2172;
float l9_2177=0.0;
float l9_2178=1.0;
bool l9_2179=l9_2174;
float l9_2180=l9_2175;
float l9_2181=fast::clamp(l9_2176,l9_2177,l9_2178);
float l9_2182=step(abs(l9_2176-l9_2181),1e-05);
l9_2180*=(l9_2182+((1.0-float(l9_2179))*(1.0-l9_2182)));
l9_2176=l9_2181;
l9_2172=l9_2176;
l9_2175=l9_2180;
}
l9_2116.y=l9_2172;
l9_2126=l9_2175;
float2 l9_2183=l9_2113;
float2 l9_2184=l9_2116;
int l9_2185=l9_2114;
int l9_2186=l9_2115;
float l9_2187=l9_2124;
float2 l9_2188=l9_2184;
int l9_2189=l9_2185;
int l9_2190=l9_2186;
float3 l9_2191;
if (l9_2189==0)
{
l9_2191=float3(l9_2188,0.0);
}
else
{
if (l9_2189==1)
{
l9_2191=float3(l9_2188.x,(l9_2188.y*0.5)+(0.5-(float(l9_2190)*0.5)),0.0);
}
else
{
l9_2191=float3(l9_2188,float(l9_2190));
}
}
float3 l9_2192=l9_2191;
float3 l9_2193=l9_2192;
float2 l9_2194=l9_2183;
float2 l9_2195=l9_2193.xy;
float l9_2196=l9_2187;
float4 l9_2197=sc_set2.opacityTex.sample(sc_set2.opacityTexSmpSC,l9_2195,bias(l9_2196));
float4 l9_2198=l9_2197;
float4 l9_2199=l9_2198;
if (l9_2122)
{
l9_2199=mix(l9_2123,l9_2199,float4(l9_2126));
}
float4 l9_2200=l9_2199;
float4 l9_2201=l9_2200;
l9_2104=l9_2200;
float l9_2202=0.0;
l9_2202=l9_2104.x;
param_13=l9_2202;
param_15=param_13;
}
else
{
param_15=param_14;
}
Result_N204=param_15;
float Output_N72=0.0;
float param_17=1.0;
float param_18=1.0;
float param_19=(*sc_set2.UserUniforms).Port_Input2_N072;
ssGlobals param_21=Globals;
float param_20;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_2203=float4(0.0);
l9_2203=param_21.VertexColor;
float l9_2204=0.0;
l9_2204=l9_2203.w;
param_18=l9_2204;
param_20=param_18;
}
else
{
param_20=param_19;
}
Output_N72=param_20;
float Output_N205=0.0;
Output_N205=(Output_N168*Result_N204)*Output_N72;
float Export_N158=0.0;
Export_N158=Output_N205;
float3 Result_N337=float3(0.0);
float param_22=0.0;
float3 param_23=float3(0.0);
float3 param_24=float3(0.0);
ssGlobals param_26=Globals;
float3 param_25;
if ((int(ENABLE_NORMALMAP_tmp)!=0))
{
float3 l9_2205=float3(0.0);
l9_2205=param_26.VertexTangent_WorldSpace;
float3 l9_2206=float3(0.0);
l9_2206=param_26.VertexBinormal_WorldSpace;
float3 l9_2207=float3(0.0);
l9_2207=param_26.VertexNormal_WorldSpace;
float3x3 l9_2208=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_2208=float3x3(float3(l9_2205),float3(l9_2206),float3(l9_2207));
float2 l9_2209=float2(0.0);
float l9_2210=0.0;
float2 l9_2211=float2(0.0);
float2 l9_2212=float2(0.0);
float2 l9_2213=float2(0.0);
float2 l9_2214=float2(0.0);
float2 l9_2215=float2(0.0);
ssGlobals l9_2216=param_26;
float2 l9_2217;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_2218=float2(0.0);
l9_2218=l9_2216.Surface_UVCoord0;
l9_2211=l9_2218;
l9_2217=l9_2211;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_2219=float2(0.0);
l9_2219=l9_2216.Surface_UVCoord1;
l9_2212=l9_2219;
l9_2217=l9_2212;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_2220=float2(0.0);
float l9_2221=0.0;
float2 l9_2222=float2(0.0);
float2 l9_2223=float2(0.0);
ssGlobals l9_2224=l9_2216;
float2 l9_2225;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2226=float2(0.0);
float l9_2227=0.0;
float2 l9_2228=float2(0.0);
float2 l9_2229=float2(0.0);
ssGlobals l9_2230=l9_2224;
float2 l9_2231;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2232=float2(0.0);
float l9_2233=0.0;
float2 l9_2234=float2(0.0);
float2 l9_2235=float2(0.0);
float2 l9_2236=float2(0.0);
float2 l9_2237=float2(0.0);
ssGlobals l9_2238=l9_2230;
float2 l9_2239;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2240=float2(0.0);
l9_2240=l9_2238.Surface_UVCoord0;
l9_2234=l9_2240;
l9_2239=l9_2234;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2241=float2(0.0);
l9_2241=l9_2238.Surface_UVCoord1;
l9_2235=l9_2241;
l9_2239=l9_2235;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2242=float2(0.0);
l9_2242=l9_2238.gScreenCoord;
l9_2236=l9_2242;
l9_2239=l9_2236;
}
else
{
float2 l9_2243=float2(0.0);
l9_2243=l9_2238.Surface_UVCoord0;
l9_2237=l9_2243;
l9_2239=l9_2237;
}
}
}
l9_2232=l9_2239;
float2 l9_2244=float2(0.0);
ssGlobals l9_2245=l9_2230;
float2 l9_2246=(*sc_set2.UserUniforms).uv2Scale;
l9_2244=l9_2246;
float2 l9_2247=float2(0.0);
l9_2247=l9_2244;
float2 l9_2248=float2(0.0);
ssGlobals l9_2249=l9_2230;
float2 l9_2250=(*sc_set2.UserUniforms).uv2Offset;
l9_2248=l9_2250;
float2 l9_2251=float2(0.0);
l9_2251=l9_2248;
float2 l9_2252=float2(0.0);
l9_2252=(l9_2232*l9_2247)+l9_2251;
float2 l9_2253=float2(0.0);
l9_2253=l9_2252+(l9_2251*(l9_2230.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2228=l9_2253;
l9_2231=l9_2228;
}
else
{
float2 l9_2254=float2(0.0);
float l9_2255=0.0;
float2 l9_2256=float2(0.0);
float2 l9_2257=float2(0.0);
float2 l9_2258=float2(0.0);
float2 l9_2259=float2(0.0);
ssGlobals l9_2260=l9_2230;
float2 l9_2261;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2262=float2(0.0);
l9_2262=l9_2260.Surface_UVCoord0;
l9_2256=l9_2262;
l9_2261=l9_2256;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2263=float2(0.0);
l9_2263=l9_2260.Surface_UVCoord1;
l9_2257=l9_2263;
l9_2261=l9_2257;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2264=float2(0.0);
l9_2264=l9_2260.gScreenCoord;
l9_2258=l9_2264;
l9_2261=l9_2258;
}
else
{
float2 l9_2265=float2(0.0);
l9_2265=l9_2260.Surface_UVCoord0;
l9_2259=l9_2265;
l9_2261=l9_2259;
}
}
}
l9_2254=l9_2261;
float2 l9_2266=float2(0.0);
ssGlobals l9_2267=l9_2230;
float2 l9_2268=(*sc_set2.UserUniforms).uv2Scale;
l9_2266=l9_2268;
float2 l9_2269=float2(0.0);
l9_2269=l9_2266;
float2 l9_2270=float2(0.0);
ssGlobals l9_2271=l9_2230;
float2 l9_2272=(*sc_set2.UserUniforms).uv2Offset;
l9_2270=l9_2272;
float2 l9_2273=float2(0.0);
l9_2273=l9_2270;
float2 l9_2274=float2(0.0);
l9_2274=(l9_2254*l9_2269)+l9_2273;
l9_2229=l9_2274;
l9_2231=l9_2229;
}
l9_2226=l9_2231;
l9_2222=l9_2226;
l9_2225=l9_2222;
}
else
{
float2 l9_2275=float2(0.0);
l9_2275=l9_2224.Surface_UVCoord0;
l9_2223=l9_2275;
l9_2225=l9_2223;
}
l9_2220=l9_2225;
float2 l9_2276=float2(0.0);
l9_2276=l9_2220;
float2 l9_2277=float2(0.0);
l9_2277=l9_2276;
l9_2213=l9_2277;
l9_2217=l9_2213;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_2278=float2(0.0);
float l9_2279=0.0;
float2 l9_2280=float2(0.0);
float2 l9_2281=float2(0.0);
ssGlobals l9_2282=l9_2216;
float2 l9_2283;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_2284=float2(0.0);
float l9_2285=0.0;
float2 l9_2286=float2(0.0);
float2 l9_2287=float2(0.0);
ssGlobals l9_2288=l9_2282;
float2 l9_2289;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_2290=float2(0.0);
float l9_2291=0.0;
float2 l9_2292=float2(0.0);
float2 l9_2293=float2(0.0);
float2 l9_2294=float2(0.0);
float2 l9_2295=float2(0.0);
float2 l9_2296=float2(0.0);
ssGlobals l9_2297=l9_2288;
float2 l9_2298;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2299=float2(0.0);
l9_2299=l9_2297.Surface_UVCoord0;
l9_2292=l9_2299;
l9_2298=l9_2292;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2300=float2(0.0);
l9_2300=l9_2297.Surface_UVCoord1;
l9_2293=l9_2300;
l9_2298=l9_2293;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2301=float2(0.0);
l9_2301=l9_2297.gScreenCoord;
l9_2294=l9_2301;
l9_2298=l9_2294;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2302=float2(0.0);
float l9_2303=0.0;
float2 l9_2304=float2(0.0);
float2 l9_2305=float2(0.0);
ssGlobals l9_2306=l9_2297;
float2 l9_2307;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2308=float2(0.0);
float l9_2309=0.0;
float2 l9_2310=float2(0.0);
float2 l9_2311=float2(0.0);
ssGlobals l9_2312=l9_2306;
float2 l9_2313;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2314=float2(0.0);
float l9_2315=0.0;
float2 l9_2316=float2(0.0);
float2 l9_2317=float2(0.0);
float2 l9_2318=float2(0.0);
float2 l9_2319=float2(0.0);
ssGlobals l9_2320=l9_2312;
float2 l9_2321;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2322=float2(0.0);
l9_2322=l9_2320.Surface_UVCoord0;
l9_2316=l9_2322;
l9_2321=l9_2316;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2323=float2(0.0);
l9_2323=l9_2320.Surface_UVCoord1;
l9_2317=l9_2323;
l9_2321=l9_2317;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2324=float2(0.0);
l9_2324=l9_2320.gScreenCoord;
l9_2318=l9_2324;
l9_2321=l9_2318;
}
else
{
float2 l9_2325=float2(0.0);
l9_2325=l9_2320.Surface_UVCoord0;
l9_2319=l9_2325;
l9_2321=l9_2319;
}
}
}
l9_2314=l9_2321;
float2 l9_2326=float2(0.0);
ssGlobals l9_2327=l9_2312;
float2 l9_2328=(*sc_set2.UserUniforms).uv2Scale;
l9_2326=l9_2328;
float2 l9_2329=float2(0.0);
l9_2329=l9_2326;
float2 l9_2330=float2(0.0);
ssGlobals l9_2331=l9_2312;
float2 l9_2332=(*sc_set2.UserUniforms).uv2Offset;
l9_2330=l9_2332;
float2 l9_2333=float2(0.0);
l9_2333=l9_2330;
float2 l9_2334=float2(0.0);
l9_2334=(l9_2314*l9_2329)+l9_2333;
float2 l9_2335=float2(0.0);
l9_2335=l9_2334+(l9_2333*(l9_2312.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2310=l9_2335;
l9_2313=l9_2310;
}
else
{
float2 l9_2336=float2(0.0);
float l9_2337=0.0;
float2 l9_2338=float2(0.0);
float2 l9_2339=float2(0.0);
float2 l9_2340=float2(0.0);
float2 l9_2341=float2(0.0);
ssGlobals l9_2342=l9_2312;
float2 l9_2343;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2344=float2(0.0);
l9_2344=l9_2342.Surface_UVCoord0;
l9_2338=l9_2344;
l9_2343=l9_2338;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2345=float2(0.0);
l9_2345=l9_2342.Surface_UVCoord1;
l9_2339=l9_2345;
l9_2343=l9_2339;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2346=float2(0.0);
l9_2346=l9_2342.gScreenCoord;
l9_2340=l9_2346;
l9_2343=l9_2340;
}
else
{
float2 l9_2347=float2(0.0);
l9_2347=l9_2342.Surface_UVCoord0;
l9_2341=l9_2347;
l9_2343=l9_2341;
}
}
}
l9_2336=l9_2343;
float2 l9_2348=float2(0.0);
ssGlobals l9_2349=l9_2312;
float2 l9_2350=(*sc_set2.UserUniforms).uv2Scale;
l9_2348=l9_2350;
float2 l9_2351=float2(0.0);
l9_2351=l9_2348;
float2 l9_2352=float2(0.0);
ssGlobals l9_2353=l9_2312;
float2 l9_2354=(*sc_set2.UserUniforms).uv2Offset;
l9_2352=l9_2354;
float2 l9_2355=float2(0.0);
l9_2355=l9_2352;
float2 l9_2356=float2(0.0);
l9_2356=(l9_2336*l9_2351)+l9_2355;
l9_2311=l9_2356;
l9_2313=l9_2311;
}
l9_2308=l9_2313;
l9_2304=l9_2308;
l9_2307=l9_2304;
}
else
{
float2 l9_2357=float2(0.0);
l9_2357=l9_2306.Surface_UVCoord0;
l9_2305=l9_2357;
l9_2307=l9_2305;
}
l9_2302=l9_2307;
float2 l9_2358=float2(0.0);
l9_2358=l9_2302;
float2 l9_2359=float2(0.0);
l9_2359=l9_2358;
l9_2295=l9_2359;
l9_2298=l9_2295;
}
else
{
float2 l9_2360=float2(0.0);
l9_2360=l9_2297.Surface_UVCoord0;
l9_2296=l9_2360;
l9_2298=l9_2296;
}
}
}
}
l9_2290=l9_2298;
float2 l9_2361=float2(0.0);
ssGlobals l9_2362=l9_2288;
float2 l9_2363=(*sc_set2.UserUniforms).uv3Scale;
l9_2361=l9_2363;
float2 l9_2364=float2(0.0);
l9_2364=l9_2361;
float2 l9_2365=float2(0.0);
ssGlobals l9_2366=l9_2288;
float2 l9_2367=(*sc_set2.UserUniforms).uv3Offset;
l9_2365=l9_2367;
float2 l9_2368=float2(0.0);
l9_2368=l9_2365;
float2 l9_2369=float2(0.0);
l9_2369=(l9_2290*l9_2364)+l9_2368;
float2 l9_2370=float2(0.0);
l9_2370=l9_2369+(l9_2368*(l9_2288.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_2286=l9_2370;
l9_2289=l9_2286;
}
else
{
float2 l9_2371=float2(0.0);
float l9_2372=0.0;
float2 l9_2373=float2(0.0);
float2 l9_2374=float2(0.0);
float2 l9_2375=float2(0.0);
float2 l9_2376=float2(0.0);
float2 l9_2377=float2(0.0);
ssGlobals l9_2378=l9_2288;
float2 l9_2379;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2380=float2(0.0);
l9_2380=l9_2378.Surface_UVCoord0;
l9_2373=l9_2380;
l9_2379=l9_2373;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2381=float2(0.0);
l9_2381=l9_2378.Surface_UVCoord1;
l9_2374=l9_2381;
l9_2379=l9_2374;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2382=float2(0.0);
l9_2382=l9_2378.gScreenCoord;
l9_2375=l9_2382;
l9_2379=l9_2375;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2383=float2(0.0);
float l9_2384=0.0;
float2 l9_2385=float2(0.0);
float2 l9_2386=float2(0.0);
ssGlobals l9_2387=l9_2378;
float2 l9_2388;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2389=float2(0.0);
float l9_2390=0.0;
float2 l9_2391=float2(0.0);
float2 l9_2392=float2(0.0);
ssGlobals l9_2393=l9_2387;
float2 l9_2394;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2395=float2(0.0);
float l9_2396=0.0;
float2 l9_2397=float2(0.0);
float2 l9_2398=float2(0.0);
float2 l9_2399=float2(0.0);
float2 l9_2400=float2(0.0);
ssGlobals l9_2401=l9_2393;
float2 l9_2402;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2403=float2(0.0);
l9_2403=l9_2401.Surface_UVCoord0;
l9_2397=l9_2403;
l9_2402=l9_2397;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2404=float2(0.0);
l9_2404=l9_2401.Surface_UVCoord1;
l9_2398=l9_2404;
l9_2402=l9_2398;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2405=float2(0.0);
l9_2405=l9_2401.gScreenCoord;
l9_2399=l9_2405;
l9_2402=l9_2399;
}
else
{
float2 l9_2406=float2(0.0);
l9_2406=l9_2401.Surface_UVCoord0;
l9_2400=l9_2406;
l9_2402=l9_2400;
}
}
}
l9_2395=l9_2402;
float2 l9_2407=float2(0.0);
ssGlobals l9_2408=l9_2393;
float2 l9_2409=(*sc_set2.UserUniforms).uv2Scale;
l9_2407=l9_2409;
float2 l9_2410=float2(0.0);
l9_2410=l9_2407;
float2 l9_2411=float2(0.0);
ssGlobals l9_2412=l9_2393;
float2 l9_2413=(*sc_set2.UserUniforms).uv2Offset;
l9_2411=l9_2413;
float2 l9_2414=float2(0.0);
l9_2414=l9_2411;
float2 l9_2415=float2(0.0);
l9_2415=(l9_2395*l9_2410)+l9_2414;
float2 l9_2416=float2(0.0);
l9_2416=l9_2415+(l9_2414*(l9_2393.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2391=l9_2416;
l9_2394=l9_2391;
}
else
{
float2 l9_2417=float2(0.0);
float l9_2418=0.0;
float2 l9_2419=float2(0.0);
float2 l9_2420=float2(0.0);
float2 l9_2421=float2(0.0);
float2 l9_2422=float2(0.0);
ssGlobals l9_2423=l9_2393;
float2 l9_2424;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2425=float2(0.0);
l9_2425=l9_2423.Surface_UVCoord0;
l9_2419=l9_2425;
l9_2424=l9_2419;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2426=float2(0.0);
l9_2426=l9_2423.Surface_UVCoord1;
l9_2420=l9_2426;
l9_2424=l9_2420;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2427=float2(0.0);
l9_2427=l9_2423.gScreenCoord;
l9_2421=l9_2427;
l9_2424=l9_2421;
}
else
{
float2 l9_2428=float2(0.0);
l9_2428=l9_2423.Surface_UVCoord0;
l9_2422=l9_2428;
l9_2424=l9_2422;
}
}
}
l9_2417=l9_2424;
float2 l9_2429=float2(0.0);
ssGlobals l9_2430=l9_2393;
float2 l9_2431=(*sc_set2.UserUniforms).uv2Scale;
l9_2429=l9_2431;
float2 l9_2432=float2(0.0);
l9_2432=l9_2429;
float2 l9_2433=float2(0.0);
ssGlobals l9_2434=l9_2393;
float2 l9_2435=(*sc_set2.UserUniforms).uv2Offset;
l9_2433=l9_2435;
float2 l9_2436=float2(0.0);
l9_2436=l9_2433;
float2 l9_2437=float2(0.0);
l9_2437=(l9_2417*l9_2432)+l9_2436;
l9_2392=l9_2437;
l9_2394=l9_2392;
}
l9_2389=l9_2394;
l9_2385=l9_2389;
l9_2388=l9_2385;
}
else
{
float2 l9_2438=float2(0.0);
l9_2438=l9_2387.Surface_UVCoord0;
l9_2386=l9_2438;
l9_2388=l9_2386;
}
l9_2383=l9_2388;
float2 l9_2439=float2(0.0);
l9_2439=l9_2383;
float2 l9_2440=float2(0.0);
l9_2440=l9_2439;
l9_2376=l9_2440;
l9_2379=l9_2376;
}
else
{
float2 l9_2441=float2(0.0);
l9_2441=l9_2378.Surface_UVCoord0;
l9_2377=l9_2441;
l9_2379=l9_2377;
}
}
}
}
l9_2371=l9_2379;
float2 l9_2442=float2(0.0);
ssGlobals l9_2443=l9_2288;
float2 l9_2444=(*sc_set2.UserUniforms).uv3Scale;
l9_2442=l9_2444;
float2 l9_2445=float2(0.0);
l9_2445=l9_2442;
float2 l9_2446=float2(0.0);
ssGlobals l9_2447=l9_2288;
float2 l9_2448=(*sc_set2.UserUniforms).uv3Offset;
l9_2446=l9_2448;
float2 l9_2449=float2(0.0);
l9_2449=l9_2446;
float2 l9_2450=float2(0.0);
l9_2450=(l9_2371*l9_2445)+l9_2449;
l9_2287=l9_2450;
l9_2289=l9_2287;
}
l9_2284=l9_2289;
l9_2280=l9_2284;
l9_2283=l9_2280;
}
else
{
float2 l9_2451=float2(0.0);
l9_2451=l9_2282.Surface_UVCoord0;
l9_2281=l9_2451;
l9_2283=l9_2281;
}
l9_2278=l9_2283;
float2 l9_2452=float2(0.0);
l9_2452=l9_2278;
float2 l9_2453=float2(0.0);
l9_2453=l9_2452;
l9_2214=l9_2453;
l9_2217=l9_2214;
}
else
{
float2 l9_2454=float2(0.0);
l9_2454=l9_2216.Surface_UVCoord0;
l9_2215=l9_2454;
l9_2217=l9_2215;
}
}
}
}
l9_2209=l9_2217;
float4 l9_2455=float4(0.0);
float2 l9_2456=l9_2209;
ssGlobals l9_2457=param_26;
float2 l9_2458=(*sc_set2.UserUniforms).normalTexDims.xy;
float2 l9_2459=l9_2458;
int l9_2460;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_2461;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2461=0;
}
else
{
l9_2461=in.varStereoViewID;
}
int l9_2462=l9_2461;
l9_2460=1-l9_2462;
}
else
{
int l9_2463;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2463=0;
}
else
{
l9_2463=in.varStereoViewID;
}
int l9_2464=l9_2463;
l9_2460=l9_2464;
}
int l9_2465=l9_2460;
float2 l9_2466=l9_2459;
int l9_2467=normalTexLayout_tmp;
int l9_2468=l9_2465;
float2 l9_2469=l9_2456;
bool l9_2470=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_2471=(*sc_set2.UserUniforms).normalTexTransform;
int2 l9_2472=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_2473=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_2474=(*sc_set2.UserUniforms).normalTexUvMinMax;
bool l9_2475=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_2476=(*sc_set2.UserUniforms).normalTexBorderColor;
float l9_2477=0.0;
bool l9_2478=l9_2475&&(!l9_2473);
float l9_2479=1.0;
float l9_2480=l9_2469.x;
int l9_2481=l9_2472.x;
if (l9_2481==1)
{
l9_2480=fract(l9_2480);
}
else
{
if (l9_2481==2)
{
float l9_2482=fract(l9_2480);
float l9_2483=l9_2480-l9_2482;
float l9_2484=step(0.25,fract(l9_2483*0.5));
l9_2480=mix(l9_2482,1.0-l9_2482,fast::clamp(l9_2484,0.0,1.0));
}
}
l9_2469.x=l9_2480;
float l9_2485=l9_2469.y;
int l9_2486=l9_2472.y;
if (l9_2486==1)
{
l9_2485=fract(l9_2485);
}
else
{
if (l9_2486==2)
{
float l9_2487=fract(l9_2485);
float l9_2488=l9_2485-l9_2487;
float l9_2489=step(0.25,fract(l9_2488*0.5));
l9_2485=mix(l9_2487,1.0-l9_2487,fast::clamp(l9_2489,0.0,1.0));
}
}
l9_2469.y=l9_2485;
if (l9_2473)
{
bool l9_2490=l9_2475;
bool l9_2491;
if (l9_2490)
{
l9_2491=l9_2472.x==3;
}
else
{
l9_2491=l9_2490;
}
float l9_2492=l9_2469.x;
float l9_2493=l9_2474.x;
float l9_2494=l9_2474.z;
bool l9_2495=l9_2491;
float l9_2496=l9_2479;
float l9_2497=fast::clamp(l9_2492,l9_2493,l9_2494);
float l9_2498=step(abs(l9_2492-l9_2497),1e-05);
l9_2496*=(l9_2498+((1.0-float(l9_2495))*(1.0-l9_2498)));
l9_2492=l9_2497;
l9_2469.x=l9_2492;
l9_2479=l9_2496;
bool l9_2499=l9_2475;
bool l9_2500;
if (l9_2499)
{
l9_2500=l9_2472.y==3;
}
else
{
l9_2500=l9_2499;
}
float l9_2501=l9_2469.y;
float l9_2502=l9_2474.y;
float l9_2503=l9_2474.w;
bool l9_2504=l9_2500;
float l9_2505=l9_2479;
float l9_2506=fast::clamp(l9_2501,l9_2502,l9_2503);
float l9_2507=step(abs(l9_2501-l9_2506),1e-05);
l9_2505*=(l9_2507+((1.0-float(l9_2504))*(1.0-l9_2507)));
l9_2501=l9_2506;
l9_2469.y=l9_2501;
l9_2479=l9_2505;
}
float2 l9_2508=l9_2469;
bool l9_2509=l9_2470;
float3x3 l9_2510=l9_2471;
if (l9_2509)
{
l9_2508=float2((l9_2510*float3(l9_2508,1.0)).xy);
}
float2 l9_2511=l9_2508;
float2 l9_2512=l9_2511;
float2 l9_2513=l9_2512;
l9_2469=l9_2513;
float l9_2514=l9_2469.x;
int l9_2515=l9_2472.x;
bool l9_2516=l9_2478;
float l9_2517=l9_2479;
if ((l9_2515==0)||(l9_2515==3))
{
float l9_2518=l9_2514;
float l9_2519=0.0;
float l9_2520=1.0;
bool l9_2521=l9_2516;
float l9_2522=l9_2517;
float l9_2523=fast::clamp(l9_2518,l9_2519,l9_2520);
float l9_2524=step(abs(l9_2518-l9_2523),1e-05);
l9_2522*=(l9_2524+((1.0-float(l9_2521))*(1.0-l9_2524)));
l9_2518=l9_2523;
l9_2514=l9_2518;
l9_2517=l9_2522;
}
l9_2469.x=l9_2514;
l9_2479=l9_2517;
float l9_2525=l9_2469.y;
int l9_2526=l9_2472.y;
bool l9_2527=l9_2478;
float l9_2528=l9_2479;
if ((l9_2526==0)||(l9_2526==3))
{
float l9_2529=l9_2525;
float l9_2530=0.0;
float l9_2531=1.0;
bool l9_2532=l9_2527;
float l9_2533=l9_2528;
float l9_2534=fast::clamp(l9_2529,l9_2530,l9_2531);
float l9_2535=step(abs(l9_2529-l9_2534),1e-05);
l9_2533*=(l9_2535+((1.0-float(l9_2532))*(1.0-l9_2535)));
l9_2529=l9_2534;
l9_2525=l9_2529;
l9_2528=l9_2533;
}
l9_2469.y=l9_2525;
l9_2479=l9_2528;
float2 l9_2536=l9_2466;
float2 l9_2537=l9_2469;
int l9_2538=l9_2467;
int l9_2539=l9_2468;
float l9_2540=l9_2477;
float2 l9_2541=l9_2537;
int l9_2542=l9_2538;
int l9_2543=l9_2539;
float3 l9_2544;
if (l9_2542==0)
{
l9_2544=float3(l9_2541,0.0);
}
else
{
if (l9_2542==1)
{
l9_2544=float3(l9_2541.x,(l9_2541.y*0.5)+(0.5-(float(l9_2543)*0.5)),0.0);
}
else
{
l9_2544=float3(l9_2541,float(l9_2543));
}
}
float3 l9_2545=l9_2544;
float3 l9_2546=l9_2545;
float2 l9_2547=l9_2536;
float2 l9_2548=l9_2546.xy;
float l9_2549=l9_2540;
float4 l9_2550=sc_set2.normalTex.sample(sc_set2.normalTexSmpSC,l9_2548,bias(l9_2549));
float4 l9_2551=l9_2550;
float4 l9_2552=l9_2551;
if (l9_2475)
{
l9_2552=mix(l9_2476,l9_2552,float4(l9_2479));
}
float4 l9_2553=l9_2552;
float4 l9_2554=l9_2553;
float4 l9_2555=l9_2553;
float3 l9_2556=(l9_2555.xyz*1.99219)-float3(1.0);
l9_2555=float4(l9_2556.x,l9_2556.y,l9_2556.z,l9_2555.w);
l9_2455=l9_2555;
float3 l9_2557=float3(0.0);
float l9_2558=0.0;
float3 l9_2559=float3(0.0);
float3 l9_2560=(*sc_set2.UserUniforms).Port_Default_N113;
ssGlobals l9_2561=param_26;
float3 l9_2562;
if ((int(ENABLE_DETAIL_NORMAL_tmp)!=0))
{
float2 l9_2563=float2(0.0);
float l9_2564=0.0;
float2 l9_2565=float2(0.0);
float2 l9_2566=float2(0.0);
float2 l9_2567=float2(0.0);
float2 l9_2568=float2(0.0);
float2 l9_2569=float2(0.0);
ssGlobals l9_2570=l9_2561;
float2 l9_2571;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_2572=float2(0.0);
l9_2572=l9_2570.Surface_UVCoord0;
l9_2565=l9_2572;
l9_2571=l9_2565;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_2573=float2(0.0);
l9_2573=l9_2570.Surface_UVCoord1;
l9_2566=l9_2573;
l9_2571=l9_2566;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_2574=float2(0.0);
float l9_2575=0.0;
float2 l9_2576=float2(0.0);
float2 l9_2577=float2(0.0);
ssGlobals l9_2578=l9_2570;
float2 l9_2579;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2580=float2(0.0);
float l9_2581=0.0;
float2 l9_2582=float2(0.0);
float2 l9_2583=float2(0.0);
ssGlobals l9_2584=l9_2578;
float2 l9_2585;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2586=float2(0.0);
float l9_2587=0.0;
float2 l9_2588=float2(0.0);
float2 l9_2589=float2(0.0);
float2 l9_2590=float2(0.0);
float2 l9_2591=float2(0.0);
ssGlobals l9_2592=l9_2584;
float2 l9_2593;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2594=float2(0.0);
l9_2594=l9_2592.Surface_UVCoord0;
l9_2588=l9_2594;
l9_2593=l9_2588;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2595=float2(0.0);
l9_2595=l9_2592.Surface_UVCoord1;
l9_2589=l9_2595;
l9_2593=l9_2589;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2596=float2(0.0);
l9_2596=l9_2592.gScreenCoord;
l9_2590=l9_2596;
l9_2593=l9_2590;
}
else
{
float2 l9_2597=float2(0.0);
l9_2597=l9_2592.Surface_UVCoord0;
l9_2591=l9_2597;
l9_2593=l9_2591;
}
}
}
l9_2586=l9_2593;
float2 l9_2598=float2(0.0);
ssGlobals l9_2599=l9_2584;
float2 l9_2600=(*sc_set2.UserUniforms).uv2Scale;
l9_2598=l9_2600;
float2 l9_2601=float2(0.0);
l9_2601=l9_2598;
float2 l9_2602=float2(0.0);
ssGlobals l9_2603=l9_2584;
float2 l9_2604=(*sc_set2.UserUniforms).uv2Offset;
l9_2602=l9_2604;
float2 l9_2605=float2(0.0);
l9_2605=l9_2602;
float2 l9_2606=float2(0.0);
l9_2606=(l9_2586*l9_2601)+l9_2605;
float2 l9_2607=float2(0.0);
l9_2607=l9_2606+(l9_2605*(l9_2584.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2582=l9_2607;
l9_2585=l9_2582;
}
else
{
float2 l9_2608=float2(0.0);
float l9_2609=0.0;
float2 l9_2610=float2(0.0);
float2 l9_2611=float2(0.0);
float2 l9_2612=float2(0.0);
float2 l9_2613=float2(0.0);
ssGlobals l9_2614=l9_2584;
float2 l9_2615;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2616=float2(0.0);
l9_2616=l9_2614.Surface_UVCoord0;
l9_2610=l9_2616;
l9_2615=l9_2610;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2617=float2(0.0);
l9_2617=l9_2614.Surface_UVCoord1;
l9_2611=l9_2617;
l9_2615=l9_2611;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2618=float2(0.0);
l9_2618=l9_2614.gScreenCoord;
l9_2612=l9_2618;
l9_2615=l9_2612;
}
else
{
float2 l9_2619=float2(0.0);
l9_2619=l9_2614.Surface_UVCoord0;
l9_2613=l9_2619;
l9_2615=l9_2613;
}
}
}
l9_2608=l9_2615;
float2 l9_2620=float2(0.0);
ssGlobals l9_2621=l9_2584;
float2 l9_2622=(*sc_set2.UserUniforms).uv2Scale;
l9_2620=l9_2622;
float2 l9_2623=float2(0.0);
l9_2623=l9_2620;
float2 l9_2624=float2(0.0);
ssGlobals l9_2625=l9_2584;
float2 l9_2626=(*sc_set2.UserUniforms).uv2Offset;
l9_2624=l9_2626;
float2 l9_2627=float2(0.0);
l9_2627=l9_2624;
float2 l9_2628=float2(0.0);
l9_2628=(l9_2608*l9_2623)+l9_2627;
l9_2583=l9_2628;
l9_2585=l9_2583;
}
l9_2580=l9_2585;
l9_2576=l9_2580;
l9_2579=l9_2576;
}
else
{
float2 l9_2629=float2(0.0);
l9_2629=l9_2578.Surface_UVCoord0;
l9_2577=l9_2629;
l9_2579=l9_2577;
}
l9_2574=l9_2579;
float2 l9_2630=float2(0.0);
l9_2630=l9_2574;
float2 l9_2631=float2(0.0);
l9_2631=l9_2630;
l9_2567=l9_2631;
l9_2571=l9_2567;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_2632=float2(0.0);
float l9_2633=0.0;
float2 l9_2634=float2(0.0);
float2 l9_2635=float2(0.0);
ssGlobals l9_2636=l9_2570;
float2 l9_2637;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_2638=float2(0.0);
float l9_2639=0.0;
float2 l9_2640=float2(0.0);
float2 l9_2641=float2(0.0);
ssGlobals l9_2642=l9_2636;
float2 l9_2643;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_2644=float2(0.0);
float l9_2645=0.0;
float2 l9_2646=float2(0.0);
float2 l9_2647=float2(0.0);
float2 l9_2648=float2(0.0);
float2 l9_2649=float2(0.0);
float2 l9_2650=float2(0.0);
ssGlobals l9_2651=l9_2642;
float2 l9_2652;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2653=float2(0.0);
l9_2653=l9_2651.Surface_UVCoord0;
l9_2646=l9_2653;
l9_2652=l9_2646;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2654=float2(0.0);
l9_2654=l9_2651.Surface_UVCoord1;
l9_2647=l9_2654;
l9_2652=l9_2647;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2655=float2(0.0);
l9_2655=l9_2651.gScreenCoord;
l9_2648=l9_2655;
l9_2652=l9_2648;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2656=float2(0.0);
float l9_2657=0.0;
float2 l9_2658=float2(0.0);
float2 l9_2659=float2(0.0);
ssGlobals l9_2660=l9_2651;
float2 l9_2661;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2662=float2(0.0);
float l9_2663=0.0;
float2 l9_2664=float2(0.0);
float2 l9_2665=float2(0.0);
ssGlobals l9_2666=l9_2660;
float2 l9_2667;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2668=float2(0.0);
float l9_2669=0.0;
float2 l9_2670=float2(0.0);
float2 l9_2671=float2(0.0);
float2 l9_2672=float2(0.0);
float2 l9_2673=float2(0.0);
ssGlobals l9_2674=l9_2666;
float2 l9_2675;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2676=float2(0.0);
l9_2676=l9_2674.Surface_UVCoord0;
l9_2670=l9_2676;
l9_2675=l9_2670;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2677=float2(0.0);
l9_2677=l9_2674.Surface_UVCoord1;
l9_2671=l9_2677;
l9_2675=l9_2671;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2678=float2(0.0);
l9_2678=l9_2674.gScreenCoord;
l9_2672=l9_2678;
l9_2675=l9_2672;
}
else
{
float2 l9_2679=float2(0.0);
l9_2679=l9_2674.Surface_UVCoord0;
l9_2673=l9_2679;
l9_2675=l9_2673;
}
}
}
l9_2668=l9_2675;
float2 l9_2680=float2(0.0);
ssGlobals l9_2681=l9_2666;
float2 l9_2682=(*sc_set2.UserUniforms).uv2Scale;
l9_2680=l9_2682;
float2 l9_2683=float2(0.0);
l9_2683=l9_2680;
float2 l9_2684=float2(0.0);
ssGlobals l9_2685=l9_2666;
float2 l9_2686=(*sc_set2.UserUniforms).uv2Offset;
l9_2684=l9_2686;
float2 l9_2687=float2(0.0);
l9_2687=l9_2684;
float2 l9_2688=float2(0.0);
l9_2688=(l9_2668*l9_2683)+l9_2687;
float2 l9_2689=float2(0.0);
l9_2689=l9_2688+(l9_2687*(l9_2666.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2664=l9_2689;
l9_2667=l9_2664;
}
else
{
float2 l9_2690=float2(0.0);
float l9_2691=0.0;
float2 l9_2692=float2(0.0);
float2 l9_2693=float2(0.0);
float2 l9_2694=float2(0.0);
float2 l9_2695=float2(0.0);
ssGlobals l9_2696=l9_2666;
float2 l9_2697;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2698=float2(0.0);
l9_2698=l9_2696.Surface_UVCoord0;
l9_2692=l9_2698;
l9_2697=l9_2692;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2699=float2(0.0);
l9_2699=l9_2696.Surface_UVCoord1;
l9_2693=l9_2699;
l9_2697=l9_2693;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2700=float2(0.0);
l9_2700=l9_2696.gScreenCoord;
l9_2694=l9_2700;
l9_2697=l9_2694;
}
else
{
float2 l9_2701=float2(0.0);
l9_2701=l9_2696.Surface_UVCoord0;
l9_2695=l9_2701;
l9_2697=l9_2695;
}
}
}
l9_2690=l9_2697;
float2 l9_2702=float2(0.0);
ssGlobals l9_2703=l9_2666;
float2 l9_2704=(*sc_set2.UserUniforms).uv2Scale;
l9_2702=l9_2704;
float2 l9_2705=float2(0.0);
l9_2705=l9_2702;
float2 l9_2706=float2(0.0);
ssGlobals l9_2707=l9_2666;
float2 l9_2708=(*sc_set2.UserUniforms).uv2Offset;
l9_2706=l9_2708;
float2 l9_2709=float2(0.0);
l9_2709=l9_2706;
float2 l9_2710=float2(0.0);
l9_2710=(l9_2690*l9_2705)+l9_2709;
l9_2665=l9_2710;
l9_2667=l9_2665;
}
l9_2662=l9_2667;
l9_2658=l9_2662;
l9_2661=l9_2658;
}
else
{
float2 l9_2711=float2(0.0);
l9_2711=l9_2660.Surface_UVCoord0;
l9_2659=l9_2711;
l9_2661=l9_2659;
}
l9_2656=l9_2661;
float2 l9_2712=float2(0.0);
l9_2712=l9_2656;
float2 l9_2713=float2(0.0);
l9_2713=l9_2712;
l9_2649=l9_2713;
l9_2652=l9_2649;
}
else
{
float2 l9_2714=float2(0.0);
l9_2714=l9_2651.Surface_UVCoord0;
l9_2650=l9_2714;
l9_2652=l9_2650;
}
}
}
}
l9_2644=l9_2652;
float2 l9_2715=float2(0.0);
ssGlobals l9_2716=l9_2642;
float2 l9_2717=(*sc_set2.UserUniforms).uv3Scale;
l9_2715=l9_2717;
float2 l9_2718=float2(0.0);
l9_2718=l9_2715;
float2 l9_2719=float2(0.0);
ssGlobals l9_2720=l9_2642;
float2 l9_2721=(*sc_set2.UserUniforms).uv3Offset;
l9_2719=l9_2721;
float2 l9_2722=float2(0.0);
l9_2722=l9_2719;
float2 l9_2723=float2(0.0);
l9_2723=(l9_2644*l9_2718)+l9_2722;
float2 l9_2724=float2(0.0);
l9_2724=l9_2723+(l9_2722*(l9_2642.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_2640=l9_2724;
l9_2643=l9_2640;
}
else
{
float2 l9_2725=float2(0.0);
float l9_2726=0.0;
float2 l9_2727=float2(0.0);
float2 l9_2728=float2(0.0);
float2 l9_2729=float2(0.0);
float2 l9_2730=float2(0.0);
float2 l9_2731=float2(0.0);
ssGlobals l9_2732=l9_2642;
float2 l9_2733;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2734=float2(0.0);
l9_2734=l9_2732.Surface_UVCoord0;
l9_2727=l9_2734;
l9_2733=l9_2727;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2735=float2(0.0);
l9_2735=l9_2732.Surface_UVCoord1;
l9_2728=l9_2735;
l9_2733=l9_2728;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2736=float2(0.0);
l9_2736=l9_2732.gScreenCoord;
l9_2729=l9_2736;
l9_2733=l9_2729;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2737=float2(0.0);
float l9_2738=0.0;
float2 l9_2739=float2(0.0);
float2 l9_2740=float2(0.0);
ssGlobals l9_2741=l9_2732;
float2 l9_2742;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2743=float2(0.0);
float l9_2744=0.0;
float2 l9_2745=float2(0.0);
float2 l9_2746=float2(0.0);
ssGlobals l9_2747=l9_2741;
float2 l9_2748;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2749=float2(0.0);
float l9_2750=0.0;
float2 l9_2751=float2(0.0);
float2 l9_2752=float2(0.0);
float2 l9_2753=float2(0.0);
float2 l9_2754=float2(0.0);
ssGlobals l9_2755=l9_2747;
float2 l9_2756;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2757=float2(0.0);
l9_2757=l9_2755.Surface_UVCoord0;
l9_2751=l9_2757;
l9_2756=l9_2751;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2758=float2(0.0);
l9_2758=l9_2755.Surface_UVCoord1;
l9_2752=l9_2758;
l9_2756=l9_2752;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2759=float2(0.0);
l9_2759=l9_2755.gScreenCoord;
l9_2753=l9_2759;
l9_2756=l9_2753;
}
else
{
float2 l9_2760=float2(0.0);
l9_2760=l9_2755.Surface_UVCoord0;
l9_2754=l9_2760;
l9_2756=l9_2754;
}
}
}
l9_2749=l9_2756;
float2 l9_2761=float2(0.0);
ssGlobals l9_2762=l9_2747;
float2 l9_2763=(*sc_set2.UserUniforms).uv2Scale;
l9_2761=l9_2763;
float2 l9_2764=float2(0.0);
l9_2764=l9_2761;
float2 l9_2765=float2(0.0);
ssGlobals l9_2766=l9_2747;
float2 l9_2767=(*sc_set2.UserUniforms).uv2Offset;
l9_2765=l9_2767;
float2 l9_2768=float2(0.0);
l9_2768=l9_2765;
float2 l9_2769=float2(0.0);
l9_2769=(l9_2749*l9_2764)+l9_2768;
float2 l9_2770=float2(0.0);
l9_2770=l9_2769+(l9_2768*(l9_2747.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2745=l9_2770;
l9_2748=l9_2745;
}
else
{
float2 l9_2771=float2(0.0);
float l9_2772=0.0;
float2 l9_2773=float2(0.0);
float2 l9_2774=float2(0.0);
float2 l9_2775=float2(0.0);
float2 l9_2776=float2(0.0);
ssGlobals l9_2777=l9_2747;
float2 l9_2778;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2779=float2(0.0);
l9_2779=l9_2777.Surface_UVCoord0;
l9_2773=l9_2779;
l9_2778=l9_2773;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2780=float2(0.0);
l9_2780=l9_2777.Surface_UVCoord1;
l9_2774=l9_2780;
l9_2778=l9_2774;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2781=float2(0.0);
l9_2781=l9_2777.gScreenCoord;
l9_2775=l9_2781;
l9_2778=l9_2775;
}
else
{
float2 l9_2782=float2(0.0);
l9_2782=l9_2777.Surface_UVCoord0;
l9_2776=l9_2782;
l9_2778=l9_2776;
}
}
}
l9_2771=l9_2778;
float2 l9_2783=float2(0.0);
ssGlobals l9_2784=l9_2747;
float2 l9_2785=(*sc_set2.UserUniforms).uv2Scale;
l9_2783=l9_2785;
float2 l9_2786=float2(0.0);
l9_2786=l9_2783;
float2 l9_2787=float2(0.0);
ssGlobals l9_2788=l9_2747;
float2 l9_2789=(*sc_set2.UserUniforms).uv2Offset;
l9_2787=l9_2789;
float2 l9_2790=float2(0.0);
l9_2790=l9_2787;
float2 l9_2791=float2(0.0);
l9_2791=(l9_2771*l9_2786)+l9_2790;
l9_2746=l9_2791;
l9_2748=l9_2746;
}
l9_2743=l9_2748;
l9_2739=l9_2743;
l9_2742=l9_2739;
}
else
{
float2 l9_2792=float2(0.0);
l9_2792=l9_2741.Surface_UVCoord0;
l9_2740=l9_2792;
l9_2742=l9_2740;
}
l9_2737=l9_2742;
float2 l9_2793=float2(0.0);
l9_2793=l9_2737;
float2 l9_2794=float2(0.0);
l9_2794=l9_2793;
l9_2730=l9_2794;
l9_2733=l9_2730;
}
else
{
float2 l9_2795=float2(0.0);
l9_2795=l9_2732.Surface_UVCoord0;
l9_2731=l9_2795;
l9_2733=l9_2731;
}
}
}
}
l9_2725=l9_2733;
float2 l9_2796=float2(0.0);
ssGlobals l9_2797=l9_2642;
float2 l9_2798=(*sc_set2.UserUniforms).uv3Scale;
l9_2796=l9_2798;
float2 l9_2799=float2(0.0);
l9_2799=l9_2796;
float2 l9_2800=float2(0.0);
ssGlobals l9_2801=l9_2642;
float2 l9_2802=(*sc_set2.UserUniforms).uv3Offset;
l9_2800=l9_2802;
float2 l9_2803=float2(0.0);
l9_2803=l9_2800;
float2 l9_2804=float2(0.0);
l9_2804=(l9_2725*l9_2799)+l9_2803;
l9_2641=l9_2804;
l9_2643=l9_2641;
}
l9_2638=l9_2643;
l9_2634=l9_2638;
l9_2637=l9_2634;
}
else
{
float2 l9_2805=float2(0.0);
l9_2805=l9_2636.Surface_UVCoord0;
l9_2635=l9_2805;
l9_2637=l9_2635;
}
l9_2632=l9_2637;
float2 l9_2806=float2(0.0);
l9_2806=l9_2632;
float2 l9_2807=float2(0.0);
l9_2807=l9_2806;
l9_2568=l9_2807;
l9_2571=l9_2568;
}
else
{
float2 l9_2808=float2(0.0);
l9_2808=l9_2570.Surface_UVCoord0;
l9_2569=l9_2808;
l9_2571=l9_2569;
}
}
}
}
l9_2563=l9_2571;
float4 l9_2809=float4(0.0);
float2 l9_2810=l9_2563;
ssGlobals l9_2811=l9_2561;
float2 l9_2812=(*sc_set2.UserUniforms).detailNormalTexDims.xy;
float2 l9_2813=l9_2812;
int l9_2814;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_2815;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2815=0;
}
else
{
l9_2815=in.varStereoViewID;
}
int l9_2816=l9_2815;
l9_2814=1-l9_2816;
}
else
{
int l9_2817;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2817=0;
}
else
{
l9_2817=in.varStereoViewID;
}
int l9_2818=l9_2817;
l9_2814=l9_2818;
}
int l9_2819=l9_2814;
float2 l9_2820=l9_2813;
int l9_2821=detailNormalTexLayout_tmp;
int l9_2822=l9_2819;
float2 l9_2823=l9_2810;
bool l9_2824=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_2825=(*sc_set2.UserUniforms).detailNormalTexTransform;
int2 l9_2826=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_2827=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_2828=(*sc_set2.UserUniforms).detailNormalTexUvMinMax;
bool l9_2829=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_2830=(*sc_set2.UserUniforms).detailNormalTexBorderColor;
float l9_2831=0.0;
bool l9_2832=l9_2829&&(!l9_2827);
float l9_2833=1.0;
float l9_2834=l9_2823.x;
int l9_2835=l9_2826.x;
if (l9_2835==1)
{
l9_2834=fract(l9_2834);
}
else
{
if (l9_2835==2)
{
float l9_2836=fract(l9_2834);
float l9_2837=l9_2834-l9_2836;
float l9_2838=step(0.25,fract(l9_2837*0.5));
l9_2834=mix(l9_2836,1.0-l9_2836,fast::clamp(l9_2838,0.0,1.0));
}
}
l9_2823.x=l9_2834;
float l9_2839=l9_2823.y;
int l9_2840=l9_2826.y;
if (l9_2840==1)
{
l9_2839=fract(l9_2839);
}
else
{
if (l9_2840==2)
{
float l9_2841=fract(l9_2839);
float l9_2842=l9_2839-l9_2841;
float l9_2843=step(0.25,fract(l9_2842*0.5));
l9_2839=mix(l9_2841,1.0-l9_2841,fast::clamp(l9_2843,0.0,1.0));
}
}
l9_2823.y=l9_2839;
if (l9_2827)
{
bool l9_2844=l9_2829;
bool l9_2845;
if (l9_2844)
{
l9_2845=l9_2826.x==3;
}
else
{
l9_2845=l9_2844;
}
float l9_2846=l9_2823.x;
float l9_2847=l9_2828.x;
float l9_2848=l9_2828.z;
bool l9_2849=l9_2845;
float l9_2850=l9_2833;
float l9_2851=fast::clamp(l9_2846,l9_2847,l9_2848);
float l9_2852=step(abs(l9_2846-l9_2851),1e-05);
l9_2850*=(l9_2852+((1.0-float(l9_2849))*(1.0-l9_2852)));
l9_2846=l9_2851;
l9_2823.x=l9_2846;
l9_2833=l9_2850;
bool l9_2853=l9_2829;
bool l9_2854;
if (l9_2853)
{
l9_2854=l9_2826.y==3;
}
else
{
l9_2854=l9_2853;
}
float l9_2855=l9_2823.y;
float l9_2856=l9_2828.y;
float l9_2857=l9_2828.w;
bool l9_2858=l9_2854;
float l9_2859=l9_2833;
float l9_2860=fast::clamp(l9_2855,l9_2856,l9_2857);
float l9_2861=step(abs(l9_2855-l9_2860),1e-05);
l9_2859*=(l9_2861+((1.0-float(l9_2858))*(1.0-l9_2861)));
l9_2855=l9_2860;
l9_2823.y=l9_2855;
l9_2833=l9_2859;
}
float2 l9_2862=l9_2823;
bool l9_2863=l9_2824;
float3x3 l9_2864=l9_2825;
if (l9_2863)
{
l9_2862=float2((l9_2864*float3(l9_2862,1.0)).xy);
}
float2 l9_2865=l9_2862;
float2 l9_2866=l9_2865;
float2 l9_2867=l9_2866;
l9_2823=l9_2867;
float l9_2868=l9_2823.x;
int l9_2869=l9_2826.x;
bool l9_2870=l9_2832;
float l9_2871=l9_2833;
if ((l9_2869==0)||(l9_2869==3))
{
float l9_2872=l9_2868;
float l9_2873=0.0;
float l9_2874=1.0;
bool l9_2875=l9_2870;
float l9_2876=l9_2871;
float l9_2877=fast::clamp(l9_2872,l9_2873,l9_2874);
float l9_2878=step(abs(l9_2872-l9_2877),1e-05);
l9_2876*=(l9_2878+((1.0-float(l9_2875))*(1.0-l9_2878)));
l9_2872=l9_2877;
l9_2868=l9_2872;
l9_2871=l9_2876;
}
l9_2823.x=l9_2868;
l9_2833=l9_2871;
float l9_2879=l9_2823.y;
int l9_2880=l9_2826.y;
bool l9_2881=l9_2832;
float l9_2882=l9_2833;
if ((l9_2880==0)||(l9_2880==3))
{
float l9_2883=l9_2879;
float l9_2884=0.0;
float l9_2885=1.0;
bool l9_2886=l9_2881;
float l9_2887=l9_2882;
float l9_2888=fast::clamp(l9_2883,l9_2884,l9_2885);
float l9_2889=step(abs(l9_2883-l9_2888),1e-05);
l9_2887*=(l9_2889+((1.0-float(l9_2886))*(1.0-l9_2889)));
l9_2883=l9_2888;
l9_2879=l9_2883;
l9_2882=l9_2887;
}
l9_2823.y=l9_2879;
l9_2833=l9_2882;
float2 l9_2890=l9_2820;
float2 l9_2891=l9_2823;
int l9_2892=l9_2821;
int l9_2893=l9_2822;
float l9_2894=l9_2831;
float2 l9_2895=l9_2891;
int l9_2896=l9_2892;
int l9_2897=l9_2893;
float3 l9_2898;
if (l9_2896==0)
{
l9_2898=float3(l9_2895,0.0);
}
else
{
if (l9_2896==1)
{
l9_2898=float3(l9_2895.x,(l9_2895.y*0.5)+(0.5-(float(l9_2897)*0.5)),0.0);
}
else
{
l9_2898=float3(l9_2895,float(l9_2897));
}
}
float3 l9_2899=l9_2898;
float3 l9_2900=l9_2899;
float2 l9_2901=l9_2890;
float2 l9_2902=l9_2900.xy;
float l9_2903=l9_2894;
float4 l9_2904=sc_set2.detailNormalTex.sample(sc_set2.detailNormalTexSmpSC,l9_2902,bias(l9_2903));
float4 l9_2905=l9_2904;
float4 l9_2906=l9_2905;
if (l9_2829)
{
l9_2906=mix(l9_2830,l9_2906,float4(l9_2833));
}
float4 l9_2907=l9_2906;
float4 l9_2908=l9_2907;
float4 l9_2909=l9_2907;
float3 l9_2910=(l9_2909.xyz*1.99219)-float3(1.0);
l9_2909=float4(l9_2910.x,l9_2910.y,l9_2910.z,l9_2909.w);
l9_2809=l9_2909;
l9_2559=l9_2809.xyz;
l9_2562=l9_2559;
}
else
{
l9_2562=l9_2560;
}
l9_2557=l9_2562;
float3 l9_2911=float3(0.0);
float3 l9_2912=l9_2455.xyz;
float l9_2913=(*sc_set2.UserUniforms).Port_Strength1_N200;
float3 l9_2914=l9_2557;
float l9_2915=(*sc_set2.UserUniforms).Port_Strength2_N200;
ssGlobals l9_2916=param_26;
float3 l9_2917=l9_2912;
float l9_2918=l9_2913;
float3 l9_2919=l9_2914;
float l9_2920=l9_2915;
float3 l9_2921=mix(float3(0.0,0.0,1.0),l9_2917,float3(l9_2918))+float3(0.0,0.0,1.0);
float3 l9_2922=mix(float3(0.0,0.0,1.0),l9_2919,float3(l9_2920))*float3(-1.0,-1.0,1.0);
float3 l9_2923=normalize((l9_2921*dot(l9_2921,l9_2922))-(l9_2922*l9_2921.z));
l9_2914=l9_2923;
float3 l9_2924=l9_2914;
l9_2911=l9_2924;
float3 l9_2925=float3(0.0);
l9_2925=l9_2208*l9_2911;
float3 l9_2926=float3(0.0);
float3 l9_2927=l9_2925;
ssGlobals l9_2928=param_26;
float l9_2929=dot(l9_2927,l9_2927);
float l9_2930;
if (l9_2929>0.0)
{
l9_2930=1.0/sqrt(l9_2929);
}
else
{
l9_2930=0.0;
}
float l9_2931=l9_2930;
float3 l9_2932=l9_2927*l9_2931;
l9_2926=l9_2932;
param_23=l9_2926;
param_25=param_23;
}
else
{
float3 l9_2933=float3(0.0);
l9_2933=param_26.VertexNormal_WorldSpace;
float3 l9_2934=float3(0.0);
float3 l9_2935=l9_2933;
ssGlobals l9_2936=param_26;
float l9_2937=dot(l9_2935,l9_2935);
float l9_2938;
if (l9_2937>0.0)
{
l9_2938=1.0/sqrt(l9_2937);
}
else
{
l9_2938=0.0;
}
float l9_2939=l9_2938;
float3 l9_2940=l9_2935*l9_2939;
l9_2934=l9_2940;
param_24=l9_2934;
param_25=param_24;
}
Result_N337=param_25;
float3 Export_N334=float3(0.0);
Export_N334=Result_N337;
float4 Output_N36=float4(0.0);
float3 param_27=Export_N364.xyz;
float param_28=Export_N158;
float3 param_29=Export_N334;
float3 param_30=(*sc_set2.UserUniforms).Port_Emissive_N036;
float3 param_31=(*sc_set2.UserUniforms).Port_AO_N036;
ssGlobals param_33=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_33.BumpedNormal=param_29;
}
param_28=fast::clamp(param_28,0.0,1.0);
float l9_2941=param_28;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_2941<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_2942=gl_FragCoord;
float2 l9_2943=floor(mod(l9_2942.xy,float2(4.0)));
float l9_2944=(mod(dot(l9_2943,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_2941<l9_2944)
{
discard_fragment();
}
}
param_27=fast::max(param_27,float3(0.0));
float4 param_32;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float l9_2945=0.0;
float l9_2946=1.0;
float3 l9_2947=float3(1.0);
float3 l9_2948=param_27;
float l9_2949=param_28;
float3 l9_2950=param_33.BumpedNormal;
float3 l9_2951=param_33.PositionWS;
float3 l9_2952=param_33.ViewDirWS;
float3 l9_2953=param_30;
float l9_2954=l9_2945;
float l9_2955=l9_2946;
float3 l9_2956=param_31;
float3 l9_2957=l9_2947;
SurfaceProperties l9_2958;
l9_2958.albedo=float3(0.0);
l9_2958.opacity=1.0;
l9_2958.normal=float3(0.0);
l9_2958.positionWS=float3(0.0);
l9_2958.viewDirWS=float3(0.0);
l9_2958.metallic=0.0;
l9_2958.roughness=0.0;
l9_2958.emissive=float3(0.0);
l9_2958.ao=float3(1.0);
l9_2958.specularAo=float3(1.0);
l9_2958.bakedShadows=float3(1.0);
SurfaceProperties l9_2959=l9_2958;
SurfaceProperties l9_2960=l9_2959;
l9_2960.opacity=l9_2949;
float3 l9_2961=l9_2948;
float3 l9_2962;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2962=float3(pow(l9_2961.x,2.2),pow(l9_2961.y,2.2),pow(l9_2961.z,2.2));
}
else
{
l9_2962=l9_2961*l9_2961;
}
float3 l9_2963=l9_2962;
l9_2960.albedo=l9_2963;
l9_2960.normal=normalize(l9_2950);
l9_2960.positionWS=l9_2951;
l9_2960.viewDirWS=l9_2952;
float3 l9_2964=l9_2953;
float3 l9_2965;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2965=float3(pow(l9_2964.x,2.2),pow(l9_2964.y,2.2),pow(l9_2964.z,2.2));
}
else
{
l9_2965=l9_2964*l9_2964;
}
float3 l9_2966=l9_2965;
l9_2960.emissive=l9_2966;
l9_2960.metallic=l9_2954;
l9_2960.roughness=l9_2955;
l9_2960.ao=l9_2956;
l9_2960.specularAo=l9_2957;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_2967=l9_2960.positionWS;
l9_2960.ao=evaluateSSAO(l9_2967,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.sc_SSAOTexture,sc_set2.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_2968=l9_2960;
SurfaceProperties l9_2969=l9_2968;
float3 l9_2970=mix(float3(0.04),l9_2969.albedo*l9_2969.metallic,float3(l9_2969.metallic));
float3 l9_2971=mix(l9_2969.albedo*(1.0-l9_2969.metallic),float3(0.0),float3(l9_2969.metallic));
l9_2968.albedo=l9_2971;
l9_2968.specColor=l9_2970;
SurfaceProperties l9_2972=l9_2968;
l9_2960=l9_2972;
SurfaceProperties l9_2973=l9_2960;
LightingComponents l9_2974;
l9_2974.directDiffuse=float3(0.0);
l9_2974.directSpecular=float3(0.0);
l9_2974.indirectDiffuse=float3(1.0);
l9_2974.indirectSpecular=float3(0.0);
l9_2974.emitted=float3(0.0);
l9_2974.transmitted=float3(0.0);
LightingComponents l9_2975=l9_2974;
LightingComponents l9_2976=l9_2975;
float3 l9_2977=l9_2973.viewDirWS;
int l9_2978=0;
float4 l9_2979=float4(l9_2973.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_2980;
LightProperties l9_2981;
int l9_2982=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2982<sc_DirectionalLightsCount_tmp)
{
l9_2980.direction=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_2982].direction;
l9_2980.color=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_2982].color;
l9_2981.direction=l9_2980.direction;
l9_2981.color=l9_2980.color.xyz;
l9_2981.attenuation=l9_2980.color.w;
l9_2981.attenuation*=l9_2979[(l9_2978<3) ? l9_2978 : 3];
l9_2978++;
LightingComponents l9_2983=l9_2976;
LightProperties l9_2984=l9_2981;
SurfaceProperties l9_2985=l9_2973;
float3 l9_2986=l9_2977;
SurfaceProperties l9_2987=l9_2985;
float3 l9_2988=l9_2984.direction;
float l9_2989=dot(l9_2987.normal,l9_2988);
float l9_2990=fast::clamp(l9_2989,0.0,1.0);
float3 l9_2991=float3(l9_2990);
l9_2983.directDiffuse+=((l9_2991*l9_2984.color)*l9_2984.attenuation);
SurfaceProperties l9_2992=l9_2985;
float3 l9_2993=l9_2984.direction;
float3 l9_2994=l9_2986;
l9_2983.directSpecular+=((calculateDirectSpecular(l9_2992,l9_2993,l9_2994)*l9_2984.color)*l9_2984.attenuation);
LightingComponents l9_2995=l9_2983;
l9_2976=l9_2995;
l9_2982++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_2996;
LightProperties l9_2997;
int l9_2998=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2998<sc_PointLightsCount_tmp)
{
l9_2996.falloffEnabled=(*sc_set2.UserUniforms).sc_PointLights[l9_2998].falloffEnabled!=0;
l9_2996.falloffEndDistance=(*sc_set2.UserUniforms).sc_PointLights[l9_2998].falloffEndDistance;
l9_2996.negRcpFalloffEndDistance4=(*sc_set2.UserUniforms).sc_PointLights[l9_2998].negRcpFalloffEndDistance4;
l9_2996.angleScale=(*sc_set2.UserUniforms).sc_PointLights[l9_2998].angleScale;
l9_2996.angleOffset=(*sc_set2.UserUniforms).sc_PointLights[l9_2998].angleOffset;
l9_2996.direction=(*sc_set2.UserUniforms).sc_PointLights[l9_2998].direction;
l9_2996.position=(*sc_set2.UserUniforms).sc_PointLights[l9_2998].position;
l9_2996.color=(*sc_set2.UserUniforms).sc_PointLights[l9_2998].color;
float3 l9_2999=l9_2996.position-l9_2973.positionWS;
l9_2997.direction=normalize(l9_2999);
l9_2997.color=l9_2996.color.xyz;
l9_2997.attenuation=l9_2996.color.w;
l9_2997.attenuation*=l9_2979[(l9_2978<3) ? l9_2978 : 3];
float3 l9_3000=l9_2997.direction;
float3 l9_3001=l9_2996.direction;
float l9_3002=l9_2996.angleScale;
float l9_3003=l9_2996.angleOffset;
float l9_3004=dot(l9_3000,l9_3001);
float l9_3005=fast::clamp((l9_3004*l9_3002)+l9_3003,0.0,1.0);
float l9_3006=l9_3005*l9_3005;
l9_2997.attenuation*=l9_3006;
if (l9_2996.falloffEnabled)
{
float l9_3007=length(l9_2999);
float l9_3008=l9_2996.falloffEndDistance;
l9_2997.attenuation*=computeDistanceAttenuation(l9_3007,l9_3008);
}
l9_2978++;
LightingComponents l9_3009=l9_2976;
LightProperties l9_3010=l9_2997;
SurfaceProperties l9_3011=l9_2973;
float3 l9_3012=l9_2977;
SurfaceProperties l9_3013=l9_3011;
float3 l9_3014=l9_3010.direction;
float l9_3015=dot(l9_3013.normal,l9_3014);
float l9_3016=fast::clamp(l9_3015,0.0,1.0);
float3 l9_3017=float3(l9_3016);
l9_3009.directDiffuse+=((l9_3017*l9_3010.color)*l9_3010.attenuation);
SurfaceProperties l9_3018=l9_3011;
float3 l9_3019=l9_3010.direction;
float3 l9_3020=l9_3012;
l9_3009.directSpecular+=((calculateDirectSpecular(l9_3018,l9_3019,l9_3020)*l9_3010.color)*l9_3010.attenuation);
LightingComponents l9_3021=l9_3009;
l9_2976=l9_3021;
l9_2998++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_3022;
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_3023=abs(in.varShadowTex-float2(0.5));
float l9_3024=fast::max(l9_3023.x,l9_3023.y);
float l9_3025=step(l9_3024,0.5);
float4 l9_3026=sc_set2.sc_ShadowTexture.sample(sc_set2.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_3025;
float3 l9_3027=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_3026.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float l9_3028=l9_3026.w*(*sc_set2.UserUniforms).sc_ShadowDensity;
l9_3022=mix(float3(1.0),l9_3027,float3(l9_3028));
}
else
{
l9_3022=float3(1.0);
}
float3 l9_3029=l9_3022;
float3 l9_3030=l9_3029;
l9_2976.directDiffuse*=l9_3030;
l9_2976.directSpecular*=l9_3030;
}
l9_2976.directSpecular=float3(0.0);
SurfaceProperties l9_3031=l9_2973;
float3 l9_3032=l9_3031.normal;
float3 l9_3033=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_3034=l9_3032;
float3 l9_3035=l9_3034;
float l9_3036=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float l9_3037=l9_3035.x;
float l9_3038=-l9_3035.z;
float l9_3039=(l9_3037<0.0) ? (-1.0) : 1.0;
float l9_3040=l9_3039*acos(fast::clamp(l9_3038/length(float2(l9_3037,l9_3038)),-1.0,1.0));
float2 l9_3041;
l9_3041.x=l9_3040-1.5708;
l9_3041.y=acos(l9_3035.y);
l9_3041/=float2(6.28319,3.14159);
l9_3041.y=1.0-l9_3041.y;
l9_3041.x+=(l9_3036/360.0);
l9_3041.x=fract((l9_3041.x+floor(l9_3041.x))+1.0);
float2 l9_3042=l9_3041;
float2 l9_3043=l9_3042;
float4 l9_3044;
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_3045=l9_3043;
float2 l9_3046=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_3047=5.0;
l9_3043=calcSeamlessPanoramicUvsForSampling(l9_3045,l9_3046,l9_3047);
}
float2 l9_3048=l9_3043;
float l9_3049=13.0;
int l9_3050;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3051;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3051=0;
}
else
{
l9_3051=in.varStereoViewID;
}
int l9_3052=l9_3051;
l9_3050=1-l9_3052;
}
else
{
int l9_3053;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3053=0;
}
else
{
l9_3053=in.varStereoViewID;
}
int l9_3054=l9_3053;
l9_3050=l9_3054;
}
int l9_3055=l9_3050;
float2 l9_3056=l9_3048;
int l9_3057=l9_3055;
float l9_3058=l9_3049;
float2 l9_3059=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_3060=l9_3059;
float2 l9_3061=l9_3056;
int l9_3062=sc_EnvmapSpecularLayout_tmp;
int l9_3063=l9_3057;
float l9_3064=l9_3058;
float2 l9_3065=l9_3061;
int l9_3066=l9_3062;
int l9_3067=l9_3063;
float3 l9_3068;
if (l9_3066==0)
{
l9_3068=float3(l9_3065,0.0);
}
else
{
if (l9_3066==1)
{
l9_3068=float3(l9_3065.x,(l9_3065.y*0.5)+(0.5-(float(l9_3067)*0.5)),0.0);
}
else
{
l9_3068=float3(l9_3065,float(l9_3067));
}
}
float3 l9_3069=l9_3068;
float3 l9_3070=l9_3069;
float2 l9_3071=l9_3060;
float2 l9_3072=l9_3070.xy;
float l9_3073=l9_3064;
float4 l9_3074=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_3072,bias(l9_3073));
float4 l9_3075=l9_3074;
float4 l9_3076=l9_3075;
float4 l9_3077=l9_3076;
float4 l9_3078=l9_3077;
l9_3044=l9_3078;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_3079=l9_3043;
float2 l9_3080=(*sc_set2.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_3081=0.0;
l9_3043=calcSeamlessPanoramicUvsForSampling(l9_3079,l9_3080,l9_3081);
float2 l9_3082=l9_3043;
float l9_3083=-13.0;
int l9_3084;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_3085;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3085=0;
}
else
{
l9_3085=in.varStereoViewID;
}
int l9_3086=l9_3085;
l9_3084=1-l9_3086;
}
else
{
int l9_3087;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3087=0;
}
else
{
l9_3087=in.varStereoViewID;
}
int l9_3088=l9_3087;
l9_3084=l9_3088;
}
int l9_3089=l9_3084;
float2 l9_3090=l9_3082;
int l9_3091=l9_3089;
float l9_3092=l9_3083;
float2 l9_3093=(*sc_set2.UserUniforms).sc_EnvmapDiffuseDims.xy;
float2 l9_3094=l9_3093;
float2 l9_3095=l9_3090;
int l9_3096=sc_EnvmapDiffuseLayout_tmp;
int l9_3097=l9_3091;
float l9_3098=l9_3092;
float2 l9_3099=l9_3095;
int l9_3100=l9_3096;
int l9_3101=l9_3097;
float3 l9_3102;
if (l9_3100==0)
{
l9_3102=float3(l9_3099,0.0);
}
else
{
if (l9_3100==1)
{
l9_3102=float3(l9_3099.x,(l9_3099.y*0.5)+(0.5-(float(l9_3101)*0.5)),0.0);
}
else
{
l9_3102=float3(l9_3099,float(l9_3101));
}
}
float3 l9_3103=l9_3102;
float3 l9_3104=l9_3103;
float2 l9_3105=l9_3094;
float2 l9_3106=l9_3104.xy;
float l9_3107=l9_3098;
float4 l9_3108=sc_set2.sc_EnvmapDiffuse.sample(sc_set2.sc_EnvmapDiffuseSmpSC,l9_3106,bias(l9_3107));
float4 l9_3109=l9_3108;
float4 l9_3110=l9_3109;
float4 l9_3111=l9_3110;
float4 l9_3112=l9_3111;
l9_3044=l9_3112;
}
else
{
float2 l9_3113=l9_3043;
float l9_3114=13.0;
int l9_3115;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_3116;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3116=0;
}
else
{
l9_3116=in.varStereoViewID;
}
int l9_3117=l9_3116;
l9_3115=1-l9_3117;
}
else
{
int l9_3118;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3118=0;
}
else
{
l9_3118=in.varStereoViewID;
}
int l9_3119=l9_3118;
l9_3115=l9_3119;
}
int l9_3120=l9_3115;
float2 l9_3121=l9_3113;
int l9_3122=l9_3120;
float l9_3123=l9_3114;
float2 l9_3124=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_3125=l9_3124;
float2 l9_3126=l9_3121;
int l9_3127=sc_EnvmapSpecularLayout_tmp;
int l9_3128=l9_3122;
float l9_3129=l9_3123;
float2 l9_3130=l9_3126;
int l9_3131=l9_3127;
int l9_3132=l9_3128;
float3 l9_3133;
if (l9_3131==0)
{
l9_3133=float3(l9_3130,0.0);
}
else
{
if (l9_3131==1)
{
l9_3133=float3(l9_3130.x,(l9_3130.y*0.5)+(0.5-(float(l9_3132)*0.5)),0.0);
}
else
{
l9_3133=float3(l9_3130,float(l9_3132));
}
}
float3 l9_3134=l9_3133;
float3 l9_3135=l9_3134;
float2 l9_3136=l9_3125;
float2 l9_3137=l9_3135.xy;
float l9_3138=l9_3129;
float4 l9_3139=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_3137,bias(l9_3138));
float4 l9_3140=l9_3139;
float4 l9_3141=l9_3140;
float4 l9_3142=l9_3141;
float4 l9_3143=l9_3142;
l9_3044=l9_3143;
}
}
float4 l9_3144=l9_3044;
float3 l9_3145=l9_3144.xyz*(1.0/l9_3144.w);
float3 l9_3146=l9_3145*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_3033=l9_3146;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_3147=(*sc_set2.UserUniforms).sc_Sh[0];
float3 l9_3148=(*sc_set2.UserUniforms).sc_Sh[1];
float3 l9_3149=(*sc_set2.UserUniforms).sc_Sh[2];
float3 l9_3150=(*sc_set2.UserUniforms).sc_Sh[3];
float3 l9_3151=(*sc_set2.UserUniforms).sc_Sh[4];
float3 l9_3152=(*sc_set2.UserUniforms).sc_Sh[5];
float3 l9_3153=(*sc_set2.UserUniforms).sc_Sh[6];
float3 l9_3154=(*sc_set2.UserUniforms).sc_Sh[7];
float3 l9_3155=(*sc_set2.UserUniforms).sc_Sh[8];
float3 l9_3156=-l9_3032;
float l9_3157=l9_3156.x;
float l9_3158=l9_3156.y;
float l9_3159=l9_3156.z;
float l9_3160=l9_3157*l9_3157;
float l9_3161=l9_3158*l9_3158;
float l9_3162=l9_3159*l9_3159;
float l9_3163=l9_3157*l9_3158;
float l9_3164=l9_3158*l9_3159;
float l9_3165=l9_3157*l9_3159;
float3 l9_3166=((((((l9_3155*0.429043)*(l9_3160-l9_3161))+((l9_3153*0.743125)*l9_3162))+(l9_3147*0.886227))-(l9_3153*0.247708))+((((l9_3151*l9_3163)+(l9_3154*l9_3165))+(l9_3152*l9_3164))*0.858086))+((((l9_3150*l9_3157)+(l9_3148*l9_3158))+(l9_3149*l9_3159))*1.02333);
l9_3033=l9_3166*(*sc_set2.UserUniforms).sc_ShIntensity;
}
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_3033+=((*sc_set2.UserUniforms).sc_AmbientLights[0].color*(*sc_set2.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_3033.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_3033+=((*sc_set2.UserUniforms).sc_AmbientLights[1].color*(*sc_set2.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_3033.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_3033+=((*sc_set2.UserUniforms).sc_AmbientLights[2].color*(*sc_set2.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_3033.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_3167=l9_3032;
float3 l9_3168=(*sc_set2.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_3169;
float l9_3170;
int l9_3171=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_3171<sc_LightEstimationSGCount_tmp)
{
l9_3169.color=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_3171].color;
l9_3169.sharpness=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_3171].sharpness;
l9_3169.axis=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_3171].axis;
float3 l9_3172=l9_3167;
float l9_3173=dot(l9_3169.axis,l9_3172);
float l9_3174=l9_3169.sharpness;
float l9_3175=0.36;
float l9_3176=1.0/(4.0*l9_3175);
float l9_3177=exp(-l9_3174);
float l9_3178=l9_3177*l9_3177;
float l9_3179=1.0/l9_3174;
float l9_3180=(1.0+(2.0*l9_3178))-l9_3179;
float l9_3181=((l9_3177-l9_3178)*l9_3179)-l9_3178;
float l9_3182=sqrt(1.0-l9_3180);
float l9_3183=l9_3175*l9_3173;
float l9_3184=l9_3176*l9_3182;
float l9_3185=l9_3183+l9_3184;
float l9_3186=l9_3173;
float l9_3187=fast::clamp(l9_3186,0.0,1.0);
float l9_3188=l9_3187;
if (step(abs(l9_3183),l9_3184)>0.5)
{
l9_3170=(l9_3185*l9_3185)/l9_3182;
}
else
{
l9_3170=l9_3188;
}
l9_3188=l9_3170;
float l9_3189=(l9_3180*l9_3188)+l9_3181;
sc_SphericalGaussianLight_t l9_3190=l9_3169;
float3 l9_3191=(l9_3190.color/float3(l9_3190.sharpness))*6.28319;
float3 l9_3192=(l9_3191*l9_3189)/float3(3.14159);
l9_3168+=l9_3192;
l9_3171++;
continue;
}
else
{
break;
}
}
float3 l9_3193=l9_3168;
l9_3033+=l9_3193;
}
float3 l9_3194=l9_3033;
float3 l9_3195=l9_3194;
l9_2976.indirectDiffuse=l9_3195;
LightingComponents l9_3196=l9_2976;
LightingComponents l9_3197=l9_3196;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_3197.directDiffuse=float3(0.0);
l9_3197.indirectDiffuse=float3(0.0);
float4 l9_3198;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_3199=out.FragColor0;
float4 l9_3200=l9_3199;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_3200.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_3201=l9_3200;
l9_3198=l9_3201;
}
else
{
float4 l9_3202=gl_FragCoord;
float2 l9_3203=(l9_3202.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_3204=l9_3203;
float2 l9_3205;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_3206=float3(l9_3204,0.0);
int l9_3207=1;
int l9_3208;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3208=0;
}
else
{
l9_3208=in.varStereoViewID;
}
int l9_3209=l9_3208;
int l9_3210=l9_3209;
float3 l9_3211=float3(l9_3204,0.0);
int l9_3212=l9_3207;
int l9_3213=l9_3210;
if (l9_3212==1)
{
l9_3211.y=((2.0*l9_3211.y)+float(l9_3213))-1.0;
}
float2 l9_3214=l9_3211.xy;
l9_3205=l9_3214;
}
else
{
l9_3205=l9_3204;
}
float2 l9_3215=l9_3205;
float2 l9_3216=l9_3215;
float2 l9_3217=l9_3216;
int l9_3218;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_3219;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3219=0;
}
else
{
l9_3219=in.varStereoViewID;
}
int l9_3220=l9_3219;
l9_3218=1-l9_3220;
}
else
{
int l9_3221;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3221=0;
}
else
{
l9_3221=in.varStereoViewID;
}
int l9_3222=l9_3221;
l9_3218=l9_3222;
}
int l9_3223=l9_3218;
float2 l9_3224=l9_3217;
int l9_3225=l9_3223;
float2 l9_3226=l9_3224;
int l9_3227=l9_3225;
float l9_3228=0.0;
float2 l9_3229=(*sc_set2.UserUniforms).sc_ScreenTextureDims.xy;
float2 l9_3230=l9_3229;
float2 l9_3231=l9_3226;
int l9_3232=sc_ScreenTextureLayout_tmp;
int l9_3233=l9_3227;
float l9_3234=l9_3228;
float2 l9_3235=l9_3231;
int l9_3236=l9_3232;
int l9_3237=l9_3233;
float3 l9_3238;
if (l9_3236==0)
{
l9_3238=float3(l9_3235,0.0);
}
else
{
if (l9_3236==1)
{
l9_3238=float3(l9_3235.x,(l9_3235.y*0.5)+(0.5-(float(l9_3237)*0.5)),0.0);
}
else
{
l9_3238=float3(l9_3235,float(l9_3237));
}
}
float3 l9_3239=l9_3238;
float3 l9_3240=l9_3239;
float2 l9_3241=l9_3230;
float2 l9_3242=l9_3240.xy;
float l9_3243=l9_3234;
float4 l9_3244=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_3242,bias(l9_3243));
float4 l9_3245=l9_3244;
float4 l9_3246=l9_3245;
float4 l9_3247=l9_3246;
float4 l9_3248=l9_3247;
float4 l9_3249=l9_3248;
l9_3198=l9_3249;
}
float4 l9_3250=l9_3198;
float4 l9_3251=l9_3250;
float3 l9_3252=l9_3251.xyz;
float3 l9_3253;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3253=float3(pow(l9_3252.x,2.2),pow(l9_3252.y,2.2),pow(l9_3252.z,2.2));
}
else
{
l9_3253=l9_3252*l9_3252;
}
float3 l9_3254=l9_3253;
float3 l9_3255=l9_3254;
l9_3197.transmitted=l9_3255*mix(float3(1.0),l9_2960.albedo,float3(l9_2960.opacity));
l9_2960.opacity=1.0;
}
bool l9_3256=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_3256=true;
}
SurfaceProperties l9_3257=l9_2960;
LightingComponents l9_3258=l9_3197;
bool l9_3259=l9_3256;
float3 l9_3260=l9_3257.albedo*(l9_3258.directDiffuse+(l9_3258.indirectDiffuse*l9_3257.ao));
float3 l9_3261=l9_3258.directSpecular+(l9_3258.indirectSpecular*l9_3257.specularAo);
float3 l9_3262=l9_3257.emissive;
float3 l9_3263=l9_3258.transmitted;
if (l9_3259)
{
float l9_3264=l9_3257.opacity;
l9_3260*=srgbToLinear(l9_3264);
}
float3 l9_3265=((l9_3260+l9_3261)+l9_3262)+l9_3263;
float3 l9_3266=l9_3265;
float4 l9_3267=float4(l9_3266,l9_2960.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_3268=l9_3267.xyz;
float3 l9_3269=linearToneMapping(l9_3268);
l9_3267=float4(l9_3269.x,l9_3269.y,l9_3269.z,l9_3267.w);
}
float3 l9_3270=l9_3267.xyz;
float l9_3271=l9_3270.x;
float l9_3272=l9_3270.y;
float l9_3273=l9_3270.z;
float3 l9_3274=float3(linearToSrgb(l9_3271),linearToSrgb(l9_3272),linearToSrgb(l9_3273));
l9_3267=float4(l9_3274.x,l9_3274.y,l9_3274.z,l9_3267.w);
float4 l9_3275=l9_3267;
param_32=l9_3275;
}
else
{
param_32=float4(param_27,param_28);
}
param_32=fast::max(param_32,float4(0.0));
Output_N36=param_32;
FinalColor=Output_N36;
float4 param_34=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_3276=param_34;
float4 l9_3277=l9_3276;
float l9_3278=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_3278=l9_3277.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_3278=fast::clamp(l9_3277.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_3278=fast::clamp(dot(l9_3277.xyz,float3(l9_3277.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_3278=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_3278=(1.0-dot(l9_3277.xyz,float3(0.33333)))*l9_3277.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_3278=(1.0-fast::clamp(dot(l9_3277.xyz,float3(1.0)),0.0,1.0))*l9_3277.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_3278=fast::clamp(dot(l9_3277.xyz,float3(1.0)),0.0,1.0)*l9_3277.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_3278=fast::clamp(dot(l9_3277.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_3278=fast::clamp(dot(l9_3277.xyz,float3(1.0)),0.0,1.0)*l9_3277.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_3278=dot(l9_3277.xyz,float3(0.33333))*l9_3277.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_3278=1.0-fast::clamp(dot(l9_3277.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_3278=fast::clamp(dot(l9_3277.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_3279=l9_3278;
float l9_3280=l9_3279;
float l9_3281=(*sc_set2.UserUniforms).sc_ShadowDensity*l9_3280;
float3 l9_3282=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_3276.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float4 l9_3283=float4(l9_3282.x,l9_3282.y,l9_3282.z,l9_3281);
param_34=l9_3283;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_34=float4(param_34.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_3284=param_34;
float4 l9_3285;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_3286=out.FragColor0;
float4 l9_3287=l9_3286;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_3287.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_3288=l9_3287;
l9_3285=l9_3288;
}
else
{
float4 l9_3289=gl_FragCoord;
float2 l9_3290=(l9_3289.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_3291=l9_3290;
float2 l9_3292;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_3293=float3(l9_3291,0.0);
int l9_3294=1;
int l9_3295;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3295=0;
}
else
{
l9_3295=in.varStereoViewID;
}
int l9_3296=l9_3295;
int l9_3297=l9_3296;
float3 l9_3298=float3(l9_3291,0.0);
int l9_3299=l9_3294;
int l9_3300=l9_3297;
if (l9_3299==1)
{
l9_3298.y=((2.0*l9_3298.y)+float(l9_3300))-1.0;
}
float2 l9_3301=l9_3298.xy;
l9_3292=l9_3301;
}
else
{
l9_3292=l9_3291;
}
float2 l9_3302=l9_3292;
float2 l9_3303=l9_3302;
float2 l9_3304=l9_3303;
int l9_3305;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_3306;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3306=0;
}
else
{
l9_3306=in.varStereoViewID;
}
int l9_3307=l9_3306;
l9_3305=1-l9_3307;
}
else
{
int l9_3308;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3308=0;
}
else
{
l9_3308=in.varStereoViewID;
}
int l9_3309=l9_3308;
l9_3305=l9_3309;
}
int l9_3310=l9_3305;
float2 l9_3311=l9_3304;
int l9_3312=l9_3310;
float2 l9_3313=l9_3311;
int l9_3314=l9_3312;
float l9_3315=0.0;
float2 l9_3316=(*sc_set2.UserUniforms).sc_ScreenTextureDims.xy;
float2 l9_3317=l9_3316;
float2 l9_3318=l9_3313;
int l9_3319=sc_ScreenTextureLayout_tmp;
int l9_3320=l9_3314;
float l9_3321=l9_3315;
float2 l9_3322=l9_3318;
int l9_3323=l9_3319;
int l9_3324=l9_3320;
float3 l9_3325;
if (l9_3323==0)
{
l9_3325=float3(l9_3322,0.0);
}
else
{
if (l9_3323==1)
{
l9_3325=float3(l9_3322.x,(l9_3322.y*0.5)+(0.5-(float(l9_3324)*0.5)),0.0);
}
else
{
l9_3325=float3(l9_3322,float(l9_3324));
}
}
float3 l9_3326=l9_3325;
float3 l9_3327=l9_3326;
float2 l9_3328=l9_3317;
float2 l9_3329=l9_3327.xy;
float l9_3330=l9_3321;
float4 l9_3331=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_3329,bias(l9_3330));
float4 l9_3332=l9_3331;
float4 l9_3333=l9_3332;
float4 l9_3334=l9_3333;
float4 l9_3335=l9_3334;
float4 l9_3336=l9_3335;
l9_3285=l9_3336;
}
float4 l9_3337=l9_3285;
float4 l9_3338=l9_3337;
float3 l9_3339=l9_3338.xyz;
float3 l9_3340=l9_3339;
float3 l9_3341=l9_3284.xyz;
float3 l9_3342=definedBlend(l9_3340,l9_3341,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.intensityTexture,sc_set2.intensityTextureSmpSC);
float4 l9_3343;
l9_3343=float4(l9_3342.x,l9_3342.y,l9_3342.z,l9_3343.w);
float3 l9_3344=mix(l9_3339,l9_3343.xyz,float3(l9_3284.w));
l9_3343=float4(l9_3344.x,l9_3344.y,l9_3344.z,l9_3343.w);
l9_3343.w=1.0;
float4 l9_3345=l9_3343;
param_34=l9_3345;
}
else
{
float4 l9_3346=param_34;
float4 l9_3347;
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_3347=float4(mix(float3(1.0),l9_3346.xyz,float3(l9_3346.w)),l9_3346.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_3348=l9_3346.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_3348=fast::clamp(l9_3348,0.0,1.0);
}
l9_3347=float4(l9_3346.xyz*l9_3348,l9_3348);
}
else
{
l9_3347=l9_3346;
}
}
float4 l9_3349=l9_3347;
param_34=l9_3349;
}
}
}
float4 l9_3350=param_34;
FinalColor=l9_3350;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_3351;
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_3351=float4((*sc_set2.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_3351=float4(0.0);
}
float4 l9_3352=l9_3351;
float4 Cost=l9_3352;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_35=FinalColor;
out.FragColor0=param_35;
float4 param_36=FinalColor;
return out;
}
} // FRAGMENT SHADER
