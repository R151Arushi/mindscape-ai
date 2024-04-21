#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
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
//sampler sampler baseTexSmpSC 2:25
//sampler sampler detailNormalTexSmpSC 2:26
//sampler sampler emissiveTexSmpSC 2:27
//sampler sampler intensityTextureSmpSC 2:28
//sampler sampler materialParamsTexSmpSC 2:29
//sampler sampler normalTexSmpSC 2:30
//sampler sampler opacityTexSmpSC 2:31
//sampler sampler reflectionModulationTexSmpSC 2:32
//sampler sampler reflectionTexSmpSC 2:33
//sampler sampler rimColorTexSmpSC 2:34
//sampler sampler sc_EnvmapDiffuseSmpSC 2:35
//sampler sampler sc_EnvmapSpecularSmpSC 2:36
//sampler sampler sc_SSAOTextureSmpSC 2:38
//sampler sampler sc_ScreenTextureSmpSC 2:39
//sampler sampler sc_ShadowTextureSmpSC 2:40
//texture texture2D baseTex 2:1:2:25
//texture texture2D detailNormalTex 2:2:2:26
//texture texture2D emissiveTex 2:3:2:27
//texture texture2D intensityTexture 2:4:2:28
//texture texture2D materialParamsTex 2:5:2:29
//texture texture2D normalTex 2:6:2:30
//texture texture2D opacityTex 2:7:2:31
//texture texture2D reflectionModulationTex 2:8:2:32
//texture texture2D reflectionTex 2:9:2:33
//texture texture2D rimColorTex 2:10:2:34
//texture texture2D sc_EnvmapDiffuse 2:11:2:35
//texture texture2D sc_EnvmapSpecular 2:12:2:36
//texture texture2D sc_SSAOTexture 2:21:2:38
//texture texture2D sc_ScreenTexture 2:22:2:39
//texture texture2D sc_ShadowTexture 2:23:2:40
//ubo int UserUniforms 2:42:5040 {
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
//float4 baseColor 3680
//float4 baseTexSize 3696
//float4 baseTexDims 3712
//float4 baseTexView 3728
//float3x3 baseTexTransform 3744
//float4 baseTexUvMinMax 3792
//float4 baseTexBorderColor 3808
//float3 recolorRed 3824
//float3 recolorGreen 3840
//float3 recolorBlue 3856
//float4 opacityTexSize 3872
//float4 opacityTexDims 3888
//float4 opacityTexView 3904
//float3x3 opacityTexTransform 3920
//float4 opacityTexUvMinMax 3968
//float4 opacityTexBorderColor 3984
//float4 normalTexSize 4000
//float4 normalTexDims 4016
//float4 normalTexView 4032
//float3x3 normalTexTransform 4048
//float4 normalTexUvMinMax 4096
//float4 normalTexBorderColor 4112
//float4 detailNormalTexSize 4128
//float4 detailNormalTexDims 4144
//float4 detailNormalTexView 4160
//float3x3 detailNormalTexTransform 4176
//float4 detailNormalTexUvMinMax 4224
//float4 detailNormalTexBorderColor 4240
//float4 emissiveTexSize 4256
//float4 emissiveTexDims 4272
//float4 emissiveTexView 4288
//float3x3 emissiveTexTransform 4304
//float4 emissiveTexUvMinMax 4352
//float4 emissiveTexBorderColor 4368
//float3 emissiveColor 4384
//float emissiveIntensity 4400
//float4 reflectionTexSize 4416
//float4 reflectionTexDims 4432
//float4 reflectionTexView 4448
//float3x3 reflectionTexTransform 4464
//float4 reflectionTexUvMinMax 4512
//float4 reflectionTexBorderColor 4528
//float reflectionIntensity 4544
//float4 reflectionModulationTexSize 4560
//float4 reflectionModulationTexDims 4576
//float4 reflectionModulationTexView 4592
//float3x3 reflectionModulationTexTransform 4608
//float4 reflectionModulationTexUvMinMax 4656
//float4 reflectionModulationTexBorderColor 4672
//float3 rimColor 4688
//float rimIntensity 4704
//float rimExponent 4708
//float4 rimColorTexSize 4720
//float4 rimColorTexDims 4736
//float4 rimColorTexView 4752
//float3x3 rimColorTexTransform 4768
//float4 rimColorTexUvMinMax 4816
//float4 rimColorTexBorderColor 4832
//float metallic 4848
//float roughness 4852
//float4 materialParamsTexSize 4864
//float4 materialParamsTexDims 4880
//float4 materialParamsTexView 4896
//float3x3 materialParamsTexTransform 4912
//float4 materialParamsTexUvMinMax 4960
//float4 materialParamsTexBorderColor 4976
//float specularAoIntensity 4992
//float specularAoDarkening 4996
//float2 uv2Scale 5000
//float2 uv2Offset 5008
//float2 uv3Scale 5016
//float2 uv3Offset 5024
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
//spec_const bool ENABLE_EMISSIVE 1032
//spec_const bool ENABLE_NORMALMAP 1033
//spec_const bool ENABLE_OPACITY_TEX 1034
//spec_const bool ENABLE_RECOLOR 1035
//spec_const bool ENABLE_RIM_HIGHLIGHT 1036
//spec_const bool ENABLE_RIM_INVERT 1037
//spec_const bool ENABLE_SIMPLE_REFLECTION 1038
//spec_const bool ENABLE_SPECULAR_AO 1039
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 1040
//spec_const bool ENABLE_UV2 1041
//spec_const bool ENABLE_UV3 1042
//spec_const bool SC_GL_FRAGMENT_PRECISION_HIGH 1043
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 1044
//spec_const bool SC_USE_CLAMP_TO_BORDER_detailNormalTex 1045
//spec_const bool SC_USE_CLAMP_TO_BORDER_emissiveTex 1046
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 1047
//spec_const bool SC_USE_CLAMP_TO_BORDER_materialParamsTex 1048
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 1049
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 1050
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 1051
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionTex 1052
//spec_const bool SC_USE_CLAMP_TO_BORDER_rimColorTex 1053
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 1054
//spec_const bool SC_USE_UV_MIN_MAX_detailNormalTex 1055
//spec_const bool SC_USE_UV_MIN_MAX_emissiveTex 1056
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 1057
//spec_const bool SC_USE_UV_MIN_MAX_materialParamsTex 1058
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 1059
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 1060
//spec_const bool SC_USE_UV_MIN_MAX_reflectionModulationTex 1061
//spec_const bool SC_USE_UV_MIN_MAX_reflectionTex 1062
//spec_const bool SC_USE_UV_MIN_MAX_rimColorTex 1063
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 1064
//spec_const bool SC_USE_UV_TRANSFORM_detailNormalTex 1065
//spec_const bool SC_USE_UV_TRANSFORM_emissiveTex 1066
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 1067
//spec_const bool SC_USE_UV_TRANSFORM_materialParamsTex 1068
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 1069
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 1070
//spec_const bool SC_USE_UV_TRANSFORM_reflectionModulationTex 1071
//spec_const bool SC_USE_UV_TRANSFORM_reflectionTex 1072
//spec_const bool SC_USE_UV_TRANSFORM_rimColorTex 1073
//spec_const bool Tweak_N177 1074
//spec_const bool Tweak_N216 1075
//spec_const bool UseViewSpaceDepthVariant 1076
//spec_const bool baseTexHasSwappedViews 1077
//spec_const bool detailNormalTexHasSwappedViews 1078
//spec_const bool emissiveTexHasSwappedViews 1079
//spec_const bool intensityTextureHasSwappedViews 1080
//spec_const bool materialParamsTexHasSwappedViews 1081
//spec_const bool normalTexHasSwappedViews 1082
//spec_const bool opacityTexHasSwappedViews 1083
//spec_const bool reflectionModulationTexHasSwappedViews 1084
//spec_const bool reflectionTexHasSwappedViews 1085
//spec_const bool rimColorTexHasSwappedViews 1086
//spec_const bool sc_BlendMode_AddWithAlphaFactor 1087
//spec_const bool sc_BlendMode_Add 1088
//spec_const bool sc_BlendMode_AlphaTest 1089
//spec_const bool sc_BlendMode_AlphaToCoverage 1090
//spec_const bool sc_BlendMode_ColoredGlass 1091
//spec_const bool sc_BlendMode_Custom 1092
//spec_const bool sc_BlendMode_Max 1093
//spec_const bool sc_BlendMode_Min 1094
//spec_const bool sc_BlendMode_MultiplyOriginal 1095
//spec_const bool sc_BlendMode_Multiply 1096
//spec_const bool sc_BlendMode_Normal 1097
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 1098
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 1099
//spec_const bool sc_BlendMode_PremultipliedAlpha 1100
//spec_const bool sc_BlendMode_Screen 1101
//spec_const bool sc_DepthOnly 1102
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 1103
//spec_const bool sc_EnvmapSpecularHasSwappedViews 1104
//spec_const bool sc_FramebufferFetch 1105
//spec_const bool sc_HasDiffuseEnvmap 1106
//spec_const bool sc_LightEstimation 1107
//spec_const bool sc_OITCompositingPass 1108
//spec_const bool sc_OITDepthBoundsPass 1109
//spec_const bool sc_OITDepthGatherPass 1110
//spec_const bool sc_ProjectiveShadowsCaster 1111
//spec_const bool sc_ProjectiveShadowsReceiver 1112
//spec_const bool sc_RenderAlphaToColor 1113
//spec_const bool sc_SSAOEnabled 1114
//spec_const bool sc_ScreenTextureHasSwappedViews 1115
//spec_const bool sc_ShaderComplexityAnalyzer 1116
//spec_const bool sc_UseFramebufferFetchMarker 1117
//spec_const bool sc_VertexBlendingUseNormals 1118
//spec_const bool sc_VertexBlending 1119
//spec_const bool uv2EnableAnimation 1120
//spec_const bool uv3EnableAnimation 1121
//spec_const int NODE_13_DROPLIST_ITEM 1122
//spec_const int NODE_181_DROPLIST_ITEM 1123
//spec_const int NODE_184_DROPLIST_ITEM 1124
//spec_const int NODE_221_DROPLIST_ITEM 1125
//spec_const int NODE_228_DROPLIST_ITEM 1126
//spec_const int NODE_27_DROPLIST_ITEM 1127
//spec_const int NODE_315_DROPLIST_ITEM 1128
//spec_const int NODE_38_DROPLIST_ITEM 1129
//spec_const int NODE_49_DROPLIST_ITEM 1130
//spec_const int NODE_69_DROPLIST_ITEM 1131
//spec_const int NODE_76_DROPLIST_ITEM 1132
//spec_const int SC_DEVICE_CLASS 1133
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 1134
//spec_const int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex 1135
//spec_const int SC_SOFTWARE_WRAP_MODE_U_emissiveTex 1136
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 1137
//spec_const int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex 1138
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 1139
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 1140
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex 1141
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionTex 1142
//spec_const int SC_SOFTWARE_WRAP_MODE_U_rimColorTex 1143
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 1144
//spec_const int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex 1145
//spec_const int SC_SOFTWARE_WRAP_MODE_V_emissiveTex 1146
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 1147
//spec_const int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex 1148
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 1149
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 1150
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex 1151
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionTex 1152
//spec_const int SC_SOFTWARE_WRAP_MODE_V_rimColorTex 1153
//spec_const int baseTexLayout 1154
//spec_const int detailNormalTexLayout 1155
//spec_const int emissiveTexLayout 1156
//spec_const int intensityTextureLayout 1157
//spec_const int materialParamsTexLayout 1158
//spec_const int normalTexLayout 1159
//spec_const int opacityTexLayout 1160
//spec_const int reflectionModulationTexLayout 1161
//spec_const int reflectionTexLayout 1162
//spec_const int rimColorTexLayout 1163
//spec_const int sc_AmbientLightMode0 1164
//spec_const int sc_AmbientLightMode1 1165
//spec_const int sc_AmbientLightMode2 1166
//spec_const int sc_AmbientLightMode_Constant 1167
//spec_const int sc_AmbientLightMode_EnvironmentMap 1168
//spec_const int sc_AmbientLightMode_FromCamera 1169
//spec_const int sc_AmbientLightMode_SphericalHarmonics 1170
//spec_const int sc_AmbientLightsCount 1171
//spec_const int sc_DepthBufferMode 1172
//spec_const int sc_DirectionalLightsCount 1173
//spec_const int sc_EnvLightMode 1174
//spec_const int sc_EnvmapDiffuseLayout 1175
//spec_const int sc_EnvmapSpecularLayout 1176
//spec_const int sc_LightEstimationSGCount 1177
//spec_const int sc_MaxTextureImageUnits 1178
//spec_const int sc_PointLightsCount 1179
//spec_const int sc_RenderingSpace 1180
//spec_const int sc_ScreenTextureLayout 1181
//spec_const int sc_SkinBonesCount 1182
//spec_const int sc_StereoRenderingMode 1183
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 1184
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
constant bool ENABLE_EMISSIVE [[function_constant(1032)]];
constant bool ENABLE_EMISSIVE_tmp = is_function_constant_defined(ENABLE_EMISSIVE) ? ENABLE_EMISSIVE : false;
constant bool ENABLE_NORMALMAP [[function_constant(1033)]];
constant bool ENABLE_NORMALMAP_tmp = is_function_constant_defined(ENABLE_NORMALMAP) ? ENABLE_NORMALMAP : false;
constant bool ENABLE_OPACITY_TEX [[function_constant(1034)]];
constant bool ENABLE_OPACITY_TEX_tmp = is_function_constant_defined(ENABLE_OPACITY_TEX) ? ENABLE_OPACITY_TEX : false;
constant bool ENABLE_RECOLOR [[function_constant(1035)]];
constant bool ENABLE_RECOLOR_tmp = is_function_constant_defined(ENABLE_RECOLOR) ? ENABLE_RECOLOR : false;
constant bool ENABLE_RIM_HIGHLIGHT [[function_constant(1036)]];
constant bool ENABLE_RIM_HIGHLIGHT_tmp = is_function_constant_defined(ENABLE_RIM_HIGHLIGHT) ? ENABLE_RIM_HIGHLIGHT : false;
constant bool ENABLE_RIM_INVERT [[function_constant(1037)]];
constant bool ENABLE_RIM_INVERT_tmp = is_function_constant_defined(ENABLE_RIM_INVERT) ? ENABLE_RIM_INVERT : false;
constant bool ENABLE_SIMPLE_REFLECTION [[function_constant(1038)]];
constant bool ENABLE_SIMPLE_REFLECTION_tmp = is_function_constant_defined(ENABLE_SIMPLE_REFLECTION) ? ENABLE_SIMPLE_REFLECTION : false;
constant bool ENABLE_SPECULAR_AO [[function_constant(1039)]];
constant bool ENABLE_SPECULAR_AO_tmp = is_function_constant_defined(ENABLE_SPECULAR_AO) ? ENABLE_SPECULAR_AO : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(1040)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool ENABLE_UV2 [[function_constant(1041)]];
constant bool ENABLE_UV2_tmp = is_function_constant_defined(ENABLE_UV2) ? ENABLE_UV2 : false;
constant bool ENABLE_UV3 [[function_constant(1042)]];
constant bool ENABLE_UV3_tmp = is_function_constant_defined(ENABLE_UV3) ? ENABLE_UV3 : false;
constant bool SC_GL_FRAGMENT_PRECISION_HIGH [[function_constant(1043)]];
constant bool SC_GL_FRAGMENT_PRECISION_HIGH_tmp = is_function_constant_defined(SC_GL_FRAGMENT_PRECISION_HIGH) ? SC_GL_FRAGMENT_PRECISION_HIGH : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(1044)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex [[function_constant(1045)]];
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_detailNormalTex) ? SC_USE_CLAMP_TO_BORDER_detailNormalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTex [[function_constant(1046)]];
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_emissiveTex) ? SC_USE_CLAMP_TO_BORDER_emissiveTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(1047)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex [[function_constant(1048)]];
constant bool SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_materialParamsTex) ? SC_USE_CLAMP_TO_BORDER_materialParamsTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTex [[function_constant(1049)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTex) ? SC_USE_CLAMP_TO_BORDER_normalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex [[function_constant(1050)]];
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_opacityTex) ? SC_USE_CLAMP_TO_BORDER_opacityTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex [[function_constant(1051)]];
constant bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex) ? SC_USE_CLAMP_TO_BORDER_reflectionModulationTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_reflectionTex [[function_constant(1052)]];
constant bool SC_USE_CLAMP_TO_BORDER_reflectionTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_reflectionTex) ? SC_USE_CLAMP_TO_BORDER_reflectionTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_rimColorTex [[function_constant(1053)]];
constant bool SC_USE_CLAMP_TO_BORDER_rimColorTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_rimColorTex) ? SC_USE_CLAMP_TO_BORDER_rimColorTex : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(1054)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_detailNormalTex [[function_constant(1055)]];
constant bool SC_USE_UV_MIN_MAX_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_detailNormalTex) ? SC_USE_UV_MIN_MAX_detailNormalTex : false;
constant bool SC_USE_UV_MIN_MAX_emissiveTex [[function_constant(1056)]];
constant bool SC_USE_UV_MIN_MAX_emissiveTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_emissiveTex) ? SC_USE_UV_MIN_MAX_emissiveTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(1057)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_materialParamsTex [[function_constant(1058)]];
constant bool SC_USE_UV_MIN_MAX_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_materialParamsTex) ? SC_USE_UV_MIN_MAX_materialParamsTex : false;
constant bool SC_USE_UV_MIN_MAX_normalTex [[function_constant(1059)]];
constant bool SC_USE_UV_MIN_MAX_normalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTex) ? SC_USE_UV_MIN_MAX_normalTex : false;
constant bool SC_USE_UV_MIN_MAX_opacityTex [[function_constant(1060)]];
constant bool SC_USE_UV_MIN_MAX_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_opacityTex) ? SC_USE_UV_MIN_MAX_opacityTex : false;
constant bool SC_USE_UV_MIN_MAX_reflectionModulationTex [[function_constant(1061)]];
constant bool SC_USE_UV_MIN_MAX_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_reflectionModulationTex) ? SC_USE_UV_MIN_MAX_reflectionModulationTex : false;
constant bool SC_USE_UV_MIN_MAX_reflectionTex [[function_constant(1062)]];
constant bool SC_USE_UV_MIN_MAX_reflectionTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_reflectionTex) ? SC_USE_UV_MIN_MAX_reflectionTex : false;
constant bool SC_USE_UV_MIN_MAX_rimColorTex [[function_constant(1063)]];
constant bool SC_USE_UV_MIN_MAX_rimColorTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_rimColorTex) ? SC_USE_UV_MIN_MAX_rimColorTex : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(1064)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_detailNormalTex [[function_constant(1065)]];
constant bool SC_USE_UV_TRANSFORM_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_detailNormalTex) ? SC_USE_UV_TRANSFORM_detailNormalTex : false;
constant bool SC_USE_UV_TRANSFORM_emissiveTex [[function_constant(1066)]];
constant bool SC_USE_UV_TRANSFORM_emissiveTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_emissiveTex) ? SC_USE_UV_TRANSFORM_emissiveTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(1067)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_materialParamsTex [[function_constant(1068)]];
constant bool SC_USE_UV_TRANSFORM_materialParamsTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_materialParamsTex) ? SC_USE_UV_TRANSFORM_materialParamsTex : false;
constant bool SC_USE_UV_TRANSFORM_normalTex [[function_constant(1069)]];
constant bool SC_USE_UV_TRANSFORM_normalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTex) ? SC_USE_UV_TRANSFORM_normalTex : false;
constant bool SC_USE_UV_TRANSFORM_opacityTex [[function_constant(1070)]];
constant bool SC_USE_UV_TRANSFORM_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_opacityTex) ? SC_USE_UV_TRANSFORM_opacityTex : false;
constant bool SC_USE_UV_TRANSFORM_reflectionModulationTex [[function_constant(1071)]];
constant bool SC_USE_UV_TRANSFORM_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_reflectionModulationTex) ? SC_USE_UV_TRANSFORM_reflectionModulationTex : false;
constant bool SC_USE_UV_TRANSFORM_reflectionTex [[function_constant(1072)]];
constant bool SC_USE_UV_TRANSFORM_reflectionTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_reflectionTex) ? SC_USE_UV_TRANSFORM_reflectionTex : false;
constant bool SC_USE_UV_TRANSFORM_rimColorTex [[function_constant(1073)]];
constant bool SC_USE_UV_TRANSFORM_rimColorTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_rimColorTex) ? SC_USE_UV_TRANSFORM_rimColorTex : false;
constant bool Tweak_N177 [[function_constant(1074)]];
constant bool Tweak_N177_tmp = is_function_constant_defined(Tweak_N177) ? Tweak_N177 : false;
constant bool Tweak_N216 [[function_constant(1075)]];
constant bool Tweak_N216_tmp = is_function_constant_defined(Tweak_N216) ? Tweak_N216 : false;
constant bool UseViewSpaceDepthVariant [[function_constant(1076)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(1077)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool detailNormalTexHasSwappedViews [[function_constant(1078)]];
constant bool detailNormalTexHasSwappedViews_tmp = is_function_constant_defined(detailNormalTexHasSwappedViews) ? detailNormalTexHasSwappedViews : false;
constant bool emissiveTexHasSwappedViews [[function_constant(1079)]];
constant bool emissiveTexHasSwappedViews_tmp = is_function_constant_defined(emissiveTexHasSwappedViews) ? emissiveTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(1080)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool materialParamsTexHasSwappedViews [[function_constant(1081)]];
constant bool materialParamsTexHasSwappedViews_tmp = is_function_constant_defined(materialParamsTexHasSwappedViews) ? materialParamsTexHasSwappedViews : false;
constant bool normalTexHasSwappedViews [[function_constant(1082)]];
constant bool normalTexHasSwappedViews_tmp = is_function_constant_defined(normalTexHasSwappedViews) ? normalTexHasSwappedViews : false;
constant bool opacityTexHasSwappedViews [[function_constant(1083)]];
constant bool opacityTexHasSwappedViews_tmp = is_function_constant_defined(opacityTexHasSwappedViews) ? opacityTexHasSwappedViews : false;
constant bool reflectionModulationTexHasSwappedViews [[function_constant(1084)]];
constant bool reflectionModulationTexHasSwappedViews_tmp = is_function_constant_defined(reflectionModulationTexHasSwappedViews) ? reflectionModulationTexHasSwappedViews : false;
constant bool reflectionTexHasSwappedViews [[function_constant(1085)]];
constant bool reflectionTexHasSwappedViews_tmp = is_function_constant_defined(reflectionTexHasSwappedViews) ? reflectionTexHasSwappedViews : false;
constant bool rimColorTexHasSwappedViews [[function_constant(1086)]];
constant bool rimColorTexHasSwappedViews_tmp = is_function_constant_defined(rimColorTexHasSwappedViews) ? rimColorTexHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(1087)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(1088)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(1089)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(1090)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(1091)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(1092)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(1093)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(1094)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(1095)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(1096)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(1097)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(1098)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(1099)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(1100)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(1101)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(1102)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(1103)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(1104)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(1105)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(1106)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(1107)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_OITCompositingPass [[function_constant(1108)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(1109)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(1110)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(1111)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(1112)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(1113)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(1114)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(1115)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(1116)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(1117)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(1118)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(1119)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool uv2EnableAnimation [[function_constant(1120)]];
constant bool uv2EnableAnimation_tmp = is_function_constant_defined(uv2EnableAnimation) ? uv2EnableAnimation : false;
constant bool uv3EnableAnimation [[function_constant(1121)]];
constant bool uv3EnableAnimation_tmp = is_function_constant_defined(uv3EnableAnimation) ? uv3EnableAnimation : false;
constant int NODE_13_DROPLIST_ITEM [[function_constant(1122)]];
constant int NODE_13_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_13_DROPLIST_ITEM) ? NODE_13_DROPLIST_ITEM : 0;
constant int NODE_181_DROPLIST_ITEM [[function_constant(1123)]];
constant int NODE_181_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_181_DROPLIST_ITEM) ? NODE_181_DROPLIST_ITEM : 0;
constant int NODE_184_DROPLIST_ITEM [[function_constant(1124)]];
constant int NODE_184_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_184_DROPLIST_ITEM) ? NODE_184_DROPLIST_ITEM : 0;
constant int NODE_221_DROPLIST_ITEM [[function_constant(1125)]];
constant int NODE_221_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_221_DROPLIST_ITEM) ? NODE_221_DROPLIST_ITEM : 0;
constant int NODE_228_DROPLIST_ITEM [[function_constant(1126)]];
constant int NODE_228_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_228_DROPLIST_ITEM) ? NODE_228_DROPLIST_ITEM : 0;
constant int NODE_27_DROPLIST_ITEM [[function_constant(1127)]];
constant int NODE_27_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_27_DROPLIST_ITEM) ? NODE_27_DROPLIST_ITEM : 0;
constant int NODE_315_DROPLIST_ITEM [[function_constant(1128)]];
constant int NODE_315_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_315_DROPLIST_ITEM) ? NODE_315_DROPLIST_ITEM : 0;
constant int NODE_38_DROPLIST_ITEM [[function_constant(1129)]];
constant int NODE_38_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_38_DROPLIST_ITEM) ? NODE_38_DROPLIST_ITEM : 0;
constant int NODE_49_DROPLIST_ITEM [[function_constant(1130)]];
constant int NODE_49_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_49_DROPLIST_ITEM) ? NODE_49_DROPLIST_ITEM : 0;
constant int NODE_69_DROPLIST_ITEM [[function_constant(1131)]];
constant int NODE_69_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_69_DROPLIST_ITEM) ? NODE_69_DROPLIST_ITEM : 0;
constant int NODE_76_DROPLIST_ITEM [[function_constant(1132)]];
constant int NODE_76_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_76_DROPLIST_ITEM) ? NODE_76_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(1133)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(1134)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex [[function_constant(1135)]];
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_U_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTex [[function_constant(1136)]];
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_emissiveTex) ? SC_SOFTWARE_WRAP_MODE_U_emissiveTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(1137)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex [[function_constant(1138)]];
constant int SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_U_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(1139)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex [[function_constant(1140)]];
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_opacityTex) ? SC_SOFTWARE_WRAP_MODE_U_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex [[function_constant(1141)]];
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex) ? SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionTex [[function_constant(1142)]];
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_reflectionTex) ? SC_SOFTWARE_WRAP_MODE_U_reflectionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_rimColorTex [[function_constant(1143)]];
constant int SC_SOFTWARE_WRAP_MODE_U_rimColorTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_rimColorTex) ? SC_SOFTWARE_WRAP_MODE_U_rimColorTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(1144)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex [[function_constant(1145)]];
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_V_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTex [[function_constant(1146)]];
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_emissiveTex) ? SC_SOFTWARE_WRAP_MODE_V_emissiveTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(1147)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex [[function_constant(1148)]];
constant int SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_materialParamsTex) ? SC_SOFTWARE_WRAP_MODE_V_materialParamsTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(1149)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex [[function_constant(1150)]];
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_opacityTex) ? SC_SOFTWARE_WRAP_MODE_V_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex [[function_constant(1151)]];
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex) ? SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionTex [[function_constant(1152)]];
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_reflectionTex) ? SC_SOFTWARE_WRAP_MODE_V_reflectionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_rimColorTex [[function_constant(1153)]];
constant int SC_SOFTWARE_WRAP_MODE_V_rimColorTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_rimColorTex) ? SC_SOFTWARE_WRAP_MODE_V_rimColorTex : -1;
constant int baseTexLayout [[function_constant(1154)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int detailNormalTexLayout [[function_constant(1155)]];
constant int detailNormalTexLayout_tmp = is_function_constant_defined(detailNormalTexLayout) ? detailNormalTexLayout : 0;
constant int emissiveTexLayout [[function_constant(1156)]];
constant int emissiveTexLayout_tmp = is_function_constant_defined(emissiveTexLayout) ? emissiveTexLayout : 0;
constant int intensityTextureLayout [[function_constant(1157)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int materialParamsTexLayout [[function_constant(1158)]];
constant int materialParamsTexLayout_tmp = is_function_constant_defined(materialParamsTexLayout) ? materialParamsTexLayout : 0;
constant int normalTexLayout [[function_constant(1159)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int opacityTexLayout [[function_constant(1160)]];
constant int opacityTexLayout_tmp = is_function_constant_defined(opacityTexLayout) ? opacityTexLayout : 0;
constant int reflectionModulationTexLayout [[function_constant(1161)]];
constant int reflectionModulationTexLayout_tmp = is_function_constant_defined(reflectionModulationTexLayout) ? reflectionModulationTexLayout : 0;
constant int reflectionTexLayout [[function_constant(1162)]];
constant int reflectionTexLayout_tmp = is_function_constant_defined(reflectionTexLayout) ? reflectionTexLayout : 0;
constant int rimColorTexLayout [[function_constant(1163)]];
constant int rimColorTexLayout_tmp = is_function_constant_defined(rimColorTexLayout) ? rimColorTexLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(1164)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(1165)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(1166)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(1167)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(1168)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(1169)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(1170)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(1171)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(1172)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(1173)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(1174)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(1175)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(1176)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(1177)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(1178)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(1179)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RenderingSpace [[function_constant(1180)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(1181)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_SkinBonesCount [[function_constant(1182)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(1183)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(1184)]];
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
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float3 recolorRed;
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
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float reflectionIntensity;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float rimExponent;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float metallic;
float roughness;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float specularAoIntensity;
float specularAoDarkening;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
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
float2 N7_TransformedUV2;
float2 N7_TransformedUV3;
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
texture2d<float> emissiveTex [[id(3)]];
texture2d<float> intensityTexture [[id(4)]];
texture2d<float> materialParamsTex [[id(5)]];
texture2d<float> normalTex [[id(6)]];
texture2d<float> opacityTex [[id(7)]];
texture2d<float> reflectionModulationTex [[id(8)]];
texture2d<float> reflectionTex [[id(9)]];
texture2d<float> rimColorTex [[id(10)]];
texture2d<float> sc_EnvmapDiffuse [[id(11)]];
texture2d<float> sc_EnvmapSpecular [[id(12)]];
texture2d<float> sc_SSAOTexture [[id(21)]];
texture2d<float> sc_ScreenTexture [[id(22)]];
texture2d<float> sc_ShadowTexture [[id(23)]];
sampler baseTexSmpSC [[id(25)]];
sampler detailNormalTexSmpSC [[id(26)]];
sampler emissiveTexSmpSC [[id(27)]];
sampler intensityTextureSmpSC [[id(28)]];
sampler materialParamsTexSmpSC [[id(29)]];
sampler normalTexSmpSC [[id(30)]];
sampler opacityTexSmpSC [[id(31)]];
sampler reflectionModulationTexSmpSC [[id(32)]];
sampler reflectionTexSmpSC [[id(33)]];
sampler rimColorTexSmpSC [[id(34)]];
sampler sc_EnvmapDiffuseSmpSC [[id(35)]];
sampler sc_EnvmapSpecularSmpSC [[id(36)]];
sampler sc_SSAOTextureSmpSC [[id(38)]];
sampler sc_ScreenTextureSmpSC [[id(39)]];
sampler sc_ShadowTextureSmpSC [[id(40)]];
constant userUniformsObj* UserUniforms [[id(42)]];
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
float2 N7_TransformedUV2;
float2 N7_TransformedUV3;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexNormal_WorldSpace;
float3 VertexTangent_WorldSpace;
float3 VertexBinormal_WorldSpace;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float4 VertexColor;
float2 gScreenCoord;
float3 SurfacePosition_WorldSpace;
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
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float3 recolorRed;
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
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float reflectionIntensity;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float rimExponent;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float metallic;
float roughness;
float4 materialParamsTexSize;
float4 materialParamsTexDims;
float4 materialParamsTexView;
float3x3 materialParamsTexTransform;
float4 materialParamsTexUvMinMax;
float4 materialParamsTexBorderColor;
float specularAoIntensity;
float specularAoDarkening;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
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
texture2d<float> emissiveTex [[id(3)]];
texture2d<float> intensityTexture [[id(4)]];
texture2d<float> materialParamsTex [[id(5)]];
texture2d<float> normalTex [[id(6)]];
texture2d<float> opacityTex [[id(7)]];
texture2d<float> reflectionModulationTex [[id(8)]];
texture2d<float> reflectionTex [[id(9)]];
texture2d<float> rimColorTex [[id(10)]];
texture2d<float> sc_EnvmapDiffuse [[id(11)]];
texture2d<float> sc_EnvmapSpecular [[id(12)]];
texture2d<float> sc_SSAOTexture [[id(21)]];
texture2d<float> sc_ScreenTexture [[id(22)]];
texture2d<float> sc_ShadowTexture [[id(23)]];
sampler baseTexSmpSC [[id(25)]];
sampler detailNormalTexSmpSC [[id(26)]];
sampler emissiveTexSmpSC [[id(27)]];
sampler intensityTextureSmpSC [[id(28)]];
sampler materialParamsTexSmpSC [[id(29)]];
sampler normalTexSmpSC [[id(30)]];
sampler opacityTexSmpSC [[id(31)]];
sampler reflectionModulationTexSmpSC [[id(32)]];
sampler reflectionTexSmpSC [[id(33)]];
sampler rimColorTexSmpSC [[id(34)]];
sampler sc_EnvmapDiffuseSmpSC [[id(35)]];
sampler sc_EnvmapSpecularSmpSC [[id(36)]];
sampler sc_SSAOTextureSmpSC [[id(38)]];
sampler sc_ScreenTextureSmpSC [[id(39)]];
sampler sc_ShadowTextureSmpSC [[id(40)]];
constant userUniformsObj* UserUniforms [[id(42)]];
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
float3 getSpecularDominantDir(thread const float3& N,thread const float3& R,thread const float& roughness)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float lerpFactor=(roughness*roughness)*roughness;
return normalize(mix(R,N,float3(lerpFactor)));
}
else
{
return R;
}
}
float3 envBRDFApprox(thread const SurfaceProperties& surfaceProperties,thread const float& NdotV)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float4 r=(float4(-1.0,-0.0275,-0.572,0.022)*surfaceProperties.roughness)+float4(1.0,0.0425,1.04,-0.04);
float a004=(fast::min(r.x*r.x,exp2((-9.28)*NdotV))*r.x)+r.y;
float2 AB=(float2(-1.04,1.04)*a004)+r.zw;
return fast::max((surfaceProperties.specColor*AB.x)+float3(AB.y),float3(0.0));
}
else
{
float3 fresnelMax=fast::max(float3(1.0-surfaceProperties.roughness),surfaceProperties.specColor);
float param=NdotV;
float3 param_1=surfaceProperties.specColor;
float3 param_2=fresnelMax;
float l9_0=1.0-param;
float l9_1=l9_0*l9_0;
float l9_2=(l9_1*l9_1)*l9_0;
float3 l9_3=param_1+((param_2-param_1)*l9_2);
return l9_3;
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
ssGlobals tempGlobals;
bool N7_EnableUV2;
int N7_UV2Switch;
float2 N7_UV2Scale;
float2 N7_UV2Offset;
bool N7_UV2Animation;
int N7_UV3Switch;
float2 N7_UV3Scale;
float2 N7_UV3Offset;
bool N7_UV3Animation;
bool N7_EnableUV3;
float N7_Opacity;
float4 N7_Albedo;
float4 N7_BaseColorValue;
bool N7_EnableBaseTexture;
int N7_BaseTextureUVSwitch;
bool N7_EnableRecolor;
float3 N7_RecolorR;
float3 N7_RecolorG;
float3 N7_RecolorB;
bool N7_EnableOpacityTexture;
int N7_OpacityUVSwitch;
int N7_VertexColorSwitch;
bool N7_EnableNormalTexture;
int N7_NormalUVSwitch;
float3 N7_Normal;
bool N7_EnableDetailNormal;
int N7_Detail_NormalUVSwitch;
float3 N7_Emissive;
bool N7_EnableEmissiveTexture;
int N7_EmissiveUVSwitch;
float3 N7_EmissiveColor;
float N7_EmissiveIntensity;
bool N7_EnableSimpleReflection;
bool N7_EnableModulationTexture;
int N7_ModuationUVSwitch;
float N7_ReflectionIntensity;
bool N7_EnableRimHighlight;
float3 N7_RimColor;
float N7_RimIntensity;
bool N7_EnableRimColorTexture;
int N7_RimUVSwitch;
bool N7_EnableRimInvert;
float N7_RimExponent;
int N7_MaterialParamsUVSwitch;
float N7_Metallic;
float N7_MetallicValue;
float N7_Roughness;
float N7_RoughnessValue;
float3 N7_AO;
bool N7_EnableSpecularAO;
float3 N7_SpecularAO;
float N7_Darkening;
float N7_Intensity;
ssPreviewInfo PreviewInfo;
float Dummy1;
float2 Dummy2;
float3 Dummy3;
float4 Dummy4;
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
float4 FinalColor=float4(0.0,0.99144,1.0,1.0);
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
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
Globals.VertexColor=in.varColor;
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
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set2.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float Output_N38=0.0;
Output_N38=float(NODE_38_DROPLIST_ITEM_tmp);
float4 Output_N5=float4(0.0);
ssGlobals param_1=Globals;
float4 param=(*sc_set2.UserUniforms).baseColor;
Output_N5=param;
float Output_N121=0.0;
ssGlobals param_3=Globals;
float param_2;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
param_2=1.001;
}
else
{
param_2=0.001;
}
param_2-=0.001;
Output_N121=param_2;
float Output_N27=0.0;
Output_N27=float(NODE_27_DROPLIST_ITEM_tmp);
float Output_N37=0.0;
ssGlobals param_5=Globals;
float param_4;
if ((int(ENABLE_RECOLOR_tmp)!=0))
{
param_4=1.001;
}
else
{
param_4=0.001;
}
param_4-=0.001;
Output_N37=param_4;
float3 Output_N85=float3(0.0);
ssGlobals param_7=Globals;
float3 param_6=(*sc_set2.UserUniforms).recolorRed;
Output_N85=param_6;
float3 Output_N86=float3(0.0);
ssGlobals param_9=Globals;
float3 param_8=(*sc_set2.UserUniforms).recolorGreen;
Output_N86=param_8;
float3 Output_N87=float3(0.0);
ssGlobals param_11=Globals;
float3 param_10=(*sc_set2.UserUniforms).recolorBlue;
Output_N87=param_10;
float Output_N308=0.0;
ssGlobals param_13=Globals;
float param_12;
if ((int(ENABLE_OPACITY_TEX_tmp)!=0))
{
param_12=1.001;
}
else
{
param_12=0.001;
}
param_12-=0.001;
Output_N308=param_12;
float Output_N69=0.0;
Output_N69=float(NODE_69_DROPLIST_ITEM_tmp);
float Output_N354=0.0;
ssGlobals param_15=Globals;
float param_14;
if ((int(ENABLE_NORMALMAP_tmp)!=0))
{
param_14=1.001;
}
else
{
param_14=0.001;
}
param_14-=0.001;
Output_N354=param_14;
float Output_N181=0.0;
Output_N181=float(NODE_181_DROPLIST_ITEM_tmp);
float Output_N218=0.0;
ssGlobals param_17=Globals;
float param_16;
if ((int(ENABLE_DETAIL_NORMAL_tmp)!=0))
{
param_16=1.001;
}
else
{
param_16=0.001;
}
param_16-=0.001;
Output_N218=param_16;
float Output_N184=0.0;
Output_N184=float(NODE_184_DROPLIST_ITEM_tmp);
float Output_N223=0.0;
ssGlobals param_19=Globals;
float param_18;
if ((int(ENABLE_EMISSIVE_tmp)!=0))
{
param_18=1.001;
}
else
{
param_18=0.001;
}
param_18-=0.001;
Output_N223=param_18;
float Output_N76=0.0;
Output_N76=float(NODE_76_DROPLIST_ITEM_tmp);
float3 Output_N236=float3(0.0);
ssGlobals param_21=Globals;
float3 param_20=(*sc_set2.UserUniforms).emissiveColor;
Output_N236=param_20;
float Output_N233=0.0;
ssGlobals param_23=Globals;
float param_22=(*sc_set2.UserUniforms).emissiveIntensity;
Output_N233=param_22;
float Output_N179=0.0;
ssGlobals param_25=Globals;
float param_24;
if ((int(ENABLE_SIMPLE_REFLECTION_tmp)!=0))
{
param_24=1.001;
}
else
{
param_24=0.001;
}
param_24-=0.001;
Output_N179=param_24;
float Output_N225=0.0;
ssGlobals param_27=Globals;
float param_26=(*sc_set2.UserUniforms).reflectionIntensity;
Output_N225=param_26;
float Output_N177=0.0;
ssGlobals param_29=Globals;
float param_28;
if ((int(Tweak_N177_tmp)!=0))
{
param_28=1.001;
}
else
{
param_28=0.001;
}
param_28-=0.001;
Output_N177=param_28;
float Output_N228=0.0;
Output_N228=float(NODE_228_DROPLIST_ITEM_tmp);
float Output_N74=0.0;
ssGlobals param_31=Globals;
float param_30;
if ((int(ENABLE_RIM_HIGHLIGHT_tmp)!=0))
{
param_30=1.001;
}
else
{
param_30=0.001;
}
param_30-=0.001;
Output_N74=param_30;
float3 Output_N309=float3(0.0);
ssGlobals param_33=Globals;
float3 param_32=(*sc_set2.UserUniforms).rimColor;
Output_N309=param_32;
float Output_N310=0.0;
ssGlobals param_35=Globals;
float param_34=(*sc_set2.UserUniforms).rimIntensity;
Output_N310=param_34;
float Output_N311=0.0;
ssGlobals param_37=Globals;
float param_36=(*sc_set2.UserUniforms).rimExponent;
Output_N311=param_36;
float Output_N216=0.0;
ssGlobals param_39=Globals;
float param_38;
if ((int(Tweak_N216_tmp)!=0))
{
param_38=1.001;
}
else
{
param_38=0.001;
}
param_38-=0.001;
Output_N216=param_38;
float Output_N312=0.0;
ssGlobals param_41=Globals;
float param_40;
if ((int(ENABLE_RIM_INVERT_tmp)!=0))
{
param_40=1.001;
}
else
{
param_40=0.001;
}
param_40-=0.001;
Output_N312=param_40;
float Output_N315=0.0;
Output_N315=float(NODE_315_DROPLIST_ITEM_tmp);
float Output_N242=0.0;
ssGlobals param_43=Globals;
float param_42=(*sc_set2.UserUniforms).metallic;
Output_N242=param_42;
float Output_N243=0.0;
ssGlobals param_45=Globals;
float param_44=(*sc_set2.UserUniforms).roughness;
Output_N243=param_44;
float Output_N221=0.0;
Output_N221=float(NODE_221_DROPLIST_ITEM_tmp);
float Output_N219=0.0;
ssGlobals param_47=Globals;
float param_46;
if ((int(ENABLE_SPECULAR_AO_tmp)!=0))
{
param_46=1.001;
}
else
{
param_46=0.001;
}
param_46-=0.001;
Output_N219=param_46;
float Output_N244=0.0;
ssGlobals param_49=Globals;
float param_48=(*sc_set2.UserUniforms).specularAoIntensity;
Output_N244=param_48;
float Output_N245=0.0;
ssGlobals param_51=Globals;
float param_50=(*sc_set2.UserUniforms).specularAoDarkening;
Output_N245=param_50;
float Output_N67=0.0;
ssGlobals param_53=Globals;
float param_52;
if ((int(ENABLE_UV2_tmp)!=0))
{
param_52=1.001;
}
else
{
param_52=0.001;
}
param_52-=0.001;
Output_N67=param_52;
float Output_N13=0.0;
Output_N13=float(NODE_13_DROPLIST_ITEM_tmp);
float2 Output_N14=float2(0.0);
ssGlobals param_55=Globals;
float2 param_54=(*sc_set2.UserUniforms).uv2Scale;
Output_N14=param_54;
float2 Output_N15=float2(0.0);
ssGlobals param_57=Globals;
float2 param_56=(*sc_set2.UserUniforms).uv2Offset;
Output_N15=param_56;
float Output_N16=0.0;
ssGlobals param_59=Globals;
float param_58;
if ((int(uv2EnableAnimation_tmp)!=0))
{
param_58=1.001;
}
else
{
param_58=0.001;
}
param_58-=0.001;
Output_N16=param_58;
float Output_N11=0.0;
ssGlobals param_61=Globals;
float param_60;
if ((int(ENABLE_UV3_tmp)!=0))
{
param_60=1.001;
}
else
{
param_60=0.001;
}
param_60-=0.001;
Output_N11=param_60;
float Output_N49=0.0;
Output_N49=float(NODE_49_DROPLIST_ITEM_tmp);
float2 Output_N50=float2(0.0);
ssGlobals param_63=Globals;
float2 param_62=(*sc_set2.UserUniforms).uv3Scale;
Output_N50=param_62;
float2 Output_N51=float2(0.0);
ssGlobals param_65=Globals;
float2 param_64=(*sc_set2.UserUniforms).uv3Offset;
Output_N51=param_64;
float Output_N52=0.0;
ssGlobals param_67=Globals;
float param_66;
if ((int(uv3EnableAnimation_tmp)!=0))
{
param_66=1.001;
}
else
{
param_66=0.001;
}
param_66-=0.001;
Output_N52=param_66;
float4 Albedo_N7=float4(0.0);
float Opacity_N7=0.0;
float3 Normal_N7=float3(0.0);
float3 Emissive_N7=float3(0.0);
float Metallic_N7=0.0;
float Roughness_N7=0.0;
float3 AO_N7=float3(0.0);
float3 SpecularAO_N7=float3(0.0);
float param_68=Output_N38;
float4 param_69=Output_N5;
float param_70=Output_N121;
float param_71=Output_N27;
float param_72=Output_N37;
float3 param_73=Output_N85;
float3 param_74=Output_N86;
float3 param_75=Output_N87;
float param_76=Output_N308;
float param_77=Output_N69;
float param_78=Output_N354;
float param_79=Output_N181;
float param_80=Output_N218;
float param_81=Output_N184;
float param_82=Output_N223;
float param_83=Output_N76;
float3 param_84=Output_N236;
float param_85=Output_N233;
float param_86=Output_N179;
float param_87=Output_N225;
float param_88=Output_N177;
float param_89=Output_N228;
float param_90=Output_N74;
float3 param_91=Output_N309;
float param_92=Output_N310;
float param_93=Output_N311;
float param_94=Output_N216;
float param_95=Output_N312;
float param_96=Output_N315;
float param_97=Output_N242;
float param_98=Output_N243;
float param_99=Output_N221;
float param_100=Output_N219;
float param_101=Output_N244;
float param_102=Output_N245;
float param_103=Output_N67;
float param_104=Output_N13;
float2 param_105=Output_N14;
float2 param_106=Output_N15;
float param_107=Output_N16;
float param_108=Output_N11;
float param_109=Output_N49;
float2 param_110=Output_N50;
float2 param_111=Output_N51;
float param_112=Output_N52;
ssGlobals param_121=Globals;
tempGlobals=param_121;
float4 param_113=float4(0.0);
float param_114=0.0;
float3 param_115=float3(0.0);
float3 param_116=float3(0.0);
float param_117=0.0;
float param_118=0.0;
float3 param_119=float3(0.0);
float3 param_120=float3(0.0);
N7_VertexColorSwitch=NODE_38_DROPLIST_ITEM_tmp;
N7_BaseColorValue=param_69;
N7_EnableBaseTexture=(int(ENABLE_BASE_TEX_tmp)!=0);
N7_BaseTextureUVSwitch=NODE_27_DROPLIST_ITEM_tmp;
N7_EnableRecolor=(int(ENABLE_RECOLOR_tmp)!=0);
N7_RecolorR=param_73;
N7_RecolorG=param_74;
N7_RecolorB=param_75;
N7_EnableOpacityTexture=(int(ENABLE_OPACITY_TEX_tmp)!=0);
N7_OpacityUVSwitch=NODE_69_DROPLIST_ITEM_tmp;
N7_EnableNormalTexture=(int(ENABLE_NORMALMAP_tmp)!=0);
N7_NormalUVSwitch=NODE_181_DROPLIST_ITEM_tmp;
N7_EnableDetailNormal=(int(ENABLE_DETAIL_NORMAL_tmp)!=0);
N7_Detail_NormalUVSwitch=NODE_184_DROPLIST_ITEM_tmp;
N7_EnableEmissiveTexture=(int(ENABLE_EMISSIVE_tmp)!=0);
N7_EmissiveUVSwitch=NODE_76_DROPLIST_ITEM_tmp;
N7_EmissiveColor=param_84;
N7_EmissiveIntensity=param_85;
N7_EnableSimpleReflection=(int(ENABLE_SIMPLE_REFLECTION_tmp)!=0);
N7_ReflectionIntensity=param_87;
N7_EnableModulationTexture=(int(Tweak_N177_tmp)!=0);
N7_ModuationUVSwitch=NODE_228_DROPLIST_ITEM_tmp;
N7_EnableRimHighlight=(int(ENABLE_RIM_HIGHLIGHT_tmp)!=0);
N7_RimColor=param_91;
N7_RimIntensity=param_92;
N7_RimExponent=param_93;
N7_EnableRimColorTexture=(int(Tweak_N216_tmp)!=0);
N7_EnableRimInvert=(int(ENABLE_RIM_INVERT_tmp)!=0);
N7_RimUVSwitch=NODE_315_DROPLIST_ITEM_tmp;
N7_MetallicValue=param_97;
N7_RoughnessValue=param_98;
N7_MaterialParamsUVSwitch=NODE_221_DROPLIST_ITEM_tmp;
N7_EnableSpecularAO=(int(ENABLE_SPECULAR_AO_tmp)!=0);
N7_Intensity=param_101;
N7_Darkening=param_102;
N7_EnableUV2=(int(ENABLE_UV2_tmp)!=0);
N7_UV2Switch=NODE_13_DROPLIST_ITEM_tmp;
N7_UV2Scale=param_105;
N7_UV2Offset=param_106;
N7_UV2Animation=(int(uv2EnableAnimation_tmp)!=0);
N7_EnableUV3=(int(ENABLE_UV3_tmp)!=0);
N7_UV3Switch=NODE_49_DROPLIST_ITEM_tmp;
N7_UV3Scale=param_110;
N7_UV3Offset=param_111;
N7_UV3Animation=(int(uv3EnableAnimation_tmp)!=0);
int l9_18=N7_UV2Switch;
float2 l9_19=N7_UV2Scale;
float2 l9_20=N7_UV2Offset;
bool l9_21=N7_UV2Animation;
bool l9_22=N7_EnableUV2;
float2 l9_23=tempGlobals.Surface_UVCoord0;
float2 l9_24=l9_23;
if (l9_22==N7_EnableUV2)
{
if (l9_18==0)
{
float2 l9_25=tempGlobals.Surface_UVCoord0;
l9_24=l9_25;
}
if (l9_18==1)
{
float2 l9_26=tempGlobals.Surface_UVCoord1;
l9_24=l9_26;
}
if (l9_18==2)
{
float2 l9_27=tempGlobals.gScreenCoord;
l9_24=l9_27;
}
}
else
{
if (l9_18==0)
{
float2 l9_28=tempGlobals.Surface_UVCoord0;
l9_24=l9_28;
}
if (l9_18==1)
{
float2 l9_29=tempGlobals.Surface_UVCoord1;
l9_24=l9_29;
}
if (l9_18==2)
{
float2 l9_30=tempGlobals.gScreenCoord;
l9_24=l9_30;
}
if (l9_18==3)
{
l9_24=tempGlobals.N7_TransformedUV2;
}
}
l9_24=(l9_24*l9_19)+l9_20;
if (l9_21)
{
float l9_31=tempGlobals.gTimeElapsed;
l9_24+=(l9_20*l9_31);
}
float2 l9_32=l9_24;
tempGlobals.N7_TransformedUV2=l9_32;
int l9_33=N7_UV3Switch;
float2 l9_34=N7_UV3Scale;
float2 l9_35=N7_UV3Offset;
bool l9_36=N7_UV3Animation;
bool l9_37=N7_EnableUV3;
float2 l9_38=tempGlobals.Surface_UVCoord0;
float2 l9_39=l9_38;
if (l9_37==N7_EnableUV2)
{
if (l9_33==0)
{
float2 l9_40=tempGlobals.Surface_UVCoord0;
l9_39=l9_40;
}
if (l9_33==1)
{
float2 l9_41=tempGlobals.Surface_UVCoord1;
l9_39=l9_41;
}
if (l9_33==2)
{
float2 l9_42=tempGlobals.gScreenCoord;
l9_39=l9_42;
}
}
else
{
if (l9_33==0)
{
float2 l9_43=tempGlobals.Surface_UVCoord0;
l9_39=l9_43;
}
if (l9_33==1)
{
float2 l9_44=tempGlobals.Surface_UVCoord1;
l9_39=l9_44;
}
if (l9_33==2)
{
float2 l9_45=tempGlobals.gScreenCoord;
l9_39=l9_45;
}
if (l9_33==3)
{
l9_39=tempGlobals.N7_TransformedUV2;
}
}
l9_39=(l9_39*l9_34)+l9_35;
if (l9_36)
{
float l9_46=tempGlobals.gTimeElapsed;
l9_39+=(l9_35*l9_46);
}
float2 l9_47=l9_39;
tempGlobals.N7_TransformedUV3=l9_47;
float2 l9_48=tempGlobals.Surface_UVCoord0;
float2 l9_49=l9_48;
float2 l9_50=tempGlobals.Surface_UVCoord0;
float2 l9_51=l9_50;
N7_Opacity=1.0;
N7_Albedo=N7_BaseColorValue;
if (N7_EnableBaseTexture)
{
int l9_52=N7_BaseTextureUVSwitch;
float2 l9_53=tempGlobals.Surface_UVCoord0;
float2 l9_54=l9_53;
if (l9_52==0)
{
float2 l9_55=tempGlobals.Surface_UVCoord0;
l9_54=l9_55;
}
if (l9_52==1)
{
float2 l9_56=tempGlobals.Surface_UVCoord1;
l9_54=l9_56;
}
if (l9_52==2)
{
l9_54=tempGlobals.N7_TransformedUV2;
}
if (l9_52==3)
{
l9_54=tempGlobals.N7_TransformedUV3;
}
float2 l9_57=l9_54;
l9_49=l9_57;
float2 l9_58=l9_49;
float4 l9_59=float4(0.0);
float2 l9_60=(*sc_set2.UserUniforms).baseTexDims.xy;
float2 l9_61=l9_60;
int l9_62;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_63;
if (sc_StereoRenderingMode_tmp==0)
{
l9_63=0;
}
else
{
l9_63=in.varStereoViewID;
}
int l9_64=l9_63;
l9_62=1-l9_64;
}
else
{
int l9_65;
if (sc_StereoRenderingMode_tmp==0)
{
l9_65=0;
}
else
{
l9_65=in.varStereoViewID;
}
int l9_66=l9_65;
l9_62=l9_66;
}
int l9_67=l9_62;
float2 l9_68=l9_61;
int l9_69=baseTexLayout_tmp;
int l9_70=l9_67;
float2 l9_71=l9_58;
bool l9_72=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_73=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_74=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_75=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_76=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_77=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_78=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_79=0.0;
bool l9_80=l9_77&&(!l9_75);
float l9_81=1.0;
float l9_82=l9_71.x;
int l9_83=l9_74.x;
if (l9_83==1)
{
l9_82=fract(l9_82);
}
else
{
if (l9_83==2)
{
float l9_84=fract(l9_82);
float l9_85=l9_82-l9_84;
float l9_86=step(0.25,fract(l9_85*0.5));
l9_82=mix(l9_84,1.0-l9_84,fast::clamp(l9_86,0.0,1.0));
}
}
l9_71.x=l9_82;
float l9_87=l9_71.y;
int l9_88=l9_74.y;
if (l9_88==1)
{
l9_87=fract(l9_87);
}
else
{
if (l9_88==2)
{
float l9_89=fract(l9_87);
float l9_90=l9_87-l9_89;
float l9_91=step(0.25,fract(l9_90*0.5));
l9_87=mix(l9_89,1.0-l9_89,fast::clamp(l9_91,0.0,1.0));
}
}
l9_71.y=l9_87;
if (l9_75)
{
bool l9_92=l9_77;
bool l9_93;
if (l9_92)
{
l9_93=l9_74.x==3;
}
else
{
l9_93=l9_92;
}
float l9_94=l9_71.x;
float l9_95=l9_76.x;
float l9_96=l9_76.z;
bool l9_97=l9_93;
float l9_98=l9_81;
float l9_99=fast::clamp(l9_94,l9_95,l9_96);
float l9_100=step(abs(l9_94-l9_99),1e-05);
l9_98*=(l9_100+((1.0-float(l9_97))*(1.0-l9_100)));
l9_94=l9_99;
l9_71.x=l9_94;
l9_81=l9_98;
bool l9_101=l9_77;
bool l9_102;
if (l9_101)
{
l9_102=l9_74.y==3;
}
else
{
l9_102=l9_101;
}
float l9_103=l9_71.y;
float l9_104=l9_76.y;
float l9_105=l9_76.w;
bool l9_106=l9_102;
float l9_107=l9_81;
float l9_108=fast::clamp(l9_103,l9_104,l9_105);
float l9_109=step(abs(l9_103-l9_108),1e-05);
l9_107*=(l9_109+((1.0-float(l9_106))*(1.0-l9_109)));
l9_103=l9_108;
l9_71.y=l9_103;
l9_81=l9_107;
}
float2 l9_110=l9_71;
bool l9_111=l9_72;
float3x3 l9_112=l9_73;
if (l9_111)
{
l9_110=float2((l9_112*float3(l9_110,1.0)).xy);
}
float2 l9_113=l9_110;
float2 l9_114=l9_113;
float2 l9_115=l9_114;
l9_71=l9_115;
float l9_116=l9_71.x;
int l9_117=l9_74.x;
bool l9_118=l9_80;
float l9_119=l9_81;
if ((l9_117==0)||(l9_117==3))
{
float l9_120=l9_116;
float l9_121=0.0;
float l9_122=1.0;
bool l9_123=l9_118;
float l9_124=l9_119;
float l9_125=fast::clamp(l9_120,l9_121,l9_122);
float l9_126=step(abs(l9_120-l9_125),1e-05);
l9_124*=(l9_126+((1.0-float(l9_123))*(1.0-l9_126)));
l9_120=l9_125;
l9_116=l9_120;
l9_119=l9_124;
}
l9_71.x=l9_116;
l9_81=l9_119;
float l9_127=l9_71.y;
int l9_128=l9_74.y;
bool l9_129=l9_80;
float l9_130=l9_81;
if ((l9_128==0)||(l9_128==3))
{
float l9_131=l9_127;
float l9_132=0.0;
float l9_133=1.0;
bool l9_134=l9_129;
float l9_135=l9_130;
float l9_136=fast::clamp(l9_131,l9_132,l9_133);
float l9_137=step(abs(l9_131-l9_136),1e-05);
l9_135*=(l9_137+((1.0-float(l9_134))*(1.0-l9_137)));
l9_131=l9_136;
l9_127=l9_131;
l9_130=l9_135;
}
l9_71.y=l9_127;
l9_81=l9_130;
float2 l9_138=l9_68;
float2 l9_139=l9_71;
int l9_140=l9_69;
int l9_141=l9_70;
float l9_142=l9_79;
float2 l9_143=l9_139;
int l9_144=l9_140;
int l9_145=l9_141;
float3 l9_146;
if (l9_144==0)
{
l9_146=float3(l9_143,0.0);
}
else
{
if (l9_144==1)
{
l9_146=float3(l9_143.x,(l9_143.y*0.5)+(0.5-(float(l9_145)*0.5)),0.0);
}
else
{
l9_146=float3(l9_143,float(l9_145));
}
}
float3 l9_147=l9_146;
float3 l9_148=l9_147;
float2 l9_149=l9_138;
float2 l9_150=l9_148.xy;
float l9_151=l9_142;
float4 l9_152=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_150,bias(l9_151));
float4 l9_153=l9_152;
float4 l9_154=l9_153;
if (l9_77)
{
l9_154=mix(l9_78,l9_154,float4(l9_81));
}
float4 l9_155=l9_154;
float4 l9_156=l9_155;
l9_59=l9_155;
float4 l9_157=l9_59;
N7_Albedo*=l9_157;
}
if (N7_EnableRecolor)
{
float3 l9_158=((N7_RecolorR*N7_Albedo.x)+(N7_RecolorG*N7_Albedo.y))+(N7_RecolorB*N7_Albedo.z);
N7_Albedo=float4(l9_158.x,l9_158.y,l9_158.z,N7_Albedo.w);
}
if (N7_EnableOpacityTexture)
{
int l9_159=N7_OpacityUVSwitch;
float2 l9_160=tempGlobals.Surface_UVCoord0;
float2 l9_161=l9_160;
if (l9_159==0)
{
float2 l9_162=tempGlobals.Surface_UVCoord0;
l9_161=l9_162;
}
if (l9_159==1)
{
float2 l9_163=tempGlobals.Surface_UVCoord1;
l9_161=l9_163;
}
if (l9_159==2)
{
l9_161=tempGlobals.N7_TransformedUV2;
}
if (l9_159==3)
{
l9_161=tempGlobals.N7_TransformedUV3;
}
float2 l9_164=l9_161;
l9_51=l9_164;
float2 l9_165=l9_51;
float4 l9_166=float4(0.0);
float2 l9_167=(*sc_set2.UserUniforms).opacityTexDims.xy;
float2 l9_168=l9_167;
int l9_169;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_170;
if (sc_StereoRenderingMode_tmp==0)
{
l9_170=0;
}
else
{
l9_170=in.varStereoViewID;
}
int l9_171=l9_170;
l9_169=1-l9_171;
}
else
{
int l9_172;
if (sc_StereoRenderingMode_tmp==0)
{
l9_172=0;
}
else
{
l9_172=in.varStereoViewID;
}
int l9_173=l9_172;
l9_169=l9_173;
}
int l9_174=l9_169;
float2 l9_175=l9_168;
int l9_176=opacityTexLayout_tmp;
int l9_177=l9_174;
float2 l9_178=l9_165;
bool l9_179=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_180=(*sc_set2.UserUniforms).opacityTexTransform;
int2 l9_181=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_182=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_183=(*sc_set2.UserUniforms).opacityTexUvMinMax;
bool l9_184=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_185=(*sc_set2.UserUniforms).opacityTexBorderColor;
float l9_186=0.0;
bool l9_187=l9_184&&(!l9_182);
float l9_188=1.0;
float l9_189=l9_178.x;
int l9_190=l9_181.x;
if (l9_190==1)
{
l9_189=fract(l9_189);
}
else
{
if (l9_190==2)
{
float l9_191=fract(l9_189);
float l9_192=l9_189-l9_191;
float l9_193=step(0.25,fract(l9_192*0.5));
l9_189=mix(l9_191,1.0-l9_191,fast::clamp(l9_193,0.0,1.0));
}
}
l9_178.x=l9_189;
float l9_194=l9_178.y;
int l9_195=l9_181.y;
if (l9_195==1)
{
l9_194=fract(l9_194);
}
else
{
if (l9_195==2)
{
float l9_196=fract(l9_194);
float l9_197=l9_194-l9_196;
float l9_198=step(0.25,fract(l9_197*0.5));
l9_194=mix(l9_196,1.0-l9_196,fast::clamp(l9_198,0.0,1.0));
}
}
l9_178.y=l9_194;
if (l9_182)
{
bool l9_199=l9_184;
bool l9_200;
if (l9_199)
{
l9_200=l9_181.x==3;
}
else
{
l9_200=l9_199;
}
float l9_201=l9_178.x;
float l9_202=l9_183.x;
float l9_203=l9_183.z;
bool l9_204=l9_200;
float l9_205=l9_188;
float l9_206=fast::clamp(l9_201,l9_202,l9_203);
float l9_207=step(abs(l9_201-l9_206),1e-05);
l9_205*=(l9_207+((1.0-float(l9_204))*(1.0-l9_207)));
l9_201=l9_206;
l9_178.x=l9_201;
l9_188=l9_205;
bool l9_208=l9_184;
bool l9_209;
if (l9_208)
{
l9_209=l9_181.y==3;
}
else
{
l9_209=l9_208;
}
float l9_210=l9_178.y;
float l9_211=l9_183.y;
float l9_212=l9_183.w;
bool l9_213=l9_209;
float l9_214=l9_188;
float l9_215=fast::clamp(l9_210,l9_211,l9_212);
float l9_216=step(abs(l9_210-l9_215),1e-05);
l9_214*=(l9_216+((1.0-float(l9_213))*(1.0-l9_216)));
l9_210=l9_215;
l9_178.y=l9_210;
l9_188=l9_214;
}
float2 l9_217=l9_178;
bool l9_218=l9_179;
float3x3 l9_219=l9_180;
if (l9_218)
{
l9_217=float2((l9_219*float3(l9_217,1.0)).xy);
}
float2 l9_220=l9_217;
float2 l9_221=l9_220;
float2 l9_222=l9_221;
l9_178=l9_222;
float l9_223=l9_178.x;
int l9_224=l9_181.x;
bool l9_225=l9_187;
float l9_226=l9_188;
if ((l9_224==0)||(l9_224==3))
{
float l9_227=l9_223;
float l9_228=0.0;
float l9_229=1.0;
bool l9_230=l9_225;
float l9_231=l9_226;
float l9_232=fast::clamp(l9_227,l9_228,l9_229);
float l9_233=step(abs(l9_227-l9_232),1e-05);
l9_231*=(l9_233+((1.0-float(l9_230))*(1.0-l9_233)));
l9_227=l9_232;
l9_223=l9_227;
l9_226=l9_231;
}
l9_178.x=l9_223;
l9_188=l9_226;
float l9_234=l9_178.y;
int l9_235=l9_181.y;
bool l9_236=l9_187;
float l9_237=l9_188;
if ((l9_235==0)||(l9_235==3))
{
float l9_238=l9_234;
float l9_239=0.0;
float l9_240=1.0;
bool l9_241=l9_236;
float l9_242=l9_237;
float l9_243=fast::clamp(l9_238,l9_239,l9_240);
float l9_244=step(abs(l9_238-l9_243),1e-05);
l9_242*=(l9_244+((1.0-float(l9_241))*(1.0-l9_244)));
l9_238=l9_243;
l9_234=l9_238;
l9_237=l9_242;
}
l9_178.y=l9_234;
l9_188=l9_237;
float2 l9_245=l9_175;
float2 l9_246=l9_178;
int l9_247=l9_176;
int l9_248=l9_177;
float l9_249=l9_186;
float2 l9_250=l9_246;
int l9_251=l9_247;
int l9_252=l9_248;
float3 l9_253;
if (l9_251==0)
{
l9_253=float3(l9_250,0.0);
}
else
{
if (l9_251==1)
{
l9_253=float3(l9_250.x,(l9_250.y*0.5)+(0.5-(float(l9_252)*0.5)),0.0);
}
else
{
l9_253=float3(l9_250,float(l9_252));
}
}
float3 l9_254=l9_253;
float3 l9_255=l9_254;
float2 l9_256=l9_245;
float2 l9_257=l9_255.xy;
float l9_258=l9_249;
float4 l9_259=sc_set2.opacityTex.sample(sc_set2.opacityTexSmpSC,l9_257,bias(l9_258));
float4 l9_260=l9_259;
float4 l9_261=l9_260;
if (l9_184)
{
l9_261=mix(l9_185,l9_261,float4(l9_188));
}
float4 l9_262=l9_261;
float4 l9_263=l9_262;
l9_166=l9_262;
float4 l9_264=l9_166;
N7_Opacity=l9_264.x;
}
N7_Opacity*=N7_Albedo.w;
if (N7_VertexColorSwitch==1)
{
float4 l9_265=tempGlobals.VertexColor;
N7_Albedo*=l9_265;
float4 l9_266=tempGlobals.VertexColor;
N7_Opacity*=l9_266.w;
}
if (N7_EnableNormalTexture)
{
float3 l9_267=float3(0.0,0.0,1.0);
int l9_268=N7_NormalUVSwitch;
float2 l9_269=tempGlobals.Surface_UVCoord0;
float2 l9_270=l9_269;
if (l9_268==0)
{
float2 l9_271=tempGlobals.Surface_UVCoord0;
l9_270=l9_271;
}
if (l9_268==1)
{
float2 l9_272=tempGlobals.Surface_UVCoord1;
l9_270=l9_272;
}
if (l9_268==2)
{
l9_270=tempGlobals.N7_TransformedUV2;
}
if (l9_268==3)
{
l9_270=tempGlobals.N7_TransformedUV3;
}
float2 l9_273=l9_270;
float2 l9_274=l9_273;
float2 l9_275=l9_274;
float4 l9_276=float4(0.0);
float2 l9_277=(*sc_set2.UserUniforms).normalTexDims.xy;
float2 l9_278=l9_277;
int l9_279;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_280;
if (sc_StereoRenderingMode_tmp==0)
{
l9_280=0;
}
else
{
l9_280=in.varStereoViewID;
}
int l9_281=l9_280;
l9_279=1-l9_281;
}
else
{
int l9_282;
if (sc_StereoRenderingMode_tmp==0)
{
l9_282=0;
}
else
{
l9_282=in.varStereoViewID;
}
int l9_283=l9_282;
l9_279=l9_283;
}
int l9_284=l9_279;
float2 l9_285=l9_278;
int l9_286=normalTexLayout_tmp;
int l9_287=l9_284;
float2 l9_288=l9_275;
bool l9_289=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_290=(*sc_set2.UserUniforms).normalTexTransform;
int2 l9_291=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_292=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_293=(*sc_set2.UserUniforms).normalTexUvMinMax;
bool l9_294=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_295=(*sc_set2.UserUniforms).normalTexBorderColor;
float l9_296=0.0;
bool l9_297=l9_294&&(!l9_292);
float l9_298=1.0;
float l9_299=l9_288.x;
int l9_300=l9_291.x;
if (l9_300==1)
{
l9_299=fract(l9_299);
}
else
{
if (l9_300==2)
{
float l9_301=fract(l9_299);
float l9_302=l9_299-l9_301;
float l9_303=step(0.25,fract(l9_302*0.5));
l9_299=mix(l9_301,1.0-l9_301,fast::clamp(l9_303,0.0,1.0));
}
}
l9_288.x=l9_299;
float l9_304=l9_288.y;
int l9_305=l9_291.y;
if (l9_305==1)
{
l9_304=fract(l9_304);
}
else
{
if (l9_305==2)
{
float l9_306=fract(l9_304);
float l9_307=l9_304-l9_306;
float l9_308=step(0.25,fract(l9_307*0.5));
l9_304=mix(l9_306,1.0-l9_306,fast::clamp(l9_308,0.0,1.0));
}
}
l9_288.y=l9_304;
if (l9_292)
{
bool l9_309=l9_294;
bool l9_310;
if (l9_309)
{
l9_310=l9_291.x==3;
}
else
{
l9_310=l9_309;
}
float l9_311=l9_288.x;
float l9_312=l9_293.x;
float l9_313=l9_293.z;
bool l9_314=l9_310;
float l9_315=l9_298;
float l9_316=fast::clamp(l9_311,l9_312,l9_313);
float l9_317=step(abs(l9_311-l9_316),1e-05);
l9_315*=(l9_317+((1.0-float(l9_314))*(1.0-l9_317)));
l9_311=l9_316;
l9_288.x=l9_311;
l9_298=l9_315;
bool l9_318=l9_294;
bool l9_319;
if (l9_318)
{
l9_319=l9_291.y==3;
}
else
{
l9_319=l9_318;
}
float l9_320=l9_288.y;
float l9_321=l9_293.y;
float l9_322=l9_293.w;
bool l9_323=l9_319;
float l9_324=l9_298;
float l9_325=fast::clamp(l9_320,l9_321,l9_322);
float l9_326=step(abs(l9_320-l9_325),1e-05);
l9_324*=(l9_326+((1.0-float(l9_323))*(1.0-l9_326)));
l9_320=l9_325;
l9_288.y=l9_320;
l9_298=l9_324;
}
float2 l9_327=l9_288;
bool l9_328=l9_289;
float3x3 l9_329=l9_290;
if (l9_328)
{
l9_327=float2((l9_329*float3(l9_327,1.0)).xy);
}
float2 l9_330=l9_327;
float2 l9_331=l9_330;
float2 l9_332=l9_331;
l9_288=l9_332;
float l9_333=l9_288.x;
int l9_334=l9_291.x;
bool l9_335=l9_297;
float l9_336=l9_298;
if ((l9_334==0)||(l9_334==3))
{
float l9_337=l9_333;
float l9_338=0.0;
float l9_339=1.0;
bool l9_340=l9_335;
float l9_341=l9_336;
float l9_342=fast::clamp(l9_337,l9_338,l9_339);
float l9_343=step(abs(l9_337-l9_342),1e-05);
l9_341*=(l9_343+((1.0-float(l9_340))*(1.0-l9_343)));
l9_337=l9_342;
l9_333=l9_337;
l9_336=l9_341;
}
l9_288.x=l9_333;
l9_298=l9_336;
float l9_344=l9_288.y;
int l9_345=l9_291.y;
bool l9_346=l9_297;
float l9_347=l9_298;
if ((l9_345==0)||(l9_345==3))
{
float l9_348=l9_344;
float l9_349=0.0;
float l9_350=1.0;
bool l9_351=l9_346;
float l9_352=l9_347;
float l9_353=fast::clamp(l9_348,l9_349,l9_350);
float l9_354=step(abs(l9_348-l9_353),1e-05);
l9_352*=(l9_354+((1.0-float(l9_351))*(1.0-l9_354)));
l9_348=l9_353;
l9_344=l9_348;
l9_347=l9_352;
}
l9_288.y=l9_344;
l9_298=l9_347;
float2 l9_355=l9_285;
float2 l9_356=l9_288;
int l9_357=l9_286;
int l9_358=l9_287;
float l9_359=l9_296;
float2 l9_360=l9_356;
int l9_361=l9_357;
int l9_362=l9_358;
float3 l9_363;
if (l9_361==0)
{
l9_363=float3(l9_360,0.0);
}
else
{
if (l9_361==1)
{
l9_363=float3(l9_360.x,(l9_360.y*0.5)+(0.5-(float(l9_362)*0.5)),0.0);
}
else
{
l9_363=float3(l9_360,float(l9_362));
}
}
float3 l9_364=l9_363;
float3 l9_365=l9_364;
float2 l9_366=l9_355;
float2 l9_367=l9_365.xy;
float l9_368=l9_359;
float4 l9_369=sc_set2.normalTex.sample(sc_set2.normalTexSmpSC,l9_367,bias(l9_368));
float4 l9_370=l9_369;
float4 l9_371=l9_370;
if (l9_294)
{
l9_371=mix(l9_295,l9_371,float4(l9_298));
}
float4 l9_372=l9_371;
float4 l9_373=l9_372;
l9_276=l9_372;
float4 l9_374=l9_276;
N7_Normal=(l9_374.xyz*1.99219)-float3(1.0);
if (N7_EnableDetailNormal)
{
int l9_375=N7_Detail_NormalUVSwitch;
float2 l9_376=tempGlobals.Surface_UVCoord0;
float2 l9_377=l9_376;
if (l9_375==0)
{
float2 l9_378=tempGlobals.Surface_UVCoord0;
l9_377=l9_378;
}
if (l9_375==1)
{
float2 l9_379=tempGlobals.Surface_UVCoord1;
l9_377=l9_379;
}
if (l9_375==2)
{
l9_377=tempGlobals.N7_TransformedUV2;
}
if (l9_375==3)
{
l9_377=tempGlobals.N7_TransformedUV3;
}
float2 l9_380=l9_377;
float2 l9_381=l9_380;
float2 l9_382=l9_381;
float4 l9_383=float4(0.0);
float2 l9_384=(*sc_set2.UserUniforms).detailNormalTexDims.xy;
float2 l9_385=l9_384;
int l9_386;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_387;
if (sc_StereoRenderingMode_tmp==0)
{
l9_387=0;
}
else
{
l9_387=in.varStereoViewID;
}
int l9_388=l9_387;
l9_386=1-l9_388;
}
else
{
int l9_389;
if (sc_StereoRenderingMode_tmp==0)
{
l9_389=0;
}
else
{
l9_389=in.varStereoViewID;
}
int l9_390=l9_389;
l9_386=l9_390;
}
int l9_391=l9_386;
float2 l9_392=l9_385;
int l9_393=detailNormalTexLayout_tmp;
int l9_394=l9_391;
float2 l9_395=l9_382;
bool l9_396=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_397=(*sc_set2.UserUniforms).detailNormalTexTransform;
int2 l9_398=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_399=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_400=(*sc_set2.UserUniforms).detailNormalTexUvMinMax;
bool l9_401=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_402=(*sc_set2.UserUniforms).detailNormalTexBorderColor;
float l9_403=0.0;
bool l9_404=l9_401&&(!l9_399);
float l9_405=1.0;
float l9_406=l9_395.x;
int l9_407=l9_398.x;
if (l9_407==1)
{
l9_406=fract(l9_406);
}
else
{
if (l9_407==2)
{
float l9_408=fract(l9_406);
float l9_409=l9_406-l9_408;
float l9_410=step(0.25,fract(l9_409*0.5));
l9_406=mix(l9_408,1.0-l9_408,fast::clamp(l9_410,0.0,1.0));
}
}
l9_395.x=l9_406;
float l9_411=l9_395.y;
int l9_412=l9_398.y;
if (l9_412==1)
{
l9_411=fract(l9_411);
}
else
{
if (l9_412==2)
{
float l9_413=fract(l9_411);
float l9_414=l9_411-l9_413;
float l9_415=step(0.25,fract(l9_414*0.5));
l9_411=mix(l9_413,1.0-l9_413,fast::clamp(l9_415,0.0,1.0));
}
}
l9_395.y=l9_411;
if (l9_399)
{
bool l9_416=l9_401;
bool l9_417;
if (l9_416)
{
l9_417=l9_398.x==3;
}
else
{
l9_417=l9_416;
}
float l9_418=l9_395.x;
float l9_419=l9_400.x;
float l9_420=l9_400.z;
bool l9_421=l9_417;
float l9_422=l9_405;
float l9_423=fast::clamp(l9_418,l9_419,l9_420);
float l9_424=step(abs(l9_418-l9_423),1e-05);
l9_422*=(l9_424+((1.0-float(l9_421))*(1.0-l9_424)));
l9_418=l9_423;
l9_395.x=l9_418;
l9_405=l9_422;
bool l9_425=l9_401;
bool l9_426;
if (l9_425)
{
l9_426=l9_398.y==3;
}
else
{
l9_426=l9_425;
}
float l9_427=l9_395.y;
float l9_428=l9_400.y;
float l9_429=l9_400.w;
bool l9_430=l9_426;
float l9_431=l9_405;
float l9_432=fast::clamp(l9_427,l9_428,l9_429);
float l9_433=step(abs(l9_427-l9_432),1e-05);
l9_431*=(l9_433+((1.0-float(l9_430))*(1.0-l9_433)));
l9_427=l9_432;
l9_395.y=l9_427;
l9_405=l9_431;
}
float2 l9_434=l9_395;
bool l9_435=l9_396;
float3x3 l9_436=l9_397;
if (l9_435)
{
l9_434=float2((l9_436*float3(l9_434,1.0)).xy);
}
float2 l9_437=l9_434;
float2 l9_438=l9_437;
float2 l9_439=l9_438;
l9_395=l9_439;
float l9_440=l9_395.x;
int l9_441=l9_398.x;
bool l9_442=l9_404;
float l9_443=l9_405;
if ((l9_441==0)||(l9_441==3))
{
float l9_444=l9_440;
float l9_445=0.0;
float l9_446=1.0;
bool l9_447=l9_442;
float l9_448=l9_443;
float l9_449=fast::clamp(l9_444,l9_445,l9_446);
float l9_450=step(abs(l9_444-l9_449),1e-05);
l9_448*=(l9_450+((1.0-float(l9_447))*(1.0-l9_450)));
l9_444=l9_449;
l9_440=l9_444;
l9_443=l9_448;
}
l9_395.x=l9_440;
l9_405=l9_443;
float l9_451=l9_395.y;
int l9_452=l9_398.y;
bool l9_453=l9_404;
float l9_454=l9_405;
if ((l9_452==0)||(l9_452==3))
{
float l9_455=l9_451;
float l9_456=0.0;
float l9_457=1.0;
bool l9_458=l9_453;
float l9_459=l9_454;
float l9_460=fast::clamp(l9_455,l9_456,l9_457);
float l9_461=step(abs(l9_455-l9_460),1e-05);
l9_459*=(l9_461+((1.0-float(l9_458))*(1.0-l9_461)));
l9_455=l9_460;
l9_451=l9_455;
l9_454=l9_459;
}
l9_395.y=l9_451;
l9_405=l9_454;
float2 l9_462=l9_392;
float2 l9_463=l9_395;
int l9_464=l9_393;
int l9_465=l9_394;
float l9_466=l9_403;
float2 l9_467=l9_463;
int l9_468=l9_464;
int l9_469=l9_465;
float3 l9_470;
if (l9_468==0)
{
l9_470=float3(l9_467,0.0);
}
else
{
if (l9_468==1)
{
l9_470=float3(l9_467.x,(l9_467.y*0.5)+(0.5-(float(l9_469)*0.5)),0.0);
}
else
{
l9_470=float3(l9_467,float(l9_469));
}
}
float3 l9_471=l9_470;
float3 l9_472=l9_471;
float2 l9_473=l9_462;
float2 l9_474=l9_472.xy;
float l9_475=l9_466;
float4 l9_476=sc_set2.detailNormalTex.sample(sc_set2.detailNormalTexSmpSC,l9_474,bias(l9_475));
float4 l9_477=l9_476;
float4 l9_478=l9_477;
if (l9_401)
{
l9_478=mix(l9_402,l9_478,float4(l9_405));
}
float4 l9_479=l9_478;
float4 l9_480=l9_479;
l9_383=l9_479;
float4 l9_481=l9_383;
l9_267=(l9_481.xyz*1.99219)-float3(1.0);
}
float3 l9_482=N7_Normal;
float3 l9_483=l9_267;
float3 l9_484=l9_482+float3(0.0,0.0,1.0);
float3 l9_485=l9_483*float3(-1.0,-1.0,1.0);
float3 l9_486=normalize((l9_484*dot(l9_484,l9_485))-(l9_485*l9_484.z));
N7_Normal=l9_486;
float3 l9_487=tempGlobals.VertexNormal_WorldSpace;
float3 l9_488=l9_487;
float3 l9_489=tempGlobals.VertexTangent_WorldSpace;
float3 l9_490=l9_489;
float3 l9_491=tempGlobals.VertexBinormal_WorldSpace;
float3 l9_492=l9_491;
float3x3 l9_493=float3x3(float3(l9_490),float3(l9_492),float3(l9_488));
N7_Normal=normalize(l9_493*N7_Normal);
}
else
{
float3 l9_494=tempGlobals.VertexNormal_WorldSpace;
N7_Normal=normalize(l9_494);
}
float2 l9_495=tempGlobals.Surface_UVCoord0;
float2 l9_496=l9_495;
float3 l9_497=float3(0.0);
float3 l9_498=float3(0.0);
N7_Emissive=float3(0.0);
if (N7_EnableEmissiveTexture)
{
int l9_499=N7_EmissiveUVSwitch;
float2 l9_500=tempGlobals.Surface_UVCoord0;
float2 l9_501=l9_500;
if (l9_499==0)
{
float2 l9_502=tempGlobals.Surface_UVCoord0;
l9_501=l9_502;
}
if (l9_499==1)
{
float2 l9_503=tempGlobals.Surface_UVCoord1;
l9_501=l9_503;
}
if (l9_499==2)
{
l9_501=tempGlobals.N7_TransformedUV2;
}
if (l9_499==3)
{
l9_501=tempGlobals.N7_TransformedUV3;
}
float2 l9_504=l9_501;
l9_496=l9_504;
float2 l9_505=l9_496;
float4 l9_506=float4(0.0);
float2 l9_507=(*sc_set2.UserUniforms).emissiveTexDims.xy;
float2 l9_508=l9_507;
int l9_509;
if ((int(emissiveTexHasSwappedViews_tmp)!=0))
{
int l9_510;
if (sc_StereoRenderingMode_tmp==0)
{
l9_510=0;
}
else
{
l9_510=in.varStereoViewID;
}
int l9_511=l9_510;
l9_509=1-l9_511;
}
else
{
int l9_512;
if (sc_StereoRenderingMode_tmp==0)
{
l9_512=0;
}
else
{
l9_512=in.varStereoViewID;
}
int l9_513=l9_512;
l9_509=l9_513;
}
int l9_514=l9_509;
float2 l9_515=l9_508;
int l9_516=emissiveTexLayout_tmp;
int l9_517=l9_514;
float2 l9_518=l9_505;
bool l9_519=(int(SC_USE_UV_TRANSFORM_emissiveTex_tmp)!=0);
float3x3 l9_520=(*sc_set2.UserUniforms).emissiveTexTransform;
int2 l9_521=int2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp,SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp);
bool l9_522=(int(SC_USE_UV_MIN_MAX_emissiveTex_tmp)!=0);
float4 l9_523=(*sc_set2.UserUniforms).emissiveTexUvMinMax;
bool l9_524=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp)!=0);
float4 l9_525=(*sc_set2.UserUniforms).emissiveTexBorderColor;
float l9_526=0.0;
bool l9_527=l9_524&&(!l9_522);
float l9_528=1.0;
float l9_529=l9_518.x;
int l9_530=l9_521.x;
if (l9_530==1)
{
l9_529=fract(l9_529);
}
else
{
if (l9_530==2)
{
float l9_531=fract(l9_529);
float l9_532=l9_529-l9_531;
float l9_533=step(0.25,fract(l9_532*0.5));
l9_529=mix(l9_531,1.0-l9_531,fast::clamp(l9_533,0.0,1.0));
}
}
l9_518.x=l9_529;
float l9_534=l9_518.y;
int l9_535=l9_521.y;
if (l9_535==1)
{
l9_534=fract(l9_534);
}
else
{
if (l9_535==2)
{
float l9_536=fract(l9_534);
float l9_537=l9_534-l9_536;
float l9_538=step(0.25,fract(l9_537*0.5));
l9_534=mix(l9_536,1.0-l9_536,fast::clamp(l9_538,0.0,1.0));
}
}
l9_518.y=l9_534;
if (l9_522)
{
bool l9_539=l9_524;
bool l9_540;
if (l9_539)
{
l9_540=l9_521.x==3;
}
else
{
l9_540=l9_539;
}
float l9_541=l9_518.x;
float l9_542=l9_523.x;
float l9_543=l9_523.z;
bool l9_544=l9_540;
float l9_545=l9_528;
float l9_546=fast::clamp(l9_541,l9_542,l9_543);
float l9_547=step(abs(l9_541-l9_546),1e-05);
l9_545*=(l9_547+((1.0-float(l9_544))*(1.0-l9_547)));
l9_541=l9_546;
l9_518.x=l9_541;
l9_528=l9_545;
bool l9_548=l9_524;
bool l9_549;
if (l9_548)
{
l9_549=l9_521.y==3;
}
else
{
l9_549=l9_548;
}
float l9_550=l9_518.y;
float l9_551=l9_523.y;
float l9_552=l9_523.w;
bool l9_553=l9_549;
float l9_554=l9_528;
float l9_555=fast::clamp(l9_550,l9_551,l9_552);
float l9_556=step(abs(l9_550-l9_555),1e-05);
l9_554*=(l9_556+((1.0-float(l9_553))*(1.0-l9_556)));
l9_550=l9_555;
l9_518.y=l9_550;
l9_528=l9_554;
}
float2 l9_557=l9_518;
bool l9_558=l9_519;
float3x3 l9_559=l9_520;
if (l9_558)
{
l9_557=float2((l9_559*float3(l9_557,1.0)).xy);
}
float2 l9_560=l9_557;
float2 l9_561=l9_560;
float2 l9_562=l9_561;
l9_518=l9_562;
float l9_563=l9_518.x;
int l9_564=l9_521.x;
bool l9_565=l9_527;
float l9_566=l9_528;
if ((l9_564==0)||(l9_564==3))
{
float l9_567=l9_563;
float l9_568=0.0;
float l9_569=1.0;
bool l9_570=l9_565;
float l9_571=l9_566;
float l9_572=fast::clamp(l9_567,l9_568,l9_569);
float l9_573=step(abs(l9_567-l9_572),1e-05);
l9_571*=(l9_573+((1.0-float(l9_570))*(1.0-l9_573)));
l9_567=l9_572;
l9_563=l9_567;
l9_566=l9_571;
}
l9_518.x=l9_563;
l9_528=l9_566;
float l9_574=l9_518.y;
int l9_575=l9_521.y;
bool l9_576=l9_527;
float l9_577=l9_528;
if ((l9_575==0)||(l9_575==3))
{
float l9_578=l9_574;
float l9_579=0.0;
float l9_580=1.0;
bool l9_581=l9_576;
float l9_582=l9_577;
float l9_583=fast::clamp(l9_578,l9_579,l9_580);
float l9_584=step(abs(l9_578-l9_583),1e-05);
l9_582*=(l9_584+((1.0-float(l9_581))*(1.0-l9_584)));
l9_578=l9_583;
l9_574=l9_578;
l9_577=l9_582;
}
l9_518.y=l9_574;
l9_528=l9_577;
float2 l9_585=l9_515;
float2 l9_586=l9_518;
int l9_587=l9_516;
int l9_588=l9_517;
float l9_589=l9_526;
float2 l9_590=l9_586;
int l9_591=l9_587;
int l9_592=l9_588;
float3 l9_593;
if (l9_591==0)
{
l9_593=float3(l9_590,0.0);
}
else
{
if (l9_591==1)
{
l9_593=float3(l9_590.x,(l9_590.y*0.5)+(0.5-(float(l9_592)*0.5)),0.0);
}
else
{
l9_593=float3(l9_590,float(l9_592));
}
}
float3 l9_594=l9_593;
float3 l9_595=l9_594;
float2 l9_596=l9_585;
float2 l9_597=l9_595.xy;
float l9_598=l9_589;
float4 l9_599=sc_set2.emissiveTex.sample(sc_set2.emissiveTexSmpSC,l9_597,bias(l9_598));
float4 l9_600=l9_599;
float4 l9_601=l9_600;
if (l9_524)
{
l9_601=mix(l9_525,l9_601,float4(l9_528));
}
float4 l9_602=l9_601;
float4 l9_603=l9_602;
l9_506=l9_602;
float4 l9_604=l9_506;
N7_Emissive=l9_604.xyz;
}
if (N7_VertexColorSwitch==2)
{
float4 l9_605=tempGlobals.VertexColor;
N7_Emissive+=l9_605.xyz;
}
if ((N7_VertexColorSwitch==2)||N7_EnableEmissiveTexture)
{
float3 l9_606=(N7_Emissive*N7_EmissiveColor)*float3(N7_EmissiveIntensity);
float3 l9_607=float3(2.2);
float l9_608;
if (l9_606.x<=0.0)
{
l9_608=0.0;
}
else
{
l9_608=pow(l9_606.x,l9_607.x);
}
float l9_609=l9_608;
float l9_610;
if (l9_606.y<=0.0)
{
l9_610=0.0;
}
else
{
l9_610=pow(l9_606.y,l9_607.y);
}
float l9_611=l9_610;
float l9_612;
if (l9_606.z<=0.0)
{
l9_612=0.0;
}
else
{
l9_612=pow(l9_606.z,l9_607.z);
}
float3 l9_613=float3(l9_609,l9_611,l9_612);
N7_Emissive=l9_613;
}
if (N7_EnableSimpleReflection)
{
float3 l9_614=tempGlobals.ViewDirWS;
float3 l9_615=l9_614;
float3 l9_616=reflect(l9_615,N7_Normal);
l9_616.z=-l9_616.z;
float3 l9_617=l9_616;
float l9_618=((l9_617.x*l9_617.x)+(l9_617.y*l9_617.y))+((l9_617.z+1.0)*(l9_617.z+1.0));
float l9_619;
if (l9_618<=0.0)
{
l9_619=0.0;
}
else
{
l9_619=sqrt(l9_618);
}
float l9_620=l9_619;
float l9_621=2.0*l9_620;
float2 l9_622=(l9_617.xy/float2(l9_621))+float2(0.5);
float2 l9_623=l9_622;
float2 l9_624=float2(1.0)-l9_623;
float2 l9_625=l9_624;
float4 l9_626=float4(0.0);
float2 l9_627=(*sc_set2.UserUniforms).reflectionTexDims.xy;
float2 l9_628=l9_627;
int l9_629;
if ((int(reflectionTexHasSwappedViews_tmp)!=0))
{
int l9_630;
if (sc_StereoRenderingMode_tmp==0)
{
l9_630=0;
}
else
{
l9_630=in.varStereoViewID;
}
int l9_631=l9_630;
l9_629=1-l9_631;
}
else
{
int l9_632;
if (sc_StereoRenderingMode_tmp==0)
{
l9_632=0;
}
else
{
l9_632=in.varStereoViewID;
}
int l9_633=l9_632;
l9_629=l9_633;
}
int l9_634=l9_629;
float2 l9_635=l9_628;
int l9_636=reflectionTexLayout_tmp;
int l9_637=l9_634;
float2 l9_638=l9_625;
bool l9_639=(int(SC_USE_UV_TRANSFORM_reflectionTex_tmp)!=0);
float3x3 l9_640=(*sc_set2.UserUniforms).reflectionTexTransform;
int2 l9_641=int2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex_tmp,SC_SOFTWARE_WRAP_MODE_V_reflectionTex_tmp);
bool l9_642=(int(SC_USE_UV_MIN_MAX_reflectionTex_tmp)!=0);
float4 l9_643=(*sc_set2.UserUniforms).reflectionTexUvMinMax;
bool l9_644=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex_tmp)!=0);
float4 l9_645=(*sc_set2.UserUniforms).reflectionTexBorderColor;
float l9_646=0.0;
bool l9_647=l9_644&&(!l9_642);
float l9_648=1.0;
float l9_649=l9_638.x;
int l9_650=l9_641.x;
if (l9_650==1)
{
l9_649=fract(l9_649);
}
else
{
if (l9_650==2)
{
float l9_651=fract(l9_649);
float l9_652=l9_649-l9_651;
float l9_653=step(0.25,fract(l9_652*0.5));
l9_649=mix(l9_651,1.0-l9_651,fast::clamp(l9_653,0.0,1.0));
}
}
l9_638.x=l9_649;
float l9_654=l9_638.y;
int l9_655=l9_641.y;
if (l9_655==1)
{
l9_654=fract(l9_654);
}
else
{
if (l9_655==2)
{
float l9_656=fract(l9_654);
float l9_657=l9_654-l9_656;
float l9_658=step(0.25,fract(l9_657*0.5));
l9_654=mix(l9_656,1.0-l9_656,fast::clamp(l9_658,0.0,1.0));
}
}
l9_638.y=l9_654;
if (l9_642)
{
bool l9_659=l9_644;
bool l9_660;
if (l9_659)
{
l9_660=l9_641.x==3;
}
else
{
l9_660=l9_659;
}
float l9_661=l9_638.x;
float l9_662=l9_643.x;
float l9_663=l9_643.z;
bool l9_664=l9_660;
float l9_665=l9_648;
float l9_666=fast::clamp(l9_661,l9_662,l9_663);
float l9_667=step(abs(l9_661-l9_666),1e-05);
l9_665*=(l9_667+((1.0-float(l9_664))*(1.0-l9_667)));
l9_661=l9_666;
l9_638.x=l9_661;
l9_648=l9_665;
bool l9_668=l9_644;
bool l9_669;
if (l9_668)
{
l9_669=l9_641.y==3;
}
else
{
l9_669=l9_668;
}
float l9_670=l9_638.y;
float l9_671=l9_643.y;
float l9_672=l9_643.w;
bool l9_673=l9_669;
float l9_674=l9_648;
float l9_675=fast::clamp(l9_670,l9_671,l9_672);
float l9_676=step(abs(l9_670-l9_675),1e-05);
l9_674*=(l9_676+((1.0-float(l9_673))*(1.0-l9_676)));
l9_670=l9_675;
l9_638.y=l9_670;
l9_648=l9_674;
}
float2 l9_677=l9_638;
bool l9_678=l9_639;
float3x3 l9_679=l9_640;
if (l9_678)
{
l9_677=float2((l9_679*float3(l9_677,1.0)).xy);
}
float2 l9_680=l9_677;
float2 l9_681=l9_680;
float2 l9_682=l9_681;
l9_638=l9_682;
float l9_683=l9_638.x;
int l9_684=l9_641.x;
bool l9_685=l9_647;
float l9_686=l9_648;
if ((l9_684==0)||(l9_684==3))
{
float l9_687=l9_683;
float l9_688=0.0;
float l9_689=1.0;
bool l9_690=l9_685;
float l9_691=l9_686;
float l9_692=fast::clamp(l9_687,l9_688,l9_689);
float l9_693=step(abs(l9_687-l9_692),1e-05);
l9_691*=(l9_693+((1.0-float(l9_690))*(1.0-l9_693)));
l9_687=l9_692;
l9_683=l9_687;
l9_686=l9_691;
}
l9_638.x=l9_683;
l9_648=l9_686;
float l9_694=l9_638.y;
int l9_695=l9_641.y;
bool l9_696=l9_647;
float l9_697=l9_648;
if ((l9_695==0)||(l9_695==3))
{
float l9_698=l9_694;
float l9_699=0.0;
float l9_700=1.0;
bool l9_701=l9_696;
float l9_702=l9_697;
float l9_703=fast::clamp(l9_698,l9_699,l9_700);
float l9_704=step(abs(l9_698-l9_703),1e-05);
l9_702*=(l9_704+((1.0-float(l9_701))*(1.0-l9_704)));
l9_698=l9_703;
l9_694=l9_698;
l9_697=l9_702;
}
l9_638.y=l9_694;
l9_648=l9_697;
float2 l9_705=l9_635;
float2 l9_706=l9_638;
int l9_707=l9_636;
int l9_708=l9_637;
float l9_709=l9_646;
float2 l9_710=l9_706;
int l9_711=l9_707;
int l9_712=l9_708;
float3 l9_713;
if (l9_711==0)
{
l9_713=float3(l9_710,0.0);
}
else
{
if (l9_711==1)
{
l9_713=float3(l9_710.x,(l9_710.y*0.5)+(0.5-(float(l9_712)*0.5)),0.0);
}
else
{
l9_713=float3(l9_710,float(l9_712));
}
}
float3 l9_714=l9_713;
float3 l9_715=l9_714;
float2 l9_716=l9_705;
float2 l9_717=l9_715.xy;
float l9_718=l9_709;
float4 l9_719=sc_set2.reflectionTex.sample(sc_set2.reflectionTexSmpSC,l9_717,bias(l9_718));
float4 l9_720=l9_719;
float4 l9_721=l9_720;
if (l9_644)
{
l9_721=mix(l9_645,l9_721,float4(l9_648));
}
float4 l9_722=l9_721;
float4 l9_723=l9_722;
l9_626=l9_722;
float4 l9_724=l9_626;
l9_497=l9_724.xyz;
if (N7_EnableModulationTexture)
{
int l9_725=N7_ModuationUVSwitch;
float2 l9_726=tempGlobals.Surface_UVCoord0;
float2 l9_727=l9_726;
if (l9_725==0)
{
float2 l9_728=tempGlobals.Surface_UVCoord0;
l9_727=l9_728;
}
if (l9_725==1)
{
float2 l9_729=tempGlobals.Surface_UVCoord1;
l9_727=l9_729;
}
if (l9_725==2)
{
l9_727=tempGlobals.N7_TransformedUV2;
}
if (l9_725==3)
{
l9_727=tempGlobals.N7_TransformedUV3;
}
float2 l9_730=l9_727;
float2 l9_731=l9_730;
float2 l9_732=l9_731;
float4 l9_733=float4(0.0);
float2 l9_734=(*sc_set2.UserUniforms).reflectionModulationTexDims.xy;
float2 l9_735=l9_734;
int l9_736;
if ((int(reflectionModulationTexHasSwappedViews_tmp)!=0))
{
int l9_737;
if (sc_StereoRenderingMode_tmp==0)
{
l9_737=0;
}
else
{
l9_737=in.varStereoViewID;
}
int l9_738=l9_737;
l9_736=1-l9_738;
}
else
{
int l9_739;
if (sc_StereoRenderingMode_tmp==0)
{
l9_739=0;
}
else
{
l9_739=in.varStereoViewID;
}
int l9_740=l9_739;
l9_736=l9_740;
}
int l9_741=l9_736;
float2 l9_742=l9_735;
int l9_743=reflectionModulationTexLayout_tmp;
int l9_744=l9_741;
float2 l9_745=l9_732;
bool l9_746=(int(SC_USE_UV_TRANSFORM_reflectionModulationTex_tmp)!=0);
float3x3 l9_747=(*sc_set2.UserUniforms).reflectionModulationTexTransform;
int2 l9_748=int2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex_tmp,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex_tmp);
bool l9_749=(int(SC_USE_UV_MIN_MAX_reflectionModulationTex_tmp)!=0);
float4 l9_750=(*sc_set2.UserUniforms).reflectionModulationTexUvMinMax;
bool l9_751=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex_tmp)!=0);
float4 l9_752=(*sc_set2.UserUniforms).reflectionModulationTexBorderColor;
float l9_753=0.0;
bool l9_754=l9_751&&(!l9_749);
float l9_755=1.0;
float l9_756=l9_745.x;
int l9_757=l9_748.x;
if (l9_757==1)
{
l9_756=fract(l9_756);
}
else
{
if (l9_757==2)
{
float l9_758=fract(l9_756);
float l9_759=l9_756-l9_758;
float l9_760=step(0.25,fract(l9_759*0.5));
l9_756=mix(l9_758,1.0-l9_758,fast::clamp(l9_760,0.0,1.0));
}
}
l9_745.x=l9_756;
float l9_761=l9_745.y;
int l9_762=l9_748.y;
if (l9_762==1)
{
l9_761=fract(l9_761);
}
else
{
if (l9_762==2)
{
float l9_763=fract(l9_761);
float l9_764=l9_761-l9_763;
float l9_765=step(0.25,fract(l9_764*0.5));
l9_761=mix(l9_763,1.0-l9_763,fast::clamp(l9_765,0.0,1.0));
}
}
l9_745.y=l9_761;
if (l9_749)
{
bool l9_766=l9_751;
bool l9_767;
if (l9_766)
{
l9_767=l9_748.x==3;
}
else
{
l9_767=l9_766;
}
float l9_768=l9_745.x;
float l9_769=l9_750.x;
float l9_770=l9_750.z;
bool l9_771=l9_767;
float l9_772=l9_755;
float l9_773=fast::clamp(l9_768,l9_769,l9_770);
float l9_774=step(abs(l9_768-l9_773),1e-05);
l9_772*=(l9_774+((1.0-float(l9_771))*(1.0-l9_774)));
l9_768=l9_773;
l9_745.x=l9_768;
l9_755=l9_772;
bool l9_775=l9_751;
bool l9_776;
if (l9_775)
{
l9_776=l9_748.y==3;
}
else
{
l9_776=l9_775;
}
float l9_777=l9_745.y;
float l9_778=l9_750.y;
float l9_779=l9_750.w;
bool l9_780=l9_776;
float l9_781=l9_755;
float l9_782=fast::clamp(l9_777,l9_778,l9_779);
float l9_783=step(abs(l9_777-l9_782),1e-05);
l9_781*=(l9_783+((1.0-float(l9_780))*(1.0-l9_783)));
l9_777=l9_782;
l9_745.y=l9_777;
l9_755=l9_781;
}
float2 l9_784=l9_745;
bool l9_785=l9_746;
float3x3 l9_786=l9_747;
if (l9_785)
{
l9_784=float2((l9_786*float3(l9_784,1.0)).xy);
}
float2 l9_787=l9_784;
float2 l9_788=l9_787;
float2 l9_789=l9_788;
l9_745=l9_789;
float l9_790=l9_745.x;
int l9_791=l9_748.x;
bool l9_792=l9_754;
float l9_793=l9_755;
if ((l9_791==0)||(l9_791==3))
{
float l9_794=l9_790;
float l9_795=0.0;
float l9_796=1.0;
bool l9_797=l9_792;
float l9_798=l9_793;
float l9_799=fast::clamp(l9_794,l9_795,l9_796);
float l9_800=step(abs(l9_794-l9_799),1e-05);
l9_798*=(l9_800+((1.0-float(l9_797))*(1.0-l9_800)));
l9_794=l9_799;
l9_790=l9_794;
l9_793=l9_798;
}
l9_745.x=l9_790;
l9_755=l9_793;
float l9_801=l9_745.y;
int l9_802=l9_748.y;
bool l9_803=l9_754;
float l9_804=l9_755;
if ((l9_802==0)||(l9_802==3))
{
float l9_805=l9_801;
float l9_806=0.0;
float l9_807=1.0;
bool l9_808=l9_803;
float l9_809=l9_804;
float l9_810=fast::clamp(l9_805,l9_806,l9_807);
float l9_811=step(abs(l9_805-l9_810),1e-05);
l9_809*=(l9_811+((1.0-float(l9_808))*(1.0-l9_811)));
l9_805=l9_810;
l9_801=l9_805;
l9_804=l9_809;
}
l9_745.y=l9_801;
l9_755=l9_804;
float2 l9_812=l9_742;
float2 l9_813=l9_745;
int l9_814=l9_743;
int l9_815=l9_744;
float l9_816=l9_753;
float2 l9_817=l9_813;
int l9_818=l9_814;
int l9_819=l9_815;
float3 l9_820;
if (l9_818==0)
{
l9_820=float3(l9_817,0.0);
}
else
{
if (l9_818==1)
{
l9_820=float3(l9_817.x,(l9_817.y*0.5)+(0.5-(float(l9_819)*0.5)),0.0);
}
else
{
l9_820=float3(l9_817,float(l9_819));
}
}
float3 l9_821=l9_820;
float3 l9_822=l9_821;
float2 l9_823=l9_812;
float2 l9_824=l9_822.xy;
float l9_825=l9_816;
float4 l9_826=sc_set2.reflectionModulationTex.sample(sc_set2.reflectionModulationTexSmpSC,l9_824,bias(l9_825));
float4 l9_827=l9_826;
float4 l9_828=l9_827;
if (l9_751)
{
l9_828=mix(l9_752,l9_828,float4(l9_755));
}
float4 l9_829=l9_828;
float4 l9_830=l9_829;
l9_733=l9_829;
float4 l9_831=l9_733;
float3 l9_832=l9_831.xyz;
l9_497*=l9_832;
}
float3 l9_833=l9_497;
float l9_834=l9_833.x;
float l9_835=2.2;
float l9_836;
if (l9_834<=0.0)
{
l9_836=0.0;
}
else
{
l9_836=pow(l9_834,l9_835);
}
float l9_837=l9_836;
float l9_838=l9_837;
float l9_839=l9_833.y;
float l9_840=2.2;
float l9_841;
if (l9_839<=0.0)
{
l9_841=0.0;
}
else
{
l9_841=pow(l9_839,l9_840);
}
float l9_842=l9_841;
float l9_843=l9_842;
float l9_844=l9_833.z;
float l9_845=2.2;
float l9_846;
if (l9_844<=0.0)
{
l9_846=0.0;
}
else
{
l9_846=pow(l9_844,l9_845);
}
float l9_847=l9_846;
float3 l9_848=float3(l9_838,l9_843,l9_847);
l9_497=l9_848;
l9_497*=N7_ReflectionIntensity;
}
if (N7_EnableRimHighlight)
{
float3 l9_849=N7_RimColor*N7_RimIntensity;
if (N7_EnableRimColorTexture)
{
int l9_850=N7_RimUVSwitch;
float2 l9_851=tempGlobals.Surface_UVCoord0;
float2 l9_852=l9_851;
if (l9_850==0)
{
float2 l9_853=tempGlobals.Surface_UVCoord0;
l9_852=l9_853;
}
if (l9_850==1)
{
float2 l9_854=tempGlobals.Surface_UVCoord1;
l9_852=l9_854;
}
if (l9_850==2)
{
l9_852=tempGlobals.N7_TransformedUV2;
}
if (l9_850==3)
{
l9_852=tempGlobals.N7_TransformedUV3;
}
float2 l9_855=l9_852;
float2 l9_856=l9_855;
float2 l9_857=l9_856;
float4 l9_858=float4(0.0);
float2 l9_859=(*sc_set2.UserUniforms).rimColorTexDims.xy;
float2 l9_860=l9_859;
int l9_861;
if ((int(rimColorTexHasSwappedViews_tmp)!=0))
{
int l9_862;
if (sc_StereoRenderingMode_tmp==0)
{
l9_862=0;
}
else
{
l9_862=in.varStereoViewID;
}
int l9_863=l9_862;
l9_861=1-l9_863;
}
else
{
int l9_864;
if (sc_StereoRenderingMode_tmp==0)
{
l9_864=0;
}
else
{
l9_864=in.varStereoViewID;
}
int l9_865=l9_864;
l9_861=l9_865;
}
int l9_866=l9_861;
float2 l9_867=l9_860;
int l9_868=rimColorTexLayout_tmp;
int l9_869=l9_866;
float2 l9_870=l9_857;
bool l9_871=(int(SC_USE_UV_TRANSFORM_rimColorTex_tmp)!=0);
float3x3 l9_872=(*sc_set2.UserUniforms).rimColorTexTransform;
int2 l9_873=int2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex_tmp,SC_SOFTWARE_WRAP_MODE_V_rimColorTex_tmp);
bool l9_874=(int(SC_USE_UV_MIN_MAX_rimColorTex_tmp)!=0);
float4 l9_875=(*sc_set2.UserUniforms).rimColorTexUvMinMax;
bool l9_876=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex_tmp)!=0);
float4 l9_877=(*sc_set2.UserUniforms).rimColorTexBorderColor;
float l9_878=0.0;
bool l9_879=l9_876&&(!l9_874);
float l9_880=1.0;
float l9_881=l9_870.x;
int l9_882=l9_873.x;
if (l9_882==1)
{
l9_881=fract(l9_881);
}
else
{
if (l9_882==2)
{
float l9_883=fract(l9_881);
float l9_884=l9_881-l9_883;
float l9_885=step(0.25,fract(l9_884*0.5));
l9_881=mix(l9_883,1.0-l9_883,fast::clamp(l9_885,0.0,1.0));
}
}
l9_870.x=l9_881;
float l9_886=l9_870.y;
int l9_887=l9_873.y;
if (l9_887==1)
{
l9_886=fract(l9_886);
}
else
{
if (l9_887==2)
{
float l9_888=fract(l9_886);
float l9_889=l9_886-l9_888;
float l9_890=step(0.25,fract(l9_889*0.5));
l9_886=mix(l9_888,1.0-l9_888,fast::clamp(l9_890,0.0,1.0));
}
}
l9_870.y=l9_886;
if (l9_874)
{
bool l9_891=l9_876;
bool l9_892;
if (l9_891)
{
l9_892=l9_873.x==3;
}
else
{
l9_892=l9_891;
}
float l9_893=l9_870.x;
float l9_894=l9_875.x;
float l9_895=l9_875.z;
bool l9_896=l9_892;
float l9_897=l9_880;
float l9_898=fast::clamp(l9_893,l9_894,l9_895);
float l9_899=step(abs(l9_893-l9_898),1e-05);
l9_897*=(l9_899+((1.0-float(l9_896))*(1.0-l9_899)));
l9_893=l9_898;
l9_870.x=l9_893;
l9_880=l9_897;
bool l9_900=l9_876;
bool l9_901;
if (l9_900)
{
l9_901=l9_873.y==3;
}
else
{
l9_901=l9_900;
}
float l9_902=l9_870.y;
float l9_903=l9_875.y;
float l9_904=l9_875.w;
bool l9_905=l9_901;
float l9_906=l9_880;
float l9_907=fast::clamp(l9_902,l9_903,l9_904);
float l9_908=step(abs(l9_902-l9_907),1e-05);
l9_906*=(l9_908+((1.0-float(l9_905))*(1.0-l9_908)));
l9_902=l9_907;
l9_870.y=l9_902;
l9_880=l9_906;
}
float2 l9_909=l9_870;
bool l9_910=l9_871;
float3x3 l9_911=l9_872;
if (l9_910)
{
l9_909=float2((l9_911*float3(l9_909,1.0)).xy);
}
float2 l9_912=l9_909;
float2 l9_913=l9_912;
float2 l9_914=l9_913;
l9_870=l9_914;
float l9_915=l9_870.x;
int l9_916=l9_873.x;
bool l9_917=l9_879;
float l9_918=l9_880;
if ((l9_916==0)||(l9_916==3))
{
float l9_919=l9_915;
float l9_920=0.0;
float l9_921=1.0;
bool l9_922=l9_917;
float l9_923=l9_918;
float l9_924=fast::clamp(l9_919,l9_920,l9_921);
float l9_925=step(abs(l9_919-l9_924),1e-05);
l9_923*=(l9_925+((1.0-float(l9_922))*(1.0-l9_925)));
l9_919=l9_924;
l9_915=l9_919;
l9_918=l9_923;
}
l9_870.x=l9_915;
l9_880=l9_918;
float l9_926=l9_870.y;
int l9_927=l9_873.y;
bool l9_928=l9_879;
float l9_929=l9_880;
if ((l9_927==0)||(l9_927==3))
{
float l9_930=l9_926;
float l9_931=0.0;
float l9_932=1.0;
bool l9_933=l9_928;
float l9_934=l9_929;
float l9_935=fast::clamp(l9_930,l9_931,l9_932);
float l9_936=step(abs(l9_930-l9_935),1e-05);
l9_934*=(l9_936+((1.0-float(l9_933))*(1.0-l9_936)));
l9_930=l9_935;
l9_926=l9_930;
l9_929=l9_934;
}
l9_870.y=l9_926;
l9_880=l9_929;
float2 l9_937=l9_867;
float2 l9_938=l9_870;
int l9_939=l9_868;
int l9_940=l9_869;
float l9_941=l9_878;
float2 l9_942=l9_938;
int l9_943=l9_939;
int l9_944=l9_940;
float3 l9_945;
if (l9_943==0)
{
l9_945=float3(l9_942,0.0);
}
else
{
if (l9_943==1)
{
l9_945=float3(l9_942.x,(l9_942.y*0.5)+(0.5-(float(l9_944)*0.5)),0.0);
}
else
{
l9_945=float3(l9_942,float(l9_944));
}
}
float3 l9_946=l9_945;
float3 l9_947=l9_946;
float2 l9_948=l9_937;
float2 l9_949=l9_947.xy;
float l9_950=l9_941;
float4 l9_951=sc_set2.rimColorTex.sample(sc_set2.rimColorTexSmpSC,l9_949,bias(l9_950));
float4 l9_952=l9_951;
float4 l9_953=l9_952;
if (l9_876)
{
l9_953=mix(l9_877,l9_953,float4(l9_880));
}
float4 l9_954=l9_953;
float4 l9_955=l9_954;
l9_858=l9_954;
float4 l9_956=l9_858;
l9_849*=l9_956.xyz;
}
float3 l9_957=tempGlobals.ViewDirWS;
float3 l9_958=l9_957;
float l9_959=abs(dot(N7_Normal,l9_958));
if (!N7_EnableRimInvert)
{
l9_959=1.0-l9_959;
}
float l9_960=l9_959;
float l9_961=N7_RimExponent;
float l9_962;
if (l9_960<=0.0)
{
l9_962=0.0;
}
else
{
l9_962=pow(l9_960,l9_961);
}
float l9_963=l9_962;
float l9_964=l9_963;
float3 l9_965=l9_849;
float l9_966=l9_965.x;
float l9_967=2.2;
float l9_968;
if (l9_966<=0.0)
{
l9_968=0.0;
}
else
{
l9_968=pow(l9_966,l9_967);
}
float l9_969=l9_968;
float l9_970=l9_969;
float l9_971=l9_965.y;
float l9_972=2.2;
float l9_973;
if (l9_971<=0.0)
{
l9_973=0.0;
}
else
{
l9_973=pow(l9_971,l9_972);
}
float l9_974=l9_973;
float l9_975=l9_974;
float l9_976=l9_965.z;
float l9_977=2.2;
float l9_978;
if (l9_976<=0.0)
{
l9_978=0.0;
}
else
{
l9_978=pow(l9_976,l9_977);
}
float l9_979=l9_978;
float3 l9_980=float3(l9_970,l9_975,l9_979);
l9_498+=(l9_980*l9_964);
}
float3 l9_981=(N7_Emissive+l9_497)+l9_498;
float3 l9_982=float3(0.454545);
float l9_983;
if (l9_981.x<=0.0)
{
l9_983=0.0;
}
else
{
l9_983=pow(l9_981.x,l9_982.x);
}
float l9_984=l9_983;
float l9_985;
if (l9_981.y<=0.0)
{
l9_985=0.0;
}
else
{
l9_985=pow(l9_981.y,l9_982.y);
}
float l9_986=l9_985;
float l9_987;
if (l9_981.z<=0.0)
{
l9_987=0.0;
}
else
{
l9_987=pow(l9_981.z,l9_982.z);
}
float3 l9_988=float3(l9_984,l9_986,l9_987);
N7_Emissive=l9_988;
int l9_989=N7_MaterialParamsUVSwitch;
float2 l9_990=tempGlobals.Surface_UVCoord0;
float2 l9_991=l9_990;
if (l9_989==0)
{
float2 l9_992=tempGlobals.Surface_UVCoord0;
l9_991=l9_992;
}
if (l9_989==1)
{
float2 l9_993=tempGlobals.Surface_UVCoord1;
l9_991=l9_993;
}
if (l9_989==2)
{
l9_991=tempGlobals.N7_TransformedUV2;
}
if (l9_989==3)
{
l9_991=tempGlobals.N7_TransformedUV3;
}
float2 l9_994=l9_991;
float2 l9_995=l9_994;
float2 l9_996=l9_995;
float4 l9_997=float4(0.0);
float2 l9_998=(*sc_set2.UserUniforms).materialParamsTexDims.xy;
float2 l9_999=l9_998;
int l9_1000;
if ((int(materialParamsTexHasSwappedViews_tmp)!=0))
{
int l9_1001;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1001=0;
}
else
{
l9_1001=in.varStereoViewID;
}
int l9_1002=l9_1001;
l9_1000=1-l9_1002;
}
else
{
int l9_1003;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1003=0;
}
else
{
l9_1003=in.varStereoViewID;
}
int l9_1004=l9_1003;
l9_1000=l9_1004;
}
int l9_1005=l9_1000;
float2 l9_1006=l9_999;
int l9_1007=materialParamsTexLayout_tmp;
int l9_1008=l9_1005;
float2 l9_1009=l9_996;
bool l9_1010=(int(SC_USE_UV_TRANSFORM_materialParamsTex_tmp)!=0);
float3x3 l9_1011=(*sc_set2.UserUniforms).materialParamsTexTransform;
int2 l9_1012=int2(SC_SOFTWARE_WRAP_MODE_U_materialParamsTex_tmp,SC_SOFTWARE_WRAP_MODE_V_materialParamsTex_tmp);
bool l9_1013=(int(SC_USE_UV_MIN_MAX_materialParamsTex_tmp)!=0);
float4 l9_1014=(*sc_set2.UserUniforms).materialParamsTexUvMinMax;
bool l9_1015=(int(SC_USE_CLAMP_TO_BORDER_materialParamsTex_tmp)!=0);
float4 l9_1016=(*sc_set2.UserUniforms).materialParamsTexBorderColor;
float l9_1017=0.0;
bool l9_1018=l9_1015&&(!l9_1013);
float l9_1019=1.0;
float l9_1020=l9_1009.x;
int l9_1021=l9_1012.x;
if (l9_1021==1)
{
l9_1020=fract(l9_1020);
}
else
{
if (l9_1021==2)
{
float l9_1022=fract(l9_1020);
float l9_1023=l9_1020-l9_1022;
float l9_1024=step(0.25,fract(l9_1023*0.5));
l9_1020=mix(l9_1022,1.0-l9_1022,fast::clamp(l9_1024,0.0,1.0));
}
}
l9_1009.x=l9_1020;
float l9_1025=l9_1009.y;
int l9_1026=l9_1012.y;
if (l9_1026==1)
{
l9_1025=fract(l9_1025);
}
else
{
if (l9_1026==2)
{
float l9_1027=fract(l9_1025);
float l9_1028=l9_1025-l9_1027;
float l9_1029=step(0.25,fract(l9_1028*0.5));
l9_1025=mix(l9_1027,1.0-l9_1027,fast::clamp(l9_1029,0.0,1.0));
}
}
l9_1009.y=l9_1025;
if (l9_1013)
{
bool l9_1030=l9_1015;
bool l9_1031;
if (l9_1030)
{
l9_1031=l9_1012.x==3;
}
else
{
l9_1031=l9_1030;
}
float l9_1032=l9_1009.x;
float l9_1033=l9_1014.x;
float l9_1034=l9_1014.z;
bool l9_1035=l9_1031;
float l9_1036=l9_1019;
float l9_1037=fast::clamp(l9_1032,l9_1033,l9_1034);
float l9_1038=step(abs(l9_1032-l9_1037),1e-05);
l9_1036*=(l9_1038+((1.0-float(l9_1035))*(1.0-l9_1038)));
l9_1032=l9_1037;
l9_1009.x=l9_1032;
l9_1019=l9_1036;
bool l9_1039=l9_1015;
bool l9_1040;
if (l9_1039)
{
l9_1040=l9_1012.y==3;
}
else
{
l9_1040=l9_1039;
}
float l9_1041=l9_1009.y;
float l9_1042=l9_1014.y;
float l9_1043=l9_1014.w;
bool l9_1044=l9_1040;
float l9_1045=l9_1019;
float l9_1046=fast::clamp(l9_1041,l9_1042,l9_1043);
float l9_1047=step(abs(l9_1041-l9_1046),1e-05);
l9_1045*=(l9_1047+((1.0-float(l9_1044))*(1.0-l9_1047)));
l9_1041=l9_1046;
l9_1009.y=l9_1041;
l9_1019=l9_1045;
}
float2 l9_1048=l9_1009;
bool l9_1049=l9_1010;
float3x3 l9_1050=l9_1011;
if (l9_1049)
{
l9_1048=float2((l9_1050*float3(l9_1048,1.0)).xy);
}
float2 l9_1051=l9_1048;
float2 l9_1052=l9_1051;
float2 l9_1053=l9_1052;
l9_1009=l9_1053;
float l9_1054=l9_1009.x;
int l9_1055=l9_1012.x;
bool l9_1056=l9_1018;
float l9_1057=l9_1019;
if ((l9_1055==0)||(l9_1055==3))
{
float l9_1058=l9_1054;
float l9_1059=0.0;
float l9_1060=1.0;
bool l9_1061=l9_1056;
float l9_1062=l9_1057;
float l9_1063=fast::clamp(l9_1058,l9_1059,l9_1060);
float l9_1064=step(abs(l9_1058-l9_1063),1e-05);
l9_1062*=(l9_1064+((1.0-float(l9_1061))*(1.0-l9_1064)));
l9_1058=l9_1063;
l9_1054=l9_1058;
l9_1057=l9_1062;
}
l9_1009.x=l9_1054;
l9_1019=l9_1057;
float l9_1065=l9_1009.y;
int l9_1066=l9_1012.y;
bool l9_1067=l9_1018;
float l9_1068=l9_1019;
if ((l9_1066==0)||(l9_1066==3))
{
float l9_1069=l9_1065;
float l9_1070=0.0;
float l9_1071=1.0;
bool l9_1072=l9_1067;
float l9_1073=l9_1068;
float l9_1074=fast::clamp(l9_1069,l9_1070,l9_1071);
float l9_1075=step(abs(l9_1069-l9_1074),1e-05);
l9_1073*=(l9_1075+((1.0-float(l9_1072))*(1.0-l9_1075)));
l9_1069=l9_1074;
l9_1065=l9_1069;
l9_1068=l9_1073;
}
l9_1009.y=l9_1065;
l9_1019=l9_1068;
float2 l9_1076=l9_1006;
float2 l9_1077=l9_1009;
int l9_1078=l9_1007;
int l9_1079=l9_1008;
float l9_1080=l9_1017;
float2 l9_1081=l9_1077;
int l9_1082=l9_1078;
int l9_1083=l9_1079;
float3 l9_1084;
if (l9_1082==0)
{
l9_1084=float3(l9_1081,0.0);
}
else
{
if (l9_1082==1)
{
l9_1084=float3(l9_1081.x,(l9_1081.y*0.5)+(0.5-(float(l9_1083)*0.5)),0.0);
}
else
{
l9_1084=float3(l9_1081,float(l9_1083));
}
}
float3 l9_1085=l9_1084;
float3 l9_1086=l9_1085;
float2 l9_1087=l9_1076;
float2 l9_1088=l9_1086.xy;
float l9_1089=l9_1080;
float4 l9_1090=sc_set2.materialParamsTex.sample(sc_set2.materialParamsTexSmpSC,l9_1088,bias(l9_1089));
float4 l9_1091=l9_1090;
float4 l9_1092=l9_1091;
if (l9_1015)
{
l9_1092=mix(l9_1016,l9_1092,float4(l9_1019));
}
float4 l9_1093=l9_1092;
float4 l9_1094=l9_1093;
l9_997=l9_1093;
float4 l9_1095=l9_997;
float3 l9_1096=l9_1095.xyz;
N7_Metallic=l9_1096.x*N7_MetallicValue;
N7_Roughness=l9_1096.y*N7_RoughnessValue;
if (N7_VertexColorSwitch==3)
{
float4 l9_1097=tempGlobals.VertexColor;
N7_AO=float3(l9_1096.z)*l9_1097.xyz;
}
else
{
N7_AO=float3(l9_1096.z);
}
if (N7_EnableSpecularAO)
{
N7_SpecularAO=mix(float3(0.04),N7_Albedo.xyz*N7_Metallic,float3(N7_Metallic));
N7_SpecularAO=mix((N7_SpecularAO*(1.0-N7_Darkening))*N7_SpecularAO,float3(1.0),float3(N7_AO.x));
N7_SpecularAO=mix(float3(1.0),N7_SpecularAO,float3(N7_Intensity));
}
else
{
N7_SpecularAO=float3(1.0);
}
if (N7_EnableSimpleReflection)
{
N7_SpecularAO=float3(0.0);
}
param_113=N7_Albedo;
param_114=N7_Opacity;
param_115=N7_Normal;
param_116=N7_Emissive;
param_117=N7_Metallic;
param_118=N7_Roughness;
param_119=N7_AO;
param_120=N7_SpecularAO;
Albedo_N7=param_113;
Opacity_N7=param_114;
Normal_N7=param_115;
Emissive_N7=param_116;
Metallic_N7=param_117;
Roughness_N7=param_118;
AO_N7=param_119;
SpecularAO_N7=param_120;
float4 Output_N36=float4(0.0);
float3 param_122=Albedo_N7.xyz;
float param_123=Opacity_N7;
float3 param_124=Normal_N7;
float3 param_125=Emissive_N7;
float param_126=Metallic_N7;
float param_127=Roughness_N7;
float3 param_128=AO_N7;
float3 param_129=SpecularAO_N7;
ssGlobals param_131=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_131.BumpedNormal=param_124;
}
param_123=fast::clamp(param_123,0.0,1.0);
float l9_1098=param_123;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_1098<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1099=gl_FragCoord;
float2 l9_1100=floor(mod(l9_1099.xy,float2(4.0)));
float l9_1101=(mod(dot(l9_1100,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_1098<l9_1101)
{
discard_fragment();
}
}
param_122=fast::max(param_122,float3(0.0));
float4 param_130;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_125=fast::max(param_125,float3(0.0));
param_126=fast::clamp(param_126,0.0,1.0);
param_127=fast::clamp(param_127,0.0,1.0);
param_128=fast::clamp(param_128,float3(0.0),float3(1.0));
param_129=fast::clamp(param_129,float3(0.0),float3(1.0));
float3 l9_1102=param_122;
float l9_1103=param_123;
float3 l9_1104=param_131.BumpedNormal;
float3 l9_1105=param_131.PositionWS;
float3 l9_1106=param_131.ViewDirWS;
float3 l9_1107=param_125;
float l9_1108=param_126;
float l9_1109=param_127;
float3 l9_1110=param_128;
float3 l9_1111=param_129;
SurfaceProperties l9_1112;
l9_1112.albedo=float3(0.0);
l9_1112.opacity=1.0;
l9_1112.normal=float3(0.0);
l9_1112.positionWS=float3(0.0);
l9_1112.viewDirWS=float3(0.0);
l9_1112.metallic=0.0;
l9_1112.roughness=0.0;
l9_1112.emissive=float3(0.0);
l9_1112.ao=float3(1.0);
l9_1112.specularAo=float3(1.0);
l9_1112.bakedShadows=float3(1.0);
SurfaceProperties l9_1113=l9_1112;
SurfaceProperties l9_1114=l9_1113;
l9_1114.opacity=l9_1103;
float3 l9_1115=l9_1102;
float3 l9_1116;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1116=float3(pow(l9_1115.x,2.2),pow(l9_1115.y,2.2),pow(l9_1115.z,2.2));
}
else
{
l9_1116=l9_1115*l9_1115;
}
float3 l9_1117=l9_1116;
l9_1114.albedo=l9_1117;
l9_1114.normal=normalize(l9_1104);
l9_1114.positionWS=l9_1105;
l9_1114.viewDirWS=l9_1106;
float3 l9_1118=l9_1107;
float3 l9_1119;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1119=float3(pow(l9_1118.x,2.2),pow(l9_1118.y,2.2),pow(l9_1118.z,2.2));
}
else
{
l9_1119=l9_1118*l9_1118;
}
float3 l9_1120=l9_1119;
l9_1114.emissive=l9_1120;
l9_1114.metallic=l9_1108;
l9_1114.roughness=l9_1109;
l9_1114.ao=l9_1110;
l9_1114.specularAo=l9_1111;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_1121=l9_1114.positionWS;
l9_1114.ao=evaluateSSAO(l9_1121,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.sc_SSAOTexture,sc_set2.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_1122=l9_1114;
SurfaceProperties l9_1123=l9_1122;
float3 l9_1124=mix(float3(0.04),l9_1123.albedo*l9_1123.metallic,float3(l9_1123.metallic));
float3 l9_1125=mix(l9_1123.albedo*(1.0-l9_1123.metallic),float3(0.0),float3(l9_1123.metallic));
l9_1122.albedo=l9_1125;
l9_1122.specColor=l9_1124;
SurfaceProperties l9_1126=l9_1122;
l9_1114=l9_1126;
SurfaceProperties l9_1127=l9_1114;
LightingComponents l9_1128;
l9_1128.directDiffuse=float3(0.0);
l9_1128.directSpecular=float3(0.0);
l9_1128.indirectDiffuse=float3(1.0);
l9_1128.indirectSpecular=float3(0.0);
l9_1128.emitted=float3(0.0);
l9_1128.transmitted=float3(0.0);
LightingComponents l9_1129=l9_1128;
LightingComponents l9_1130=l9_1129;
float3 l9_1131=l9_1127.viewDirWS;
int l9_1132=0;
float4 l9_1133=float4(l9_1127.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_1134;
LightProperties l9_1135;
int l9_1136=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1136<sc_DirectionalLightsCount_tmp)
{
l9_1134.direction=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_1136].direction;
l9_1134.color=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_1136].color;
l9_1135.direction=l9_1134.direction;
l9_1135.color=l9_1134.color.xyz;
l9_1135.attenuation=l9_1134.color.w;
l9_1135.attenuation*=l9_1133[(l9_1132<3) ? l9_1132 : 3];
l9_1132++;
LightingComponents l9_1137=l9_1130;
LightProperties l9_1138=l9_1135;
SurfaceProperties l9_1139=l9_1127;
float3 l9_1140=l9_1131;
SurfaceProperties l9_1141=l9_1139;
float3 l9_1142=l9_1138.direction;
float l9_1143=dot(l9_1141.normal,l9_1142);
float l9_1144=fast::clamp(l9_1143,0.0,1.0);
float3 l9_1145=float3(l9_1144);
l9_1137.directDiffuse+=((l9_1145*l9_1138.color)*l9_1138.attenuation);
SurfaceProperties l9_1146=l9_1139;
float3 l9_1147=l9_1138.direction;
float3 l9_1148=l9_1140;
l9_1137.directSpecular+=((calculateDirectSpecular(l9_1146,l9_1147,l9_1148)*l9_1138.color)*l9_1138.attenuation);
LightingComponents l9_1149=l9_1137;
l9_1130=l9_1149;
l9_1136++;
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
sc_PointLight_t_1 l9_1150;
LightProperties l9_1151;
int l9_1152=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1152<sc_PointLightsCount_tmp)
{
l9_1150.falloffEnabled=(*sc_set2.UserUniforms).sc_PointLights[l9_1152].falloffEnabled!=0;
l9_1150.falloffEndDistance=(*sc_set2.UserUniforms).sc_PointLights[l9_1152].falloffEndDistance;
l9_1150.negRcpFalloffEndDistance4=(*sc_set2.UserUniforms).sc_PointLights[l9_1152].negRcpFalloffEndDistance4;
l9_1150.angleScale=(*sc_set2.UserUniforms).sc_PointLights[l9_1152].angleScale;
l9_1150.angleOffset=(*sc_set2.UserUniforms).sc_PointLights[l9_1152].angleOffset;
l9_1150.direction=(*sc_set2.UserUniforms).sc_PointLights[l9_1152].direction;
l9_1150.position=(*sc_set2.UserUniforms).sc_PointLights[l9_1152].position;
l9_1150.color=(*sc_set2.UserUniforms).sc_PointLights[l9_1152].color;
float3 l9_1153=l9_1150.position-l9_1127.positionWS;
l9_1151.direction=normalize(l9_1153);
l9_1151.color=l9_1150.color.xyz;
l9_1151.attenuation=l9_1150.color.w;
l9_1151.attenuation*=l9_1133[(l9_1132<3) ? l9_1132 : 3];
float3 l9_1154=l9_1151.direction;
float3 l9_1155=l9_1150.direction;
float l9_1156=l9_1150.angleScale;
float l9_1157=l9_1150.angleOffset;
float l9_1158=dot(l9_1154,l9_1155);
float l9_1159=fast::clamp((l9_1158*l9_1156)+l9_1157,0.0,1.0);
float l9_1160=l9_1159*l9_1159;
l9_1151.attenuation*=l9_1160;
if (l9_1150.falloffEnabled)
{
float l9_1161=length(l9_1153);
float l9_1162=l9_1150.falloffEndDistance;
l9_1151.attenuation*=computeDistanceAttenuation(l9_1161,l9_1162);
}
l9_1132++;
LightingComponents l9_1163=l9_1130;
LightProperties l9_1164=l9_1151;
SurfaceProperties l9_1165=l9_1127;
float3 l9_1166=l9_1131;
SurfaceProperties l9_1167=l9_1165;
float3 l9_1168=l9_1164.direction;
float l9_1169=dot(l9_1167.normal,l9_1168);
float l9_1170=fast::clamp(l9_1169,0.0,1.0);
float3 l9_1171=float3(l9_1170);
l9_1163.directDiffuse+=((l9_1171*l9_1164.color)*l9_1164.attenuation);
SurfaceProperties l9_1172=l9_1165;
float3 l9_1173=l9_1164.direction;
float3 l9_1174=l9_1166;
l9_1163.directSpecular+=((calculateDirectSpecular(l9_1172,l9_1173,l9_1174)*l9_1164.color)*l9_1164.attenuation);
LightingComponents l9_1175=l9_1163;
l9_1130=l9_1175;
l9_1152++;
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
float3 l9_1176;
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_1177=abs(in.varShadowTex-float2(0.5));
float l9_1178=fast::max(l9_1177.x,l9_1177.y);
float l9_1179=step(l9_1178,0.5);
float4 l9_1180=sc_set2.sc_ShadowTexture.sample(sc_set2.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_1179;
float3 l9_1181=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_1180.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float l9_1182=l9_1180.w*(*sc_set2.UserUniforms).sc_ShadowDensity;
l9_1176=mix(float3(1.0),l9_1181,float3(l9_1182));
}
else
{
l9_1176=float3(1.0);
}
float3 l9_1183=l9_1176;
float3 l9_1184=l9_1183;
l9_1130.directDiffuse*=l9_1184;
l9_1130.directSpecular*=l9_1184;
}
SurfaceProperties l9_1185=l9_1127;
float3 l9_1186=l9_1185.normal;
float3 l9_1187=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_1188=l9_1186;
float3 l9_1189=l9_1188;
float l9_1190=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float l9_1191=l9_1189.x;
float l9_1192=-l9_1189.z;
float l9_1193=(l9_1191<0.0) ? (-1.0) : 1.0;
float l9_1194=l9_1193*acos(fast::clamp(l9_1192/length(float2(l9_1191,l9_1192)),-1.0,1.0));
float2 l9_1195;
l9_1195.x=l9_1194-1.5708;
l9_1195.y=acos(l9_1189.y);
l9_1195/=float2(6.28319,3.14159);
l9_1195.y=1.0-l9_1195.y;
l9_1195.x+=(l9_1190/360.0);
l9_1195.x=fract((l9_1195.x+floor(l9_1195.x))+1.0);
float2 l9_1196=l9_1195;
float2 l9_1197=l9_1196;
float4 l9_1198;
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_1199=l9_1197;
float2 l9_1200=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1201=5.0;
l9_1197=calcSeamlessPanoramicUvsForSampling(l9_1199,l9_1200,l9_1201);
}
float2 l9_1202=l9_1197;
float l9_1203=13.0;
int l9_1204;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1205;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1205=0;
}
else
{
l9_1205=in.varStereoViewID;
}
int l9_1206=l9_1205;
l9_1204=1-l9_1206;
}
else
{
int l9_1207;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1207=0;
}
else
{
l9_1207=in.varStereoViewID;
}
int l9_1208=l9_1207;
l9_1204=l9_1208;
}
int l9_1209=l9_1204;
float2 l9_1210=l9_1202;
int l9_1211=l9_1209;
float l9_1212=l9_1203;
float2 l9_1213=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_1214=l9_1213;
float2 l9_1215=l9_1210;
int l9_1216=sc_EnvmapSpecularLayout_tmp;
int l9_1217=l9_1211;
float l9_1218=l9_1212;
float2 l9_1219=l9_1215;
int l9_1220=l9_1216;
int l9_1221=l9_1217;
float3 l9_1222;
if (l9_1220==0)
{
l9_1222=float3(l9_1219,0.0);
}
else
{
if (l9_1220==1)
{
l9_1222=float3(l9_1219.x,(l9_1219.y*0.5)+(0.5-(float(l9_1221)*0.5)),0.0);
}
else
{
l9_1222=float3(l9_1219,float(l9_1221));
}
}
float3 l9_1223=l9_1222;
float3 l9_1224=l9_1223;
float2 l9_1225=l9_1214;
float2 l9_1226=l9_1224.xy;
float l9_1227=l9_1218;
float4 l9_1228=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_1226,bias(l9_1227));
float4 l9_1229=l9_1228;
float4 l9_1230=l9_1229;
float4 l9_1231=l9_1230;
float4 l9_1232=l9_1231;
l9_1198=l9_1232;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_1233=l9_1197;
float2 l9_1234=(*sc_set2.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_1235=0.0;
l9_1197=calcSeamlessPanoramicUvsForSampling(l9_1233,l9_1234,l9_1235);
float2 l9_1236=l9_1197;
float l9_1237=-13.0;
int l9_1238;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_1239;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1239=0;
}
else
{
l9_1239=in.varStereoViewID;
}
int l9_1240=l9_1239;
l9_1238=1-l9_1240;
}
else
{
int l9_1241;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1241=0;
}
else
{
l9_1241=in.varStereoViewID;
}
int l9_1242=l9_1241;
l9_1238=l9_1242;
}
int l9_1243=l9_1238;
float2 l9_1244=l9_1236;
int l9_1245=l9_1243;
float l9_1246=l9_1237;
float2 l9_1247=(*sc_set2.UserUniforms).sc_EnvmapDiffuseDims.xy;
float2 l9_1248=l9_1247;
float2 l9_1249=l9_1244;
int l9_1250=sc_EnvmapDiffuseLayout_tmp;
int l9_1251=l9_1245;
float l9_1252=l9_1246;
float2 l9_1253=l9_1249;
int l9_1254=l9_1250;
int l9_1255=l9_1251;
float3 l9_1256;
if (l9_1254==0)
{
l9_1256=float3(l9_1253,0.0);
}
else
{
if (l9_1254==1)
{
l9_1256=float3(l9_1253.x,(l9_1253.y*0.5)+(0.5-(float(l9_1255)*0.5)),0.0);
}
else
{
l9_1256=float3(l9_1253,float(l9_1255));
}
}
float3 l9_1257=l9_1256;
float3 l9_1258=l9_1257;
float2 l9_1259=l9_1248;
float2 l9_1260=l9_1258.xy;
float l9_1261=l9_1252;
float4 l9_1262=sc_set2.sc_EnvmapDiffuse.sample(sc_set2.sc_EnvmapDiffuseSmpSC,l9_1260,bias(l9_1261));
float4 l9_1263=l9_1262;
float4 l9_1264=l9_1263;
float4 l9_1265=l9_1264;
float4 l9_1266=l9_1265;
l9_1198=l9_1266;
}
else
{
float2 l9_1267=l9_1197;
float l9_1268=13.0;
int l9_1269;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1270;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1270=0;
}
else
{
l9_1270=in.varStereoViewID;
}
int l9_1271=l9_1270;
l9_1269=1-l9_1271;
}
else
{
int l9_1272;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1272=0;
}
else
{
l9_1272=in.varStereoViewID;
}
int l9_1273=l9_1272;
l9_1269=l9_1273;
}
int l9_1274=l9_1269;
float2 l9_1275=l9_1267;
int l9_1276=l9_1274;
float l9_1277=l9_1268;
float2 l9_1278=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_1279=l9_1278;
float2 l9_1280=l9_1275;
int l9_1281=sc_EnvmapSpecularLayout_tmp;
int l9_1282=l9_1276;
float l9_1283=l9_1277;
float2 l9_1284=l9_1280;
int l9_1285=l9_1281;
int l9_1286=l9_1282;
float3 l9_1287;
if (l9_1285==0)
{
l9_1287=float3(l9_1284,0.0);
}
else
{
if (l9_1285==1)
{
l9_1287=float3(l9_1284.x,(l9_1284.y*0.5)+(0.5-(float(l9_1286)*0.5)),0.0);
}
else
{
l9_1287=float3(l9_1284,float(l9_1286));
}
}
float3 l9_1288=l9_1287;
float3 l9_1289=l9_1288;
float2 l9_1290=l9_1279;
float2 l9_1291=l9_1289.xy;
float l9_1292=l9_1283;
float4 l9_1293=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_1291,bias(l9_1292));
float4 l9_1294=l9_1293;
float4 l9_1295=l9_1294;
float4 l9_1296=l9_1295;
float4 l9_1297=l9_1296;
l9_1198=l9_1297;
}
}
float4 l9_1298=l9_1198;
float3 l9_1299=l9_1298.xyz*(1.0/l9_1298.w);
float3 l9_1300=l9_1299*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_1187=l9_1300;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_1301=(*sc_set2.UserUniforms).sc_Sh[0];
float3 l9_1302=(*sc_set2.UserUniforms).sc_Sh[1];
float3 l9_1303=(*sc_set2.UserUniforms).sc_Sh[2];
float3 l9_1304=(*sc_set2.UserUniforms).sc_Sh[3];
float3 l9_1305=(*sc_set2.UserUniforms).sc_Sh[4];
float3 l9_1306=(*sc_set2.UserUniforms).sc_Sh[5];
float3 l9_1307=(*sc_set2.UserUniforms).sc_Sh[6];
float3 l9_1308=(*sc_set2.UserUniforms).sc_Sh[7];
float3 l9_1309=(*sc_set2.UserUniforms).sc_Sh[8];
float3 l9_1310=-l9_1186;
float l9_1311=l9_1310.x;
float l9_1312=l9_1310.y;
float l9_1313=l9_1310.z;
float l9_1314=l9_1311*l9_1311;
float l9_1315=l9_1312*l9_1312;
float l9_1316=l9_1313*l9_1313;
float l9_1317=l9_1311*l9_1312;
float l9_1318=l9_1312*l9_1313;
float l9_1319=l9_1311*l9_1313;
float3 l9_1320=((((((l9_1309*0.429043)*(l9_1314-l9_1315))+((l9_1307*0.743125)*l9_1316))+(l9_1301*0.886227))-(l9_1307*0.247708))+((((l9_1305*l9_1317)+(l9_1308*l9_1319))+(l9_1306*l9_1318))*0.858086))+((((l9_1304*l9_1311)+(l9_1302*l9_1312))+(l9_1303*l9_1313))*1.02333);
l9_1187=l9_1320*(*sc_set2.UserUniforms).sc_ShIntensity;
}
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_1187+=((*sc_set2.UserUniforms).sc_AmbientLights[0].color*(*sc_set2.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_1187.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_1187+=((*sc_set2.UserUniforms).sc_AmbientLights[1].color*(*sc_set2.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_1187.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_1187+=((*sc_set2.UserUniforms).sc_AmbientLights[2].color*(*sc_set2.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_1187.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_1321=l9_1186;
float3 l9_1322=(*sc_set2.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_1323;
float l9_1324;
int l9_1325=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1325<sc_LightEstimationSGCount_tmp)
{
l9_1323.color=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_1325].color;
l9_1323.sharpness=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_1325].sharpness;
l9_1323.axis=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_1325].axis;
float3 l9_1326=l9_1321;
float l9_1327=dot(l9_1323.axis,l9_1326);
float l9_1328=l9_1323.sharpness;
float l9_1329=0.36;
float l9_1330=1.0/(4.0*l9_1329);
float l9_1331=exp(-l9_1328);
float l9_1332=l9_1331*l9_1331;
float l9_1333=1.0/l9_1328;
float l9_1334=(1.0+(2.0*l9_1332))-l9_1333;
float l9_1335=((l9_1331-l9_1332)*l9_1333)-l9_1332;
float l9_1336=sqrt(1.0-l9_1334);
float l9_1337=l9_1329*l9_1327;
float l9_1338=l9_1330*l9_1336;
float l9_1339=l9_1337+l9_1338;
float l9_1340=l9_1327;
float l9_1341=fast::clamp(l9_1340,0.0,1.0);
float l9_1342=l9_1341;
if (step(abs(l9_1337),l9_1338)>0.5)
{
l9_1324=(l9_1339*l9_1339)/l9_1336;
}
else
{
l9_1324=l9_1342;
}
l9_1342=l9_1324;
float l9_1343=(l9_1334*l9_1342)+l9_1335;
sc_SphericalGaussianLight_t l9_1344=l9_1323;
float3 l9_1345=(l9_1344.color/float3(l9_1344.sharpness))*6.28319;
float3 l9_1346=(l9_1345*l9_1343)/float3(3.14159);
l9_1322+=l9_1346;
l9_1325++;
continue;
}
else
{
break;
}
}
float3 l9_1347=l9_1322;
l9_1187+=l9_1347;
}
float3 l9_1348=l9_1187;
float3 l9_1349=l9_1348;
l9_1130.indirectDiffuse=l9_1349;
SurfaceProperties l9_1350=l9_1127;
float3 l9_1351=l9_1131;
float3 l9_1352=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_1353=l9_1350;
float3 l9_1354=l9_1351;
float3 l9_1355=l9_1353.normal;
float3 l9_1356=reflect(-l9_1354,l9_1355);
float3 l9_1357=l9_1355;
float3 l9_1358=l9_1356;
float l9_1359=l9_1353.roughness;
l9_1356=getSpecularDominantDir(l9_1357,l9_1358,l9_1359);
float l9_1360=l9_1353.roughness;
float l9_1361=pow(l9_1360,0.666667);
float l9_1362=fast::clamp(l9_1361,0.0,1.0);
float l9_1363=l9_1362*5.0;
float l9_1364=l9_1363;
float l9_1365=l9_1364;
float3 l9_1366=l9_1356;
float l9_1367=l9_1365;
float3 l9_1368=l9_1366;
float l9_1369=l9_1367;
float3 l9_1370=l9_1368;
float l9_1371=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float l9_1372=l9_1370.x;
float l9_1373=-l9_1370.z;
float l9_1374=(l9_1372<0.0) ? (-1.0) : 1.0;
float l9_1375=l9_1374*acos(fast::clamp(l9_1373/length(float2(l9_1372,l9_1373)),-1.0,1.0));
float2 l9_1376;
l9_1376.x=l9_1375-1.5708;
l9_1376.y=acos(l9_1370.y);
l9_1376/=float2(6.28319,3.14159);
l9_1376.y=1.0-l9_1376.y;
l9_1376.x+=(l9_1371/360.0);
l9_1376.x=fract((l9_1376.x+floor(l9_1376.x))+1.0);
float2 l9_1377=l9_1376;
float2 l9_1378=l9_1377;
float4 l9_1379;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_1380=floor(l9_1369);
float l9_1381=ceil(l9_1369);
float l9_1382=l9_1369-l9_1380;
float2 l9_1383=l9_1378;
float2 l9_1384=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1385=l9_1380;
float2 l9_1386=calcSeamlessPanoramicUvsForSampling(l9_1383,l9_1384,l9_1385);
float2 l9_1387=l9_1386;
float l9_1388=l9_1380;
float2 l9_1389=l9_1387;
float l9_1390=l9_1388;
int l9_1391;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1392;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1392=0;
}
else
{
l9_1392=in.varStereoViewID;
}
int l9_1393=l9_1392;
l9_1391=1-l9_1393;
}
else
{
int l9_1394;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1394=0;
}
else
{
l9_1394=in.varStereoViewID;
}
int l9_1395=l9_1394;
l9_1391=l9_1395;
}
int l9_1396=l9_1391;
float2 l9_1397=l9_1389;
int l9_1398=l9_1396;
float l9_1399=l9_1390;
float2 l9_1400=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_1401=l9_1400;
float2 l9_1402=l9_1397;
int l9_1403=sc_EnvmapSpecularLayout_tmp;
int l9_1404=l9_1398;
float l9_1405=l9_1399;
float2 l9_1406=l9_1402;
int l9_1407=l9_1403;
int l9_1408=l9_1404;
float3 l9_1409;
if (l9_1407==0)
{
l9_1409=float3(l9_1406,0.0);
}
else
{
if (l9_1407==1)
{
l9_1409=float3(l9_1406.x,(l9_1406.y*0.5)+(0.5-(float(l9_1408)*0.5)),0.0);
}
else
{
l9_1409=float3(l9_1406,float(l9_1408));
}
}
float3 l9_1410=l9_1409;
float3 l9_1411=l9_1410;
float2 l9_1412=l9_1401;
float2 l9_1413=l9_1411.xy;
float l9_1414=l9_1405;
float4 l9_1415=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_1413,level(l9_1414));
float4 l9_1416=l9_1415;
float4 l9_1417=l9_1416;
float4 l9_1418=l9_1417;
float4 l9_1419=l9_1418;
float4 l9_1420=l9_1419;
float4 l9_1421=l9_1420;
float2 l9_1422=l9_1378;
float2 l9_1423=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1424=l9_1381;
float2 l9_1425=calcSeamlessPanoramicUvsForSampling(l9_1422,l9_1423,l9_1424);
float2 l9_1426=l9_1425;
float l9_1427=l9_1381;
float2 l9_1428=l9_1426;
float l9_1429=l9_1427;
int l9_1430;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1431;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1431=0;
}
else
{
l9_1431=in.varStereoViewID;
}
int l9_1432=l9_1431;
l9_1430=1-l9_1432;
}
else
{
int l9_1433;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1433=0;
}
else
{
l9_1433=in.varStereoViewID;
}
int l9_1434=l9_1433;
l9_1430=l9_1434;
}
int l9_1435=l9_1430;
float2 l9_1436=l9_1428;
int l9_1437=l9_1435;
float l9_1438=l9_1429;
float2 l9_1439=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_1440=l9_1439;
float2 l9_1441=l9_1436;
int l9_1442=sc_EnvmapSpecularLayout_tmp;
int l9_1443=l9_1437;
float l9_1444=l9_1438;
float2 l9_1445=l9_1441;
int l9_1446=l9_1442;
int l9_1447=l9_1443;
float3 l9_1448;
if (l9_1446==0)
{
l9_1448=float3(l9_1445,0.0);
}
else
{
if (l9_1446==1)
{
l9_1448=float3(l9_1445.x,(l9_1445.y*0.5)+(0.5-(float(l9_1447)*0.5)),0.0);
}
else
{
l9_1448=float3(l9_1445,float(l9_1447));
}
}
float3 l9_1449=l9_1448;
float3 l9_1450=l9_1449;
float2 l9_1451=l9_1440;
float2 l9_1452=l9_1450.xy;
float l9_1453=l9_1444;
float4 l9_1454=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_1452,level(l9_1453));
float4 l9_1455=l9_1454;
float4 l9_1456=l9_1455;
float4 l9_1457=l9_1456;
float4 l9_1458=l9_1457;
float4 l9_1459=l9_1458;
float4 l9_1460=l9_1459;
l9_1379=mix(l9_1421,l9_1460,float4(l9_1382));
}
else
{
float2 l9_1461=l9_1378;
float l9_1462=l9_1369;
float2 l9_1463=l9_1461;
float l9_1464=l9_1462;
int l9_1465;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1466;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1466=0;
}
else
{
l9_1466=in.varStereoViewID;
}
int l9_1467=l9_1466;
l9_1465=1-l9_1467;
}
else
{
int l9_1468;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1468=0;
}
else
{
l9_1468=in.varStereoViewID;
}
int l9_1469=l9_1468;
l9_1465=l9_1469;
}
int l9_1470=l9_1465;
float2 l9_1471=l9_1463;
int l9_1472=l9_1470;
float l9_1473=l9_1464;
float2 l9_1474=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_1475=l9_1474;
float2 l9_1476=l9_1471;
int l9_1477=sc_EnvmapSpecularLayout_tmp;
int l9_1478=l9_1472;
float l9_1479=l9_1473;
float2 l9_1480=l9_1476;
int l9_1481=l9_1477;
int l9_1482=l9_1478;
float3 l9_1483;
if (l9_1481==0)
{
l9_1483=float3(l9_1480,0.0);
}
else
{
if (l9_1481==1)
{
l9_1483=float3(l9_1480.x,(l9_1480.y*0.5)+(0.5-(float(l9_1482)*0.5)),0.0);
}
else
{
l9_1483=float3(l9_1480,float(l9_1482));
}
}
float3 l9_1484=l9_1483;
float3 l9_1485=l9_1484;
float2 l9_1486=l9_1475;
float2 l9_1487=l9_1485.xy;
float l9_1488=l9_1479;
float4 l9_1489=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_1487,level(l9_1488));
float4 l9_1490=l9_1489;
float4 l9_1491=l9_1490;
float4 l9_1492=l9_1491;
float4 l9_1493=l9_1492;
float4 l9_1494=l9_1493;
l9_1379=l9_1494;
}
float4 l9_1495=l9_1379;
float3 l9_1496=l9_1495.xyz*(1.0/l9_1495.w);
float3 l9_1497=l9_1496;
float3 l9_1498=l9_1497*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_1498+=float3(1e-06);
float3 l9_1499=l9_1498;
float3 l9_1500=l9_1499;
SurfaceProperties l9_1501=l9_1353;
float l9_1502=abs(dot(l9_1355,l9_1354));
float3 l9_1503=l9_1500*envBRDFApprox(l9_1501,l9_1502);
l9_1352+=l9_1503;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_1504=l9_1350;
float3 l9_1505=l9_1351;
float l9_1506=fast::clamp(l9_1504.roughness*l9_1504.roughness,0.01,1.0);
float3 l9_1507=(*sc_set2.UserUniforms).sc_LightEstimationData.ambientLight*l9_1504.specColor;
sc_SphericalGaussianLight_t l9_1508;
sc_SphericalGaussianLight_t l9_1509;
sc_SphericalGaussianLight_t l9_1510;
int l9_1511=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_1511<sc_LightEstimationSGCount_tmp)
{
l9_1508.color=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_1511].color;
l9_1508.sharpness=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_1511].sharpness;
l9_1508.axis=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_1511].axis;
float3 l9_1512=l9_1504.normal;
float l9_1513=l9_1506;
float3 l9_1514=l9_1505;
float3 l9_1515=l9_1504.specColor;
float3 l9_1516=l9_1512;
float l9_1517=l9_1513;
l9_1509.axis=l9_1516;
float l9_1518=l9_1517*l9_1517;
l9_1509.sharpness=2.0/l9_1518;
l9_1509.color=float3(1.0/(3.14159*l9_1518));
sc_SphericalGaussianLight_t l9_1519=l9_1509;
sc_SphericalGaussianLight_t l9_1520=l9_1519;
sc_SphericalGaussianLight_t l9_1521=l9_1520;
float3 l9_1522=l9_1514;
l9_1510.axis=reflect(-l9_1522,l9_1521.axis);
l9_1510.color=l9_1521.color;
l9_1510.sharpness=l9_1521.sharpness;
l9_1510.sharpness/=(4.0*fast::max(dot(l9_1521.axis,l9_1522),0.0001));
sc_SphericalGaussianLight_t l9_1523=l9_1510;
sc_SphericalGaussianLight_t l9_1524=l9_1523;
sc_SphericalGaussianLight_t l9_1525=l9_1524;
sc_SphericalGaussianLight_t l9_1526=l9_1508;
float l9_1527=length((l9_1525.axis*l9_1525.sharpness)+(l9_1526.axis*l9_1526.sharpness));
float3 l9_1528=(l9_1525.color*exp((l9_1527-l9_1525.sharpness)-l9_1526.sharpness))*l9_1526.color;
float l9_1529=1.0-exp((-2.0)*l9_1527);
float3 l9_1530=((l9_1528*6.28319)*l9_1529)/float3(l9_1527);
float3 l9_1531=l9_1530;
float3 l9_1532=l9_1524.axis;
float l9_1533=l9_1513*l9_1513;
float l9_1534=dot(l9_1512,l9_1532);
float l9_1535=fast::clamp(l9_1534,0.0,1.0);
float l9_1536=l9_1535;
float l9_1537=dot(l9_1512,l9_1514);
float l9_1538=fast::clamp(l9_1537,0.0,1.0);
float l9_1539=l9_1538;
float3 l9_1540=normalize(l9_1524.axis+l9_1514);
float l9_1541=l9_1533;
float l9_1542=l9_1536;
float l9_1543=1.0/(l9_1542+sqrt(l9_1541+(((1.0-l9_1541)*l9_1542)*l9_1542)));
float l9_1544=l9_1533;
float l9_1545=l9_1539;
float l9_1546=1.0/(l9_1545+sqrt(l9_1544+(((1.0-l9_1544)*l9_1545)*l9_1545)));
l9_1531*=(l9_1543*l9_1546);
float l9_1547=dot(l9_1532,l9_1540);
float l9_1548=fast::clamp(l9_1547,0.0,1.0);
float l9_1549=pow(1.0-l9_1548,5.0);
l9_1531*=(l9_1515+((float3(1.0)-l9_1515)*l9_1549));
l9_1531*=l9_1536;
float3 l9_1550=l9_1531;
l9_1507+=l9_1550;
l9_1511++;
continue;
}
else
{
break;
}
}
float3 l9_1551=l9_1507;
l9_1352+=l9_1551;
}
float3 l9_1552=l9_1352;
l9_1130.indirectSpecular=l9_1552;
LightingComponents l9_1553=l9_1130;
LightingComponents l9_1554=l9_1553;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1554.directDiffuse=float3(0.0);
l9_1554.indirectDiffuse=float3(0.0);
float4 l9_1555;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1556=out.FragColor0;
float4 l9_1557=l9_1556;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1557.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1558=l9_1557;
l9_1555=l9_1558;
}
else
{
float4 l9_1559=gl_FragCoord;
float2 l9_1560=(l9_1559.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_1561=l9_1560;
float2 l9_1562;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_1563=float3(l9_1561,0.0);
int l9_1564=1;
int l9_1565;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1565=0;
}
else
{
l9_1565=in.varStereoViewID;
}
int l9_1566=l9_1565;
int l9_1567=l9_1566;
float3 l9_1568=float3(l9_1561,0.0);
int l9_1569=l9_1564;
int l9_1570=l9_1567;
if (l9_1569==1)
{
l9_1568.y=((2.0*l9_1568.y)+float(l9_1570))-1.0;
}
float2 l9_1571=l9_1568.xy;
l9_1562=l9_1571;
}
else
{
l9_1562=l9_1561;
}
float2 l9_1572=l9_1562;
float2 l9_1573=l9_1572;
float2 l9_1574=l9_1573;
int l9_1575;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1576;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1576=0;
}
else
{
l9_1576=in.varStereoViewID;
}
int l9_1577=l9_1576;
l9_1575=1-l9_1577;
}
else
{
int l9_1578;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1578=0;
}
else
{
l9_1578=in.varStereoViewID;
}
int l9_1579=l9_1578;
l9_1575=l9_1579;
}
int l9_1580=l9_1575;
float2 l9_1581=l9_1574;
int l9_1582=l9_1580;
float2 l9_1583=l9_1581;
int l9_1584=l9_1582;
float l9_1585=0.0;
float2 l9_1586=(*sc_set2.UserUniforms).sc_ScreenTextureDims.xy;
float2 l9_1587=l9_1586;
float2 l9_1588=l9_1583;
int l9_1589=sc_ScreenTextureLayout_tmp;
int l9_1590=l9_1584;
float l9_1591=l9_1585;
float2 l9_1592=l9_1588;
int l9_1593=l9_1589;
int l9_1594=l9_1590;
float3 l9_1595;
if (l9_1593==0)
{
l9_1595=float3(l9_1592,0.0);
}
else
{
if (l9_1593==1)
{
l9_1595=float3(l9_1592.x,(l9_1592.y*0.5)+(0.5-(float(l9_1594)*0.5)),0.0);
}
else
{
l9_1595=float3(l9_1592,float(l9_1594));
}
}
float3 l9_1596=l9_1595;
float3 l9_1597=l9_1596;
float2 l9_1598=l9_1587;
float2 l9_1599=l9_1597.xy;
float l9_1600=l9_1591;
float4 l9_1601=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_1599,bias(l9_1600));
float4 l9_1602=l9_1601;
float4 l9_1603=l9_1602;
float4 l9_1604=l9_1603;
float4 l9_1605=l9_1604;
float4 l9_1606=l9_1605;
l9_1555=l9_1606;
}
float4 l9_1607=l9_1555;
float4 l9_1608=l9_1607;
float3 l9_1609=l9_1608.xyz;
float3 l9_1610;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1610=float3(pow(l9_1609.x,2.2),pow(l9_1609.y,2.2),pow(l9_1609.z,2.2));
}
else
{
l9_1610=l9_1609*l9_1609;
}
float3 l9_1611=l9_1610;
float3 l9_1612=l9_1611;
l9_1554.transmitted=l9_1612*mix(float3(1.0),l9_1114.albedo,float3(l9_1114.opacity));
l9_1114.opacity=1.0;
}
bool l9_1613=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1613=true;
}
SurfaceProperties l9_1614=l9_1114;
LightingComponents l9_1615=l9_1554;
bool l9_1616=l9_1613;
float3 l9_1617=l9_1614.albedo*(l9_1615.directDiffuse+(l9_1615.indirectDiffuse*l9_1614.ao));
float3 l9_1618=l9_1615.directSpecular+(l9_1615.indirectSpecular*l9_1614.specularAo);
float3 l9_1619=l9_1614.emissive;
float3 l9_1620=l9_1615.transmitted;
if (l9_1616)
{
float l9_1621=l9_1614.opacity;
l9_1617*=srgbToLinear(l9_1621);
}
float3 l9_1622=((l9_1617+l9_1618)+l9_1619)+l9_1620;
float3 l9_1623=l9_1622;
float4 l9_1624=float4(l9_1623,l9_1114.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_1625=l9_1624.xyz;
float3 l9_1626=linearToneMapping(l9_1625);
l9_1624=float4(l9_1626.x,l9_1626.y,l9_1626.z,l9_1624.w);
}
float3 l9_1627=l9_1624.xyz;
float l9_1628=l9_1627.x;
float l9_1629=l9_1627.y;
float l9_1630=l9_1627.z;
float3 l9_1631=float3(linearToSrgb(l9_1628),linearToSrgb(l9_1629),linearToSrgb(l9_1630));
l9_1624=float4(l9_1631.x,l9_1631.y,l9_1631.z,l9_1624.w);
float4 l9_1632=l9_1624;
param_130=l9_1632;
}
else
{
param_130=float4(param_122,param_123);
}
param_130=fast::max(param_130,float4(0.0));
Output_N36=param_130;
FinalColor=Output_N36;
float4 param_132=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_1633=param_132;
float4 l9_1634=l9_1633;
float l9_1635=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1635=l9_1634.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1635=fast::clamp(l9_1634.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1635=fast::clamp(dot(l9_1634.xyz,float3(l9_1634.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_1635=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_1635=(1.0-dot(l9_1634.xyz,float3(0.33333)))*l9_1634.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1635=(1.0-fast::clamp(dot(l9_1634.xyz,float3(1.0)),0.0,1.0))*l9_1634.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1635=fast::clamp(dot(l9_1634.xyz,float3(1.0)),0.0,1.0)*l9_1634.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_1635=fast::clamp(dot(l9_1634.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1635=fast::clamp(dot(l9_1634.xyz,float3(1.0)),0.0,1.0)*l9_1634.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_1635=dot(l9_1634.xyz,float3(0.33333))*l9_1634.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_1635=1.0-fast::clamp(dot(l9_1634.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_1635=fast::clamp(dot(l9_1634.xyz,float3(1.0)),0.0,1.0);
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
float l9_1636=l9_1635;
float l9_1637=l9_1636;
float l9_1638=(*sc_set2.UserUniforms).sc_ShadowDensity*l9_1637;
float3 l9_1639=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_1633.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float4 l9_1640=float4(l9_1639.x,l9_1639.y,l9_1639.z,l9_1638);
param_132=l9_1640;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_132=float4(param_132.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_1641=param_132;
float4 l9_1642;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1643=out.FragColor0;
float4 l9_1644=l9_1643;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1644.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1645=l9_1644;
l9_1642=l9_1645;
}
else
{
float4 l9_1646=gl_FragCoord;
float2 l9_1647=(l9_1646.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_1648=l9_1647;
float2 l9_1649;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_1650=float3(l9_1648,0.0);
int l9_1651=1;
int l9_1652;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1652=0;
}
else
{
l9_1652=in.varStereoViewID;
}
int l9_1653=l9_1652;
int l9_1654=l9_1653;
float3 l9_1655=float3(l9_1648,0.0);
int l9_1656=l9_1651;
int l9_1657=l9_1654;
if (l9_1656==1)
{
l9_1655.y=((2.0*l9_1655.y)+float(l9_1657))-1.0;
}
float2 l9_1658=l9_1655.xy;
l9_1649=l9_1658;
}
else
{
l9_1649=l9_1648;
}
float2 l9_1659=l9_1649;
float2 l9_1660=l9_1659;
float2 l9_1661=l9_1660;
int l9_1662;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1663;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1663=0;
}
else
{
l9_1663=in.varStereoViewID;
}
int l9_1664=l9_1663;
l9_1662=1-l9_1664;
}
else
{
int l9_1665;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1665=0;
}
else
{
l9_1665=in.varStereoViewID;
}
int l9_1666=l9_1665;
l9_1662=l9_1666;
}
int l9_1667=l9_1662;
float2 l9_1668=l9_1661;
int l9_1669=l9_1667;
float2 l9_1670=l9_1668;
int l9_1671=l9_1669;
float l9_1672=0.0;
float2 l9_1673=(*sc_set2.UserUniforms).sc_ScreenTextureDims.xy;
float2 l9_1674=l9_1673;
float2 l9_1675=l9_1670;
int l9_1676=sc_ScreenTextureLayout_tmp;
int l9_1677=l9_1671;
float l9_1678=l9_1672;
float2 l9_1679=l9_1675;
int l9_1680=l9_1676;
int l9_1681=l9_1677;
float3 l9_1682;
if (l9_1680==0)
{
l9_1682=float3(l9_1679,0.0);
}
else
{
if (l9_1680==1)
{
l9_1682=float3(l9_1679.x,(l9_1679.y*0.5)+(0.5-(float(l9_1681)*0.5)),0.0);
}
else
{
l9_1682=float3(l9_1679,float(l9_1681));
}
}
float3 l9_1683=l9_1682;
float3 l9_1684=l9_1683;
float2 l9_1685=l9_1674;
float2 l9_1686=l9_1684.xy;
float l9_1687=l9_1678;
float4 l9_1688=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_1686,bias(l9_1687));
float4 l9_1689=l9_1688;
float4 l9_1690=l9_1689;
float4 l9_1691=l9_1690;
float4 l9_1692=l9_1691;
float4 l9_1693=l9_1692;
l9_1642=l9_1693;
}
float4 l9_1694=l9_1642;
float4 l9_1695=l9_1694;
float3 l9_1696=l9_1695.xyz;
float3 l9_1697=l9_1696;
float3 l9_1698=l9_1641.xyz;
float3 l9_1699=definedBlend(l9_1697,l9_1698,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.intensityTexture,sc_set2.intensityTextureSmpSC);
float4 l9_1700;
l9_1700=float4(l9_1699.x,l9_1699.y,l9_1699.z,l9_1700.w);
float3 l9_1701=mix(l9_1696,l9_1700.xyz,float3(l9_1641.w));
l9_1700=float4(l9_1701.x,l9_1701.y,l9_1701.z,l9_1700.w);
l9_1700.w=1.0;
float4 l9_1702=l9_1700;
param_132=l9_1702;
}
else
{
float4 l9_1703=param_132;
float4 l9_1704;
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1704=float4(mix(float3(1.0),l9_1703.xyz,float3(l9_1703.w)),l9_1703.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_1705=l9_1703.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1705=fast::clamp(l9_1705,0.0,1.0);
}
l9_1704=float4(l9_1703.xyz*l9_1705,l9_1705);
}
else
{
l9_1704=l9_1703;
}
}
float4 l9_1706=l9_1704;
param_132=l9_1706;
}
}
}
float4 l9_1707=param_132;
FinalColor=l9_1707;
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
float4 l9_1708;
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_1708=float4((*sc_set2.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_1708=float4(0.0);
}
float4 l9_1709=l9_1708;
float4 Cost=l9_1709;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_133=FinalColor;
out.FragColor0=param_133;
float4 param_134=FinalColor;
return out;
}
} // FRAGMENT SHADER
