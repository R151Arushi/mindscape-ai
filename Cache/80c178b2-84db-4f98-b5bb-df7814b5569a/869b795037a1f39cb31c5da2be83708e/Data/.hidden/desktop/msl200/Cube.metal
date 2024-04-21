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
//sampler sampler baseColorTextureSmpSC 2:27
//sampler sampler clearcoatNormalTextureSmpSC 2:28
//sampler sampler clearcoatRoughnessTextureSmpSC 2:29
//sampler sampler clearcoatTextureSmpSC 2:30
//sampler sampler emissiveTextureSmpSC 2:31
//sampler sampler intensityTextureSmpSC 2:32
//sampler sampler metallicRoughnessTextureSmpSC 2:33
//sampler sampler normalTextureSmpSC 2:34
//sampler sampler sc_EnvmapDiffuseSmpSC 2:35
//sampler sampler sc_EnvmapSpecularSmpSC 2:36
//sampler sampler sc_SSAOTextureSmpSC 2:38
//sampler sampler sc_ScreenTextureSmpSC 2:39
//sampler sampler sc_ShadowTextureSmpSC 2:40
//sampler sampler screenTextureSmpSC 2:42
//sampler sampler sheenColorTextureSmpSC 2:43
//sampler sampler sheenRoughnessTextureSmpSC 2:44
//sampler sampler transmissionTextureSmpSC 2:45
//texture texture2D baseColorTexture 2:1:2:27
//texture texture2D clearcoatNormalTexture 2:2:2:28
//texture texture2D clearcoatRoughnessTexture 2:3:2:29
//texture texture2D clearcoatTexture 2:4:2:30
//texture texture2D emissiveTexture 2:5:2:31
//texture texture2D intensityTexture 2:6:2:32
//texture texture2D metallicRoughnessTexture 2:7:2:33
//texture texture2D normalTexture 2:8:2:34
//texture texture2D sc_EnvmapDiffuse 2:9:2:35
//texture texture2D sc_EnvmapSpecular 2:10:2:36
//texture texture2D sc_SSAOTexture 2:19:2:38
//texture texture2D sc_ScreenTexture 2:20:2:39
//texture texture2D sc_ShadowTexture 2:21:2:40
//texture texture2D screenTexture 2:23:2:42
//texture texture2D sheenColorTexture 2:24:2:43
//texture texture2D sheenRoughnessTexture 2:25:2:44
//texture texture2D transmissionTexture 2:26:2:45
//ubo int UserUniforms 2:46:5584 {
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
//float3 emissiveFactor 3680
//float4 emissiveTextureSize 3696
//float4 emissiveTextureDims 3712
//float4 emissiveTextureView 3728
//float3x3 emissiveTextureTransform 3744
//float4 emissiveTextureUvMinMax 3792
//float4 emissiveTextureBorderColor 3808
//float normalTextureScale 3824
//float4 normalTextureSize 3840
//float4 normalTextureDims 3856
//float4 normalTextureView 3872
//float3x3 normalTextureTransform 3888
//float4 normalTextureUvMinMax 3936
//float4 normalTextureBorderColor 3952
//float metallicFactor 3968
//float roughnessFactor 3972
//float occlusionTextureStrength 3976
//float4 metallicRoughnessTextureSize 3984
//float4 metallicRoughnessTextureDims 4000
//float4 metallicRoughnessTextureView 4016
//float3x3 metallicRoughnessTextureTransform 4032
//float4 metallicRoughnessTextureUvMinMax 4080
//float4 metallicRoughnessTextureBorderColor 4096
//float transmissionFactor 4112
//float4 transmissionTextureSize 4128
//float4 transmissionTextureDims 4144
//float4 transmissionTextureView 4160
//float3x3 transmissionTextureTransform 4176
//float4 transmissionTextureUvMinMax 4224
//float4 transmissionTextureBorderColor 4240
//float4 screenTextureSize 4256
//float4 screenTextureDims 4272
//float4 screenTextureView 4288
//float3x3 screenTextureTransform 4304
//float4 screenTextureUvMinMax 4352
//float4 screenTextureBorderColor 4368
//float3 sheenColorFactor 4384
//float4 sheenColorTextureSize 4400
//float4 sheenColorTextureDims 4416
//float4 sheenColorTextureView 4432
//float3x3 sheenColorTextureTransform 4448
//float4 sheenColorTextureUvMinMax 4496
//float4 sheenColorTextureBorderColor 4512
//float sheenRoughnessFactor 4528
//float4 sheenRoughnessTextureSize 4544
//float4 sheenRoughnessTextureDims 4560
//float4 sheenRoughnessTextureView 4576
//float3x3 sheenRoughnessTextureTransform 4592
//float4 sheenRoughnessTextureUvMinMax 4640
//float4 sheenRoughnessTextureBorderColor 4656
//float clearcoatFactor 4672
//float4 clearcoatTextureSize 4688
//float4 clearcoatTextureDims 4704
//float4 clearcoatTextureView 4720
//float3x3 clearcoatTextureTransform 4736
//float4 clearcoatTextureUvMinMax 4784
//float4 clearcoatTextureBorderColor 4800
//float clearcoatRoughnessFactor 4816
//float4 clearcoatRoughnessTextureSize 4832
//float4 clearcoatRoughnessTextureDims 4848
//float4 clearcoatRoughnessTextureView 4864
//float3x3 clearcoatRoughnessTextureTransform 4880
//float4 clearcoatRoughnessTextureUvMinMax 4928
//float4 clearcoatRoughnessTextureBorderColor 4944
//float4 clearcoatNormalTextureSize 4960
//float4 clearcoatNormalTextureDims 4976
//float4 clearcoatNormalTextureView 4992
//float3x3 clearcoatNormalTextureTransform 5008
//float4 clearcoatNormalTextureUvMinMax 5056
//float4 clearcoatNormalTextureBorderColor 5072
//float4 baseColorTextureSize 5088
//float4 baseColorTextureDims 5104
//float4 baseColorTextureView 5120
//float3x3 baseColorTextureTransform 5136
//float4 baseColorTextureUvMinMax 5184
//float4 baseColorTextureBorderColor 5200
//float4 baseColorFactor 5216
//float2 baseColorTexture_offset 5232
//float2 baseColorTexture_scale 5240
//float baseColorTexture_rotation 5248
//float2 emissiveTexture_offset 5256
//float2 emissiveTexture_scale 5264
//float emissiveTexture_rotation 5272
//float2 normalTexture_offset 5280
//float2 normalTexture_scale 5288
//float normalTexture_rotation 5296
//float2 metallicRoughnessTexture_offset 5304
//float2 metallicRoughnessTexture_scale 5312
//float metallicRoughnessTexture_rotation 5320
//float2 transmissionTexture_offset 5328
//float2 transmissionTexture_scale 5336
//float transmissionTexture_rotation 5344
//float2 sheenColorTexture_offset 5352
//float2 sheenColorTexture_scale 5360
//float sheenColorTexture_rotation 5368
//float2 sheenRoughnessTexture_offset 5376
//float2 sheenRoughnessTexture_scale 5384
//float sheenRoughnessTexture_rotation 5392
//float2 clearcoatTexture_offset 5400
//float2 clearcoatTexture_scale 5408
//float clearcoatTexture_rotation 5416
//float2 clearcoatNormalTexture_offset 5424
//float2 clearcoatNormalTexture_scale 5432
//float clearcoatNormalTexture_rotation 5440
//float2 clearcoatRoughnessTexture_offset 5448
//float2 clearcoatRoughnessTexture_scale 5456
//float clearcoatRoughnessTexture_rotation 5464
//float Port_DebugSheenEnvLightMult_N003 5468
//float Port_DebugSheenPunctualLightMult_N003 5472
//float Port_Input2_N043 5476
//float Port_Input2_N062 5480
//float3 Port_SpecularAO_N036 5488
//float3 Port_Albedo_N405 5504
//float Port_Opacity_N405 5520
//float3 Port_Emissive_N405 5536
//float Port_Metallic_N405 5552
//float3 Port_SpecularAO_N405 5568
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
//spec_const bool ENABLE_BASE_TEXTURE_TRANSFORM 1030
//spec_const bool ENABLE_BASE_TEX 1031
//spec_const bool ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM 1032
//spec_const bool ENABLE_CLEARCOAT_NORMAL_TEX 1033
//spec_const bool ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM 1034
//spec_const bool ENABLE_CLEARCOAT_ROUGHNESS_TEX 1035
//spec_const bool ENABLE_CLEARCOAT_TEXTURE_TRANSFORM 1036
//spec_const bool ENABLE_CLEARCOAT_TEX 1037
//spec_const bool ENABLE_CLEARCOAT 1038
//spec_const bool ENABLE_EMISSIVE_TEXTURE_TRANSFORM 1039
//spec_const bool ENABLE_EMISSIVE 1040
//spec_const bool ENABLE_GLTF_LIGHTING 1041
//spec_const bool ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM 1042
//spec_const bool ENABLE_METALLIC_ROUGHNESS_TEX 1043
//spec_const bool ENABLE_NORMALMAP 1044
//spec_const bool ENABLE_NORMAL_TEXTURE_TRANSFORM 1045
//spec_const bool ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM 1046
//spec_const bool ENABLE_SHEEN_COLOR_TEX 1047
//spec_const bool ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM 1048
//spec_const bool ENABLE_SHEEN_ROUGHNESS_TEX 1049
//spec_const bool ENABLE_SHEEN 1050
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 1051
//spec_const bool ENABLE_TEXTURE_TRANSFORM 1052
//spec_const bool ENABLE_TRANSMISSION_TEXTURE_TRANSFORM 1053
//spec_const bool ENABLE_TRANSMISSION_TEX 1054
//spec_const bool ENABLE_TRANSMISSION 1055
//spec_const bool ENABLE_VERTEX_COLOR_BASE 1056
//spec_const bool SC_GL_FRAGMENT_PRECISION_HIGH 1057
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseColorTexture 1058
//spec_const bool SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture 1059
//spec_const bool SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture 1060
//spec_const bool SC_USE_CLAMP_TO_BORDER_clearcoatTexture 1061
//spec_const bool SC_USE_CLAMP_TO_BORDER_emissiveTexture 1062
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 1063
//spec_const bool SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture 1064
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTexture 1065
//spec_const bool SC_USE_CLAMP_TO_BORDER_screenTexture 1066
//spec_const bool SC_USE_CLAMP_TO_BORDER_sheenColorTexture 1067
//spec_const bool SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture 1068
//spec_const bool SC_USE_CLAMP_TO_BORDER_transmissionTexture 1069
//spec_const bool SC_USE_UV_MIN_MAX_baseColorTexture 1070
//spec_const bool SC_USE_UV_MIN_MAX_clearcoatNormalTexture 1071
//spec_const bool SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture 1072
//spec_const bool SC_USE_UV_MIN_MAX_clearcoatTexture 1073
//spec_const bool SC_USE_UV_MIN_MAX_emissiveTexture 1074
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 1075
//spec_const bool SC_USE_UV_MIN_MAX_metallicRoughnessTexture 1076
//spec_const bool SC_USE_UV_MIN_MAX_normalTexture 1077
//spec_const bool SC_USE_UV_MIN_MAX_screenTexture 1078
//spec_const bool SC_USE_UV_MIN_MAX_sheenColorTexture 1079
//spec_const bool SC_USE_UV_MIN_MAX_sheenRoughnessTexture 1080
//spec_const bool SC_USE_UV_MIN_MAX_transmissionTexture 1081
//spec_const bool SC_USE_UV_TRANSFORM_baseColorTexture 1082
//spec_const bool SC_USE_UV_TRANSFORM_clearcoatNormalTexture 1083
//spec_const bool SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture 1084
//spec_const bool SC_USE_UV_TRANSFORM_clearcoatTexture 1085
//spec_const bool SC_USE_UV_TRANSFORM_emissiveTexture 1086
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 1087
//spec_const bool SC_USE_UV_TRANSFORM_metallicRoughnessTexture 1088
//spec_const bool SC_USE_UV_TRANSFORM_normalTexture 1089
//spec_const bool SC_USE_UV_TRANSFORM_screenTexture 1090
//spec_const bool SC_USE_UV_TRANSFORM_sheenColorTexture 1091
//spec_const bool SC_USE_UV_TRANSFORM_sheenRoughnessTexture 1092
//spec_const bool SC_USE_UV_TRANSFORM_transmissionTexture 1093
//spec_const bool UseViewSpaceDepthVariant 1094
//spec_const bool baseColorTextureHasSwappedViews 1095
//spec_const bool clearcoatNormalTextureHasSwappedViews 1096
//spec_const bool clearcoatRoughnessTextureHasSwappedViews 1097
//spec_const bool clearcoatTextureHasSwappedViews 1098
//spec_const bool emissiveTextureHasSwappedViews 1099
//spec_const bool intensityTextureHasSwappedViews 1100
//spec_const bool metallicRoughnessTextureHasSwappedViews 1101
//spec_const bool normalTextureHasSwappedViews 1102
//spec_const bool sc_BlendMode_AddWithAlphaFactor 1103
//spec_const bool sc_BlendMode_Add 1104
//spec_const bool sc_BlendMode_AlphaTest 1105
//spec_const bool sc_BlendMode_AlphaToCoverage 1106
//spec_const bool sc_BlendMode_ColoredGlass 1107
//spec_const bool sc_BlendMode_Custom 1108
//spec_const bool sc_BlendMode_Max 1109
//spec_const bool sc_BlendMode_Min 1110
//spec_const bool sc_BlendMode_MultiplyOriginal 1111
//spec_const bool sc_BlendMode_Multiply 1112
//spec_const bool sc_BlendMode_Normal 1113
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 1114
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 1115
//spec_const bool sc_BlendMode_PremultipliedAlpha 1116
//spec_const bool sc_BlendMode_Screen 1117
//spec_const bool sc_DepthOnly 1118
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 1119
//spec_const bool sc_EnvmapSpecularHasSwappedViews 1120
//spec_const bool sc_FramebufferFetch 1121
//spec_const bool sc_HasDiffuseEnvmap 1122
//spec_const bool sc_LightEstimation 1123
//spec_const bool sc_OITCompositingPass 1124
//spec_const bool sc_OITDepthBoundsPass 1125
//spec_const bool sc_OITDepthGatherPass 1126
//spec_const bool sc_ProjectiveShadowsCaster 1127
//spec_const bool sc_ProjectiveShadowsReceiver 1128
//spec_const bool sc_RenderAlphaToColor 1129
//spec_const bool sc_SSAOEnabled 1130
//spec_const bool sc_ScreenTextureHasSwappedViews 1131
//spec_const bool sc_ShaderComplexityAnalyzer 1132
//spec_const bool sc_UseFramebufferFetchMarker 1133
//spec_const bool sc_VertexBlendingUseNormals 1134
//spec_const bool sc_VertexBlending 1135
//spec_const bool screenTextureHasSwappedViews 1136
//spec_const bool sheenColorTextureHasSwappedViews 1137
//spec_const bool sheenRoughnessTextureHasSwappedViews 1138
//spec_const bool transmissionTextureHasSwappedViews 1139
//spec_const int NODE_10_DROPLIST_ITEM 1140
//spec_const int NODE_11_DROPLIST_ITEM 1141
//spec_const int NODE_7_DROPLIST_ITEM 1142
//spec_const int NODE_8_DROPLIST_ITEM 1143
//spec_const int SC_DEVICE_CLASS 1144
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseColorTexture 1145
//spec_const int SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture 1146
//spec_const int SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture 1147
//spec_const int SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture 1148
//spec_const int SC_SOFTWARE_WRAP_MODE_U_emissiveTexture 1149
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 1150
//spec_const int SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture 1151
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTexture 1152
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screenTexture 1153
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture 1154
//spec_const int SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture 1155
//spec_const int SC_SOFTWARE_WRAP_MODE_U_transmissionTexture 1156
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseColorTexture 1157
//spec_const int SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture 1158
//spec_const int SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture 1159
//spec_const int SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture 1160
//spec_const int SC_SOFTWARE_WRAP_MODE_V_emissiveTexture 1161
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 1162
//spec_const int SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture 1163
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTexture 1164
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screenTexture 1165
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture 1166
//spec_const int SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture 1167
//spec_const int SC_SOFTWARE_WRAP_MODE_V_transmissionTexture 1168
//spec_const int Tweak_N30 1169
//spec_const int Tweak_N32 1170
//spec_const int Tweak_N37 1171
//spec_const int Tweak_N44 1172
//spec_const int Tweak_N47 1173
//spec_const int Tweak_N60 1174
//spec_const int baseColorTextureLayout 1175
//spec_const int clearcoatNormalTextureLayout 1176
//spec_const int clearcoatRoughnessTextureLayout 1177
//spec_const int clearcoatTextureLayout 1178
//spec_const int emissiveTextureLayout 1179
//spec_const int intensityTextureLayout 1180
//spec_const int metallicRoughnessTextureLayout 1181
//spec_const int normalTextureLayout 1182
//spec_const int sc_AmbientLightMode0 1183
//spec_const int sc_AmbientLightMode1 1184
//spec_const int sc_AmbientLightMode2 1185
//spec_const int sc_AmbientLightMode_Constant 1186
//spec_const int sc_AmbientLightMode_EnvironmentMap 1187
//spec_const int sc_AmbientLightMode_FromCamera 1188
//spec_const int sc_AmbientLightMode_SphericalHarmonics 1189
//spec_const int sc_AmbientLightsCount 1190
//spec_const int sc_DepthBufferMode 1191
//spec_const int sc_DirectionalLightsCount 1192
//spec_const int sc_EnvLightMode 1193
//spec_const int sc_EnvmapDiffuseLayout 1194
//spec_const int sc_EnvmapSpecularLayout 1195
//spec_const int sc_LightEstimationSGCount 1196
//spec_const int sc_MaxTextureImageUnits 1197
//spec_const int sc_PointLightsCount 1198
//spec_const int sc_RenderingSpace 1199
//spec_const int sc_ScreenTextureLayout 1200
//spec_const int sc_SkinBonesCount 1201
//spec_const int sc_StereoRenderingMode 1202
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 1203
//spec_const int screenTextureLayout 1204
//spec_const int sheenColorTextureLayout 1205
//spec_const int sheenRoughnessTextureLayout 1206
//spec_const int transmissionTextureLayout 1207
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
constant bool ENABLE_BASE_TEXTURE_TRANSFORM [[function_constant(1030)]];
constant bool ENABLE_BASE_TEXTURE_TRANSFORM_tmp = is_function_constant_defined(ENABLE_BASE_TEXTURE_TRANSFORM) ? ENABLE_BASE_TEXTURE_TRANSFORM : false;
constant bool ENABLE_BASE_TEX [[function_constant(1031)]];
constant bool ENABLE_BASE_TEX_tmp = is_function_constant_defined(ENABLE_BASE_TEX) ? ENABLE_BASE_TEX : false;
constant bool ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM [[function_constant(1032)]];
constant bool ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM_tmp = is_function_constant_defined(ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM) ? ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM : false;
constant bool ENABLE_CLEARCOAT_NORMAL_TEX [[function_constant(1033)]];
constant bool ENABLE_CLEARCOAT_NORMAL_TEX_tmp = is_function_constant_defined(ENABLE_CLEARCOAT_NORMAL_TEX) ? ENABLE_CLEARCOAT_NORMAL_TEX : false;
constant bool ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM [[function_constant(1034)]];
constant bool ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM_tmp = is_function_constant_defined(ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM) ? ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM : false;
constant bool ENABLE_CLEARCOAT_ROUGHNESS_TEX [[function_constant(1035)]];
constant bool ENABLE_CLEARCOAT_ROUGHNESS_TEX_tmp = is_function_constant_defined(ENABLE_CLEARCOAT_ROUGHNESS_TEX) ? ENABLE_CLEARCOAT_ROUGHNESS_TEX : false;
constant bool ENABLE_CLEARCOAT_TEXTURE_TRANSFORM [[function_constant(1036)]];
constant bool ENABLE_CLEARCOAT_TEXTURE_TRANSFORM_tmp = is_function_constant_defined(ENABLE_CLEARCOAT_TEXTURE_TRANSFORM) ? ENABLE_CLEARCOAT_TEXTURE_TRANSFORM : false;
constant bool ENABLE_CLEARCOAT_TEX [[function_constant(1037)]];
constant bool ENABLE_CLEARCOAT_TEX_tmp = is_function_constant_defined(ENABLE_CLEARCOAT_TEX) ? ENABLE_CLEARCOAT_TEX : false;
constant bool ENABLE_CLEARCOAT [[function_constant(1038)]];
constant bool ENABLE_CLEARCOAT_tmp = is_function_constant_defined(ENABLE_CLEARCOAT) ? ENABLE_CLEARCOAT : false;
constant bool ENABLE_EMISSIVE_TEXTURE_TRANSFORM [[function_constant(1039)]];
constant bool ENABLE_EMISSIVE_TEXTURE_TRANSFORM_tmp = is_function_constant_defined(ENABLE_EMISSIVE_TEXTURE_TRANSFORM) ? ENABLE_EMISSIVE_TEXTURE_TRANSFORM : false;
constant bool ENABLE_EMISSIVE [[function_constant(1040)]];
constant bool ENABLE_EMISSIVE_tmp = is_function_constant_defined(ENABLE_EMISSIVE) ? ENABLE_EMISSIVE : false;
constant bool ENABLE_GLTF_LIGHTING [[function_constant(1041)]];
constant bool ENABLE_GLTF_LIGHTING_tmp = is_function_constant_defined(ENABLE_GLTF_LIGHTING) ? ENABLE_GLTF_LIGHTING : false;
constant bool ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM [[function_constant(1042)]];
constant bool ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM_tmp = is_function_constant_defined(ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM) ? ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM : false;
constant bool ENABLE_METALLIC_ROUGHNESS_TEX [[function_constant(1043)]];
constant bool ENABLE_METALLIC_ROUGHNESS_TEX_tmp = is_function_constant_defined(ENABLE_METALLIC_ROUGHNESS_TEX) ? ENABLE_METALLIC_ROUGHNESS_TEX : false;
constant bool ENABLE_NORMALMAP [[function_constant(1044)]];
constant bool ENABLE_NORMALMAP_tmp = is_function_constant_defined(ENABLE_NORMALMAP) ? ENABLE_NORMALMAP : false;
constant bool ENABLE_NORMAL_TEXTURE_TRANSFORM [[function_constant(1045)]];
constant bool ENABLE_NORMAL_TEXTURE_TRANSFORM_tmp = is_function_constant_defined(ENABLE_NORMAL_TEXTURE_TRANSFORM) ? ENABLE_NORMAL_TEXTURE_TRANSFORM : false;
constant bool ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM [[function_constant(1046)]];
constant bool ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM_tmp = is_function_constant_defined(ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM) ? ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM : false;
constant bool ENABLE_SHEEN_COLOR_TEX [[function_constant(1047)]];
constant bool ENABLE_SHEEN_COLOR_TEX_tmp = is_function_constant_defined(ENABLE_SHEEN_COLOR_TEX) ? ENABLE_SHEEN_COLOR_TEX : false;
constant bool ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM [[function_constant(1048)]];
constant bool ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM_tmp = is_function_constant_defined(ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM) ? ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM : false;
constant bool ENABLE_SHEEN_ROUGHNESS_TEX [[function_constant(1049)]];
constant bool ENABLE_SHEEN_ROUGHNESS_TEX_tmp = is_function_constant_defined(ENABLE_SHEEN_ROUGHNESS_TEX) ? ENABLE_SHEEN_ROUGHNESS_TEX : false;
constant bool ENABLE_SHEEN [[function_constant(1050)]];
constant bool ENABLE_SHEEN_tmp = is_function_constant_defined(ENABLE_SHEEN) ? ENABLE_SHEEN : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(1051)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool ENABLE_TEXTURE_TRANSFORM [[function_constant(1052)]];
constant bool ENABLE_TEXTURE_TRANSFORM_tmp = is_function_constant_defined(ENABLE_TEXTURE_TRANSFORM) ? ENABLE_TEXTURE_TRANSFORM : false;
constant bool ENABLE_TRANSMISSION_TEXTURE_TRANSFORM [[function_constant(1053)]];
constant bool ENABLE_TRANSMISSION_TEXTURE_TRANSFORM_tmp = is_function_constant_defined(ENABLE_TRANSMISSION_TEXTURE_TRANSFORM) ? ENABLE_TRANSMISSION_TEXTURE_TRANSFORM : false;
constant bool ENABLE_TRANSMISSION_TEX [[function_constant(1054)]];
constant bool ENABLE_TRANSMISSION_TEX_tmp = is_function_constant_defined(ENABLE_TRANSMISSION_TEX) ? ENABLE_TRANSMISSION_TEX : false;
constant bool ENABLE_TRANSMISSION [[function_constant(1055)]];
constant bool ENABLE_TRANSMISSION_tmp = is_function_constant_defined(ENABLE_TRANSMISSION) ? ENABLE_TRANSMISSION : false;
constant bool ENABLE_VERTEX_COLOR_BASE [[function_constant(1056)]];
constant bool ENABLE_VERTEX_COLOR_BASE_tmp = is_function_constant_defined(ENABLE_VERTEX_COLOR_BASE) ? ENABLE_VERTEX_COLOR_BASE : false;
constant bool SC_GL_FRAGMENT_PRECISION_HIGH [[function_constant(1057)]];
constant bool SC_GL_FRAGMENT_PRECISION_HIGH_tmp = is_function_constant_defined(SC_GL_FRAGMENT_PRECISION_HIGH) ? SC_GL_FRAGMENT_PRECISION_HIGH : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseColorTexture [[function_constant(1058)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseColorTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseColorTexture) ? SC_USE_CLAMP_TO_BORDER_baseColorTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture [[function_constant(1059)]];
constant bool SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture) ? SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture [[function_constant(1060)]];
constant bool SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture) ? SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_clearcoatTexture [[function_constant(1061)]];
constant bool SC_USE_CLAMP_TO_BORDER_clearcoatTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_clearcoatTexture) ? SC_USE_CLAMP_TO_BORDER_clearcoatTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTexture [[function_constant(1062)]];
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_emissiveTexture) ? SC_USE_CLAMP_TO_BORDER_emissiveTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(1063)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture [[function_constant(1064)]];
constant bool SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture) ? SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTexture [[function_constant(1065)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTexture) ? SC_USE_CLAMP_TO_BORDER_normalTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_screenTexture [[function_constant(1066)]];
constant bool SC_USE_CLAMP_TO_BORDER_screenTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_screenTexture) ? SC_USE_CLAMP_TO_BORDER_screenTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_sheenColorTexture [[function_constant(1067)]];
constant bool SC_USE_CLAMP_TO_BORDER_sheenColorTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sheenColorTexture) ? SC_USE_CLAMP_TO_BORDER_sheenColorTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture [[function_constant(1068)]];
constant bool SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture) ? SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_transmissionTexture [[function_constant(1069)]];
constant bool SC_USE_CLAMP_TO_BORDER_transmissionTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_transmissionTexture) ? SC_USE_CLAMP_TO_BORDER_transmissionTexture : false;
constant bool SC_USE_UV_MIN_MAX_baseColorTexture [[function_constant(1070)]];
constant bool SC_USE_UV_MIN_MAX_baseColorTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseColorTexture) ? SC_USE_UV_MIN_MAX_baseColorTexture : false;
constant bool SC_USE_UV_MIN_MAX_clearcoatNormalTexture [[function_constant(1071)]];
constant bool SC_USE_UV_MIN_MAX_clearcoatNormalTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_clearcoatNormalTexture) ? SC_USE_UV_MIN_MAX_clearcoatNormalTexture : false;
constant bool SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture [[function_constant(1072)]];
constant bool SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture) ? SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture : false;
constant bool SC_USE_UV_MIN_MAX_clearcoatTexture [[function_constant(1073)]];
constant bool SC_USE_UV_MIN_MAX_clearcoatTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_clearcoatTexture) ? SC_USE_UV_MIN_MAX_clearcoatTexture : false;
constant bool SC_USE_UV_MIN_MAX_emissiveTexture [[function_constant(1074)]];
constant bool SC_USE_UV_MIN_MAX_emissiveTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_emissiveTexture) ? SC_USE_UV_MIN_MAX_emissiveTexture : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(1075)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_metallicRoughnessTexture [[function_constant(1076)]];
constant bool SC_USE_UV_MIN_MAX_metallicRoughnessTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_metallicRoughnessTexture) ? SC_USE_UV_MIN_MAX_metallicRoughnessTexture : false;
constant bool SC_USE_UV_MIN_MAX_normalTexture [[function_constant(1077)]];
constant bool SC_USE_UV_MIN_MAX_normalTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTexture) ? SC_USE_UV_MIN_MAX_normalTexture : false;
constant bool SC_USE_UV_MIN_MAX_screenTexture [[function_constant(1078)]];
constant bool SC_USE_UV_MIN_MAX_screenTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_screenTexture) ? SC_USE_UV_MIN_MAX_screenTexture : false;
constant bool SC_USE_UV_MIN_MAX_sheenColorTexture [[function_constant(1079)]];
constant bool SC_USE_UV_MIN_MAX_sheenColorTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sheenColorTexture) ? SC_USE_UV_MIN_MAX_sheenColorTexture : false;
constant bool SC_USE_UV_MIN_MAX_sheenRoughnessTexture [[function_constant(1080)]];
constant bool SC_USE_UV_MIN_MAX_sheenRoughnessTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_sheenRoughnessTexture) ? SC_USE_UV_MIN_MAX_sheenRoughnessTexture : false;
constant bool SC_USE_UV_MIN_MAX_transmissionTexture [[function_constant(1081)]];
constant bool SC_USE_UV_MIN_MAX_transmissionTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_transmissionTexture) ? SC_USE_UV_MIN_MAX_transmissionTexture : false;
constant bool SC_USE_UV_TRANSFORM_baseColorTexture [[function_constant(1082)]];
constant bool SC_USE_UV_TRANSFORM_baseColorTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseColorTexture) ? SC_USE_UV_TRANSFORM_baseColorTexture : false;
constant bool SC_USE_UV_TRANSFORM_clearcoatNormalTexture [[function_constant(1083)]];
constant bool SC_USE_UV_TRANSFORM_clearcoatNormalTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_clearcoatNormalTexture) ? SC_USE_UV_TRANSFORM_clearcoatNormalTexture : false;
constant bool SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture [[function_constant(1084)]];
constant bool SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture) ? SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture : false;
constant bool SC_USE_UV_TRANSFORM_clearcoatTexture [[function_constant(1085)]];
constant bool SC_USE_UV_TRANSFORM_clearcoatTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_clearcoatTexture) ? SC_USE_UV_TRANSFORM_clearcoatTexture : false;
constant bool SC_USE_UV_TRANSFORM_emissiveTexture [[function_constant(1086)]];
constant bool SC_USE_UV_TRANSFORM_emissiveTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_emissiveTexture) ? SC_USE_UV_TRANSFORM_emissiveTexture : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(1087)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_metallicRoughnessTexture [[function_constant(1088)]];
constant bool SC_USE_UV_TRANSFORM_metallicRoughnessTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_metallicRoughnessTexture) ? SC_USE_UV_TRANSFORM_metallicRoughnessTexture : false;
constant bool SC_USE_UV_TRANSFORM_normalTexture [[function_constant(1089)]];
constant bool SC_USE_UV_TRANSFORM_normalTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTexture) ? SC_USE_UV_TRANSFORM_normalTexture : false;
constant bool SC_USE_UV_TRANSFORM_screenTexture [[function_constant(1090)]];
constant bool SC_USE_UV_TRANSFORM_screenTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_screenTexture) ? SC_USE_UV_TRANSFORM_screenTexture : false;
constant bool SC_USE_UV_TRANSFORM_sheenColorTexture [[function_constant(1091)]];
constant bool SC_USE_UV_TRANSFORM_sheenColorTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sheenColorTexture) ? SC_USE_UV_TRANSFORM_sheenColorTexture : false;
constant bool SC_USE_UV_TRANSFORM_sheenRoughnessTexture [[function_constant(1092)]];
constant bool SC_USE_UV_TRANSFORM_sheenRoughnessTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_sheenRoughnessTexture) ? SC_USE_UV_TRANSFORM_sheenRoughnessTexture : false;
constant bool SC_USE_UV_TRANSFORM_transmissionTexture [[function_constant(1093)]];
constant bool SC_USE_UV_TRANSFORM_transmissionTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_transmissionTexture) ? SC_USE_UV_TRANSFORM_transmissionTexture : false;
constant bool UseViewSpaceDepthVariant [[function_constant(1094)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseColorTextureHasSwappedViews [[function_constant(1095)]];
constant bool baseColorTextureHasSwappedViews_tmp = is_function_constant_defined(baseColorTextureHasSwappedViews) ? baseColorTextureHasSwappedViews : false;
constant bool clearcoatNormalTextureHasSwappedViews [[function_constant(1096)]];
constant bool clearcoatNormalTextureHasSwappedViews_tmp = is_function_constant_defined(clearcoatNormalTextureHasSwappedViews) ? clearcoatNormalTextureHasSwappedViews : false;
constant bool clearcoatRoughnessTextureHasSwappedViews [[function_constant(1097)]];
constant bool clearcoatRoughnessTextureHasSwappedViews_tmp = is_function_constant_defined(clearcoatRoughnessTextureHasSwappedViews) ? clearcoatRoughnessTextureHasSwappedViews : false;
constant bool clearcoatTextureHasSwappedViews [[function_constant(1098)]];
constant bool clearcoatTextureHasSwappedViews_tmp = is_function_constant_defined(clearcoatTextureHasSwappedViews) ? clearcoatTextureHasSwappedViews : false;
constant bool emissiveTextureHasSwappedViews [[function_constant(1099)]];
constant bool emissiveTextureHasSwappedViews_tmp = is_function_constant_defined(emissiveTextureHasSwappedViews) ? emissiveTextureHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(1100)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool metallicRoughnessTextureHasSwappedViews [[function_constant(1101)]];
constant bool metallicRoughnessTextureHasSwappedViews_tmp = is_function_constant_defined(metallicRoughnessTextureHasSwappedViews) ? metallicRoughnessTextureHasSwappedViews : false;
constant bool normalTextureHasSwappedViews [[function_constant(1102)]];
constant bool normalTextureHasSwappedViews_tmp = is_function_constant_defined(normalTextureHasSwappedViews) ? normalTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(1103)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(1104)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(1105)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(1106)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(1107)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(1108)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(1109)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(1110)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(1111)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(1112)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(1113)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(1114)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(1115)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(1116)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(1117)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(1118)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(1119)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(1120)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(1121)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(1122)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(1123)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_OITCompositingPass [[function_constant(1124)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(1125)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(1126)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(1127)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(1128)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(1129)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(1130)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(1131)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(1132)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(1133)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(1134)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(1135)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool screenTextureHasSwappedViews [[function_constant(1136)]];
constant bool screenTextureHasSwappedViews_tmp = is_function_constant_defined(screenTextureHasSwappedViews) ? screenTextureHasSwappedViews : false;
constant bool sheenColorTextureHasSwappedViews [[function_constant(1137)]];
constant bool sheenColorTextureHasSwappedViews_tmp = is_function_constant_defined(sheenColorTextureHasSwappedViews) ? sheenColorTextureHasSwappedViews : false;
constant bool sheenRoughnessTextureHasSwappedViews [[function_constant(1138)]];
constant bool sheenRoughnessTextureHasSwappedViews_tmp = is_function_constant_defined(sheenRoughnessTextureHasSwappedViews) ? sheenRoughnessTextureHasSwappedViews : false;
constant bool transmissionTextureHasSwappedViews [[function_constant(1139)]];
constant bool transmissionTextureHasSwappedViews_tmp = is_function_constant_defined(transmissionTextureHasSwappedViews) ? transmissionTextureHasSwappedViews : false;
constant int NODE_10_DROPLIST_ITEM [[function_constant(1140)]];
constant int NODE_10_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_10_DROPLIST_ITEM) ? NODE_10_DROPLIST_ITEM : 0;
constant int NODE_11_DROPLIST_ITEM [[function_constant(1141)]];
constant int NODE_11_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_11_DROPLIST_ITEM) ? NODE_11_DROPLIST_ITEM : 0;
constant int NODE_7_DROPLIST_ITEM [[function_constant(1142)]];
constant int NODE_7_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_7_DROPLIST_ITEM) ? NODE_7_DROPLIST_ITEM : 0;
constant int NODE_8_DROPLIST_ITEM [[function_constant(1143)]];
constant int NODE_8_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_8_DROPLIST_ITEM) ? NODE_8_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(1144)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseColorTexture [[function_constant(1145)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseColorTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture) ? SC_SOFTWARE_WRAP_MODE_U_baseColorTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture [[function_constant(1146)]];
constant int SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture) ? SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture [[function_constant(1147)]];
constant int SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture) ? SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture [[function_constant(1148)]];
constant int SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture) ? SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTexture [[function_constant(1149)]];
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture) ? SC_SOFTWARE_WRAP_MODE_U_emissiveTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(1150)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture [[function_constant(1151)]];
constant int SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture) ? SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTexture [[function_constant(1152)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTexture) ? SC_SOFTWARE_WRAP_MODE_U_normalTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_screenTexture [[function_constant(1153)]];
constant int SC_SOFTWARE_WRAP_MODE_U_screenTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_screenTexture) ? SC_SOFTWARE_WRAP_MODE_U_screenTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture [[function_constant(1154)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture) ? SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture [[function_constant(1155)]];
constant int SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture) ? SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_transmissionTexture [[function_constant(1156)]];
constant int SC_SOFTWARE_WRAP_MODE_U_transmissionTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture) ? SC_SOFTWARE_WRAP_MODE_U_transmissionTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseColorTexture [[function_constant(1157)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseColorTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseColorTexture) ? SC_SOFTWARE_WRAP_MODE_V_baseColorTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture [[function_constant(1158)]];
constant int SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture) ? SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture [[function_constant(1159)]];
constant int SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture) ? SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture [[function_constant(1160)]];
constant int SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture) ? SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTexture [[function_constant(1161)]];
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_emissiveTexture) ? SC_SOFTWARE_WRAP_MODE_V_emissiveTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(1162)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture [[function_constant(1163)]];
constant int SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture) ? SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTexture [[function_constant(1164)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTexture) ? SC_SOFTWARE_WRAP_MODE_V_normalTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_screenTexture [[function_constant(1165)]];
constant int SC_SOFTWARE_WRAP_MODE_V_screenTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_screenTexture) ? SC_SOFTWARE_WRAP_MODE_V_screenTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture [[function_constant(1166)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture) ? SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture [[function_constant(1167)]];
constant int SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture) ? SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_transmissionTexture [[function_constant(1168)]];
constant int SC_SOFTWARE_WRAP_MODE_V_transmissionTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_transmissionTexture) ? SC_SOFTWARE_WRAP_MODE_V_transmissionTexture : -1;
constant int Tweak_N30 [[function_constant(1169)]];
constant int Tweak_N30_tmp = is_function_constant_defined(Tweak_N30) ? Tweak_N30 : 0;
constant int Tweak_N32 [[function_constant(1170)]];
constant int Tweak_N32_tmp = is_function_constant_defined(Tweak_N32) ? Tweak_N32 : 0;
constant int Tweak_N37 [[function_constant(1171)]];
constant int Tweak_N37_tmp = is_function_constant_defined(Tweak_N37) ? Tweak_N37 : 0;
constant int Tweak_N44 [[function_constant(1172)]];
constant int Tweak_N44_tmp = is_function_constant_defined(Tweak_N44) ? Tweak_N44 : 0;
constant int Tweak_N47 [[function_constant(1173)]];
constant int Tweak_N47_tmp = is_function_constant_defined(Tweak_N47) ? Tweak_N47 : 0;
constant int Tweak_N60 [[function_constant(1174)]];
constant int Tweak_N60_tmp = is_function_constant_defined(Tweak_N60) ? Tweak_N60 : 0;
constant int baseColorTextureLayout [[function_constant(1175)]];
constant int baseColorTextureLayout_tmp = is_function_constant_defined(baseColorTextureLayout) ? baseColorTextureLayout : 0;
constant int clearcoatNormalTextureLayout [[function_constant(1176)]];
constant int clearcoatNormalTextureLayout_tmp = is_function_constant_defined(clearcoatNormalTextureLayout) ? clearcoatNormalTextureLayout : 0;
constant int clearcoatRoughnessTextureLayout [[function_constant(1177)]];
constant int clearcoatRoughnessTextureLayout_tmp = is_function_constant_defined(clearcoatRoughnessTextureLayout) ? clearcoatRoughnessTextureLayout : 0;
constant int clearcoatTextureLayout [[function_constant(1178)]];
constant int clearcoatTextureLayout_tmp = is_function_constant_defined(clearcoatTextureLayout) ? clearcoatTextureLayout : 0;
constant int emissiveTextureLayout [[function_constant(1179)]];
constant int emissiveTextureLayout_tmp = is_function_constant_defined(emissiveTextureLayout) ? emissiveTextureLayout : 0;
constant int intensityTextureLayout [[function_constant(1180)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int metallicRoughnessTextureLayout [[function_constant(1181)]];
constant int metallicRoughnessTextureLayout_tmp = is_function_constant_defined(metallicRoughnessTextureLayout) ? metallicRoughnessTextureLayout : 0;
constant int normalTextureLayout [[function_constant(1182)]];
constant int normalTextureLayout_tmp = is_function_constant_defined(normalTextureLayout) ? normalTextureLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(1183)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(1184)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(1185)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(1186)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(1187)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(1188)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(1189)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(1190)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(1191)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(1192)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(1193)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(1194)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(1195)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(1196)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(1197)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(1198)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RenderingSpace [[function_constant(1199)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(1200)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_SkinBonesCount [[function_constant(1201)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(1202)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(1203)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int screenTextureLayout [[function_constant(1204)]];
constant int screenTextureLayout_tmp = is_function_constant_defined(screenTextureLayout) ? screenTextureLayout : 0;
constant int sheenColorTextureLayout [[function_constant(1205)]];
constant int sheenColorTextureLayout_tmp = is_function_constant_defined(sheenColorTextureLayout) ? sheenColorTextureLayout : 0;
constant int sheenRoughnessTextureLayout [[function_constant(1206)]];
constant int sheenRoughnessTextureLayout_tmp = is_function_constant_defined(sheenRoughnessTextureLayout) ? sheenRoughnessTextureLayout : 0;
constant int transmissionTextureLayout [[function_constant(1207)]];
constant int transmissionTextureLayout_tmp = is_function_constant_defined(transmissionTextureLayout) ? transmissionTextureLayout : 0;

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
float3 emissiveFactor;
float4 emissiveTextureSize;
float4 emissiveTextureDims;
float4 emissiveTextureView;
float3x3 emissiveTextureTransform;
float4 emissiveTextureUvMinMax;
float4 emissiveTextureBorderColor;
float normalTextureScale;
float4 normalTextureSize;
float4 normalTextureDims;
float4 normalTextureView;
float3x3 normalTextureTransform;
float4 normalTextureUvMinMax;
float4 normalTextureBorderColor;
float metallicFactor;
float roughnessFactor;
float occlusionTextureStrength;
float4 metallicRoughnessTextureSize;
float4 metallicRoughnessTextureDims;
float4 metallicRoughnessTextureView;
float3x3 metallicRoughnessTextureTransform;
float4 metallicRoughnessTextureUvMinMax;
float4 metallicRoughnessTextureBorderColor;
float transmissionFactor;
float4 transmissionTextureSize;
float4 transmissionTextureDims;
float4 transmissionTextureView;
float3x3 transmissionTextureTransform;
float4 transmissionTextureUvMinMax;
float4 transmissionTextureBorderColor;
float4 screenTextureSize;
float4 screenTextureDims;
float4 screenTextureView;
float3x3 screenTextureTransform;
float4 screenTextureUvMinMax;
float4 screenTextureBorderColor;
float3 sheenColorFactor;
float4 sheenColorTextureSize;
float4 sheenColorTextureDims;
float4 sheenColorTextureView;
float3x3 sheenColorTextureTransform;
float4 sheenColorTextureUvMinMax;
float4 sheenColorTextureBorderColor;
float sheenRoughnessFactor;
float4 sheenRoughnessTextureSize;
float4 sheenRoughnessTextureDims;
float4 sheenRoughnessTextureView;
float3x3 sheenRoughnessTextureTransform;
float4 sheenRoughnessTextureUvMinMax;
float4 sheenRoughnessTextureBorderColor;
float clearcoatFactor;
float4 clearcoatTextureSize;
float4 clearcoatTextureDims;
float4 clearcoatTextureView;
float3x3 clearcoatTextureTransform;
float4 clearcoatTextureUvMinMax;
float4 clearcoatTextureBorderColor;
float clearcoatRoughnessFactor;
float4 clearcoatRoughnessTextureSize;
float4 clearcoatRoughnessTextureDims;
float4 clearcoatRoughnessTextureView;
float3x3 clearcoatRoughnessTextureTransform;
float4 clearcoatRoughnessTextureUvMinMax;
float4 clearcoatRoughnessTextureBorderColor;
float4 clearcoatNormalTextureSize;
float4 clearcoatNormalTextureDims;
float4 clearcoatNormalTextureView;
float3x3 clearcoatNormalTextureTransform;
float4 clearcoatNormalTextureUvMinMax;
float4 clearcoatNormalTextureBorderColor;
float4 baseColorTextureSize;
float4 baseColorTextureDims;
float4 baseColorTextureView;
float3x3 baseColorTextureTransform;
float4 baseColorTextureUvMinMax;
float4 baseColorTextureBorderColor;
float4 baseColorFactor;
float2 baseColorTexture_offset;
float2 baseColorTexture_scale;
float baseColorTexture_rotation;
float2 emissiveTexture_offset;
float2 emissiveTexture_scale;
float emissiveTexture_rotation;
float2 normalTexture_offset;
float2 normalTexture_scale;
float normalTexture_rotation;
float2 metallicRoughnessTexture_offset;
float2 metallicRoughnessTexture_scale;
float metallicRoughnessTexture_rotation;
float2 transmissionTexture_offset;
float2 transmissionTexture_scale;
float transmissionTexture_rotation;
float2 sheenColorTexture_offset;
float2 sheenColorTexture_scale;
float sheenColorTexture_rotation;
float2 sheenRoughnessTexture_offset;
float2 sheenRoughnessTexture_scale;
float sheenRoughnessTexture_rotation;
float2 clearcoatTexture_offset;
float2 clearcoatTexture_scale;
float clearcoatTexture_rotation;
float2 clearcoatNormalTexture_offset;
float2 clearcoatNormalTexture_scale;
float clearcoatNormalTexture_rotation;
float2 clearcoatRoughnessTexture_offset;
float2 clearcoatRoughnessTexture_scale;
float clearcoatRoughnessTexture_rotation;
float Port_DebugSheenEnvLightMult_N003;
float Port_DebugSheenPunctualLightMult_N003;
float Port_Input2_N043;
float Port_Input2_N062;
float3 Port_SpecularAO_N036;
float3 Port_Albedo_N405;
float Port_Opacity_N405;
float3 Port_Emissive_N405;
float Port_Metallic_N405;
float3 Port_SpecularAO_N405;
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
texture2d<float> baseColorTexture [[id(1)]];
texture2d<float> clearcoatNormalTexture [[id(2)]];
texture2d<float> clearcoatRoughnessTexture [[id(3)]];
texture2d<float> clearcoatTexture [[id(4)]];
texture2d<float> emissiveTexture [[id(5)]];
texture2d<float> intensityTexture [[id(6)]];
texture2d<float> metallicRoughnessTexture [[id(7)]];
texture2d<float> normalTexture [[id(8)]];
texture2d<float> sc_EnvmapDiffuse [[id(9)]];
texture2d<float> sc_EnvmapSpecular [[id(10)]];
texture2d<float> sc_SSAOTexture [[id(19)]];
texture2d<float> sc_ScreenTexture [[id(20)]];
texture2d<float> sc_ShadowTexture [[id(21)]];
texture2d<float> screenTexture [[id(23)]];
texture2d<float> sheenColorTexture [[id(24)]];
texture2d<float> sheenRoughnessTexture [[id(25)]];
texture2d<float> transmissionTexture [[id(26)]];
sampler baseColorTextureSmpSC [[id(27)]];
sampler clearcoatNormalTextureSmpSC [[id(28)]];
sampler clearcoatRoughnessTextureSmpSC [[id(29)]];
sampler clearcoatTextureSmpSC [[id(30)]];
sampler emissiveTextureSmpSC [[id(31)]];
sampler intensityTextureSmpSC [[id(32)]];
sampler metallicRoughnessTextureSmpSC [[id(33)]];
sampler normalTextureSmpSC [[id(34)]];
sampler sc_EnvmapDiffuseSmpSC [[id(35)]];
sampler sc_EnvmapSpecularSmpSC [[id(36)]];
sampler sc_SSAOTextureSmpSC [[id(38)]];
sampler sc_ScreenTextureSmpSC [[id(39)]];
sampler sc_ShadowTextureSmpSC [[id(40)]];
sampler screenTextureSmpSC [[id(42)]];
sampler sheenColorTextureSmpSC [[id(43)]];
sampler sheenRoughnessTextureSmpSC [[id(44)]];
sampler transmissionTextureSmpSC [[id(45)]];
constant userUniformsObj* UserUniforms [[id(46)]];
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
float3 SurfacePosition_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexTangent_WorldSpace;
float3 VertexBinormal_WorldSpace;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float2 gScreenCoord;
float4 VertexColor;
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
float3 emissiveFactor;
float4 emissiveTextureSize;
float4 emissiveTextureDims;
float4 emissiveTextureView;
float3x3 emissiveTextureTransform;
float4 emissiveTextureUvMinMax;
float4 emissiveTextureBorderColor;
float normalTextureScale;
float4 normalTextureSize;
float4 normalTextureDims;
float4 normalTextureView;
float3x3 normalTextureTransform;
float4 normalTextureUvMinMax;
float4 normalTextureBorderColor;
float metallicFactor;
float roughnessFactor;
float occlusionTextureStrength;
float4 metallicRoughnessTextureSize;
float4 metallicRoughnessTextureDims;
float4 metallicRoughnessTextureView;
float3x3 metallicRoughnessTextureTransform;
float4 metallicRoughnessTextureUvMinMax;
float4 metallicRoughnessTextureBorderColor;
float transmissionFactor;
float4 transmissionTextureSize;
float4 transmissionTextureDims;
float4 transmissionTextureView;
float3x3 transmissionTextureTransform;
float4 transmissionTextureUvMinMax;
float4 transmissionTextureBorderColor;
float4 screenTextureSize;
float4 screenTextureDims;
float4 screenTextureView;
float3x3 screenTextureTransform;
float4 screenTextureUvMinMax;
float4 screenTextureBorderColor;
float3 sheenColorFactor;
float4 sheenColorTextureSize;
float4 sheenColorTextureDims;
float4 sheenColorTextureView;
float3x3 sheenColorTextureTransform;
float4 sheenColorTextureUvMinMax;
float4 sheenColorTextureBorderColor;
float sheenRoughnessFactor;
float4 sheenRoughnessTextureSize;
float4 sheenRoughnessTextureDims;
float4 sheenRoughnessTextureView;
float3x3 sheenRoughnessTextureTransform;
float4 sheenRoughnessTextureUvMinMax;
float4 sheenRoughnessTextureBorderColor;
float clearcoatFactor;
float4 clearcoatTextureSize;
float4 clearcoatTextureDims;
float4 clearcoatTextureView;
float3x3 clearcoatTextureTransform;
float4 clearcoatTextureUvMinMax;
float4 clearcoatTextureBorderColor;
float clearcoatRoughnessFactor;
float4 clearcoatRoughnessTextureSize;
float4 clearcoatRoughnessTextureDims;
float4 clearcoatRoughnessTextureView;
float3x3 clearcoatRoughnessTextureTransform;
float4 clearcoatRoughnessTextureUvMinMax;
float4 clearcoatRoughnessTextureBorderColor;
float4 clearcoatNormalTextureSize;
float4 clearcoatNormalTextureDims;
float4 clearcoatNormalTextureView;
float3x3 clearcoatNormalTextureTransform;
float4 clearcoatNormalTextureUvMinMax;
float4 clearcoatNormalTextureBorderColor;
float4 baseColorTextureSize;
float4 baseColorTextureDims;
float4 baseColorTextureView;
float3x3 baseColorTextureTransform;
float4 baseColorTextureUvMinMax;
float4 baseColorTextureBorderColor;
float4 baseColorFactor;
float2 baseColorTexture_offset;
float2 baseColorTexture_scale;
float baseColorTexture_rotation;
float2 emissiveTexture_offset;
float2 emissiveTexture_scale;
float emissiveTexture_rotation;
float2 normalTexture_offset;
float2 normalTexture_scale;
float normalTexture_rotation;
float2 metallicRoughnessTexture_offset;
float2 metallicRoughnessTexture_scale;
float metallicRoughnessTexture_rotation;
float2 transmissionTexture_offset;
float2 transmissionTexture_scale;
float transmissionTexture_rotation;
float2 sheenColorTexture_offset;
float2 sheenColorTexture_scale;
float sheenColorTexture_rotation;
float2 sheenRoughnessTexture_offset;
float2 sheenRoughnessTexture_scale;
float sheenRoughnessTexture_rotation;
float2 clearcoatTexture_offset;
float2 clearcoatTexture_scale;
float clearcoatTexture_rotation;
float2 clearcoatNormalTexture_offset;
float2 clearcoatNormalTexture_scale;
float clearcoatNormalTexture_rotation;
float2 clearcoatRoughnessTexture_offset;
float2 clearcoatRoughnessTexture_scale;
float clearcoatRoughnessTexture_rotation;
float Port_DebugSheenEnvLightMult_N003;
float Port_DebugSheenPunctualLightMult_N003;
float Port_Input2_N043;
float Port_Input2_N062;
float3 Port_SpecularAO_N036;
float3 Port_Albedo_N405;
float Port_Opacity_N405;
float3 Port_Emissive_N405;
float Port_Metallic_N405;
float3 Port_SpecularAO_N405;
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
texture2d<float> baseColorTexture [[id(1)]];
texture2d<float> clearcoatNormalTexture [[id(2)]];
texture2d<float> clearcoatRoughnessTexture [[id(3)]];
texture2d<float> clearcoatTexture [[id(4)]];
texture2d<float> emissiveTexture [[id(5)]];
texture2d<float> intensityTexture [[id(6)]];
texture2d<float> metallicRoughnessTexture [[id(7)]];
texture2d<float> normalTexture [[id(8)]];
texture2d<float> sc_EnvmapDiffuse [[id(9)]];
texture2d<float> sc_EnvmapSpecular [[id(10)]];
texture2d<float> sc_SSAOTexture [[id(19)]];
texture2d<float> sc_ScreenTexture [[id(20)]];
texture2d<float> sc_ShadowTexture [[id(21)]];
texture2d<float> screenTexture [[id(23)]];
texture2d<float> sheenColorTexture [[id(24)]];
texture2d<float> sheenRoughnessTexture [[id(25)]];
texture2d<float> transmissionTexture [[id(26)]];
sampler baseColorTextureSmpSC [[id(27)]];
sampler clearcoatNormalTextureSmpSC [[id(28)]];
sampler clearcoatRoughnessTextureSmpSC [[id(29)]];
sampler clearcoatTextureSmpSC [[id(30)]];
sampler emissiveTextureSmpSC [[id(31)]];
sampler intensityTextureSmpSC [[id(32)]];
sampler metallicRoughnessTextureSmpSC [[id(33)]];
sampler normalTextureSmpSC [[id(34)]];
sampler sc_EnvmapDiffuseSmpSC [[id(35)]];
sampler sc_EnvmapSpecularSmpSC [[id(36)]];
sampler sc_SSAOTextureSmpSC [[id(38)]];
sampler sc_ScreenTextureSmpSC [[id(39)]];
sampler sc_ShadowTextureSmpSC [[id(40)]];
sampler screenTextureSmpSC [[id(42)]];
sampler sheenColorTextureSmpSC [[id(43)]];
sampler sheenRoughnessTextureSmpSC [[id(44)]];
sampler transmissionTextureSmpSC [[id(45)]];
constant userUniformsObj* UserUniforms [[id(46)]];
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
// Implementation of the GLSL radians() function
template<typename T>
T radians(T d)
{
return d*T(0.01745329251);
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
float4 N31_Result;
float4 N31_PbrIn;
bool N31_EnableSheen;
bool N31_EnableTransmission;
bool N31_EnableClearcoat;
float4 N31_SheenColor;
float3 N31_Background;
float N31_Opacity;
float N31_ClearcoatBase;
float4 N31_ClearcoatColor;
ssGlobals tempGlobals;
float3 N3_BaseColor;
float3 N3_BaseColorIn;
float N3_Opacity;
float N3_OpacityIn;
float3 N3_Emissive;
float3 N3_EmissiveColor;
bool N3_EnableEmissiveTexture;
float3 N3_Normal;
bool N3_EnableNormalTexture;
float N3_Metallic;
float N3_MetallicValue;
float N3_Roughness;
float N3_RoughnessValue;
float4 N3_Occlusion;
bool N3_EnableMetallicRoughnessTexture;
bool N3_TransmissionEnable;
bool N3_SheenEnable;
bool N3_ClearcoatEnable;
int N3_EmissiveTextureCoord;
bool N3_EnableTextureTransform;
bool N3_EmissiveTextureTransform;
float2 N3_EmissiveTextureOffset;
float2 N3_EmissiveTextureScale;
float N3_EmissiveTextureRotation;
int N3_NormalTextureCoord;
bool N3_NormalTextureTransform;
float2 N3_NormalTextureOffset;
float2 N3_NormalTextureScale;
float N3_NormalTextureRotation;
float N3_NormalScale;
int N3_MaterialParamsTextureCoord;
bool N3_MaterialParamsTextureTransform;
float2 N3_MaterialParamsTextureOffset;
float2 N3_MaterialParamsTextureScale;
float N3_MaterialParamsTextureRotation;
float N3_OcclusionStrength;
float3 N3_Background;
bool N3_EnableTransmissionTexture;
int N3_TransmissionTextureCoord;
bool N3_TransmissionTextureTransform;
float2 N3_TransmissionTextureOffset;
float2 N3_TransmissionTextureScale;
float N3_TransmissionTextureRotation;
float N3_TransmissionFactor;
float3 N3_SheenColorFactor;
float N3_SheenRoughnessFactor;
bool N3_EnableSheenTexture;
int N3_SheenColorTextureCoord;
bool N3_SheenColorTextureTransform;
float2 N3_SheenColorTextureOffset;
float2 N3_SheenColorTextureScale;
float N3_SheenColorTextureRotation;
bool N3_EnableSheenRoughnessTexture;
int N3_SheenRoughnessTextureCoord;
bool N3_SheenRoughnessTextureTransform;
float2 N3_SheenRoughnessTextureOffset;
float2 N3_SheenRoughnessTextureScale;
float N3_SheenRoughnessTextureRotation;
float4 N3_SheenOut;
float N3_ClearcoatBase;
float N3_ClearcoatRoughness;
float3 N3_ClearcoatNormal;
bool N3_EnableClearcoatTexture;
int N3_ClearcoatTextureCoord;
bool N3_ClearcoatTextureTransform;
float2 N3_ClearcoatTextureOffset;
float2 N3_ClearcoatTextureScale;
float N3_ClearcoatTextureRotation;
float N3_ClearcoatFactor;
bool N3_EnableClearCoatRoughnessTexture;
int N3_ClearcoatRoughnessTextureCoord;
bool N3_ClearcoatRoughnessTextureTransform;
float2 N3_ClearcoatRoughnessTextureOffset;
float2 N3_ClearcoatRoughnessTextureScale;
float N3_ClearcoatRoughnessTextureRotation;
float N3_ClearcoatRoughnessFactor;
bool N3_EnableClearCoatNormalTexture;
int N3_ClearcoatNormalMapCoord;
bool N3_ClearcoatNormalTextureTransform;
float2 N3_ClearcoatNormalTextureOffset;
float2 N3_ClearcoatNormalTextureScale;
float N3_ClearcoatNormalTextureRotation;
float4 N35_BaseColorFactor;
bool N35_EnableBaseTexture;
int N35_BaseColorTextureCoord;
bool N35_EnableTextureTransform;
bool N35_BaseTextureTransform;
float2 N35_BaseTextureOffset;
float2 N35_BaseTextureScale;
float N35_BaseTextureRotation;
bool N35_EnableVertexColor;
float3 N35_BaseColor;
float N35_Opacity;
float4 N35_UnlitColor;
float N3_DebugSheenEnvLightMult;
float N3_DebugSheenPunctualLightMult;
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
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
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
Globals.VertexColor=in.varColor;
float4 Output_N17=float4(0.0);
float param=1.0;
float4 param_1=float4(1.0);
float4 param_2=float4(0.0);
ssGlobals param_4=Globals;
float4 param_3;
if ((int(ENABLE_GLTF_LIGHTING_tmp)!=0))
{
float3 l9_18=float3(0.0);
ssGlobals l9_19=param_4;
float3 l9_20=(*sc_set2.UserUniforms).emissiveFactor;
l9_18=l9_20;
float l9_21=0.0;
ssGlobals l9_22=param_4;
float l9_23;
if ((int(ENABLE_EMISSIVE_tmp)!=0))
{
l9_23=1.001;
}
else
{
l9_23=0.001;
}
l9_23-=0.001;
l9_21=l9_23;
float l9_24=0.0;
l9_24=float(NODE_10_DROPLIST_ITEM_tmp);
float l9_25=0.0;
ssGlobals l9_26=param_4;
float l9_27;
if ((int(ENABLE_NORMALMAP_tmp)!=0))
{
l9_27=1.001;
}
else
{
l9_27=0.001;
}
l9_27-=0.001;
l9_25=l9_27;
float l9_28=0.0;
float l9_29=1.0;
float l9_30=1.0;
float l9_31=(*sc_set2.UserUniforms).Port_Input2_N043;
ssGlobals l9_32=param_4;
float l9_33;
if ((int(ENABLE_NORMALMAP_tmp)!=0))
{
float l9_34=0.0;
ssGlobals l9_35=l9_32;
float l9_36=(*sc_set2.UserUniforms).normalTextureScale;
l9_34=l9_36;
l9_30=l9_34;
l9_33=l9_30;
}
else
{
l9_33=l9_31;
}
l9_28=l9_33;
float l9_37=0.0;
l9_37=float(NODE_8_DROPLIST_ITEM_tmp);
float l9_38=0.0;
ssGlobals l9_39=param_4;
float l9_40=(*sc_set2.UserUniforms).metallicFactor;
l9_38=l9_40;
float l9_41=0.0;
ssGlobals l9_42=param_4;
float l9_43=(*sc_set2.UserUniforms).roughnessFactor;
l9_41=l9_43;
float l9_44=0.0;
ssGlobals l9_45=param_4;
float l9_46;
if ((int(ENABLE_METALLIC_ROUGHNESS_TEX_tmp)!=0))
{
l9_46=1.001;
}
else
{
l9_46=0.001;
}
l9_46-=0.001;
l9_44=l9_46;
float l9_47=0.0;
float l9_48=1.0;
float l9_49=1.0;
float l9_50=(*sc_set2.UserUniforms).Port_Input2_N062;
ssGlobals l9_51=param_4;
float l9_52;
if ((int(ENABLE_METALLIC_ROUGHNESS_TEX_tmp)!=0))
{
float l9_53=0.0;
ssGlobals l9_54=l9_51;
float l9_55=(*sc_set2.UserUniforms).occlusionTextureStrength;
l9_53=l9_55;
l9_49=l9_53;
l9_52=l9_49;
}
else
{
l9_52=l9_50;
}
l9_47=l9_52;
float l9_56=0.0;
l9_56=float(NODE_11_DROPLIST_ITEM_tmp);
float l9_57=0.0;
ssGlobals l9_58=param_4;
float l9_59;
if ((int(ENABLE_TRANSMISSION_tmp)!=0))
{
l9_59=1.001;
}
else
{
l9_59=0.001;
}
l9_59-=0.001;
l9_57=l9_59;
float l9_60=0.0;
ssGlobals l9_61=param_4;
float l9_62=(*sc_set2.UserUniforms).transmissionFactor;
l9_60=l9_62;
float l9_63=0.0;
ssGlobals l9_64=param_4;
float l9_65;
if ((int(ENABLE_TRANSMISSION_TEX_tmp)!=0))
{
l9_65=1.001;
}
else
{
l9_65=0.001;
}
l9_65-=0.001;
l9_63=l9_65;
float l9_66=0.0;
l9_66=float(Tweak_N30_tmp);
float l9_67=0.0;
ssGlobals l9_68=param_4;
float l9_69;
if ((int(ENABLE_SHEEN_tmp)!=0))
{
l9_69=1.001;
}
else
{
l9_69=0.001;
}
l9_69-=0.001;
l9_67=l9_69;
float3 l9_70=float3(0.0);
ssGlobals l9_71=param_4;
float3 l9_72=(*sc_set2.UserUniforms).sheenColorFactor;
l9_70=l9_72;
float l9_73=0.0;
ssGlobals l9_74=param_4;
float l9_75;
if ((int(ENABLE_SHEEN_COLOR_TEX_tmp)!=0))
{
l9_75=1.001;
}
else
{
l9_75=0.001;
}
l9_75-=0.001;
l9_73=l9_75;
float l9_76=0.0;
l9_76=float(Tweak_N32_tmp);
float l9_77=0.0;
ssGlobals l9_78=param_4;
float l9_79=(*sc_set2.UserUniforms).sheenRoughnessFactor;
l9_77=l9_79;
float l9_80=0.0;
ssGlobals l9_81=param_4;
float l9_82;
if ((int(ENABLE_SHEEN_ROUGHNESS_TEX_tmp)!=0))
{
l9_82=1.001;
}
else
{
l9_82=0.001;
}
l9_82-=0.001;
l9_80=l9_82;
float l9_83=0.0;
l9_83=float(Tweak_N37_tmp);
float l9_84=0.0;
ssGlobals l9_85=param_4;
float l9_86;
if ((int(ENABLE_CLEARCOAT_tmp)!=0))
{
l9_86=1.001;
}
else
{
l9_86=0.001;
}
l9_86-=0.001;
l9_84=l9_86;
float l9_87=0.0;
ssGlobals l9_88=param_4;
float l9_89=(*sc_set2.UserUniforms).clearcoatFactor;
l9_87=l9_89;
float l9_90=0.0;
ssGlobals l9_91=param_4;
float l9_92;
if ((int(ENABLE_CLEARCOAT_TEX_tmp)!=0))
{
l9_92=1.001;
}
else
{
l9_92=0.001;
}
l9_92-=0.001;
l9_90=l9_92;
float l9_93=0.0;
l9_93=float(Tweak_N44_tmp);
float l9_94=0.0;
ssGlobals l9_95=param_4;
float l9_96=(*sc_set2.UserUniforms).clearcoatRoughnessFactor;
l9_94=l9_96;
float l9_97=0.0;
ssGlobals l9_98=param_4;
float l9_99;
if ((int(ENABLE_CLEARCOAT_ROUGHNESS_TEX_tmp)!=0))
{
l9_99=1.001;
}
else
{
l9_99=0.001;
}
l9_99-=0.001;
l9_97=l9_99;
float l9_100=0.0;
l9_100=float(Tweak_N60_tmp);
float l9_101=0.0;
ssGlobals l9_102=param_4;
float l9_103;
if ((int(ENABLE_CLEARCOAT_NORMAL_TEX_tmp)!=0))
{
l9_103=1.001;
}
else
{
l9_103=0.001;
}
l9_103-=0.001;
l9_101=l9_103;
float l9_104=0.0;
l9_104=float(Tweak_N47_tmp);
float l9_105=0.0;
ssGlobals l9_106=param_4;
float l9_107;
if ((int(ENABLE_VERTEX_COLOR_BASE_tmp)!=0))
{
l9_107=1.001;
}
else
{
l9_107=0.001;
}
l9_107-=0.001;
l9_105=l9_107;
float l9_108=0.0;
ssGlobals l9_109=param_4;
float l9_110;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
l9_110=1.001;
}
else
{
l9_110=0.001;
}
l9_110-=0.001;
l9_108=l9_110;
float l9_111=0.0;
l9_111=float(NODE_7_DROPLIST_ITEM_tmp);
float4 l9_112=float4(0.0);
ssGlobals l9_113=param_4;
float4 l9_114=(*sc_set2.UserUniforms).baseColorFactor;
l9_112=l9_114;
float l9_115=0.0;
ssGlobals l9_116=param_4;
float l9_117;
if ((int(ENABLE_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_117=1.001;
}
else
{
l9_117=0.001;
}
l9_117-=0.001;
l9_115=l9_117;
float l9_118=0.0;
ssGlobals l9_119=param_4;
float l9_120;
if ((int(ENABLE_BASE_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_120=1.001;
}
else
{
l9_120=0.001;
}
l9_120-=0.001;
l9_118=l9_120;
float2 l9_121=float2(0.0);
ssGlobals l9_122=param_4;
float2 l9_123=(*sc_set2.UserUniforms).baseColorTexture_offset;
l9_121=l9_123;
float2 l9_124=float2(0.0);
ssGlobals l9_125=param_4;
float2 l9_126=(*sc_set2.UserUniforms).baseColorTexture_scale;
l9_124=l9_126;
float l9_127=0.0;
ssGlobals l9_128=param_4;
float l9_129=(*sc_set2.UserUniforms).baseColorTexture_rotation;
l9_127=l9_129;
float3 l9_130=float3(0.0);
float l9_131=0.0;
float4 l9_132=float4(0.0);
float l9_133=l9_105;
float l9_134=l9_108;
float l9_135=l9_111;
float4 l9_136=l9_112;
float l9_137=l9_115;
float l9_138=l9_118;
float2 l9_139=l9_121;
float2 l9_140=l9_124;
float l9_141=l9_127;
ssGlobals l9_142=param_4;
tempGlobals=l9_142;
float3 l9_143=float3(0.0);
float l9_144=0.0;
float4 l9_145=float4(0.0);
N35_EnableVertexColor=(int(ENABLE_VERTEX_COLOR_BASE_tmp)!=0);
N35_EnableBaseTexture=(int(ENABLE_BASE_TEX_tmp)!=0);
N35_BaseColorTextureCoord=NODE_7_DROPLIST_ITEM_tmp;
N35_BaseColorFactor=l9_136;
N35_EnableTextureTransform=(int(ENABLE_TEXTURE_TRANSFORM_tmp)!=0);
N35_BaseTextureTransform=(int(ENABLE_BASE_TEXTURE_TRANSFORM_tmp)!=0);
N35_BaseTextureOffset=l9_139;
N35_BaseTextureScale=l9_140;
N35_BaseTextureRotation=l9_141;
float4 l9_146=N35_BaseColorFactor;
if (N35_EnableBaseTexture)
{
int l9_147=N35_BaseColorTextureCoord;
float2 l9_148=tempGlobals.Surface_UVCoord0;
float2 l9_149=l9_148;
if (l9_147==0)
{
float2 l9_150=tempGlobals.Surface_UVCoord0;
l9_149=l9_150;
}
if (l9_147==1)
{
float2 l9_151=tempGlobals.Surface_UVCoord1;
l9_149=l9_151;
}
float2 l9_152=l9_149;
float2 l9_153=l9_152;
if (N35_EnableTextureTransform&&N35_BaseTextureTransform)
{
float2 l9_154=l9_153;
float2 l9_155=N35_BaseTextureOffset;
float2 l9_156=N35_BaseTextureScale;
float l9_157=N35_BaseTextureRotation;
float3x3 l9_158=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(l9_155.x,l9_155.y,1.0));
float3x3 l9_159=float3x3(float3(cos(l9_157),sin(l9_157),0.0),float3(-sin(l9_157),cos(l9_157),0.0),float3(0.0,0.0,1.0));
float3x3 l9_160=float3x3(float3(l9_156.x,0.0,0.0),float3(0.0,l9_156.y,0.0),float3(0.0,0.0,1.0));
float3x3 l9_161=(l9_158*l9_159)*l9_160;
float2 l9_162=(l9_161*float3(l9_154,1.0)).xy;
l9_153=l9_162;
}
float2 l9_163=l9_153;
float4 l9_164=float4(0.0);
float2 l9_165=(*sc_set2.UserUniforms).baseColorTextureDims.xy;
float2 l9_166=l9_165;
int l9_167;
if ((int(baseColorTextureHasSwappedViews_tmp)!=0))
{
int l9_168;
if (sc_StereoRenderingMode_tmp==0)
{
l9_168=0;
}
else
{
l9_168=in.varStereoViewID;
}
int l9_169=l9_168;
l9_167=1-l9_169;
}
else
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
l9_167=l9_171;
}
int l9_172=l9_167;
float2 l9_173=l9_166;
int l9_174=baseColorTextureLayout_tmp;
int l9_175=l9_172;
float2 l9_176=l9_163;
bool l9_177=(int(SC_USE_UV_TRANSFORM_baseColorTexture_tmp)!=0);
float3x3 l9_178=(*sc_set2.UserUniforms).baseColorTextureTransform;
int2 l9_179=int2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture_tmp);
bool l9_180=(int(SC_USE_UV_MIN_MAX_baseColorTexture_tmp)!=0);
float4 l9_181=(*sc_set2.UserUniforms).baseColorTextureUvMinMax;
bool l9_182=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture_tmp)!=0);
float4 l9_183=(*sc_set2.UserUniforms).baseColorTextureBorderColor;
float l9_184=0.0;
bool l9_185=l9_182&&(!l9_180);
float l9_186=1.0;
float l9_187=l9_176.x;
int l9_188=l9_179.x;
if (l9_188==1)
{
l9_187=fract(l9_187);
}
else
{
if (l9_188==2)
{
float l9_189=fract(l9_187);
float l9_190=l9_187-l9_189;
float l9_191=step(0.25,fract(l9_190*0.5));
l9_187=mix(l9_189,1.0-l9_189,fast::clamp(l9_191,0.0,1.0));
}
}
l9_176.x=l9_187;
float l9_192=l9_176.y;
int l9_193=l9_179.y;
if (l9_193==1)
{
l9_192=fract(l9_192);
}
else
{
if (l9_193==2)
{
float l9_194=fract(l9_192);
float l9_195=l9_192-l9_194;
float l9_196=step(0.25,fract(l9_195*0.5));
l9_192=mix(l9_194,1.0-l9_194,fast::clamp(l9_196,0.0,1.0));
}
}
l9_176.y=l9_192;
if (l9_180)
{
bool l9_197=l9_182;
bool l9_198;
if (l9_197)
{
l9_198=l9_179.x==3;
}
else
{
l9_198=l9_197;
}
float l9_199=l9_176.x;
float l9_200=l9_181.x;
float l9_201=l9_181.z;
bool l9_202=l9_198;
float l9_203=l9_186;
float l9_204=fast::clamp(l9_199,l9_200,l9_201);
float l9_205=step(abs(l9_199-l9_204),1e-05);
l9_203*=(l9_205+((1.0-float(l9_202))*(1.0-l9_205)));
l9_199=l9_204;
l9_176.x=l9_199;
l9_186=l9_203;
bool l9_206=l9_182;
bool l9_207;
if (l9_206)
{
l9_207=l9_179.y==3;
}
else
{
l9_207=l9_206;
}
float l9_208=l9_176.y;
float l9_209=l9_181.y;
float l9_210=l9_181.w;
bool l9_211=l9_207;
float l9_212=l9_186;
float l9_213=fast::clamp(l9_208,l9_209,l9_210);
float l9_214=step(abs(l9_208-l9_213),1e-05);
l9_212*=(l9_214+((1.0-float(l9_211))*(1.0-l9_214)));
l9_208=l9_213;
l9_176.y=l9_208;
l9_186=l9_212;
}
float2 l9_215=l9_176;
bool l9_216=l9_177;
float3x3 l9_217=l9_178;
if (l9_216)
{
l9_215=float2((l9_217*float3(l9_215,1.0)).xy);
}
float2 l9_218=l9_215;
float2 l9_219=l9_218;
float2 l9_220=l9_219;
l9_176=l9_220;
float l9_221=l9_176.x;
int l9_222=l9_179.x;
bool l9_223=l9_185;
float l9_224=l9_186;
if ((l9_222==0)||(l9_222==3))
{
float l9_225=l9_221;
float l9_226=0.0;
float l9_227=1.0;
bool l9_228=l9_223;
float l9_229=l9_224;
float l9_230=fast::clamp(l9_225,l9_226,l9_227);
float l9_231=step(abs(l9_225-l9_230),1e-05);
l9_229*=(l9_231+((1.0-float(l9_228))*(1.0-l9_231)));
l9_225=l9_230;
l9_221=l9_225;
l9_224=l9_229;
}
l9_176.x=l9_221;
l9_186=l9_224;
float l9_232=l9_176.y;
int l9_233=l9_179.y;
bool l9_234=l9_185;
float l9_235=l9_186;
if ((l9_233==0)||(l9_233==3))
{
float l9_236=l9_232;
float l9_237=0.0;
float l9_238=1.0;
bool l9_239=l9_234;
float l9_240=l9_235;
float l9_241=fast::clamp(l9_236,l9_237,l9_238);
float l9_242=step(abs(l9_236-l9_241),1e-05);
l9_240*=(l9_242+((1.0-float(l9_239))*(1.0-l9_242)));
l9_236=l9_241;
l9_232=l9_236;
l9_235=l9_240;
}
l9_176.y=l9_232;
l9_186=l9_235;
float2 l9_243=l9_173;
float2 l9_244=l9_176;
int l9_245=l9_174;
int l9_246=l9_175;
float l9_247=l9_184;
float2 l9_248=l9_244;
int l9_249=l9_245;
int l9_250=l9_246;
float3 l9_251;
if (l9_249==0)
{
l9_251=float3(l9_248,0.0);
}
else
{
if (l9_249==1)
{
l9_251=float3(l9_248.x,(l9_248.y*0.5)+(0.5-(float(l9_250)*0.5)),0.0);
}
else
{
l9_251=float3(l9_248,float(l9_250));
}
}
float3 l9_252=l9_251;
float3 l9_253=l9_252;
float2 l9_254=l9_243;
float2 l9_255=l9_253.xy;
float l9_256=l9_247;
float4 l9_257=sc_set2.baseColorTexture.sample(sc_set2.baseColorTextureSmpSC,l9_255,bias(l9_256));
float4 l9_258=l9_257;
float4 l9_259=l9_258;
if (l9_182)
{
l9_259=mix(l9_183,l9_259,float4(l9_186));
}
float4 l9_260=l9_259;
float4 l9_261=l9_260;
l9_164=l9_260;
float4 l9_262=l9_164;
float4 l9_263=l9_262;
float4 l9_264;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_264=float4(pow(l9_263.x,2.2),pow(l9_263.y,2.2),pow(l9_263.z,2.2),pow(l9_263.w,2.2));
}
else
{
l9_264=l9_263*l9_263;
}
float4 l9_265=l9_264;
l9_146*=l9_265;
}
if (N35_EnableVertexColor)
{
float4 l9_266=tempGlobals.VertexColor;
l9_146*=l9_266;
}
N35_BaseColor=l9_146.xyz;
N35_Opacity=l9_146.w;
float4 l9_267=l9_146;
float4 l9_268;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_268=float4(pow(l9_267.x,0.454545),pow(l9_267.y,0.454545),pow(l9_267.z,0.454545),pow(l9_267.w,0.454545));
}
else
{
l9_268=sqrt(l9_267);
}
float4 l9_269=l9_268;
N35_UnlitColor=l9_269;
l9_143=N35_BaseColor;
l9_144=N35_Opacity;
l9_145=N35_UnlitColor;
l9_130=l9_143;
l9_131=l9_144;
l9_132=l9_145;
float l9_270=0.0;
ssGlobals l9_271=param_4;
float l9_272;
if ((int(ENABLE_EMISSIVE_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_272=1.001;
}
else
{
l9_272=0.001;
}
l9_272-=0.001;
l9_270=l9_272;
float2 l9_273=float2(0.0);
ssGlobals l9_274=param_4;
float2 l9_275=(*sc_set2.UserUniforms).emissiveTexture_offset;
l9_273=l9_275;
float2 l9_276=float2(0.0);
ssGlobals l9_277=param_4;
float2 l9_278=(*sc_set2.UserUniforms).emissiveTexture_scale;
l9_276=l9_278;
float l9_279=0.0;
ssGlobals l9_280=param_4;
float l9_281=(*sc_set2.UserUniforms).emissiveTexture_rotation;
l9_279=l9_281;
float l9_282=0.0;
ssGlobals l9_283=param_4;
float l9_284;
if ((int(ENABLE_NORMAL_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_284=1.001;
}
else
{
l9_284=0.001;
}
l9_284-=0.001;
l9_282=l9_284;
float2 l9_285=float2(0.0);
ssGlobals l9_286=param_4;
float2 l9_287=(*sc_set2.UserUniforms).normalTexture_offset;
l9_285=l9_287;
float2 l9_288=float2(0.0);
ssGlobals l9_289=param_4;
float2 l9_290=(*sc_set2.UserUniforms).normalTexture_scale;
l9_288=l9_290;
float l9_291=0.0;
ssGlobals l9_292=param_4;
float l9_293=(*sc_set2.UserUniforms).normalTexture_rotation;
l9_291=l9_293;
float l9_294=0.0;
ssGlobals l9_295=param_4;
float l9_296;
if ((int(ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_296=1.001;
}
else
{
l9_296=0.001;
}
l9_296-=0.001;
l9_294=l9_296;
float2 l9_297=float2(0.0);
ssGlobals l9_298=param_4;
float2 l9_299=(*sc_set2.UserUniforms).metallicRoughnessTexture_offset;
l9_297=l9_299;
float2 l9_300=float2(0.0);
ssGlobals l9_301=param_4;
float2 l9_302=(*sc_set2.UserUniforms).metallicRoughnessTexture_scale;
l9_300=l9_302;
float l9_303=0.0;
ssGlobals l9_304=param_4;
float l9_305=(*sc_set2.UserUniforms).metallicRoughnessTexture_rotation;
l9_303=l9_305;
float l9_306=0.0;
ssGlobals l9_307=param_4;
float l9_308;
if ((int(ENABLE_TRANSMISSION_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_308=1.001;
}
else
{
l9_308=0.001;
}
l9_308-=0.001;
l9_306=l9_308;
float2 l9_309=float2(0.0);
ssGlobals l9_310=param_4;
float2 l9_311=(*sc_set2.UserUniforms).transmissionTexture_offset;
l9_309=l9_311;
float2 l9_312=float2(0.0);
ssGlobals l9_313=param_4;
float2 l9_314=(*sc_set2.UserUniforms).transmissionTexture_scale;
l9_312=l9_314;
float l9_315=0.0;
ssGlobals l9_316=param_4;
float l9_317=(*sc_set2.UserUniforms).transmissionTexture_rotation;
l9_315=l9_317;
float l9_318=0.0;
ssGlobals l9_319=param_4;
float l9_320;
if ((int(ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_320=1.001;
}
else
{
l9_320=0.001;
}
l9_320-=0.001;
l9_318=l9_320;
float2 l9_321=float2(0.0);
ssGlobals l9_322=param_4;
float2 l9_323=(*sc_set2.UserUniforms).sheenColorTexture_offset;
l9_321=l9_323;
float2 l9_324=float2(0.0);
ssGlobals l9_325=param_4;
float2 l9_326=(*sc_set2.UserUniforms).sheenColorTexture_scale;
l9_324=l9_326;
float l9_327=0.0;
ssGlobals l9_328=param_4;
float l9_329=(*sc_set2.UserUniforms).sheenColorTexture_rotation;
l9_327=l9_329;
float l9_330=0.0;
ssGlobals l9_331=param_4;
float l9_332;
if ((int(ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_332=1.001;
}
else
{
l9_332=0.001;
}
l9_332-=0.001;
l9_330=l9_332;
float2 l9_333=float2(0.0);
ssGlobals l9_334=param_4;
float2 l9_335=(*sc_set2.UserUniforms).sheenRoughnessTexture_offset;
l9_333=l9_335;
float2 l9_336=float2(0.0);
ssGlobals l9_337=param_4;
float2 l9_338=(*sc_set2.UserUniforms).sheenRoughnessTexture_scale;
l9_336=l9_338;
float l9_339=0.0;
ssGlobals l9_340=param_4;
float l9_341=(*sc_set2.UserUniforms).sheenRoughnessTexture_rotation;
l9_339=l9_341;
float l9_342=0.0;
ssGlobals l9_343=param_4;
float l9_344;
if ((int(ENABLE_CLEARCOAT_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_344=1.001;
}
else
{
l9_344=0.001;
}
l9_344-=0.001;
l9_342=l9_344;
float2 l9_345=float2(0.0);
ssGlobals l9_346=param_4;
float2 l9_347=(*sc_set2.UserUniforms).clearcoatTexture_offset;
l9_345=l9_347;
float2 l9_348=float2(0.0);
ssGlobals l9_349=param_4;
float2 l9_350=(*sc_set2.UserUniforms).clearcoatTexture_scale;
l9_348=l9_350;
float l9_351=0.0;
ssGlobals l9_352=param_4;
float l9_353=(*sc_set2.UserUniforms).clearcoatTexture_rotation;
l9_351=l9_353;
float l9_354=0.0;
ssGlobals l9_355=param_4;
float l9_356;
if ((int(ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_356=1.001;
}
else
{
l9_356=0.001;
}
l9_356-=0.001;
l9_354=l9_356;
float2 l9_357=float2(0.0);
ssGlobals l9_358=param_4;
float2 l9_359=(*sc_set2.UserUniforms).clearcoatNormalTexture_offset;
l9_357=l9_359;
float2 l9_360=float2(0.0);
ssGlobals l9_361=param_4;
float2 l9_362=(*sc_set2.UserUniforms).clearcoatNormalTexture_scale;
l9_360=l9_362;
float l9_363=0.0;
ssGlobals l9_364=param_4;
float l9_365=(*sc_set2.UserUniforms).clearcoatNormalTexture_rotation;
l9_363=l9_365;
float l9_366=0.0;
ssGlobals l9_367=param_4;
float l9_368;
if ((int(ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_368=1.001;
}
else
{
l9_368=0.001;
}
l9_368-=0.001;
l9_366=l9_368;
float2 l9_369=float2(0.0);
ssGlobals l9_370=param_4;
float2 l9_371=(*sc_set2.UserUniforms).clearcoatRoughnessTexture_offset;
l9_369=l9_371;
float2 l9_372=float2(0.0);
ssGlobals l9_373=param_4;
float2 l9_374=(*sc_set2.UserUniforms).clearcoatRoughnessTexture_scale;
l9_372=l9_374;
float l9_375=0.0;
ssGlobals l9_376=param_4;
float l9_377=(*sc_set2.UserUniforms).clearcoatRoughnessTexture_rotation;
l9_375=l9_377;
float3 l9_378=float3(0.0);
float l9_379=0.0;
float3 l9_380=float3(0.0);
float3 l9_381=float3(0.0);
float l9_382=0.0;
float l9_383=0.0;
float4 l9_384=float4(0.0);
float3 l9_385=float3(0.0);
float4 l9_386=float4(0.0);
float l9_387=0.0;
float3 l9_388=float3(0.0);
float l9_389=0.0;
float l9_390=(*sc_set2.UserUniforms).Port_DebugSheenEnvLightMult_N003;
float l9_391=(*sc_set2.UserUniforms).Port_DebugSheenPunctualLightMult_N003;
float3 l9_392=l9_18;
float l9_393=l9_21;
float l9_394=l9_24;
float l9_395=l9_25;
float l9_396=l9_28;
float l9_397=l9_37;
float l9_398=l9_38;
float l9_399=l9_41;
float l9_400=l9_44;
float l9_401=l9_47;
float l9_402=l9_56;
float l9_403=l9_57;
float l9_404=l9_60;
float l9_405=l9_63;
float l9_406=l9_66;
float l9_407=l9_67;
float3 l9_408=l9_70;
float l9_409=l9_73;
float l9_410=l9_76;
float l9_411=l9_77;
float l9_412=l9_80;
float l9_413=l9_83;
float l9_414=l9_84;
float l9_415=l9_87;
float l9_416=l9_90;
float l9_417=l9_93;
float l9_418=l9_94;
float l9_419=l9_97;
float l9_420=l9_100;
float l9_421=l9_101;
float l9_422=l9_104;
float3 l9_423=l9_130;
float l9_424=l9_131;
float l9_425=l9_115;
float l9_426=l9_270;
float2 l9_427=l9_273;
float2 l9_428=l9_276;
float l9_429=l9_279;
float l9_430=l9_282;
float2 l9_431=l9_285;
float2 l9_432=l9_288;
float l9_433=l9_291;
float l9_434=l9_294;
float2 l9_435=l9_297;
float2 l9_436=l9_300;
float l9_437=l9_303;
float l9_438=l9_306;
float2 l9_439=l9_309;
float2 l9_440=l9_312;
float l9_441=l9_315;
float l9_442=l9_318;
float2 l9_443=l9_321;
float2 l9_444=l9_324;
float l9_445=l9_327;
float l9_446=l9_330;
float2 l9_447=l9_333;
float2 l9_448=l9_336;
float l9_449=l9_339;
float l9_450=l9_342;
float2 l9_451=l9_345;
float2 l9_452=l9_348;
float l9_453=l9_351;
float l9_454=l9_354;
float2 l9_455=l9_357;
float2 l9_456=l9_360;
float l9_457=l9_363;
float l9_458=l9_366;
float2 l9_459=l9_369;
float2 l9_460=l9_372;
float l9_461=l9_375;
ssGlobals l9_462=param_4;
tempGlobals=l9_462;
float3 l9_463=float3(0.0);
float l9_464=0.0;
float3 l9_465=float3(0.0);
float3 l9_466=float3(0.0);
float l9_467=0.0;
float l9_468=0.0;
float4 l9_469=float4(0.0);
float3 l9_470=float3(0.0);
float4 l9_471=float4(0.0);
float l9_472=0.0;
float3 l9_473=float3(0.0);
float l9_474=0.0;
N3_DebugSheenEnvLightMult=l9_390;
N3_DebugSheenPunctualLightMult=l9_391;
N3_EmissiveColor=l9_392;
N3_EnableEmissiveTexture=(int(ENABLE_EMISSIVE_tmp)!=0);
N3_EmissiveTextureCoord=NODE_10_DROPLIST_ITEM_tmp;
N3_EnableNormalTexture=(int(ENABLE_NORMALMAP_tmp)!=0);
N3_NormalScale=l9_396;
N3_NormalTextureCoord=NODE_8_DROPLIST_ITEM_tmp;
N3_MetallicValue=l9_398;
N3_RoughnessValue=l9_399;
N3_EnableMetallicRoughnessTexture=(int(ENABLE_METALLIC_ROUGHNESS_TEX_tmp)!=0);
N3_OcclusionStrength=l9_401;
N3_MaterialParamsTextureCoord=NODE_11_DROPLIST_ITEM_tmp;
N3_TransmissionEnable=(int(ENABLE_TRANSMISSION_tmp)!=0);
N3_TransmissionFactor=l9_404;
N3_EnableTransmissionTexture=(int(ENABLE_TRANSMISSION_TEX_tmp)!=0);
N3_TransmissionTextureCoord=Tweak_N30_tmp;
N3_SheenEnable=(int(ENABLE_SHEEN_tmp)!=0);
N3_SheenColorFactor=l9_408;
N3_EnableSheenTexture=(int(ENABLE_SHEEN_COLOR_TEX_tmp)!=0);
N3_SheenColorTextureCoord=Tweak_N32_tmp;
N3_SheenRoughnessFactor=l9_411;
N3_EnableSheenRoughnessTexture=(int(ENABLE_SHEEN_ROUGHNESS_TEX_tmp)!=0);
N3_SheenRoughnessTextureCoord=Tweak_N37_tmp;
N3_ClearcoatEnable=(int(ENABLE_CLEARCOAT_tmp)!=0);
N3_ClearcoatFactor=l9_415;
N3_EnableClearcoatTexture=(int(ENABLE_CLEARCOAT_TEX_tmp)!=0);
N3_ClearcoatTextureCoord=Tweak_N44_tmp;
N3_ClearcoatRoughnessFactor=l9_418;
N3_EnableClearCoatRoughnessTexture=(int(ENABLE_CLEARCOAT_ROUGHNESS_TEX_tmp)!=0);
N3_ClearcoatRoughnessTextureCoord=Tweak_N60_tmp;
N3_EnableClearCoatNormalTexture=(int(ENABLE_CLEARCOAT_NORMAL_TEX_tmp)!=0);
N3_ClearcoatNormalMapCoord=Tweak_N47_tmp;
N3_BaseColorIn=l9_423;
N3_OpacityIn=l9_424;
N3_EnableTextureTransform=(int(ENABLE_TEXTURE_TRANSFORM_tmp)!=0);
N3_EmissiveTextureTransform=(int(ENABLE_EMISSIVE_TEXTURE_TRANSFORM_tmp)!=0);
N3_EmissiveTextureOffset=l9_427;
N3_EmissiveTextureScale=l9_428;
N3_EmissiveTextureRotation=l9_429;
N3_NormalTextureTransform=(int(ENABLE_NORMAL_TEXTURE_TRANSFORM_tmp)!=0);
N3_NormalTextureOffset=l9_431;
N3_NormalTextureScale=l9_432;
N3_NormalTextureRotation=l9_433;
N3_MaterialParamsTextureTransform=(int(ENABLE_METALLIC_ROUGHNESS_TEXTURE_TRANSFORM_tmp)!=0);
N3_MaterialParamsTextureOffset=l9_435;
N3_MaterialParamsTextureScale=l9_436;
N3_MaterialParamsTextureRotation=l9_437;
N3_TransmissionTextureTransform=(int(ENABLE_TRANSMISSION_TEXTURE_TRANSFORM_tmp)!=0);
N3_TransmissionTextureOffset=l9_439;
N3_TransmissionTextureScale=l9_440;
N3_TransmissionTextureRotation=l9_441;
N3_SheenColorTextureTransform=(int(ENABLE_SHEEN_COLOR_TEXTURE_TRANSFORM_tmp)!=0);
N3_SheenColorTextureOffset=l9_443;
N3_SheenColorTextureScale=l9_444;
N3_SheenColorTextureRotation=l9_445;
N3_SheenRoughnessTextureTransform=(int(ENABLE_SHEEN_ROUGHNESS_TEXTURE_TRANSFORM_tmp)!=0);
N3_SheenRoughnessTextureOffset=l9_447;
N3_SheenRoughnessTextureScale=l9_448;
N3_SheenRoughnessTextureRotation=l9_449;
N3_ClearcoatTextureTransform=(int(ENABLE_CLEARCOAT_TEXTURE_TRANSFORM_tmp)!=0);
N3_ClearcoatTextureOffset=l9_451;
N3_ClearcoatTextureScale=l9_452;
N3_ClearcoatTextureRotation=l9_453;
N3_ClearcoatNormalTextureTransform=(int(ENABLE_CLEARCOAT_NORMAL_TEXTURE_TRANSFORM_tmp)!=0);
N3_ClearcoatNormalTextureOffset=l9_455;
N3_ClearcoatNormalTextureScale=l9_456;
N3_ClearcoatNormalTextureRotation=l9_457;
N3_ClearcoatRoughnessTextureTransform=(int(ENABLE_CLEARCOAT_ROUGHNESS_TEXTURE_TRANSFORM_tmp)!=0);
N3_ClearcoatRoughnessTextureOffset=l9_459;
N3_ClearcoatRoughnessTextureScale=l9_460;
N3_ClearcoatRoughnessTextureRotation=l9_461;
N3_BaseColor=N3_BaseColorIn;
N3_Opacity=N3_OpacityIn;
N3_Emissive=N3_EmissiveColor;
if (N3_EnableEmissiveTexture)
{
float3 l9_475=N3_Emissive;
int l9_476=N3_EmissiveTextureCoord;
float2 l9_477=tempGlobals.Surface_UVCoord0;
float2 l9_478=l9_477;
if (l9_476==0)
{
float2 l9_479=tempGlobals.Surface_UVCoord0;
l9_478=l9_479;
}
if (l9_476==1)
{
float2 l9_480=tempGlobals.Surface_UVCoord1;
l9_478=l9_480;
}
float2 l9_481=l9_478;
float2 l9_482=l9_481;
if (N3_EnableTextureTransform&&N3_EmissiveTextureTransform)
{
float2 l9_483=l9_482;
float2 l9_484=N3_EmissiveTextureOffset;
float2 l9_485=N3_EmissiveTextureScale;
float l9_486=N3_EmissiveTextureRotation;
float l9_487=radians(l9_486);
float3x3 l9_488=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(l9_484.x,l9_484.y,1.0));
float3x3 l9_489=float3x3(float3(cos(l9_487),sin(l9_487),0.0),float3(-sin(l9_487),cos(l9_487),0.0),float3(0.0,0.0,1.0));
float3x3 l9_490=float3x3(float3(l9_485.x,0.0,0.0),float3(0.0,l9_485.y,0.0),float3(0.0,0.0,1.0));
float3x3 l9_491=(l9_488*l9_489)*l9_490;
float2 l9_492=(l9_491*float3(l9_483,1.0)).xy;
l9_482=l9_492;
}
float2 l9_493=l9_482;
float4 l9_494=float4(0.0);
float2 l9_495=(*sc_set2.UserUniforms).emissiveTextureDims.xy;
float2 l9_496=l9_495;
int l9_497;
if ((int(emissiveTextureHasSwappedViews_tmp)!=0))
{
int l9_498;
if (sc_StereoRenderingMode_tmp==0)
{
l9_498=0;
}
else
{
l9_498=in.varStereoViewID;
}
int l9_499=l9_498;
l9_497=1-l9_499;
}
else
{
int l9_500;
if (sc_StereoRenderingMode_tmp==0)
{
l9_500=0;
}
else
{
l9_500=in.varStereoViewID;
}
int l9_501=l9_500;
l9_497=l9_501;
}
int l9_502=l9_497;
float2 l9_503=l9_496;
int l9_504=emissiveTextureLayout_tmp;
int l9_505=l9_502;
float2 l9_506=l9_493;
bool l9_507=(int(SC_USE_UV_TRANSFORM_emissiveTexture_tmp)!=0);
float3x3 l9_508=(*sc_set2.UserUniforms).emissiveTextureTransform;
int2 l9_509=int2(SC_SOFTWARE_WRAP_MODE_U_emissiveTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_emissiveTexture_tmp);
bool l9_510=(int(SC_USE_UV_MIN_MAX_emissiveTexture_tmp)!=0);
float4 l9_511=(*sc_set2.UserUniforms).emissiveTextureUvMinMax;
bool l9_512=(int(SC_USE_CLAMP_TO_BORDER_emissiveTexture_tmp)!=0);
float4 l9_513=(*sc_set2.UserUniforms).emissiveTextureBorderColor;
float l9_514=0.0;
bool l9_515=l9_512&&(!l9_510);
float l9_516=1.0;
float l9_517=l9_506.x;
int l9_518=l9_509.x;
if (l9_518==1)
{
l9_517=fract(l9_517);
}
else
{
if (l9_518==2)
{
float l9_519=fract(l9_517);
float l9_520=l9_517-l9_519;
float l9_521=step(0.25,fract(l9_520*0.5));
l9_517=mix(l9_519,1.0-l9_519,fast::clamp(l9_521,0.0,1.0));
}
}
l9_506.x=l9_517;
float l9_522=l9_506.y;
int l9_523=l9_509.y;
if (l9_523==1)
{
l9_522=fract(l9_522);
}
else
{
if (l9_523==2)
{
float l9_524=fract(l9_522);
float l9_525=l9_522-l9_524;
float l9_526=step(0.25,fract(l9_525*0.5));
l9_522=mix(l9_524,1.0-l9_524,fast::clamp(l9_526,0.0,1.0));
}
}
l9_506.y=l9_522;
if (l9_510)
{
bool l9_527=l9_512;
bool l9_528;
if (l9_527)
{
l9_528=l9_509.x==3;
}
else
{
l9_528=l9_527;
}
float l9_529=l9_506.x;
float l9_530=l9_511.x;
float l9_531=l9_511.z;
bool l9_532=l9_528;
float l9_533=l9_516;
float l9_534=fast::clamp(l9_529,l9_530,l9_531);
float l9_535=step(abs(l9_529-l9_534),1e-05);
l9_533*=(l9_535+((1.0-float(l9_532))*(1.0-l9_535)));
l9_529=l9_534;
l9_506.x=l9_529;
l9_516=l9_533;
bool l9_536=l9_512;
bool l9_537;
if (l9_536)
{
l9_537=l9_509.y==3;
}
else
{
l9_537=l9_536;
}
float l9_538=l9_506.y;
float l9_539=l9_511.y;
float l9_540=l9_511.w;
bool l9_541=l9_537;
float l9_542=l9_516;
float l9_543=fast::clamp(l9_538,l9_539,l9_540);
float l9_544=step(abs(l9_538-l9_543),1e-05);
l9_542*=(l9_544+((1.0-float(l9_541))*(1.0-l9_544)));
l9_538=l9_543;
l9_506.y=l9_538;
l9_516=l9_542;
}
float2 l9_545=l9_506;
bool l9_546=l9_507;
float3x3 l9_547=l9_508;
if (l9_546)
{
l9_545=float2((l9_547*float3(l9_545,1.0)).xy);
}
float2 l9_548=l9_545;
float2 l9_549=l9_548;
float2 l9_550=l9_549;
l9_506=l9_550;
float l9_551=l9_506.x;
int l9_552=l9_509.x;
bool l9_553=l9_515;
float l9_554=l9_516;
if ((l9_552==0)||(l9_552==3))
{
float l9_555=l9_551;
float l9_556=0.0;
float l9_557=1.0;
bool l9_558=l9_553;
float l9_559=l9_554;
float l9_560=fast::clamp(l9_555,l9_556,l9_557);
float l9_561=step(abs(l9_555-l9_560),1e-05);
l9_559*=(l9_561+((1.0-float(l9_558))*(1.0-l9_561)));
l9_555=l9_560;
l9_551=l9_555;
l9_554=l9_559;
}
l9_506.x=l9_551;
l9_516=l9_554;
float l9_562=l9_506.y;
int l9_563=l9_509.y;
bool l9_564=l9_515;
float l9_565=l9_516;
if ((l9_563==0)||(l9_563==3))
{
float l9_566=l9_562;
float l9_567=0.0;
float l9_568=1.0;
bool l9_569=l9_564;
float l9_570=l9_565;
float l9_571=fast::clamp(l9_566,l9_567,l9_568);
float l9_572=step(abs(l9_566-l9_571),1e-05);
l9_570*=(l9_572+((1.0-float(l9_569))*(1.0-l9_572)));
l9_566=l9_571;
l9_562=l9_566;
l9_565=l9_570;
}
l9_506.y=l9_562;
l9_516=l9_565;
float2 l9_573=l9_503;
float2 l9_574=l9_506;
int l9_575=l9_504;
int l9_576=l9_505;
float l9_577=l9_514;
float2 l9_578=l9_574;
int l9_579=l9_575;
int l9_580=l9_576;
float3 l9_581;
if (l9_579==0)
{
l9_581=float3(l9_578,0.0);
}
else
{
if (l9_579==1)
{
l9_581=float3(l9_578.x,(l9_578.y*0.5)+(0.5-(float(l9_580)*0.5)),0.0);
}
else
{
l9_581=float3(l9_578,float(l9_580));
}
}
float3 l9_582=l9_581;
float3 l9_583=l9_582;
float2 l9_584=l9_573;
float2 l9_585=l9_583.xy;
float l9_586=l9_577;
float4 l9_587=sc_set2.emissiveTexture.sample(sc_set2.emissiveTextureSmpSC,l9_585,bias(l9_586));
float4 l9_588=l9_587;
float4 l9_589=l9_588;
if (l9_512)
{
l9_589=mix(l9_513,l9_589,float4(l9_516));
}
float4 l9_590=l9_589;
float4 l9_591=l9_590;
l9_494=l9_590;
float4 l9_592=l9_494;
float3 l9_593=l9_592.xyz;
float3 l9_594;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_594=float3(pow(l9_593.x,2.2),pow(l9_593.y,2.2),pow(l9_593.z,2.2));
}
else
{
l9_594=l9_593*l9_593;
}
float3 l9_595=l9_594;
float3 l9_596=l9_595;
float3 l9_597=l9_475;
float3 l9_598;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_598=float3(pow(l9_597.x,2.2),pow(l9_597.y,2.2),pow(l9_597.z,2.2));
}
else
{
l9_598=l9_597*l9_597;
}
float3 l9_599=l9_598;
l9_475=l9_596*l9_599;
N3_Emissive=l9_475;
}
float3 l9_600=tempGlobals.VertexNormal_WorldSpace;
N3_Normal=normalize(l9_600);
if (N3_EnableNormalTexture)
{
float3 l9_601=N3_Normal;
int l9_602=N3_NormalTextureCoord;
float2 l9_603=tempGlobals.Surface_UVCoord0;
float2 l9_604=l9_603;
if (l9_602==0)
{
float2 l9_605=tempGlobals.Surface_UVCoord0;
l9_604=l9_605;
}
if (l9_602==1)
{
float2 l9_606=tempGlobals.Surface_UVCoord1;
l9_604=l9_606;
}
float2 l9_607=l9_604;
float2 l9_608=l9_607;
if (N3_EnableTextureTransform&&N3_NormalTextureTransform)
{
float2 l9_609=l9_608;
float2 l9_610=N3_NormalTextureOffset;
float2 l9_611=N3_NormalTextureScale;
float l9_612=N3_NormalTextureRotation;
float l9_613=radians(l9_612);
float3x3 l9_614=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(l9_610.x,l9_610.y,1.0));
float3x3 l9_615=float3x3(float3(cos(l9_613),sin(l9_613),0.0),float3(-sin(l9_613),cos(l9_613),0.0),float3(0.0,0.0,1.0));
float3x3 l9_616=float3x3(float3(l9_611.x,0.0,0.0),float3(0.0,l9_611.y,0.0),float3(0.0,0.0,1.0));
float3x3 l9_617=(l9_614*l9_615)*l9_616;
float2 l9_618=(l9_617*float3(l9_609,1.0)).xy;
l9_608=l9_618;
}
float2 l9_619=l9_608;
float4 l9_620=float4(0.0);
float2 l9_621=(*sc_set2.UserUniforms).normalTextureDims.xy;
float2 l9_622=l9_621;
int l9_623;
if ((int(normalTextureHasSwappedViews_tmp)!=0))
{
int l9_624;
if (sc_StereoRenderingMode_tmp==0)
{
l9_624=0;
}
else
{
l9_624=in.varStereoViewID;
}
int l9_625=l9_624;
l9_623=1-l9_625;
}
else
{
int l9_626;
if (sc_StereoRenderingMode_tmp==0)
{
l9_626=0;
}
else
{
l9_626=in.varStereoViewID;
}
int l9_627=l9_626;
l9_623=l9_627;
}
int l9_628=l9_623;
float2 l9_629=l9_622;
int l9_630=normalTextureLayout_tmp;
int l9_631=l9_628;
float2 l9_632=l9_619;
bool l9_633=(int(SC_USE_UV_TRANSFORM_normalTexture_tmp)!=0);
float3x3 l9_634=(*sc_set2.UserUniforms).normalTextureTransform;
int2 l9_635=int2(SC_SOFTWARE_WRAP_MODE_U_normalTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTexture_tmp);
bool l9_636=(int(SC_USE_UV_MIN_MAX_normalTexture_tmp)!=0);
float4 l9_637=(*sc_set2.UserUniforms).normalTextureUvMinMax;
bool l9_638=(int(SC_USE_CLAMP_TO_BORDER_normalTexture_tmp)!=0);
float4 l9_639=(*sc_set2.UserUniforms).normalTextureBorderColor;
float l9_640=0.0;
bool l9_641=l9_638&&(!l9_636);
float l9_642=1.0;
float l9_643=l9_632.x;
int l9_644=l9_635.x;
if (l9_644==1)
{
l9_643=fract(l9_643);
}
else
{
if (l9_644==2)
{
float l9_645=fract(l9_643);
float l9_646=l9_643-l9_645;
float l9_647=step(0.25,fract(l9_646*0.5));
l9_643=mix(l9_645,1.0-l9_645,fast::clamp(l9_647,0.0,1.0));
}
}
l9_632.x=l9_643;
float l9_648=l9_632.y;
int l9_649=l9_635.y;
if (l9_649==1)
{
l9_648=fract(l9_648);
}
else
{
if (l9_649==2)
{
float l9_650=fract(l9_648);
float l9_651=l9_648-l9_650;
float l9_652=step(0.25,fract(l9_651*0.5));
l9_648=mix(l9_650,1.0-l9_650,fast::clamp(l9_652,0.0,1.0));
}
}
l9_632.y=l9_648;
if (l9_636)
{
bool l9_653=l9_638;
bool l9_654;
if (l9_653)
{
l9_654=l9_635.x==3;
}
else
{
l9_654=l9_653;
}
float l9_655=l9_632.x;
float l9_656=l9_637.x;
float l9_657=l9_637.z;
bool l9_658=l9_654;
float l9_659=l9_642;
float l9_660=fast::clamp(l9_655,l9_656,l9_657);
float l9_661=step(abs(l9_655-l9_660),1e-05);
l9_659*=(l9_661+((1.0-float(l9_658))*(1.0-l9_661)));
l9_655=l9_660;
l9_632.x=l9_655;
l9_642=l9_659;
bool l9_662=l9_638;
bool l9_663;
if (l9_662)
{
l9_663=l9_635.y==3;
}
else
{
l9_663=l9_662;
}
float l9_664=l9_632.y;
float l9_665=l9_637.y;
float l9_666=l9_637.w;
bool l9_667=l9_663;
float l9_668=l9_642;
float l9_669=fast::clamp(l9_664,l9_665,l9_666);
float l9_670=step(abs(l9_664-l9_669),1e-05);
l9_668*=(l9_670+((1.0-float(l9_667))*(1.0-l9_670)));
l9_664=l9_669;
l9_632.y=l9_664;
l9_642=l9_668;
}
float2 l9_671=l9_632;
bool l9_672=l9_633;
float3x3 l9_673=l9_634;
if (l9_672)
{
l9_671=float2((l9_673*float3(l9_671,1.0)).xy);
}
float2 l9_674=l9_671;
float2 l9_675=l9_674;
float2 l9_676=l9_675;
l9_632=l9_676;
float l9_677=l9_632.x;
int l9_678=l9_635.x;
bool l9_679=l9_641;
float l9_680=l9_642;
if ((l9_678==0)||(l9_678==3))
{
float l9_681=l9_677;
float l9_682=0.0;
float l9_683=1.0;
bool l9_684=l9_679;
float l9_685=l9_680;
float l9_686=fast::clamp(l9_681,l9_682,l9_683);
float l9_687=step(abs(l9_681-l9_686),1e-05);
l9_685*=(l9_687+((1.0-float(l9_684))*(1.0-l9_687)));
l9_681=l9_686;
l9_677=l9_681;
l9_680=l9_685;
}
l9_632.x=l9_677;
l9_642=l9_680;
float l9_688=l9_632.y;
int l9_689=l9_635.y;
bool l9_690=l9_641;
float l9_691=l9_642;
if ((l9_689==0)||(l9_689==3))
{
float l9_692=l9_688;
float l9_693=0.0;
float l9_694=1.0;
bool l9_695=l9_690;
float l9_696=l9_691;
float l9_697=fast::clamp(l9_692,l9_693,l9_694);
float l9_698=step(abs(l9_692-l9_697),1e-05);
l9_696*=(l9_698+((1.0-float(l9_695))*(1.0-l9_698)));
l9_692=l9_697;
l9_688=l9_692;
l9_691=l9_696;
}
l9_632.y=l9_688;
l9_642=l9_691;
float2 l9_699=l9_629;
float2 l9_700=l9_632;
int l9_701=l9_630;
int l9_702=l9_631;
float l9_703=l9_640;
float2 l9_704=l9_700;
int l9_705=l9_701;
int l9_706=l9_702;
float3 l9_707;
if (l9_705==0)
{
l9_707=float3(l9_704,0.0);
}
else
{
if (l9_705==1)
{
l9_707=float3(l9_704.x,(l9_704.y*0.5)+(0.5-(float(l9_706)*0.5)),0.0);
}
else
{
l9_707=float3(l9_704,float(l9_706));
}
}
float3 l9_708=l9_707;
float3 l9_709=l9_708;
float2 l9_710=l9_699;
float2 l9_711=l9_709.xy;
float l9_712=l9_703;
float4 l9_713=sc_set2.normalTexture.sample(sc_set2.normalTextureSmpSC,l9_711,bias(l9_712));
float4 l9_714=l9_713;
float4 l9_715=l9_714;
if (l9_638)
{
l9_715=mix(l9_639,l9_715,float4(l9_642));
}
float4 l9_716=l9_715;
float4 l9_717=l9_716;
l9_620=l9_716;
float4 l9_718=l9_620;
float3 l9_719=(l9_718.xyz*1.99219)-float3(1.0);
l9_719=mix(float3(0.0,0.0,1.0),l9_719,float3(N3_NormalScale));
float3 l9_720=tempGlobals.VertexTangent_WorldSpace;
float3 l9_721=l9_720;
float3 l9_722=tempGlobals.VertexBinormal_WorldSpace;
float3 l9_723=l9_722;
float3x3 l9_724=float3x3(float3(l9_721),float3(l9_723),float3(l9_601));
l9_601=normalize(l9_724*l9_719);
N3_Normal=l9_601;
}
N3_Metallic=N3_MetallicValue;
N3_Roughness=N3_RoughnessValue;
N3_Occlusion=float4(1.0,1.0,1.0,0.0);
if (N3_EnableMetallicRoughnessTexture)
{
float l9_725=N3_Metallic;
float l9_726=N3_Roughness;
float4 l9_727=N3_Occlusion;
int l9_728=N3_MaterialParamsTextureCoord;
float2 l9_729=tempGlobals.Surface_UVCoord0;
float2 l9_730=l9_729;
if (l9_728==0)
{
float2 l9_731=tempGlobals.Surface_UVCoord0;
l9_730=l9_731;
}
if (l9_728==1)
{
float2 l9_732=tempGlobals.Surface_UVCoord1;
l9_730=l9_732;
}
float2 l9_733=l9_730;
float2 l9_734=l9_733;
if (N3_EnableTextureTransform&&N3_MaterialParamsTextureTransform)
{
float2 l9_735=l9_734;
float2 l9_736=N3_MaterialParamsTextureOffset;
float2 l9_737=N3_MaterialParamsTextureScale;
float l9_738=N3_MaterialParamsTextureRotation;
float l9_739=radians(l9_738);
float3x3 l9_740=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(l9_736.x,l9_736.y,1.0));
float3x3 l9_741=float3x3(float3(cos(l9_739),sin(l9_739),0.0),float3(-sin(l9_739),cos(l9_739),0.0),float3(0.0,0.0,1.0));
float3x3 l9_742=float3x3(float3(l9_737.x,0.0,0.0),float3(0.0,l9_737.y,0.0),float3(0.0,0.0,1.0));
float3x3 l9_743=(l9_740*l9_741)*l9_742;
float2 l9_744=(l9_743*float3(l9_735,1.0)).xy;
l9_734=l9_744;
}
float2 l9_745=l9_734;
float4 l9_746=float4(0.0);
float2 l9_747=(*sc_set2.UserUniforms).metallicRoughnessTextureDims.xy;
float2 l9_748=l9_747;
int l9_749;
if ((int(metallicRoughnessTextureHasSwappedViews_tmp)!=0))
{
int l9_750;
if (sc_StereoRenderingMode_tmp==0)
{
l9_750=0;
}
else
{
l9_750=in.varStereoViewID;
}
int l9_751=l9_750;
l9_749=1-l9_751;
}
else
{
int l9_752;
if (sc_StereoRenderingMode_tmp==0)
{
l9_752=0;
}
else
{
l9_752=in.varStereoViewID;
}
int l9_753=l9_752;
l9_749=l9_753;
}
int l9_754=l9_749;
float2 l9_755=l9_748;
int l9_756=metallicRoughnessTextureLayout_tmp;
int l9_757=l9_754;
float2 l9_758=l9_745;
bool l9_759=(int(SC_USE_UV_TRANSFORM_metallicRoughnessTexture_tmp)!=0);
float3x3 l9_760=(*sc_set2.UserUniforms).metallicRoughnessTextureTransform;
int2 l9_761=int2(SC_SOFTWARE_WRAP_MODE_U_metallicRoughnessTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_metallicRoughnessTexture_tmp);
bool l9_762=(int(SC_USE_UV_MIN_MAX_metallicRoughnessTexture_tmp)!=0);
float4 l9_763=(*sc_set2.UserUniforms).metallicRoughnessTextureUvMinMax;
bool l9_764=(int(SC_USE_CLAMP_TO_BORDER_metallicRoughnessTexture_tmp)!=0);
float4 l9_765=(*sc_set2.UserUniforms).metallicRoughnessTextureBorderColor;
float l9_766=0.0;
bool l9_767=l9_764&&(!l9_762);
float l9_768=1.0;
float l9_769=l9_758.x;
int l9_770=l9_761.x;
if (l9_770==1)
{
l9_769=fract(l9_769);
}
else
{
if (l9_770==2)
{
float l9_771=fract(l9_769);
float l9_772=l9_769-l9_771;
float l9_773=step(0.25,fract(l9_772*0.5));
l9_769=mix(l9_771,1.0-l9_771,fast::clamp(l9_773,0.0,1.0));
}
}
l9_758.x=l9_769;
float l9_774=l9_758.y;
int l9_775=l9_761.y;
if (l9_775==1)
{
l9_774=fract(l9_774);
}
else
{
if (l9_775==2)
{
float l9_776=fract(l9_774);
float l9_777=l9_774-l9_776;
float l9_778=step(0.25,fract(l9_777*0.5));
l9_774=mix(l9_776,1.0-l9_776,fast::clamp(l9_778,0.0,1.0));
}
}
l9_758.y=l9_774;
if (l9_762)
{
bool l9_779=l9_764;
bool l9_780;
if (l9_779)
{
l9_780=l9_761.x==3;
}
else
{
l9_780=l9_779;
}
float l9_781=l9_758.x;
float l9_782=l9_763.x;
float l9_783=l9_763.z;
bool l9_784=l9_780;
float l9_785=l9_768;
float l9_786=fast::clamp(l9_781,l9_782,l9_783);
float l9_787=step(abs(l9_781-l9_786),1e-05);
l9_785*=(l9_787+((1.0-float(l9_784))*(1.0-l9_787)));
l9_781=l9_786;
l9_758.x=l9_781;
l9_768=l9_785;
bool l9_788=l9_764;
bool l9_789;
if (l9_788)
{
l9_789=l9_761.y==3;
}
else
{
l9_789=l9_788;
}
float l9_790=l9_758.y;
float l9_791=l9_763.y;
float l9_792=l9_763.w;
bool l9_793=l9_789;
float l9_794=l9_768;
float l9_795=fast::clamp(l9_790,l9_791,l9_792);
float l9_796=step(abs(l9_790-l9_795),1e-05);
l9_794*=(l9_796+((1.0-float(l9_793))*(1.0-l9_796)));
l9_790=l9_795;
l9_758.y=l9_790;
l9_768=l9_794;
}
float2 l9_797=l9_758;
bool l9_798=l9_759;
float3x3 l9_799=l9_760;
if (l9_798)
{
l9_797=float2((l9_799*float3(l9_797,1.0)).xy);
}
float2 l9_800=l9_797;
float2 l9_801=l9_800;
float2 l9_802=l9_801;
l9_758=l9_802;
float l9_803=l9_758.x;
int l9_804=l9_761.x;
bool l9_805=l9_767;
float l9_806=l9_768;
if ((l9_804==0)||(l9_804==3))
{
float l9_807=l9_803;
float l9_808=0.0;
float l9_809=1.0;
bool l9_810=l9_805;
float l9_811=l9_806;
float l9_812=fast::clamp(l9_807,l9_808,l9_809);
float l9_813=step(abs(l9_807-l9_812),1e-05);
l9_811*=(l9_813+((1.0-float(l9_810))*(1.0-l9_813)));
l9_807=l9_812;
l9_803=l9_807;
l9_806=l9_811;
}
l9_758.x=l9_803;
l9_768=l9_806;
float l9_814=l9_758.y;
int l9_815=l9_761.y;
bool l9_816=l9_767;
float l9_817=l9_768;
if ((l9_815==0)||(l9_815==3))
{
float l9_818=l9_814;
float l9_819=0.0;
float l9_820=1.0;
bool l9_821=l9_816;
float l9_822=l9_817;
float l9_823=fast::clamp(l9_818,l9_819,l9_820);
float l9_824=step(abs(l9_818-l9_823),1e-05);
l9_822*=(l9_824+((1.0-float(l9_821))*(1.0-l9_824)));
l9_818=l9_823;
l9_814=l9_818;
l9_817=l9_822;
}
l9_758.y=l9_814;
l9_768=l9_817;
float2 l9_825=l9_755;
float2 l9_826=l9_758;
int l9_827=l9_756;
int l9_828=l9_757;
float l9_829=l9_766;
float2 l9_830=l9_826;
int l9_831=l9_827;
int l9_832=l9_828;
float3 l9_833;
if (l9_831==0)
{
l9_833=float3(l9_830,0.0);
}
else
{
if (l9_831==1)
{
l9_833=float3(l9_830.x,(l9_830.y*0.5)+(0.5-(float(l9_832)*0.5)),0.0);
}
else
{
l9_833=float3(l9_830,float(l9_832));
}
}
float3 l9_834=l9_833;
float3 l9_835=l9_834;
float2 l9_836=l9_825;
float2 l9_837=l9_835.xy;
float l9_838=l9_829;
float4 l9_839=sc_set2.metallicRoughnessTexture.sample(sc_set2.metallicRoughnessTextureSmpSC,l9_837,bias(l9_838));
float4 l9_840=l9_839;
float4 l9_841=l9_840;
if (l9_764)
{
l9_841=mix(l9_765,l9_841,float4(l9_768));
}
float4 l9_842=l9_841;
float4 l9_843=l9_842;
l9_746=l9_842;
float4 l9_844=l9_746;
float3 l9_845=l9_844.xyz;
l9_725*=l9_845.x;
l9_726*=l9_845.y;
l9_727.w=N3_OcclusionStrength;
float3 l9_846=float3(1.0+(l9_727.w*(l9_845.z-1.0)));
l9_727=float4(l9_846.x,l9_846.y,l9_846.z,l9_727.w);
N3_Metallic=l9_725;
N3_Roughness=l9_726;
N3_Occlusion=l9_727;
}
if (N3_TransmissionEnable)
{
float3 l9_847=N3_BaseColor;
float3 l9_848=N3_Emissive;
float l9_849=N3_Metallic;
float2 l9_850=tempGlobals.gScreenCoord;
float2 l9_851=l9_850;
float4 l9_852=float4(0.0);
float2 l9_853=(*sc_set2.UserUniforms).screenTextureDims.xy;
float2 l9_854=l9_853;
int l9_855;
if ((int(screenTextureHasSwappedViews_tmp)!=0))
{
int l9_856;
if (sc_StereoRenderingMode_tmp==0)
{
l9_856=0;
}
else
{
l9_856=in.varStereoViewID;
}
int l9_857=l9_856;
l9_855=1-l9_857;
}
else
{
int l9_858;
if (sc_StereoRenderingMode_tmp==0)
{
l9_858=0;
}
else
{
l9_858=in.varStereoViewID;
}
int l9_859=l9_858;
l9_855=l9_859;
}
int l9_860=l9_855;
float2 l9_861=l9_854;
int l9_862=screenTextureLayout_tmp;
int l9_863=l9_860;
float2 l9_864=l9_851;
bool l9_865=(int(SC_USE_UV_TRANSFORM_screenTexture_tmp)!=0);
float3x3 l9_866=(*sc_set2.UserUniforms).screenTextureTransform;
int2 l9_867=int2(SC_SOFTWARE_WRAP_MODE_U_screenTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTexture_tmp);
bool l9_868=(int(SC_USE_UV_MIN_MAX_screenTexture_tmp)!=0);
float4 l9_869=(*sc_set2.UserUniforms).screenTextureUvMinMax;
bool l9_870=(int(SC_USE_CLAMP_TO_BORDER_screenTexture_tmp)!=0);
float4 l9_871=(*sc_set2.UserUniforms).screenTextureBorderColor;
float l9_872=0.0;
bool l9_873=l9_870&&(!l9_868);
float l9_874=1.0;
float l9_875=l9_864.x;
int l9_876=l9_867.x;
if (l9_876==1)
{
l9_875=fract(l9_875);
}
else
{
if (l9_876==2)
{
float l9_877=fract(l9_875);
float l9_878=l9_875-l9_877;
float l9_879=step(0.25,fract(l9_878*0.5));
l9_875=mix(l9_877,1.0-l9_877,fast::clamp(l9_879,0.0,1.0));
}
}
l9_864.x=l9_875;
float l9_880=l9_864.y;
int l9_881=l9_867.y;
if (l9_881==1)
{
l9_880=fract(l9_880);
}
else
{
if (l9_881==2)
{
float l9_882=fract(l9_880);
float l9_883=l9_880-l9_882;
float l9_884=step(0.25,fract(l9_883*0.5));
l9_880=mix(l9_882,1.0-l9_882,fast::clamp(l9_884,0.0,1.0));
}
}
l9_864.y=l9_880;
if (l9_868)
{
bool l9_885=l9_870;
bool l9_886;
if (l9_885)
{
l9_886=l9_867.x==3;
}
else
{
l9_886=l9_885;
}
float l9_887=l9_864.x;
float l9_888=l9_869.x;
float l9_889=l9_869.z;
bool l9_890=l9_886;
float l9_891=l9_874;
float l9_892=fast::clamp(l9_887,l9_888,l9_889);
float l9_893=step(abs(l9_887-l9_892),1e-05);
l9_891*=(l9_893+((1.0-float(l9_890))*(1.0-l9_893)));
l9_887=l9_892;
l9_864.x=l9_887;
l9_874=l9_891;
bool l9_894=l9_870;
bool l9_895;
if (l9_894)
{
l9_895=l9_867.y==3;
}
else
{
l9_895=l9_894;
}
float l9_896=l9_864.y;
float l9_897=l9_869.y;
float l9_898=l9_869.w;
bool l9_899=l9_895;
float l9_900=l9_874;
float l9_901=fast::clamp(l9_896,l9_897,l9_898);
float l9_902=step(abs(l9_896-l9_901),1e-05);
l9_900*=(l9_902+((1.0-float(l9_899))*(1.0-l9_902)));
l9_896=l9_901;
l9_864.y=l9_896;
l9_874=l9_900;
}
float2 l9_903=l9_864;
bool l9_904=l9_865;
float3x3 l9_905=l9_866;
if (l9_904)
{
l9_903=float2((l9_905*float3(l9_903,1.0)).xy);
}
float2 l9_906=l9_903;
float2 l9_907=l9_906;
float2 l9_908=l9_907;
l9_864=l9_908;
float l9_909=l9_864.x;
int l9_910=l9_867.x;
bool l9_911=l9_873;
float l9_912=l9_874;
if ((l9_910==0)||(l9_910==3))
{
float l9_913=l9_909;
float l9_914=0.0;
float l9_915=1.0;
bool l9_916=l9_911;
float l9_917=l9_912;
float l9_918=fast::clamp(l9_913,l9_914,l9_915);
float l9_919=step(abs(l9_913-l9_918),1e-05);
l9_917*=(l9_919+((1.0-float(l9_916))*(1.0-l9_919)));
l9_913=l9_918;
l9_909=l9_913;
l9_912=l9_917;
}
l9_864.x=l9_909;
l9_874=l9_912;
float l9_920=l9_864.y;
int l9_921=l9_867.y;
bool l9_922=l9_873;
float l9_923=l9_874;
if ((l9_921==0)||(l9_921==3))
{
float l9_924=l9_920;
float l9_925=0.0;
float l9_926=1.0;
bool l9_927=l9_922;
float l9_928=l9_923;
float l9_929=fast::clamp(l9_924,l9_925,l9_926);
float l9_930=step(abs(l9_924-l9_929),1e-05);
l9_928*=(l9_930+((1.0-float(l9_927))*(1.0-l9_930)));
l9_924=l9_929;
l9_920=l9_924;
l9_923=l9_928;
}
l9_864.y=l9_920;
l9_874=l9_923;
float2 l9_931=l9_861;
float2 l9_932=l9_864;
int l9_933=l9_862;
int l9_934=l9_863;
float l9_935=l9_872;
float2 l9_936=l9_932;
int l9_937=l9_933;
int l9_938=l9_934;
float3 l9_939;
if (l9_937==0)
{
l9_939=float3(l9_936,0.0);
}
else
{
if (l9_937==1)
{
l9_939=float3(l9_936.x,(l9_936.y*0.5)+(0.5-(float(l9_938)*0.5)),0.0);
}
else
{
l9_939=float3(l9_936,float(l9_938));
}
}
float3 l9_940=l9_939;
float3 l9_941=l9_940;
float2 l9_942=l9_931;
float2 l9_943=l9_941.xy;
float l9_944=l9_935;
float4 l9_945=sc_set2.screenTexture.sample(sc_set2.screenTextureSmpSC,l9_943,bias(l9_944));
float4 l9_946=l9_945;
float4 l9_947=l9_946;
if (l9_870)
{
l9_947=mix(l9_871,l9_947,float4(l9_874));
}
float4 l9_948=l9_947;
float4 l9_949=l9_948;
l9_852=l9_948;
float4 l9_950=l9_852;
float3 l9_951=l9_950.xyz;
float3 l9_952;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_952=float3(pow(l9_951.x,2.2),pow(l9_951.y,2.2),pow(l9_951.z,2.2));
}
else
{
l9_952=l9_951*l9_951;
}
float3 l9_953=l9_952;
N3_Background=l9_953;
float l9_954=1.0;
if (N3_EnableTransmissionTexture)
{
int l9_955=N3_TransmissionTextureCoord;
float2 l9_956=tempGlobals.Surface_UVCoord0;
float2 l9_957=l9_956;
if (l9_955==0)
{
float2 l9_958=tempGlobals.Surface_UVCoord0;
l9_957=l9_958;
}
if (l9_955==1)
{
float2 l9_959=tempGlobals.Surface_UVCoord1;
l9_957=l9_959;
}
float2 l9_960=l9_957;
float2 l9_961=l9_960;
if (N3_EnableTextureTransform&&N3_TransmissionTextureTransform)
{
float2 l9_962=l9_961;
float2 l9_963=N3_TransmissionTextureOffset;
float2 l9_964=N3_TransmissionTextureScale;
float l9_965=N3_TransmissionTextureRotation;
float l9_966=radians(l9_965);
float3x3 l9_967=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(l9_963.x,l9_963.y,1.0));
float3x3 l9_968=float3x3(float3(cos(l9_966),sin(l9_966),0.0),float3(-sin(l9_966),cos(l9_966),0.0),float3(0.0,0.0,1.0));
float3x3 l9_969=float3x3(float3(l9_964.x,0.0,0.0),float3(0.0,l9_964.y,0.0),float3(0.0,0.0,1.0));
float3x3 l9_970=(l9_967*l9_968)*l9_969;
float2 l9_971=(l9_970*float3(l9_962,1.0)).xy;
l9_961=l9_971;
}
float2 l9_972=l9_961;
float4 l9_973=float4(0.0);
float2 l9_974=(*sc_set2.UserUniforms).transmissionTextureDims.xy;
float2 l9_975=l9_974;
int l9_976;
if ((int(transmissionTextureHasSwappedViews_tmp)!=0))
{
int l9_977;
if (sc_StereoRenderingMode_tmp==0)
{
l9_977=0;
}
else
{
l9_977=in.varStereoViewID;
}
int l9_978=l9_977;
l9_976=1-l9_978;
}
else
{
int l9_979;
if (sc_StereoRenderingMode_tmp==0)
{
l9_979=0;
}
else
{
l9_979=in.varStereoViewID;
}
int l9_980=l9_979;
l9_976=l9_980;
}
int l9_981=l9_976;
float2 l9_982=l9_975;
int l9_983=transmissionTextureLayout_tmp;
int l9_984=l9_981;
float2 l9_985=l9_972;
bool l9_986=(int(SC_USE_UV_TRANSFORM_transmissionTexture_tmp)!=0);
float3x3 l9_987=(*sc_set2.UserUniforms).transmissionTextureTransform;
int2 l9_988=int2(SC_SOFTWARE_WRAP_MODE_U_transmissionTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_transmissionTexture_tmp);
bool l9_989=(int(SC_USE_UV_MIN_MAX_transmissionTexture_tmp)!=0);
float4 l9_990=(*sc_set2.UserUniforms).transmissionTextureUvMinMax;
bool l9_991=(int(SC_USE_CLAMP_TO_BORDER_transmissionTexture_tmp)!=0);
float4 l9_992=(*sc_set2.UserUniforms).transmissionTextureBorderColor;
float l9_993=0.0;
bool l9_994=l9_991&&(!l9_989);
float l9_995=1.0;
float l9_996=l9_985.x;
int l9_997=l9_988.x;
if (l9_997==1)
{
l9_996=fract(l9_996);
}
else
{
if (l9_997==2)
{
float l9_998=fract(l9_996);
float l9_999=l9_996-l9_998;
float l9_1000=step(0.25,fract(l9_999*0.5));
l9_996=mix(l9_998,1.0-l9_998,fast::clamp(l9_1000,0.0,1.0));
}
}
l9_985.x=l9_996;
float l9_1001=l9_985.y;
int l9_1002=l9_988.y;
if (l9_1002==1)
{
l9_1001=fract(l9_1001);
}
else
{
if (l9_1002==2)
{
float l9_1003=fract(l9_1001);
float l9_1004=l9_1001-l9_1003;
float l9_1005=step(0.25,fract(l9_1004*0.5));
l9_1001=mix(l9_1003,1.0-l9_1003,fast::clamp(l9_1005,0.0,1.0));
}
}
l9_985.y=l9_1001;
if (l9_989)
{
bool l9_1006=l9_991;
bool l9_1007;
if (l9_1006)
{
l9_1007=l9_988.x==3;
}
else
{
l9_1007=l9_1006;
}
float l9_1008=l9_985.x;
float l9_1009=l9_990.x;
float l9_1010=l9_990.z;
bool l9_1011=l9_1007;
float l9_1012=l9_995;
float l9_1013=fast::clamp(l9_1008,l9_1009,l9_1010);
float l9_1014=step(abs(l9_1008-l9_1013),1e-05);
l9_1012*=(l9_1014+((1.0-float(l9_1011))*(1.0-l9_1014)));
l9_1008=l9_1013;
l9_985.x=l9_1008;
l9_995=l9_1012;
bool l9_1015=l9_991;
bool l9_1016;
if (l9_1015)
{
l9_1016=l9_988.y==3;
}
else
{
l9_1016=l9_1015;
}
float l9_1017=l9_985.y;
float l9_1018=l9_990.y;
float l9_1019=l9_990.w;
bool l9_1020=l9_1016;
float l9_1021=l9_995;
float l9_1022=fast::clamp(l9_1017,l9_1018,l9_1019);
float l9_1023=step(abs(l9_1017-l9_1022),1e-05);
l9_1021*=(l9_1023+((1.0-float(l9_1020))*(1.0-l9_1023)));
l9_1017=l9_1022;
l9_985.y=l9_1017;
l9_995=l9_1021;
}
float2 l9_1024=l9_985;
bool l9_1025=l9_986;
float3x3 l9_1026=l9_987;
if (l9_1025)
{
l9_1024=float2((l9_1026*float3(l9_1024,1.0)).xy);
}
float2 l9_1027=l9_1024;
float2 l9_1028=l9_1027;
float2 l9_1029=l9_1028;
l9_985=l9_1029;
float l9_1030=l9_985.x;
int l9_1031=l9_988.x;
bool l9_1032=l9_994;
float l9_1033=l9_995;
if ((l9_1031==0)||(l9_1031==3))
{
float l9_1034=l9_1030;
float l9_1035=0.0;
float l9_1036=1.0;
bool l9_1037=l9_1032;
float l9_1038=l9_1033;
float l9_1039=fast::clamp(l9_1034,l9_1035,l9_1036);
float l9_1040=step(abs(l9_1034-l9_1039),1e-05);
l9_1038*=(l9_1040+((1.0-float(l9_1037))*(1.0-l9_1040)));
l9_1034=l9_1039;
l9_1030=l9_1034;
l9_1033=l9_1038;
}
l9_985.x=l9_1030;
l9_995=l9_1033;
float l9_1041=l9_985.y;
int l9_1042=l9_988.y;
bool l9_1043=l9_994;
float l9_1044=l9_995;
if ((l9_1042==0)||(l9_1042==3))
{
float l9_1045=l9_1041;
float l9_1046=0.0;
float l9_1047=1.0;
bool l9_1048=l9_1043;
float l9_1049=l9_1044;
float l9_1050=fast::clamp(l9_1045,l9_1046,l9_1047);
float l9_1051=step(abs(l9_1045-l9_1050),1e-05);
l9_1049*=(l9_1051+((1.0-float(l9_1048))*(1.0-l9_1051)));
l9_1045=l9_1050;
l9_1041=l9_1045;
l9_1044=l9_1049;
}
l9_985.y=l9_1041;
l9_995=l9_1044;
float2 l9_1052=l9_982;
float2 l9_1053=l9_985;
int l9_1054=l9_983;
int l9_1055=l9_984;
float l9_1056=l9_993;
float2 l9_1057=l9_1053;
int l9_1058=l9_1054;
int l9_1059=l9_1055;
float3 l9_1060;
if (l9_1058==0)
{
l9_1060=float3(l9_1057,0.0);
}
else
{
if (l9_1058==1)
{
l9_1060=float3(l9_1057.x,(l9_1057.y*0.5)+(0.5-(float(l9_1059)*0.5)),0.0);
}
else
{
l9_1060=float3(l9_1057,float(l9_1059));
}
}
float3 l9_1061=l9_1060;
float3 l9_1062=l9_1061;
float2 l9_1063=l9_1052;
float2 l9_1064=l9_1062.xy;
float l9_1065=l9_1056;
float4 l9_1066=sc_set2.transmissionTexture.sample(sc_set2.transmissionTextureSmpSC,l9_1064,bias(l9_1065));
float4 l9_1067=l9_1066;
float4 l9_1068=l9_1067;
if (l9_991)
{
l9_1068=mix(l9_992,l9_1068,float4(l9_995));
}
float4 l9_1069=l9_1068;
float4 l9_1070=l9_1069;
l9_973=l9_1069;
float4 l9_1071=l9_973;
l9_954=l9_1071.x;
}
l9_954*=N3_TransmissionFactor;
float3 l9_1072=l9_847;
l9_847=mix(l9_1072,float3(0.0),float3(l9_954));
l9_847=mix(l9_847,l9_1072,float3(l9_849));
float3 l9_1073=l9_848;
l9_848=mix(float3(0.0),l9_1072,float3(l9_954))*N3_Background;
l9_848=mix(l9_848,float3(0.0),float3(l9_849))+l9_1073;
N3_BaseColor=l9_847;
N3_Emissive=l9_848;
}
float3 l9_1074=N3_BaseColor;
float3 l9_1075;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1075=float3(pow(l9_1074.x,0.454545),pow(l9_1074.y,0.454545),pow(l9_1074.z,0.454545));
}
else
{
l9_1075=sqrt(l9_1074);
}
float3 l9_1076=l9_1075;
N3_BaseColor=l9_1076;
float l9_1077=N3_Opacity;
float l9_1078;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1078=pow(l9_1077,0.454545);
}
else
{
l9_1078=sqrt(l9_1077);
}
float l9_1079=l9_1078;
N3_Opacity=l9_1079;
float3 l9_1080=N3_Emissive;
float3 l9_1081;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1081=float3(pow(l9_1080.x,0.454545),pow(l9_1080.y,0.454545),pow(l9_1080.z,0.454545));
}
else
{
l9_1081=sqrt(l9_1080);
}
float3 l9_1082=l9_1081;
N3_Emissive=l9_1082;
if (N3_SheenEnable)
{
float3 l9_1083=N3_Normal;
float4 l9_1084=N3_Occlusion;
float3 l9_1085=N3_SheenColorFactor;
float l9_1086=N3_SheenRoughnessFactor;
if (N3_EnableSheenTexture)
{
int l9_1087=N3_SheenColorTextureCoord;
float2 l9_1088=tempGlobals.Surface_UVCoord0;
float2 l9_1089=l9_1088;
if (l9_1087==0)
{
float2 l9_1090=tempGlobals.Surface_UVCoord0;
l9_1089=l9_1090;
}
if (l9_1087==1)
{
float2 l9_1091=tempGlobals.Surface_UVCoord1;
l9_1089=l9_1091;
}
float2 l9_1092=l9_1089;
float2 l9_1093=l9_1092;
if (N3_EnableTextureTransform&&N3_SheenColorTextureTransform)
{
float2 l9_1094=l9_1093;
float2 l9_1095=N3_SheenColorTextureOffset;
float2 l9_1096=N3_SheenColorTextureScale;
float l9_1097=N3_SheenColorTextureRotation;
float l9_1098=radians(l9_1097);
float3x3 l9_1099=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(l9_1095.x,l9_1095.y,1.0));
float3x3 l9_1100=float3x3(float3(cos(l9_1098),sin(l9_1098),0.0),float3(-sin(l9_1098),cos(l9_1098),0.0),float3(0.0,0.0,1.0));
float3x3 l9_1101=float3x3(float3(l9_1096.x,0.0,0.0),float3(0.0,l9_1096.y,0.0),float3(0.0,0.0,1.0));
float3x3 l9_1102=(l9_1099*l9_1100)*l9_1101;
float2 l9_1103=(l9_1102*float3(l9_1094,1.0)).xy;
l9_1093=l9_1103;
}
float2 l9_1104=l9_1093;
float4 l9_1105=float4(0.0);
float2 l9_1106=(*sc_set2.UserUniforms).sheenColorTextureDims.xy;
float2 l9_1107=l9_1106;
int l9_1108;
if ((int(sheenColorTextureHasSwappedViews_tmp)!=0))
{
int l9_1109;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1109=0;
}
else
{
l9_1109=in.varStereoViewID;
}
int l9_1110=l9_1109;
l9_1108=1-l9_1110;
}
else
{
int l9_1111;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1111=0;
}
else
{
l9_1111=in.varStereoViewID;
}
int l9_1112=l9_1111;
l9_1108=l9_1112;
}
int l9_1113=l9_1108;
float2 l9_1114=l9_1107;
int l9_1115=sheenColorTextureLayout_tmp;
int l9_1116=l9_1113;
float2 l9_1117=l9_1104;
bool l9_1118=(int(SC_USE_UV_TRANSFORM_sheenColorTexture_tmp)!=0);
float3x3 l9_1119=(*sc_set2.UserUniforms).sheenColorTextureTransform;
int2 l9_1120=int2(SC_SOFTWARE_WRAP_MODE_U_sheenColorTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_sheenColorTexture_tmp);
bool l9_1121=(int(SC_USE_UV_MIN_MAX_sheenColorTexture_tmp)!=0);
float4 l9_1122=(*sc_set2.UserUniforms).sheenColorTextureUvMinMax;
bool l9_1123=(int(SC_USE_CLAMP_TO_BORDER_sheenColorTexture_tmp)!=0);
float4 l9_1124=(*sc_set2.UserUniforms).sheenColorTextureBorderColor;
float l9_1125=0.0;
bool l9_1126=l9_1123&&(!l9_1121);
float l9_1127=1.0;
float l9_1128=l9_1117.x;
int l9_1129=l9_1120.x;
if (l9_1129==1)
{
l9_1128=fract(l9_1128);
}
else
{
if (l9_1129==2)
{
float l9_1130=fract(l9_1128);
float l9_1131=l9_1128-l9_1130;
float l9_1132=step(0.25,fract(l9_1131*0.5));
l9_1128=mix(l9_1130,1.0-l9_1130,fast::clamp(l9_1132,0.0,1.0));
}
}
l9_1117.x=l9_1128;
float l9_1133=l9_1117.y;
int l9_1134=l9_1120.y;
if (l9_1134==1)
{
l9_1133=fract(l9_1133);
}
else
{
if (l9_1134==2)
{
float l9_1135=fract(l9_1133);
float l9_1136=l9_1133-l9_1135;
float l9_1137=step(0.25,fract(l9_1136*0.5));
l9_1133=mix(l9_1135,1.0-l9_1135,fast::clamp(l9_1137,0.0,1.0));
}
}
l9_1117.y=l9_1133;
if (l9_1121)
{
bool l9_1138=l9_1123;
bool l9_1139;
if (l9_1138)
{
l9_1139=l9_1120.x==3;
}
else
{
l9_1139=l9_1138;
}
float l9_1140=l9_1117.x;
float l9_1141=l9_1122.x;
float l9_1142=l9_1122.z;
bool l9_1143=l9_1139;
float l9_1144=l9_1127;
float l9_1145=fast::clamp(l9_1140,l9_1141,l9_1142);
float l9_1146=step(abs(l9_1140-l9_1145),1e-05);
l9_1144*=(l9_1146+((1.0-float(l9_1143))*(1.0-l9_1146)));
l9_1140=l9_1145;
l9_1117.x=l9_1140;
l9_1127=l9_1144;
bool l9_1147=l9_1123;
bool l9_1148;
if (l9_1147)
{
l9_1148=l9_1120.y==3;
}
else
{
l9_1148=l9_1147;
}
float l9_1149=l9_1117.y;
float l9_1150=l9_1122.y;
float l9_1151=l9_1122.w;
bool l9_1152=l9_1148;
float l9_1153=l9_1127;
float l9_1154=fast::clamp(l9_1149,l9_1150,l9_1151);
float l9_1155=step(abs(l9_1149-l9_1154),1e-05);
l9_1153*=(l9_1155+((1.0-float(l9_1152))*(1.0-l9_1155)));
l9_1149=l9_1154;
l9_1117.y=l9_1149;
l9_1127=l9_1153;
}
float2 l9_1156=l9_1117;
bool l9_1157=l9_1118;
float3x3 l9_1158=l9_1119;
if (l9_1157)
{
l9_1156=float2((l9_1158*float3(l9_1156,1.0)).xy);
}
float2 l9_1159=l9_1156;
float2 l9_1160=l9_1159;
float2 l9_1161=l9_1160;
l9_1117=l9_1161;
float l9_1162=l9_1117.x;
int l9_1163=l9_1120.x;
bool l9_1164=l9_1126;
float l9_1165=l9_1127;
if ((l9_1163==0)||(l9_1163==3))
{
float l9_1166=l9_1162;
float l9_1167=0.0;
float l9_1168=1.0;
bool l9_1169=l9_1164;
float l9_1170=l9_1165;
float l9_1171=fast::clamp(l9_1166,l9_1167,l9_1168);
float l9_1172=step(abs(l9_1166-l9_1171),1e-05);
l9_1170*=(l9_1172+((1.0-float(l9_1169))*(1.0-l9_1172)));
l9_1166=l9_1171;
l9_1162=l9_1166;
l9_1165=l9_1170;
}
l9_1117.x=l9_1162;
l9_1127=l9_1165;
float l9_1173=l9_1117.y;
int l9_1174=l9_1120.y;
bool l9_1175=l9_1126;
float l9_1176=l9_1127;
if ((l9_1174==0)||(l9_1174==3))
{
float l9_1177=l9_1173;
float l9_1178=0.0;
float l9_1179=1.0;
bool l9_1180=l9_1175;
float l9_1181=l9_1176;
float l9_1182=fast::clamp(l9_1177,l9_1178,l9_1179);
float l9_1183=step(abs(l9_1177-l9_1182),1e-05);
l9_1181*=(l9_1183+((1.0-float(l9_1180))*(1.0-l9_1183)));
l9_1177=l9_1182;
l9_1173=l9_1177;
l9_1176=l9_1181;
}
l9_1117.y=l9_1173;
l9_1127=l9_1176;
float2 l9_1184=l9_1114;
float2 l9_1185=l9_1117;
int l9_1186=l9_1115;
int l9_1187=l9_1116;
float l9_1188=l9_1125;
float2 l9_1189=l9_1185;
int l9_1190=l9_1186;
int l9_1191=l9_1187;
float3 l9_1192;
if (l9_1190==0)
{
l9_1192=float3(l9_1189,0.0);
}
else
{
if (l9_1190==1)
{
l9_1192=float3(l9_1189.x,(l9_1189.y*0.5)+(0.5-(float(l9_1191)*0.5)),0.0);
}
else
{
l9_1192=float3(l9_1189,float(l9_1191));
}
}
float3 l9_1193=l9_1192;
float3 l9_1194=l9_1193;
float2 l9_1195=l9_1184;
float2 l9_1196=l9_1194.xy;
float l9_1197=l9_1188;
float4 l9_1198=sc_set2.sheenColorTexture.sample(sc_set2.sheenColorTextureSmpSC,l9_1196,bias(l9_1197));
float4 l9_1199=l9_1198;
float4 l9_1200=l9_1199;
if (l9_1123)
{
l9_1200=mix(l9_1124,l9_1200,float4(l9_1127));
}
float4 l9_1201=l9_1200;
float4 l9_1202=l9_1201;
l9_1105=l9_1201;
float4 l9_1203=l9_1105;
float3 l9_1204=l9_1203.xyz;
float3 l9_1205;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1205=float3(pow(l9_1204.x,2.2),pow(l9_1204.y,2.2),pow(l9_1204.z,2.2));
}
else
{
l9_1205=l9_1204*l9_1204;
}
float3 l9_1206=l9_1205;
l9_1085*=l9_1206;
}
if (N3_EnableSheenRoughnessTexture)
{
int l9_1207=N3_SheenRoughnessTextureCoord;
float2 l9_1208=tempGlobals.Surface_UVCoord0;
float2 l9_1209=l9_1208;
if (l9_1207==0)
{
float2 l9_1210=tempGlobals.Surface_UVCoord0;
l9_1209=l9_1210;
}
if (l9_1207==1)
{
float2 l9_1211=tempGlobals.Surface_UVCoord1;
l9_1209=l9_1211;
}
float2 l9_1212=l9_1209;
float2 l9_1213=l9_1212;
if (N3_EnableTextureTransform&&N3_SheenRoughnessTextureTransform)
{
float2 l9_1214=l9_1213;
float2 l9_1215=N3_SheenRoughnessTextureOffset;
float2 l9_1216=N3_SheenRoughnessTextureScale;
float l9_1217=N3_SheenRoughnessTextureRotation;
float l9_1218=radians(l9_1217);
float3x3 l9_1219=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(l9_1215.x,l9_1215.y,1.0));
float3x3 l9_1220=float3x3(float3(cos(l9_1218),sin(l9_1218),0.0),float3(-sin(l9_1218),cos(l9_1218),0.0),float3(0.0,0.0,1.0));
float3x3 l9_1221=float3x3(float3(l9_1216.x,0.0,0.0),float3(0.0,l9_1216.y,0.0),float3(0.0,0.0,1.0));
float3x3 l9_1222=(l9_1219*l9_1220)*l9_1221;
float2 l9_1223=(l9_1222*float3(l9_1214,1.0)).xy;
l9_1213=l9_1223;
}
float2 l9_1224=l9_1213;
float4 l9_1225=float4(0.0);
float2 l9_1226=(*sc_set2.UserUniforms).sheenRoughnessTextureDims.xy;
float2 l9_1227=l9_1226;
int l9_1228;
if ((int(sheenRoughnessTextureHasSwappedViews_tmp)!=0))
{
int l9_1229;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1229=0;
}
else
{
l9_1229=in.varStereoViewID;
}
int l9_1230=l9_1229;
l9_1228=1-l9_1230;
}
else
{
int l9_1231;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1231=0;
}
else
{
l9_1231=in.varStereoViewID;
}
int l9_1232=l9_1231;
l9_1228=l9_1232;
}
int l9_1233=l9_1228;
float2 l9_1234=l9_1227;
int l9_1235=sheenRoughnessTextureLayout_tmp;
int l9_1236=l9_1233;
float2 l9_1237=l9_1224;
bool l9_1238=(int(SC_USE_UV_TRANSFORM_sheenRoughnessTexture_tmp)!=0);
float3x3 l9_1239=(*sc_set2.UserUniforms).sheenRoughnessTextureTransform;
int2 l9_1240=int2(SC_SOFTWARE_WRAP_MODE_U_sheenRoughnessTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_sheenRoughnessTexture_tmp);
bool l9_1241=(int(SC_USE_UV_MIN_MAX_sheenRoughnessTexture_tmp)!=0);
float4 l9_1242=(*sc_set2.UserUniforms).sheenRoughnessTextureUvMinMax;
bool l9_1243=(int(SC_USE_CLAMP_TO_BORDER_sheenRoughnessTexture_tmp)!=0);
float4 l9_1244=(*sc_set2.UserUniforms).sheenRoughnessTextureBorderColor;
float l9_1245=0.0;
bool l9_1246=l9_1243&&(!l9_1241);
float l9_1247=1.0;
float l9_1248=l9_1237.x;
int l9_1249=l9_1240.x;
if (l9_1249==1)
{
l9_1248=fract(l9_1248);
}
else
{
if (l9_1249==2)
{
float l9_1250=fract(l9_1248);
float l9_1251=l9_1248-l9_1250;
float l9_1252=step(0.25,fract(l9_1251*0.5));
l9_1248=mix(l9_1250,1.0-l9_1250,fast::clamp(l9_1252,0.0,1.0));
}
}
l9_1237.x=l9_1248;
float l9_1253=l9_1237.y;
int l9_1254=l9_1240.y;
if (l9_1254==1)
{
l9_1253=fract(l9_1253);
}
else
{
if (l9_1254==2)
{
float l9_1255=fract(l9_1253);
float l9_1256=l9_1253-l9_1255;
float l9_1257=step(0.25,fract(l9_1256*0.5));
l9_1253=mix(l9_1255,1.0-l9_1255,fast::clamp(l9_1257,0.0,1.0));
}
}
l9_1237.y=l9_1253;
if (l9_1241)
{
bool l9_1258=l9_1243;
bool l9_1259;
if (l9_1258)
{
l9_1259=l9_1240.x==3;
}
else
{
l9_1259=l9_1258;
}
float l9_1260=l9_1237.x;
float l9_1261=l9_1242.x;
float l9_1262=l9_1242.z;
bool l9_1263=l9_1259;
float l9_1264=l9_1247;
float l9_1265=fast::clamp(l9_1260,l9_1261,l9_1262);
float l9_1266=step(abs(l9_1260-l9_1265),1e-05);
l9_1264*=(l9_1266+((1.0-float(l9_1263))*(1.0-l9_1266)));
l9_1260=l9_1265;
l9_1237.x=l9_1260;
l9_1247=l9_1264;
bool l9_1267=l9_1243;
bool l9_1268;
if (l9_1267)
{
l9_1268=l9_1240.y==3;
}
else
{
l9_1268=l9_1267;
}
float l9_1269=l9_1237.y;
float l9_1270=l9_1242.y;
float l9_1271=l9_1242.w;
bool l9_1272=l9_1268;
float l9_1273=l9_1247;
float l9_1274=fast::clamp(l9_1269,l9_1270,l9_1271);
float l9_1275=step(abs(l9_1269-l9_1274),1e-05);
l9_1273*=(l9_1275+((1.0-float(l9_1272))*(1.0-l9_1275)));
l9_1269=l9_1274;
l9_1237.y=l9_1269;
l9_1247=l9_1273;
}
float2 l9_1276=l9_1237;
bool l9_1277=l9_1238;
float3x3 l9_1278=l9_1239;
if (l9_1277)
{
l9_1276=float2((l9_1278*float3(l9_1276,1.0)).xy);
}
float2 l9_1279=l9_1276;
float2 l9_1280=l9_1279;
float2 l9_1281=l9_1280;
l9_1237=l9_1281;
float l9_1282=l9_1237.x;
int l9_1283=l9_1240.x;
bool l9_1284=l9_1246;
float l9_1285=l9_1247;
if ((l9_1283==0)||(l9_1283==3))
{
float l9_1286=l9_1282;
float l9_1287=0.0;
float l9_1288=1.0;
bool l9_1289=l9_1284;
float l9_1290=l9_1285;
float l9_1291=fast::clamp(l9_1286,l9_1287,l9_1288);
float l9_1292=step(abs(l9_1286-l9_1291),1e-05);
l9_1290*=(l9_1292+((1.0-float(l9_1289))*(1.0-l9_1292)));
l9_1286=l9_1291;
l9_1282=l9_1286;
l9_1285=l9_1290;
}
l9_1237.x=l9_1282;
l9_1247=l9_1285;
float l9_1293=l9_1237.y;
int l9_1294=l9_1240.y;
bool l9_1295=l9_1246;
float l9_1296=l9_1247;
if ((l9_1294==0)||(l9_1294==3))
{
float l9_1297=l9_1293;
float l9_1298=0.0;
float l9_1299=1.0;
bool l9_1300=l9_1295;
float l9_1301=l9_1296;
float l9_1302=fast::clamp(l9_1297,l9_1298,l9_1299);
float l9_1303=step(abs(l9_1297-l9_1302),1e-05);
l9_1301*=(l9_1303+((1.0-float(l9_1300))*(1.0-l9_1303)));
l9_1297=l9_1302;
l9_1293=l9_1297;
l9_1296=l9_1301;
}
l9_1237.y=l9_1293;
l9_1247=l9_1296;
float2 l9_1304=l9_1234;
float2 l9_1305=l9_1237;
int l9_1306=l9_1235;
int l9_1307=l9_1236;
float l9_1308=l9_1245;
float2 l9_1309=l9_1305;
int l9_1310=l9_1306;
int l9_1311=l9_1307;
float3 l9_1312;
if (l9_1310==0)
{
l9_1312=float3(l9_1309,0.0);
}
else
{
if (l9_1310==1)
{
l9_1312=float3(l9_1309.x,(l9_1309.y*0.5)+(0.5-(float(l9_1311)*0.5)),0.0);
}
else
{
l9_1312=float3(l9_1309,float(l9_1311));
}
}
float3 l9_1313=l9_1312;
float3 l9_1314=l9_1313;
float2 l9_1315=l9_1304;
float2 l9_1316=l9_1314.xy;
float l9_1317=l9_1308;
float4 l9_1318=sc_set2.sheenRoughnessTexture.sample(sc_set2.sheenRoughnessTextureSmpSC,l9_1316,bias(l9_1317));
float4 l9_1319=l9_1318;
float4 l9_1320=l9_1319;
if (l9_1243)
{
l9_1320=mix(l9_1244,l9_1320,float4(l9_1247));
}
float4 l9_1321=l9_1320;
float4 l9_1322=l9_1321;
l9_1225=l9_1321;
float4 l9_1323=l9_1225;
float l9_1324=l9_1323.w;
float l9_1325;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1325=pow(l9_1324,2.2);
}
else
{
l9_1325=l9_1324*l9_1324;
}
float l9_1326=l9_1325;
l9_1086*=l9_1326;
}
l9_1086=fast::max(l9_1086,0.0001);
N3_SheenOut=float4(0.0);
float3 l9_1327=l9_1083;
float3 l9_1328=(*sc_set2.UserUniforms).sc_Camera.position;
float3 l9_1329=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_1330=normalize(l9_1328-l9_1329);
float3 l9_1331=l9_1327;
float3 l9_1332=l9_1330;
float l9_1333=fast::clamp(dot(l9_1331,l9_1332),0.0,1.0);
float l9_1334=fast::max(l9_1333,0.0001);
float l9_1335=l9_1086*l9_1086;
float3 l9_1336=normalize(reflect(-l9_1330,l9_1327));
float l9_1337=l9_1334;
float3 l9_1338=l9_1336;
float l9_1339=l9_1086;
float3 l9_1340=l9_1085;
float l9_1341=l9_1339*4.0;
l9_1341=3.0+(((l9_1341-0.0)*2.0)/5.0);
float l9_1342=l9_1339*l9_1339;
float l9_1343;
if (l9_1339<0.25)
{
l9_1343=(((-339.2)*l9_1342)+(161.4*l9_1339))-25.9;
}
else
{
l9_1343=(((-8.48)*l9_1342)+(14.3*l9_1339))-9.95;
}
float l9_1344=l9_1343;
float l9_1345;
if (l9_1339<0.25)
{
l9_1345=((44.0*l9_1342)-(23.7*l9_1339))+3.26;
}
else
{
l9_1345=((1.97*l9_1342)-(3.27*l9_1339))+0.72;
}
float l9_1346=l9_1345;
float l9_1347=l9_1344;
float l9_1348=l9_1337;
float l9_1349=l9_1346;
float l9_1350;
if (l9_1339<0.25)
{
l9_1350=0.0;
}
else
{
l9_1350=0.1*(l9_1339-0.25);
}
float l9_1351=exp((l9_1347*l9_1348)+l9_1349)+l9_1350;
float l9_1352=3.14159;
l9_1351=fast::clamp(l9_1351*l9_1352,0.0,1.0);
float3 l9_1353=l9_1338;
float l9_1354=l9_1341;
float3 l9_1355=float3(0.0);
float3 l9_1356=l9_1353;
float l9_1357=l9_1354;
float3 l9_1358=l9_1356;
float l9_1359=l9_1357;
float3 l9_1360=l9_1358;
float l9_1361=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float l9_1362=l9_1360.x;
float l9_1363=-l9_1360.z;
float l9_1364=(l9_1362<0.0) ? (-1.0) : 1.0;
float l9_1365=l9_1364*acos(fast::clamp(l9_1363/length(float2(l9_1362,l9_1363)),-1.0,1.0));
float2 l9_1366;
l9_1366.x=l9_1365-1.5708;
l9_1366.y=acos(l9_1360.y);
l9_1366/=float2(6.28319,3.14159);
l9_1366.y=1.0-l9_1366.y;
l9_1366.x+=(l9_1361/360.0);
l9_1366.x=fract((l9_1366.x+floor(l9_1366.x))+1.0);
float2 l9_1367=l9_1366;
float2 l9_1368=l9_1367;
float4 l9_1369;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_1370=floor(l9_1359);
float l9_1371=ceil(l9_1359);
float l9_1372=l9_1359-l9_1370;
float2 l9_1373=l9_1368;
float2 l9_1374=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1375=l9_1370;
float2 l9_1376=calcSeamlessPanoramicUvsForSampling(l9_1373,l9_1374,l9_1375);
float2 l9_1377=l9_1376;
float l9_1378=l9_1370;
float2 l9_1379=l9_1377;
float l9_1380=l9_1378;
int l9_1381;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1382;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1382=0;
}
else
{
l9_1382=in.varStereoViewID;
}
int l9_1383=l9_1382;
l9_1381=1-l9_1383;
}
else
{
int l9_1384;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1384=0;
}
else
{
l9_1384=in.varStereoViewID;
}
int l9_1385=l9_1384;
l9_1381=l9_1385;
}
int l9_1386=l9_1381;
float2 l9_1387=l9_1379;
int l9_1388=l9_1386;
float l9_1389=l9_1380;
float2 l9_1390=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_1391=l9_1390;
float2 l9_1392=l9_1387;
int l9_1393=sc_EnvmapSpecularLayout_tmp;
int l9_1394=l9_1388;
float l9_1395=l9_1389;
float2 l9_1396=l9_1392;
int l9_1397=l9_1393;
int l9_1398=l9_1394;
float3 l9_1399;
if (l9_1397==0)
{
l9_1399=float3(l9_1396,0.0);
}
else
{
if (l9_1397==1)
{
l9_1399=float3(l9_1396.x,(l9_1396.y*0.5)+(0.5-(float(l9_1398)*0.5)),0.0);
}
else
{
l9_1399=float3(l9_1396,float(l9_1398));
}
}
float3 l9_1400=l9_1399;
float3 l9_1401=l9_1400;
float2 l9_1402=l9_1391;
float2 l9_1403=l9_1401.xy;
float l9_1404=l9_1395;
float4 l9_1405=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_1403,level(l9_1404));
float4 l9_1406=l9_1405;
float4 l9_1407=l9_1406;
float4 l9_1408=l9_1407;
float4 l9_1409=l9_1408;
float4 l9_1410=l9_1409;
float4 l9_1411=l9_1410;
float2 l9_1412=l9_1368;
float2 l9_1413=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_1414=l9_1371;
float2 l9_1415=calcSeamlessPanoramicUvsForSampling(l9_1412,l9_1413,l9_1414);
float2 l9_1416=l9_1415;
float l9_1417=l9_1371;
float2 l9_1418=l9_1416;
float l9_1419=l9_1417;
int l9_1420;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1421;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1421=0;
}
else
{
l9_1421=in.varStereoViewID;
}
int l9_1422=l9_1421;
l9_1420=1-l9_1422;
}
else
{
int l9_1423;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1423=0;
}
else
{
l9_1423=in.varStereoViewID;
}
int l9_1424=l9_1423;
l9_1420=l9_1424;
}
int l9_1425=l9_1420;
float2 l9_1426=l9_1418;
int l9_1427=l9_1425;
float l9_1428=l9_1419;
float2 l9_1429=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_1430=l9_1429;
float2 l9_1431=l9_1426;
int l9_1432=sc_EnvmapSpecularLayout_tmp;
int l9_1433=l9_1427;
float l9_1434=l9_1428;
float2 l9_1435=l9_1431;
int l9_1436=l9_1432;
int l9_1437=l9_1433;
float3 l9_1438;
if (l9_1436==0)
{
l9_1438=float3(l9_1435,0.0);
}
else
{
if (l9_1436==1)
{
l9_1438=float3(l9_1435.x,(l9_1435.y*0.5)+(0.5-(float(l9_1437)*0.5)),0.0);
}
else
{
l9_1438=float3(l9_1435,float(l9_1437));
}
}
float3 l9_1439=l9_1438;
float3 l9_1440=l9_1439;
float2 l9_1441=l9_1430;
float2 l9_1442=l9_1440.xy;
float l9_1443=l9_1434;
float4 l9_1444=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_1442,level(l9_1443));
float4 l9_1445=l9_1444;
float4 l9_1446=l9_1445;
float4 l9_1447=l9_1446;
float4 l9_1448=l9_1447;
float4 l9_1449=l9_1448;
float4 l9_1450=l9_1449;
l9_1369=mix(l9_1411,l9_1450,float4(l9_1372));
}
else
{
float2 l9_1451=l9_1368;
float l9_1452=l9_1359;
float2 l9_1453=l9_1451;
float l9_1454=l9_1452;
int l9_1455;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_1456;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1456=0;
}
else
{
l9_1456=in.varStereoViewID;
}
int l9_1457=l9_1456;
l9_1455=1-l9_1457;
}
else
{
int l9_1458;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1458=0;
}
else
{
l9_1458=in.varStereoViewID;
}
int l9_1459=l9_1458;
l9_1455=l9_1459;
}
int l9_1460=l9_1455;
float2 l9_1461=l9_1453;
int l9_1462=l9_1460;
float l9_1463=l9_1454;
float2 l9_1464=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_1465=l9_1464;
float2 l9_1466=l9_1461;
int l9_1467=sc_EnvmapSpecularLayout_tmp;
int l9_1468=l9_1462;
float l9_1469=l9_1463;
float2 l9_1470=l9_1466;
int l9_1471=l9_1467;
int l9_1472=l9_1468;
float3 l9_1473;
if (l9_1471==0)
{
l9_1473=float3(l9_1470,0.0);
}
else
{
if (l9_1471==1)
{
l9_1473=float3(l9_1470.x,(l9_1470.y*0.5)+(0.5-(float(l9_1472)*0.5)),0.0);
}
else
{
l9_1473=float3(l9_1470,float(l9_1472));
}
}
float3 l9_1474=l9_1473;
float3 l9_1475=l9_1474;
float2 l9_1476=l9_1465;
float2 l9_1477=l9_1475.xy;
float l9_1478=l9_1469;
float4 l9_1479=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_1477,level(l9_1478));
float4 l9_1480=l9_1479;
float4 l9_1481=l9_1480;
float4 l9_1482=l9_1481;
float4 l9_1483=l9_1482;
float4 l9_1484=l9_1483;
l9_1369=l9_1484;
}
float4 l9_1485=l9_1369;
float3 l9_1486=l9_1485.xyz*(1.0/l9_1485.w);
float3 l9_1487=l9_1486;
float3 l9_1488=l9_1487*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_1488+=float3(1e-06);
float3 l9_1489=l9_1488;
l9_1355=l9_1489;
float3 l9_1490=l9_1355;
float3 l9_1491=l9_1490;
float3 l9_1492=(l9_1491*l9_1340)*l9_1351;
float3 l9_1493=N3_SheenOut.xyz+l9_1492;
N3_SheenOut=float4(l9_1493.x,l9_1493.y,l9_1493.z,N3_SheenOut.w);
float3 l9_1494=mix(N3_SheenOut.xyz,N3_SheenOut.xyz*l9_1084.xyz,float3(l9_1084.w));
N3_SheenOut=float4(l9_1494.x,l9_1494.y,l9_1494.z,N3_SheenOut.w);
float3 l9_1495=l9_1085;
float3 l9_1496=l9_1327;
float3 l9_1497=l9_1330;
float l9_1498=l9_1334;
float l9_1499=l9_1335;
float3 l9_1500=float3(0.0);
int l9_1501=0;
l9_1501=sc_DirectionalLightsCount_tmp;
int l9_1502=l9_1501;
if (l9_1502>0)
{
float l9_1503;
int l9_1504=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
int l9_1505=0;
l9_1505=sc_DirectionalLightsCount_tmp;
int l9_1506=l9_1505;
if (l9_1504<l9_1506)
{
int l9_1507=l9_1504;
float3 l9_1508=float3(0.0);
if (l9_1507<sc_DirectionalLightsCount_tmp)
{
l9_1508=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_1507].color.xyz;
}
float3 l9_1509=l9_1508;
float3 l9_1510=l9_1509;
int l9_1511=l9_1504;
float l9_1512=0.0;
if (l9_1511<sc_DirectionalLightsCount_tmp)
{
l9_1512=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_1511].color.w;
}
float l9_1513=l9_1512;
float l9_1514=l9_1513;
l9_1510*=l9_1514;
l9_1510*=3.14159;
int l9_1515=l9_1504;
float3 l9_1516=float3(0.0);
if (l9_1515<sc_DirectionalLightsCount_tmp)
{
l9_1516=-(*sc_set2.UserUniforms).sc_DirectionalLights[l9_1515].direction;
}
float3 l9_1517=l9_1516;
float3 l9_1518=normalize(-l9_1517);
float3 l9_1519=normalize(l9_1518+l9_1497);
float3 l9_1520=l9_1496;
float3 l9_1521=l9_1519;
float l9_1522=fast::clamp(dot(l9_1520,l9_1521),0.0,1.0);
float l9_1523=l9_1522;
float3 l9_1524=l9_1496;
float3 l9_1525=l9_1518;
float l9_1526=fast::clamp(dot(l9_1524,l9_1525),0.0,1.0);
float l9_1527=l9_1526;
float l9_1528=l9_1499;
float l9_1529=l9_1523;
float l9_1530=1.0/l9_1528;
float l9_1531=l9_1529*l9_1529;
float l9_1532=1.0-l9_1531;
float l9_1533=l9_1530;
float l9_1534=l9_1532;
float l9_1535=l9_1530*0.5;
if (l9_1534<=0.0)
{
l9_1503=0.0;
}
else
{
l9_1503=pow(l9_1534,l9_1535);
}
float l9_1536=l9_1503;
float l9_1537=3.14159;
float l9_1538=((2.0+l9_1533)*l9_1536)/(2.0*l9_1537);
float l9_1539=l9_1538;
float l9_1540=l9_1498;
float l9_1541=l9_1527;
float l9_1542=1.0/(4.0*((l9_1541+l9_1540)-(l9_1541*l9_1540)));
float l9_1543=l9_1542;
l9_1500+=((((l9_1510*l9_1495)*l9_1539)*l9_1543)*l9_1527);
l9_1504++;
continue;
}
else
{
break;
}
}
}
int l9_1544=0;
l9_1544=sc_PointLightsCount_tmp;
int l9_1545=l9_1544;
if (l9_1545>0)
{
float l9_1546;
int l9_1547=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
int l9_1548=0;
l9_1548=sc_PointLightsCount_tmp;
int l9_1549=l9_1548;
if (l9_1547<l9_1549)
{
int l9_1550=l9_1547;
float3 l9_1551=float3(0.0);
if (l9_1550<sc_PointLightsCount_tmp)
{
l9_1551=(*sc_set2.UserUniforms).sc_PointLights[l9_1550].color.xyz;
}
float3 l9_1552=l9_1551;
float3 l9_1553=l9_1552;
int l9_1554=l9_1547;
float l9_1555=0.0;
if (l9_1554<sc_PointLightsCount_tmp)
{
l9_1555=(*sc_set2.UserUniforms).sc_PointLights[l9_1554].color.w;
}
float l9_1556=l9_1555;
float l9_1557=l9_1556;
l9_1553*=l9_1557;
l9_1553*=3.14159;
int l9_1558=l9_1547;
float3 l9_1559=float3(0.0);
if (l9_1558<sc_PointLightsCount_tmp)
{
l9_1559=(*sc_set2.UserUniforms).sc_PointLights[l9_1558].position;
}
float3 l9_1560=l9_1559;
float3 l9_1561=l9_1560;
float3 l9_1562=tempGlobals.SurfacePosition_WorldSpace;
float3 l9_1563=normalize(l9_1561-l9_1562);
float3 l9_1564=normalize(l9_1563+l9_1497);
float3 l9_1565=l9_1496;
float3 l9_1566=l9_1564;
float l9_1567=fast::clamp(dot(l9_1565,l9_1566),0.0,1.0);
float l9_1568=l9_1567;
float3 l9_1569=l9_1496;
float3 l9_1570=l9_1563;
float l9_1571=fast::clamp(dot(l9_1569,l9_1570),0.0,1.0);
float l9_1572=l9_1571;
float l9_1573=l9_1499;
float l9_1574=l9_1568;
float l9_1575=1.0/l9_1573;
float l9_1576=l9_1574*l9_1574;
float l9_1577=1.0-l9_1576;
float l9_1578=l9_1575;
float l9_1579=l9_1577;
float l9_1580=l9_1575*0.5;
if (l9_1579<=0.0)
{
l9_1546=0.0;
}
else
{
l9_1546=pow(l9_1579,l9_1580);
}
float l9_1581=l9_1546;
float l9_1582=3.14159;
float l9_1583=((2.0+l9_1578)*l9_1581)/(2.0*l9_1582);
float l9_1584=l9_1583;
float l9_1585=l9_1498;
float l9_1586=l9_1572;
float l9_1587=1.0/(4.0*((l9_1586+l9_1585)-(l9_1586*l9_1585)));
float l9_1588=l9_1587;
l9_1500+=((((l9_1553*l9_1495)*l9_1584)*l9_1588)*l9_1572);
l9_1547++;
continue;
}
else
{
break;
}
}
}
int l9_1589=0;
l9_1589=sc_AmbientLightsCount_tmp;
int l9_1590=l9_1589;
if (l9_1590>0)
{
int l9_1591=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
int l9_1592=0;
l9_1592=sc_AmbientLightsCount_tmp;
int l9_1593=l9_1592;
if (l9_1591<l9_1593)
{
int l9_1594=l9_1591;
float3 l9_1595=float3(0.0);
if (l9_1594<sc_AmbientLightsCount_tmp)
{
l9_1595=(*sc_set2.UserUniforms).sc_AmbientLights[l9_1594].color;
}
float3 l9_1596=l9_1595;
float3 l9_1597=l9_1596;
int l9_1598=l9_1591;
float l9_1599=0.0;
if (l9_1598<sc_AmbientLightsCount_tmp)
{
l9_1599=(*sc_set2.UserUniforms).sc_AmbientLights[l9_1598].intensity;
}
float l9_1600=l9_1599;
float l9_1601=l9_1600;
l9_1597*=l9_1601;
l9_1597/=float3(3.14159);
l9_1500+=(l9_1597*l9_1495);
l9_1591++;
continue;
}
else
{
break;
}
}
}
float3 l9_1602=l9_1500;
float3 l9_1603=N3_SheenOut.xyz+l9_1602;
N3_SheenOut=float4(l9_1603.x,l9_1603.y,l9_1603.z,N3_SheenOut.w);
float3 l9_1604=l9_1085;
float3 l9_1605=l9_1604;
float l9_1606=fast::max(fast::max(l9_1605.x,l9_1605.y),l9_1605.z);
float l9_1607=1.0-(l9_1606*0.157);
N3_SheenOut.w=l9_1607;
}
if (N3_ClearcoatEnable)
{
N3_ClearcoatBase=1.0;
N3_ClearcoatRoughness=1.0;
N3_ClearcoatNormal=float3(0.0,0.0,1.0);
if (N3_EnableClearcoatTexture)
{
int l9_1608=N3_ClearcoatTextureCoord;
float2 l9_1609=tempGlobals.Surface_UVCoord0;
float2 l9_1610=l9_1609;
if (l9_1608==0)
{
float2 l9_1611=tempGlobals.Surface_UVCoord0;
l9_1610=l9_1611;
}
if (l9_1608==1)
{
float2 l9_1612=tempGlobals.Surface_UVCoord1;
l9_1610=l9_1612;
}
float2 l9_1613=l9_1610;
float2 l9_1614=l9_1613;
if (N3_EnableTextureTransform&&N3_ClearcoatTextureTransform)
{
float2 l9_1615=l9_1614;
float2 l9_1616=N3_ClearcoatTextureOffset;
float2 l9_1617=N3_ClearcoatTextureScale;
float l9_1618=N3_ClearcoatTextureRotation;
float l9_1619=radians(l9_1618);
float3x3 l9_1620=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(l9_1616.x,l9_1616.y,1.0));
float3x3 l9_1621=float3x3(float3(cos(l9_1619),sin(l9_1619),0.0),float3(-sin(l9_1619),cos(l9_1619),0.0),float3(0.0,0.0,1.0));
float3x3 l9_1622=float3x3(float3(l9_1617.x,0.0,0.0),float3(0.0,l9_1617.y,0.0),float3(0.0,0.0,1.0));
float3x3 l9_1623=(l9_1620*l9_1621)*l9_1622;
float2 l9_1624=(l9_1623*float3(l9_1615,1.0)).xy;
l9_1614=l9_1624;
}
float2 l9_1625=l9_1614;
float4 l9_1626=float4(0.0);
float2 l9_1627=(*sc_set2.UserUniforms).clearcoatTextureDims.xy;
float2 l9_1628=l9_1627;
int l9_1629;
if ((int(clearcoatTextureHasSwappedViews_tmp)!=0))
{
int l9_1630;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1630=0;
}
else
{
l9_1630=in.varStereoViewID;
}
int l9_1631=l9_1630;
l9_1629=1-l9_1631;
}
else
{
int l9_1632;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1632=0;
}
else
{
l9_1632=in.varStereoViewID;
}
int l9_1633=l9_1632;
l9_1629=l9_1633;
}
int l9_1634=l9_1629;
float2 l9_1635=l9_1628;
int l9_1636=clearcoatTextureLayout_tmp;
int l9_1637=l9_1634;
float2 l9_1638=l9_1625;
bool l9_1639=(int(SC_USE_UV_TRANSFORM_clearcoatTexture_tmp)!=0);
float3x3 l9_1640=(*sc_set2.UserUniforms).clearcoatTextureTransform;
int2 l9_1641=int2(SC_SOFTWARE_WRAP_MODE_U_clearcoatTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_clearcoatTexture_tmp);
bool l9_1642=(int(SC_USE_UV_MIN_MAX_clearcoatTexture_tmp)!=0);
float4 l9_1643=(*sc_set2.UserUniforms).clearcoatTextureUvMinMax;
bool l9_1644=(int(SC_USE_CLAMP_TO_BORDER_clearcoatTexture_tmp)!=0);
float4 l9_1645=(*sc_set2.UserUniforms).clearcoatTextureBorderColor;
float l9_1646=0.0;
bool l9_1647=l9_1644&&(!l9_1642);
float l9_1648=1.0;
float l9_1649=l9_1638.x;
int l9_1650=l9_1641.x;
if (l9_1650==1)
{
l9_1649=fract(l9_1649);
}
else
{
if (l9_1650==2)
{
float l9_1651=fract(l9_1649);
float l9_1652=l9_1649-l9_1651;
float l9_1653=step(0.25,fract(l9_1652*0.5));
l9_1649=mix(l9_1651,1.0-l9_1651,fast::clamp(l9_1653,0.0,1.0));
}
}
l9_1638.x=l9_1649;
float l9_1654=l9_1638.y;
int l9_1655=l9_1641.y;
if (l9_1655==1)
{
l9_1654=fract(l9_1654);
}
else
{
if (l9_1655==2)
{
float l9_1656=fract(l9_1654);
float l9_1657=l9_1654-l9_1656;
float l9_1658=step(0.25,fract(l9_1657*0.5));
l9_1654=mix(l9_1656,1.0-l9_1656,fast::clamp(l9_1658,0.0,1.0));
}
}
l9_1638.y=l9_1654;
if (l9_1642)
{
bool l9_1659=l9_1644;
bool l9_1660;
if (l9_1659)
{
l9_1660=l9_1641.x==3;
}
else
{
l9_1660=l9_1659;
}
float l9_1661=l9_1638.x;
float l9_1662=l9_1643.x;
float l9_1663=l9_1643.z;
bool l9_1664=l9_1660;
float l9_1665=l9_1648;
float l9_1666=fast::clamp(l9_1661,l9_1662,l9_1663);
float l9_1667=step(abs(l9_1661-l9_1666),1e-05);
l9_1665*=(l9_1667+((1.0-float(l9_1664))*(1.0-l9_1667)));
l9_1661=l9_1666;
l9_1638.x=l9_1661;
l9_1648=l9_1665;
bool l9_1668=l9_1644;
bool l9_1669;
if (l9_1668)
{
l9_1669=l9_1641.y==3;
}
else
{
l9_1669=l9_1668;
}
float l9_1670=l9_1638.y;
float l9_1671=l9_1643.y;
float l9_1672=l9_1643.w;
bool l9_1673=l9_1669;
float l9_1674=l9_1648;
float l9_1675=fast::clamp(l9_1670,l9_1671,l9_1672);
float l9_1676=step(abs(l9_1670-l9_1675),1e-05);
l9_1674*=(l9_1676+((1.0-float(l9_1673))*(1.0-l9_1676)));
l9_1670=l9_1675;
l9_1638.y=l9_1670;
l9_1648=l9_1674;
}
float2 l9_1677=l9_1638;
bool l9_1678=l9_1639;
float3x3 l9_1679=l9_1640;
if (l9_1678)
{
l9_1677=float2((l9_1679*float3(l9_1677,1.0)).xy);
}
float2 l9_1680=l9_1677;
float2 l9_1681=l9_1680;
float2 l9_1682=l9_1681;
l9_1638=l9_1682;
float l9_1683=l9_1638.x;
int l9_1684=l9_1641.x;
bool l9_1685=l9_1647;
float l9_1686=l9_1648;
if ((l9_1684==0)||(l9_1684==3))
{
float l9_1687=l9_1683;
float l9_1688=0.0;
float l9_1689=1.0;
bool l9_1690=l9_1685;
float l9_1691=l9_1686;
float l9_1692=fast::clamp(l9_1687,l9_1688,l9_1689);
float l9_1693=step(abs(l9_1687-l9_1692),1e-05);
l9_1691*=(l9_1693+((1.0-float(l9_1690))*(1.0-l9_1693)));
l9_1687=l9_1692;
l9_1683=l9_1687;
l9_1686=l9_1691;
}
l9_1638.x=l9_1683;
l9_1648=l9_1686;
float l9_1694=l9_1638.y;
int l9_1695=l9_1641.y;
bool l9_1696=l9_1647;
float l9_1697=l9_1648;
if ((l9_1695==0)||(l9_1695==3))
{
float l9_1698=l9_1694;
float l9_1699=0.0;
float l9_1700=1.0;
bool l9_1701=l9_1696;
float l9_1702=l9_1697;
float l9_1703=fast::clamp(l9_1698,l9_1699,l9_1700);
float l9_1704=step(abs(l9_1698-l9_1703),1e-05);
l9_1702*=(l9_1704+((1.0-float(l9_1701))*(1.0-l9_1704)));
l9_1698=l9_1703;
l9_1694=l9_1698;
l9_1697=l9_1702;
}
l9_1638.y=l9_1694;
l9_1648=l9_1697;
float2 l9_1705=l9_1635;
float2 l9_1706=l9_1638;
int l9_1707=l9_1636;
int l9_1708=l9_1637;
float l9_1709=l9_1646;
float2 l9_1710=l9_1706;
int l9_1711=l9_1707;
int l9_1712=l9_1708;
float3 l9_1713;
if (l9_1711==0)
{
l9_1713=float3(l9_1710,0.0);
}
else
{
if (l9_1711==1)
{
l9_1713=float3(l9_1710.x,(l9_1710.y*0.5)+(0.5-(float(l9_1712)*0.5)),0.0);
}
else
{
l9_1713=float3(l9_1710,float(l9_1712));
}
}
float3 l9_1714=l9_1713;
float3 l9_1715=l9_1714;
float2 l9_1716=l9_1705;
float2 l9_1717=l9_1715.xy;
float l9_1718=l9_1709;
float4 l9_1719=sc_set2.clearcoatTexture.sample(sc_set2.clearcoatTextureSmpSC,l9_1717,bias(l9_1718));
float4 l9_1720=l9_1719;
float4 l9_1721=l9_1720;
if (l9_1644)
{
l9_1721=mix(l9_1645,l9_1721,float4(l9_1648));
}
float4 l9_1722=l9_1721;
float4 l9_1723=l9_1722;
l9_1626=l9_1722;
float4 l9_1724=l9_1626;
float l9_1725=l9_1724.x;
float l9_1726;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1726=pow(l9_1725,2.2);
}
else
{
l9_1726=l9_1725*l9_1725;
}
float l9_1727=l9_1726;
N3_ClearcoatBase=l9_1727;
}
N3_ClearcoatBase*=N3_ClearcoatFactor;
if (N3_EnableClearCoatRoughnessTexture)
{
int l9_1728=N3_ClearcoatRoughnessTextureCoord;
float2 l9_1729=tempGlobals.Surface_UVCoord0;
float2 l9_1730=l9_1729;
if (l9_1728==0)
{
float2 l9_1731=tempGlobals.Surface_UVCoord0;
l9_1730=l9_1731;
}
if (l9_1728==1)
{
float2 l9_1732=tempGlobals.Surface_UVCoord1;
l9_1730=l9_1732;
}
float2 l9_1733=l9_1730;
float2 l9_1734=l9_1733;
if (N3_EnableTextureTransform&&N3_ClearcoatRoughnessTextureTransform)
{
float2 l9_1735=l9_1734;
float2 l9_1736=N3_ClearcoatRoughnessTextureOffset;
float2 l9_1737=N3_ClearcoatRoughnessTextureScale;
float l9_1738=N3_ClearcoatRoughnessTextureRotation;
float l9_1739=radians(l9_1738);
float3x3 l9_1740=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(l9_1736.x,l9_1736.y,1.0));
float3x3 l9_1741=float3x3(float3(cos(l9_1739),sin(l9_1739),0.0),float3(-sin(l9_1739),cos(l9_1739),0.0),float3(0.0,0.0,1.0));
float3x3 l9_1742=float3x3(float3(l9_1737.x,0.0,0.0),float3(0.0,l9_1737.y,0.0),float3(0.0,0.0,1.0));
float3x3 l9_1743=(l9_1740*l9_1741)*l9_1742;
float2 l9_1744=(l9_1743*float3(l9_1735,1.0)).xy;
l9_1734=l9_1744;
}
float2 l9_1745=l9_1734;
float4 l9_1746=float4(0.0);
float2 l9_1747=(*sc_set2.UserUniforms).clearcoatRoughnessTextureDims.xy;
float2 l9_1748=l9_1747;
int l9_1749;
if ((int(clearcoatRoughnessTextureHasSwappedViews_tmp)!=0))
{
int l9_1750;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1750=0;
}
else
{
l9_1750=in.varStereoViewID;
}
int l9_1751=l9_1750;
l9_1749=1-l9_1751;
}
else
{
int l9_1752;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1752=0;
}
else
{
l9_1752=in.varStereoViewID;
}
int l9_1753=l9_1752;
l9_1749=l9_1753;
}
int l9_1754=l9_1749;
float2 l9_1755=l9_1748;
int l9_1756=clearcoatRoughnessTextureLayout_tmp;
int l9_1757=l9_1754;
float2 l9_1758=l9_1745;
bool l9_1759=(int(SC_USE_UV_TRANSFORM_clearcoatRoughnessTexture_tmp)!=0);
float3x3 l9_1760=(*sc_set2.UserUniforms).clearcoatRoughnessTextureTransform;
int2 l9_1761=int2(SC_SOFTWARE_WRAP_MODE_U_clearcoatRoughnessTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_clearcoatRoughnessTexture_tmp);
bool l9_1762=(int(SC_USE_UV_MIN_MAX_clearcoatRoughnessTexture_tmp)!=0);
float4 l9_1763=(*sc_set2.UserUniforms).clearcoatRoughnessTextureUvMinMax;
bool l9_1764=(int(SC_USE_CLAMP_TO_BORDER_clearcoatRoughnessTexture_tmp)!=0);
float4 l9_1765=(*sc_set2.UserUniforms).clearcoatRoughnessTextureBorderColor;
float l9_1766=0.0;
bool l9_1767=l9_1764&&(!l9_1762);
float l9_1768=1.0;
float l9_1769=l9_1758.x;
int l9_1770=l9_1761.x;
if (l9_1770==1)
{
l9_1769=fract(l9_1769);
}
else
{
if (l9_1770==2)
{
float l9_1771=fract(l9_1769);
float l9_1772=l9_1769-l9_1771;
float l9_1773=step(0.25,fract(l9_1772*0.5));
l9_1769=mix(l9_1771,1.0-l9_1771,fast::clamp(l9_1773,0.0,1.0));
}
}
l9_1758.x=l9_1769;
float l9_1774=l9_1758.y;
int l9_1775=l9_1761.y;
if (l9_1775==1)
{
l9_1774=fract(l9_1774);
}
else
{
if (l9_1775==2)
{
float l9_1776=fract(l9_1774);
float l9_1777=l9_1774-l9_1776;
float l9_1778=step(0.25,fract(l9_1777*0.5));
l9_1774=mix(l9_1776,1.0-l9_1776,fast::clamp(l9_1778,0.0,1.0));
}
}
l9_1758.y=l9_1774;
if (l9_1762)
{
bool l9_1779=l9_1764;
bool l9_1780;
if (l9_1779)
{
l9_1780=l9_1761.x==3;
}
else
{
l9_1780=l9_1779;
}
float l9_1781=l9_1758.x;
float l9_1782=l9_1763.x;
float l9_1783=l9_1763.z;
bool l9_1784=l9_1780;
float l9_1785=l9_1768;
float l9_1786=fast::clamp(l9_1781,l9_1782,l9_1783);
float l9_1787=step(abs(l9_1781-l9_1786),1e-05);
l9_1785*=(l9_1787+((1.0-float(l9_1784))*(1.0-l9_1787)));
l9_1781=l9_1786;
l9_1758.x=l9_1781;
l9_1768=l9_1785;
bool l9_1788=l9_1764;
bool l9_1789;
if (l9_1788)
{
l9_1789=l9_1761.y==3;
}
else
{
l9_1789=l9_1788;
}
float l9_1790=l9_1758.y;
float l9_1791=l9_1763.y;
float l9_1792=l9_1763.w;
bool l9_1793=l9_1789;
float l9_1794=l9_1768;
float l9_1795=fast::clamp(l9_1790,l9_1791,l9_1792);
float l9_1796=step(abs(l9_1790-l9_1795),1e-05);
l9_1794*=(l9_1796+((1.0-float(l9_1793))*(1.0-l9_1796)));
l9_1790=l9_1795;
l9_1758.y=l9_1790;
l9_1768=l9_1794;
}
float2 l9_1797=l9_1758;
bool l9_1798=l9_1759;
float3x3 l9_1799=l9_1760;
if (l9_1798)
{
l9_1797=float2((l9_1799*float3(l9_1797,1.0)).xy);
}
float2 l9_1800=l9_1797;
float2 l9_1801=l9_1800;
float2 l9_1802=l9_1801;
l9_1758=l9_1802;
float l9_1803=l9_1758.x;
int l9_1804=l9_1761.x;
bool l9_1805=l9_1767;
float l9_1806=l9_1768;
if ((l9_1804==0)||(l9_1804==3))
{
float l9_1807=l9_1803;
float l9_1808=0.0;
float l9_1809=1.0;
bool l9_1810=l9_1805;
float l9_1811=l9_1806;
float l9_1812=fast::clamp(l9_1807,l9_1808,l9_1809);
float l9_1813=step(abs(l9_1807-l9_1812),1e-05);
l9_1811*=(l9_1813+((1.0-float(l9_1810))*(1.0-l9_1813)));
l9_1807=l9_1812;
l9_1803=l9_1807;
l9_1806=l9_1811;
}
l9_1758.x=l9_1803;
l9_1768=l9_1806;
float l9_1814=l9_1758.y;
int l9_1815=l9_1761.y;
bool l9_1816=l9_1767;
float l9_1817=l9_1768;
if ((l9_1815==0)||(l9_1815==3))
{
float l9_1818=l9_1814;
float l9_1819=0.0;
float l9_1820=1.0;
bool l9_1821=l9_1816;
float l9_1822=l9_1817;
float l9_1823=fast::clamp(l9_1818,l9_1819,l9_1820);
float l9_1824=step(abs(l9_1818-l9_1823),1e-05);
l9_1822*=(l9_1824+((1.0-float(l9_1821))*(1.0-l9_1824)));
l9_1818=l9_1823;
l9_1814=l9_1818;
l9_1817=l9_1822;
}
l9_1758.y=l9_1814;
l9_1768=l9_1817;
float2 l9_1825=l9_1755;
float2 l9_1826=l9_1758;
int l9_1827=l9_1756;
int l9_1828=l9_1757;
float l9_1829=l9_1766;
float2 l9_1830=l9_1826;
int l9_1831=l9_1827;
int l9_1832=l9_1828;
float3 l9_1833;
if (l9_1831==0)
{
l9_1833=float3(l9_1830,0.0);
}
else
{
if (l9_1831==1)
{
l9_1833=float3(l9_1830.x,(l9_1830.y*0.5)+(0.5-(float(l9_1832)*0.5)),0.0);
}
else
{
l9_1833=float3(l9_1830,float(l9_1832));
}
}
float3 l9_1834=l9_1833;
float3 l9_1835=l9_1834;
float2 l9_1836=l9_1825;
float2 l9_1837=l9_1835.xy;
float l9_1838=l9_1829;
float4 l9_1839=sc_set2.clearcoatRoughnessTexture.sample(sc_set2.clearcoatRoughnessTextureSmpSC,l9_1837,bias(l9_1838));
float4 l9_1840=l9_1839;
float4 l9_1841=l9_1840;
if (l9_1764)
{
l9_1841=mix(l9_1765,l9_1841,float4(l9_1768));
}
float4 l9_1842=l9_1841;
float4 l9_1843=l9_1842;
l9_1746=l9_1842;
float4 l9_1844=l9_1746;
float l9_1845=l9_1844.y;
float l9_1846;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1846=pow(l9_1845,2.2);
}
else
{
l9_1846=l9_1845*l9_1845;
}
float l9_1847=l9_1846;
N3_ClearcoatRoughness=l9_1847;
}
N3_ClearcoatRoughness*=N3_ClearcoatRoughnessFactor;
if (N3_EnableClearCoatNormalTexture)
{
int l9_1848=N3_ClearcoatNormalMapCoord;
float2 l9_1849=tempGlobals.Surface_UVCoord0;
float2 l9_1850=l9_1849;
if (l9_1848==0)
{
float2 l9_1851=tempGlobals.Surface_UVCoord0;
l9_1850=l9_1851;
}
if (l9_1848==1)
{
float2 l9_1852=tempGlobals.Surface_UVCoord1;
l9_1850=l9_1852;
}
float2 l9_1853=l9_1850;
float2 l9_1854=l9_1853;
if (N3_EnableTextureTransform&&N3_ClearcoatNormalTextureTransform)
{
float2 l9_1855=l9_1854;
float2 l9_1856=N3_ClearcoatNormalTextureOffset;
float2 l9_1857=N3_ClearcoatNormalTextureScale;
float l9_1858=N3_ClearcoatNormalTextureRotation;
float l9_1859=radians(l9_1858);
float3x3 l9_1860=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(l9_1856.x,l9_1856.y,1.0));
float3x3 l9_1861=float3x3(float3(cos(l9_1859),sin(l9_1859),0.0),float3(-sin(l9_1859),cos(l9_1859),0.0),float3(0.0,0.0,1.0));
float3x3 l9_1862=float3x3(float3(l9_1857.x,0.0,0.0),float3(0.0,l9_1857.y,0.0),float3(0.0,0.0,1.0));
float3x3 l9_1863=(l9_1860*l9_1861)*l9_1862;
float2 l9_1864=(l9_1863*float3(l9_1855,1.0)).xy;
l9_1854=l9_1864;
}
float2 l9_1865=l9_1854;
float4 l9_1866=float4(0.0);
float2 l9_1867=(*sc_set2.UserUniforms).clearcoatNormalTextureDims.xy;
float2 l9_1868=l9_1867;
int l9_1869;
if ((int(clearcoatNormalTextureHasSwappedViews_tmp)!=0))
{
int l9_1870;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1870=0;
}
else
{
l9_1870=in.varStereoViewID;
}
int l9_1871=l9_1870;
l9_1869=1-l9_1871;
}
else
{
int l9_1872;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1872=0;
}
else
{
l9_1872=in.varStereoViewID;
}
int l9_1873=l9_1872;
l9_1869=l9_1873;
}
int l9_1874=l9_1869;
float2 l9_1875=l9_1868;
int l9_1876=clearcoatNormalTextureLayout_tmp;
int l9_1877=l9_1874;
float2 l9_1878=l9_1865;
bool l9_1879=(int(SC_USE_UV_TRANSFORM_clearcoatNormalTexture_tmp)!=0);
float3x3 l9_1880=(*sc_set2.UserUniforms).clearcoatNormalTextureTransform;
int2 l9_1881=int2(SC_SOFTWARE_WRAP_MODE_U_clearcoatNormalTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_clearcoatNormalTexture_tmp);
bool l9_1882=(int(SC_USE_UV_MIN_MAX_clearcoatNormalTexture_tmp)!=0);
float4 l9_1883=(*sc_set2.UserUniforms).clearcoatNormalTextureUvMinMax;
bool l9_1884=(int(SC_USE_CLAMP_TO_BORDER_clearcoatNormalTexture_tmp)!=0);
float4 l9_1885=(*sc_set2.UserUniforms).clearcoatNormalTextureBorderColor;
float l9_1886=0.0;
bool l9_1887=l9_1884&&(!l9_1882);
float l9_1888=1.0;
float l9_1889=l9_1878.x;
int l9_1890=l9_1881.x;
if (l9_1890==1)
{
l9_1889=fract(l9_1889);
}
else
{
if (l9_1890==2)
{
float l9_1891=fract(l9_1889);
float l9_1892=l9_1889-l9_1891;
float l9_1893=step(0.25,fract(l9_1892*0.5));
l9_1889=mix(l9_1891,1.0-l9_1891,fast::clamp(l9_1893,0.0,1.0));
}
}
l9_1878.x=l9_1889;
float l9_1894=l9_1878.y;
int l9_1895=l9_1881.y;
if (l9_1895==1)
{
l9_1894=fract(l9_1894);
}
else
{
if (l9_1895==2)
{
float l9_1896=fract(l9_1894);
float l9_1897=l9_1894-l9_1896;
float l9_1898=step(0.25,fract(l9_1897*0.5));
l9_1894=mix(l9_1896,1.0-l9_1896,fast::clamp(l9_1898,0.0,1.0));
}
}
l9_1878.y=l9_1894;
if (l9_1882)
{
bool l9_1899=l9_1884;
bool l9_1900;
if (l9_1899)
{
l9_1900=l9_1881.x==3;
}
else
{
l9_1900=l9_1899;
}
float l9_1901=l9_1878.x;
float l9_1902=l9_1883.x;
float l9_1903=l9_1883.z;
bool l9_1904=l9_1900;
float l9_1905=l9_1888;
float l9_1906=fast::clamp(l9_1901,l9_1902,l9_1903);
float l9_1907=step(abs(l9_1901-l9_1906),1e-05);
l9_1905*=(l9_1907+((1.0-float(l9_1904))*(1.0-l9_1907)));
l9_1901=l9_1906;
l9_1878.x=l9_1901;
l9_1888=l9_1905;
bool l9_1908=l9_1884;
bool l9_1909;
if (l9_1908)
{
l9_1909=l9_1881.y==3;
}
else
{
l9_1909=l9_1908;
}
float l9_1910=l9_1878.y;
float l9_1911=l9_1883.y;
float l9_1912=l9_1883.w;
bool l9_1913=l9_1909;
float l9_1914=l9_1888;
float l9_1915=fast::clamp(l9_1910,l9_1911,l9_1912);
float l9_1916=step(abs(l9_1910-l9_1915),1e-05);
l9_1914*=(l9_1916+((1.0-float(l9_1913))*(1.0-l9_1916)));
l9_1910=l9_1915;
l9_1878.y=l9_1910;
l9_1888=l9_1914;
}
float2 l9_1917=l9_1878;
bool l9_1918=l9_1879;
float3x3 l9_1919=l9_1880;
if (l9_1918)
{
l9_1917=float2((l9_1919*float3(l9_1917,1.0)).xy);
}
float2 l9_1920=l9_1917;
float2 l9_1921=l9_1920;
float2 l9_1922=l9_1921;
l9_1878=l9_1922;
float l9_1923=l9_1878.x;
int l9_1924=l9_1881.x;
bool l9_1925=l9_1887;
float l9_1926=l9_1888;
if ((l9_1924==0)||(l9_1924==3))
{
float l9_1927=l9_1923;
float l9_1928=0.0;
float l9_1929=1.0;
bool l9_1930=l9_1925;
float l9_1931=l9_1926;
float l9_1932=fast::clamp(l9_1927,l9_1928,l9_1929);
float l9_1933=step(abs(l9_1927-l9_1932),1e-05);
l9_1931*=(l9_1933+((1.0-float(l9_1930))*(1.0-l9_1933)));
l9_1927=l9_1932;
l9_1923=l9_1927;
l9_1926=l9_1931;
}
l9_1878.x=l9_1923;
l9_1888=l9_1926;
float l9_1934=l9_1878.y;
int l9_1935=l9_1881.y;
bool l9_1936=l9_1887;
float l9_1937=l9_1888;
if ((l9_1935==0)||(l9_1935==3))
{
float l9_1938=l9_1934;
float l9_1939=0.0;
float l9_1940=1.0;
bool l9_1941=l9_1936;
float l9_1942=l9_1937;
float l9_1943=fast::clamp(l9_1938,l9_1939,l9_1940);
float l9_1944=step(abs(l9_1938-l9_1943),1e-05);
l9_1942*=(l9_1944+((1.0-float(l9_1941))*(1.0-l9_1944)));
l9_1938=l9_1943;
l9_1934=l9_1938;
l9_1937=l9_1942;
}
l9_1878.y=l9_1934;
l9_1888=l9_1937;
float2 l9_1945=l9_1875;
float2 l9_1946=l9_1878;
int l9_1947=l9_1876;
int l9_1948=l9_1877;
float l9_1949=l9_1886;
float2 l9_1950=l9_1946;
int l9_1951=l9_1947;
int l9_1952=l9_1948;
float3 l9_1953;
if (l9_1951==0)
{
l9_1953=float3(l9_1950,0.0);
}
else
{
if (l9_1951==1)
{
l9_1953=float3(l9_1950.x,(l9_1950.y*0.5)+(0.5-(float(l9_1952)*0.5)),0.0);
}
else
{
l9_1953=float3(l9_1950,float(l9_1952));
}
}
float3 l9_1954=l9_1953;
float3 l9_1955=l9_1954;
float2 l9_1956=l9_1945;
float2 l9_1957=l9_1955.xy;
float l9_1958=l9_1949;
float4 l9_1959=sc_set2.clearcoatNormalTexture.sample(sc_set2.clearcoatNormalTextureSmpSC,l9_1957,bias(l9_1958));
float4 l9_1960=l9_1959;
float4 l9_1961=l9_1960;
if (l9_1884)
{
l9_1961=mix(l9_1885,l9_1961,float4(l9_1888));
}
float4 l9_1962=l9_1961;
float4 l9_1963=l9_1962;
l9_1866=l9_1962;
float4 l9_1964=l9_1866;
N3_ClearcoatNormal=l9_1964.xyz;
N3_ClearcoatNormal*=0.992188;
}
}
l9_463=N3_BaseColor;
l9_464=N3_Opacity;
l9_465=N3_Normal;
l9_466=N3_Emissive;
l9_467=N3_Metallic;
l9_468=N3_Roughness;
l9_469=N3_Occlusion;
l9_470=N3_Background;
l9_471=N3_SheenOut;
l9_472=N3_ClearcoatBase;
l9_473=N3_ClearcoatNormal;
l9_474=N3_ClearcoatRoughness;
l9_378=l9_463;
l9_379=l9_464;
l9_380=l9_465;
l9_381=l9_466;
l9_382=l9_467;
l9_383=l9_468;
l9_384=l9_469;
l9_385=l9_470;
l9_386=l9_471;
l9_387=l9_472;
l9_388=l9_473;
l9_389=l9_474;
float4 l9_1965=float4(0.0);
float3 l9_1966=l9_378;
float l9_1967=l9_379;
float3 l9_1968=l9_380;
float3 l9_1969=l9_381;
float l9_1970=l9_382;
float l9_1971=l9_383;
float3 l9_1972=l9_384.xyz;
float3 l9_1973=(*sc_set2.UserUniforms).Port_SpecularAO_N036;
ssGlobals l9_1974=param_4;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_1974.BumpedNormal=l9_1968;
}
l9_1967=fast::clamp(l9_1967,0.0,1.0);
float l9_1975=l9_1967;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_1975<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1976=gl_FragCoord;
float2 l9_1977=floor(mod(l9_1976.xy,float2(4.0)));
float l9_1978=(mod(dot(l9_1977,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_1975<l9_1978)
{
discard_fragment();
}
}
l9_1966=fast::max(l9_1966,float3(0.0));
float4 l9_1979;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_1969=fast::max(l9_1969,float3(0.0));
l9_1970=fast::clamp(l9_1970,0.0,1.0);
l9_1971=fast::clamp(l9_1971,0.0,1.0);
l9_1972=fast::clamp(l9_1972,float3(0.0),float3(1.0));
float3 l9_1980=l9_1966;
float l9_1981=l9_1967;
float3 l9_1982=l9_1974.BumpedNormal;
float3 l9_1983=l9_1974.PositionWS;
float3 l9_1984=l9_1974.ViewDirWS;
float3 l9_1985=l9_1969;
float l9_1986=l9_1970;
float l9_1987=l9_1971;
float3 l9_1988=l9_1972;
float3 l9_1989=l9_1973;
SurfaceProperties l9_1990;
l9_1990.albedo=float3(0.0);
l9_1990.opacity=1.0;
l9_1990.normal=float3(0.0);
l9_1990.positionWS=float3(0.0);
l9_1990.viewDirWS=float3(0.0);
l9_1990.metallic=0.0;
l9_1990.roughness=0.0;
l9_1990.emissive=float3(0.0);
l9_1990.ao=float3(1.0);
l9_1990.specularAo=float3(1.0);
l9_1990.bakedShadows=float3(1.0);
SurfaceProperties l9_1991=l9_1990;
SurfaceProperties l9_1992=l9_1991;
l9_1992.opacity=l9_1981;
float3 l9_1993=l9_1980;
float3 l9_1994;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1994=float3(pow(l9_1993.x,2.2),pow(l9_1993.y,2.2),pow(l9_1993.z,2.2));
}
else
{
l9_1994=l9_1993*l9_1993;
}
float3 l9_1995=l9_1994;
l9_1992.albedo=l9_1995;
l9_1992.normal=normalize(l9_1982);
l9_1992.positionWS=l9_1983;
l9_1992.viewDirWS=l9_1984;
float3 l9_1996=l9_1985;
float3 l9_1997;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_1997=float3(pow(l9_1996.x,2.2),pow(l9_1996.y,2.2),pow(l9_1996.z,2.2));
}
else
{
l9_1997=l9_1996*l9_1996;
}
float3 l9_1998=l9_1997;
l9_1992.emissive=l9_1998;
l9_1992.metallic=l9_1986;
l9_1992.roughness=l9_1987;
l9_1992.ao=l9_1988;
l9_1992.specularAo=l9_1989;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_1999=l9_1992.positionWS;
l9_1992.ao=evaluateSSAO(l9_1999,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.sc_SSAOTexture,sc_set2.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_2000=l9_1992;
SurfaceProperties l9_2001=l9_2000;
float3 l9_2002=mix(float3(0.04),l9_2001.albedo*l9_2001.metallic,float3(l9_2001.metallic));
float3 l9_2003=mix(l9_2001.albedo*(1.0-l9_2001.metallic),float3(0.0),float3(l9_2001.metallic));
l9_2000.albedo=l9_2003;
l9_2000.specColor=l9_2002;
SurfaceProperties l9_2004=l9_2000;
l9_1992=l9_2004;
SurfaceProperties l9_2005=l9_1992;
LightingComponents l9_2006;
l9_2006.directDiffuse=float3(0.0);
l9_2006.directSpecular=float3(0.0);
l9_2006.indirectDiffuse=float3(1.0);
l9_2006.indirectSpecular=float3(0.0);
l9_2006.emitted=float3(0.0);
l9_2006.transmitted=float3(0.0);
LightingComponents l9_2007=l9_2006;
LightingComponents l9_2008=l9_2007;
float3 l9_2009=l9_2005.viewDirWS;
int l9_2010=0;
float4 l9_2011=float4(l9_2005.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_2012;
LightProperties l9_2013;
int l9_2014=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2014<sc_DirectionalLightsCount_tmp)
{
l9_2012.direction=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_2014].direction;
l9_2012.color=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_2014].color;
l9_2013.direction=l9_2012.direction;
l9_2013.color=l9_2012.color.xyz;
l9_2013.attenuation=l9_2012.color.w;
l9_2013.attenuation*=l9_2011[(l9_2010<3) ? l9_2010 : 3];
l9_2010++;
LightingComponents l9_2015=l9_2008;
LightProperties l9_2016=l9_2013;
SurfaceProperties l9_2017=l9_2005;
float3 l9_2018=l9_2009;
SurfaceProperties l9_2019=l9_2017;
float3 l9_2020=l9_2016.direction;
float l9_2021=dot(l9_2019.normal,l9_2020);
float l9_2022=fast::clamp(l9_2021,0.0,1.0);
float3 l9_2023=float3(l9_2022);
l9_2015.directDiffuse+=((l9_2023*l9_2016.color)*l9_2016.attenuation);
SurfaceProperties l9_2024=l9_2017;
float3 l9_2025=l9_2016.direction;
float3 l9_2026=l9_2018;
l9_2015.directSpecular+=((calculateDirectSpecular(l9_2024,l9_2025,l9_2026)*l9_2016.color)*l9_2016.attenuation);
LightingComponents l9_2027=l9_2015;
l9_2008=l9_2027;
l9_2014++;
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
sc_PointLight_t_1 l9_2028;
LightProperties l9_2029;
int l9_2030=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2030<sc_PointLightsCount_tmp)
{
l9_2028.falloffEnabled=(*sc_set2.UserUniforms).sc_PointLights[l9_2030].falloffEnabled!=0;
l9_2028.falloffEndDistance=(*sc_set2.UserUniforms).sc_PointLights[l9_2030].falloffEndDistance;
l9_2028.negRcpFalloffEndDistance4=(*sc_set2.UserUniforms).sc_PointLights[l9_2030].negRcpFalloffEndDistance4;
l9_2028.angleScale=(*sc_set2.UserUniforms).sc_PointLights[l9_2030].angleScale;
l9_2028.angleOffset=(*sc_set2.UserUniforms).sc_PointLights[l9_2030].angleOffset;
l9_2028.direction=(*sc_set2.UserUniforms).sc_PointLights[l9_2030].direction;
l9_2028.position=(*sc_set2.UserUniforms).sc_PointLights[l9_2030].position;
l9_2028.color=(*sc_set2.UserUniforms).sc_PointLights[l9_2030].color;
float3 l9_2031=l9_2028.position-l9_2005.positionWS;
l9_2029.direction=normalize(l9_2031);
l9_2029.color=l9_2028.color.xyz;
l9_2029.attenuation=l9_2028.color.w;
l9_2029.attenuation*=l9_2011[(l9_2010<3) ? l9_2010 : 3];
float3 l9_2032=l9_2029.direction;
float3 l9_2033=l9_2028.direction;
float l9_2034=l9_2028.angleScale;
float l9_2035=l9_2028.angleOffset;
float l9_2036=dot(l9_2032,l9_2033);
float l9_2037=fast::clamp((l9_2036*l9_2034)+l9_2035,0.0,1.0);
float l9_2038=l9_2037*l9_2037;
l9_2029.attenuation*=l9_2038;
if (l9_2028.falloffEnabled)
{
float l9_2039=length(l9_2031);
float l9_2040=l9_2028.falloffEndDistance;
l9_2029.attenuation*=computeDistanceAttenuation(l9_2039,l9_2040);
}
l9_2010++;
LightingComponents l9_2041=l9_2008;
LightProperties l9_2042=l9_2029;
SurfaceProperties l9_2043=l9_2005;
float3 l9_2044=l9_2009;
SurfaceProperties l9_2045=l9_2043;
float3 l9_2046=l9_2042.direction;
float l9_2047=dot(l9_2045.normal,l9_2046);
float l9_2048=fast::clamp(l9_2047,0.0,1.0);
float3 l9_2049=float3(l9_2048);
l9_2041.directDiffuse+=((l9_2049*l9_2042.color)*l9_2042.attenuation);
SurfaceProperties l9_2050=l9_2043;
float3 l9_2051=l9_2042.direction;
float3 l9_2052=l9_2044;
l9_2041.directSpecular+=((calculateDirectSpecular(l9_2050,l9_2051,l9_2052)*l9_2042.color)*l9_2042.attenuation);
LightingComponents l9_2053=l9_2041;
l9_2008=l9_2053;
l9_2030++;
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
float3 l9_2054;
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_2055=abs(in.varShadowTex-float2(0.5));
float l9_2056=fast::max(l9_2055.x,l9_2055.y);
float l9_2057=step(l9_2056,0.5);
float4 l9_2058=sc_set2.sc_ShadowTexture.sample(sc_set2.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_2057;
float3 l9_2059=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_2058.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float l9_2060=l9_2058.w*(*sc_set2.UserUniforms).sc_ShadowDensity;
l9_2054=mix(float3(1.0),l9_2059,float3(l9_2060));
}
else
{
l9_2054=float3(1.0);
}
float3 l9_2061=l9_2054;
float3 l9_2062=l9_2061;
l9_2008.directDiffuse*=l9_2062;
l9_2008.directSpecular*=l9_2062;
}
SurfaceProperties l9_2063=l9_2005;
float3 l9_2064=l9_2063.normal;
float3 l9_2065=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_2066=l9_2064;
float3 l9_2067=l9_2066;
float l9_2068=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float l9_2069=l9_2067.x;
float l9_2070=-l9_2067.z;
float l9_2071=(l9_2069<0.0) ? (-1.0) : 1.0;
float l9_2072=l9_2071*acos(fast::clamp(l9_2070/length(float2(l9_2069,l9_2070)),-1.0,1.0));
float2 l9_2073;
l9_2073.x=l9_2072-1.5708;
l9_2073.y=acos(l9_2067.y);
l9_2073/=float2(6.28319,3.14159);
l9_2073.y=1.0-l9_2073.y;
l9_2073.x+=(l9_2068/360.0);
l9_2073.x=fract((l9_2073.x+floor(l9_2073.x))+1.0);
float2 l9_2074=l9_2073;
float2 l9_2075=l9_2074;
float4 l9_2076;
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_2077=l9_2075;
float2 l9_2078=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_2079=5.0;
l9_2075=calcSeamlessPanoramicUvsForSampling(l9_2077,l9_2078,l9_2079);
}
float2 l9_2080=l9_2075;
float l9_2081=13.0;
int l9_2082;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2083;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2083=0;
}
else
{
l9_2083=in.varStereoViewID;
}
int l9_2084=l9_2083;
l9_2082=1-l9_2084;
}
else
{
int l9_2085;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2085=0;
}
else
{
l9_2085=in.varStereoViewID;
}
int l9_2086=l9_2085;
l9_2082=l9_2086;
}
int l9_2087=l9_2082;
float2 l9_2088=l9_2080;
int l9_2089=l9_2087;
float l9_2090=l9_2081;
float2 l9_2091=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_2092=l9_2091;
float2 l9_2093=l9_2088;
int l9_2094=sc_EnvmapSpecularLayout_tmp;
int l9_2095=l9_2089;
float l9_2096=l9_2090;
float2 l9_2097=l9_2093;
int l9_2098=l9_2094;
int l9_2099=l9_2095;
float3 l9_2100;
if (l9_2098==0)
{
l9_2100=float3(l9_2097,0.0);
}
else
{
if (l9_2098==1)
{
l9_2100=float3(l9_2097.x,(l9_2097.y*0.5)+(0.5-(float(l9_2099)*0.5)),0.0);
}
else
{
l9_2100=float3(l9_2097,float(l9_2099));
}
}
float3 l9_2101=l9_2100;
float3 l9_2102=l9_2101;
float2 l9_2103=l9_2092;
float2 l9_2104=l9_2102.xy;
float l9_2105=l9_2096;
float4 l9_2106=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_2104,bias(l9_2105));
float4 l9_2107=l9_2106;
float4 l9_2108=l9_2107;
float4 l9_2109=l9_2108;
float4 l9_2110=l9_2109;
l9_2076=l9_2110;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_2111=l9_2075;
float2 l9_2112=(*sc_set2.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_2113=0.0;
l9_2075=calcSeamlessPanoramicUvsForSampling(l9_2111,l9_2112,l9_2113);
float2 l9_2114=l9_2075;
float l9_2115=-13.0;
int l9_2116;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_2117;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2117=0;
}
else
{
l9_2117=in.varStereoViewID;
}
int l9_2118=l9_2117;
l9_2116=1-l9_2118;
}
else
{
int l9_2119;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2119=0;
}
else
{
l9_2119=in.varStereoViewID;
}
int l9_2120=l9_2119;
l9_2116=l9_2120;
}
int l9_2121=l9_2116;
float2 l9_2122=l9_2114;
int l9_2123=l9_2121;
float l9_2124=l9_2115;
float2 l9_2125=(*sc_set2.UserUniforms).sc_EnvmapDiffuseDims.xy;
float2 l9_2126=l9_2125;
float2 l9_2127=l9_2122;
int l9_2128=sc_EnvmapDiffuseLayout_tmp;
int l9_2129=l9_2123;
float l9_2130=l9_2124;
float2 l9_2131=l9_2127;
int l9_2132=l9_2128;
int l9_2133=l9_2129;
float3 l9_2134;
if (l9_2132==0)
{
l9_2134=float3(l9_2131,0.0);
}
else
{
if (l9_2132==1)
{
l9_2134=float3(l9_2131.x,(l9_2131.y*0.5)+(0.5-(float(l9_2133)*0.5)),0.0);
}
else
{
l9_2134=float3(l9_2131,float(l9_2133));
}
}
float3 l9_2135=l9_2134;
float3 l9_2136=l9_2135;
float2 l9_2137=l9_2126;
float2 l9_2138=l9_2136.xy;
float l9_2139=l9_2130;
float4 l9_2140=sc_set2.sc_EnvmapDiffuse.sample(sc_set2.sc_EnvmapDiffuseSmpSC,l9_2138,bias(l9_2139));
float4 l9_2141=l9_2140;
float4 l9_2142=l9_2141;
float4 l9_2143=l9_2142;
float4 l9_2144=l9_2143;
l9_2076=l9_2144;
}
else
{
float2 l9_2145=l9_2075;
float l9_2146=13.0;
int l9_2147;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2148;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2148=0;
}
else
{
l9_2148=in.varStereoViewID;
}
int l9_2149=l9_2148;
l9_2147=1-l9_2149;
}
else
{
int l9_2150;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2150=0;
}
else
{
l9_2150=in.varStereoViewID;
}
int l9_2151=l9_2150;
l9_2147=l9_2151;
}
int l9_2152=l9_2147;
float2 l9_2153=l9_2145;
int l9_2154=l9_2152;
float l9_2155=l9_2146;
float2 l9_2156=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_2157=l9_2156;
float2 l9_2158=l9_2153;
int l9_2159=sc_EnvmapSpecularLayout_tmp;
int l9_2160=l9_2154;
float l9_2161=l9_2155;
float2 l9_2162=l9_2158;
int l9_2163=l9_2159;
int l9_2164=l9_2160;
float3 l9_2165;
if (l9_2163==0)
{
l9_2165=float3(l9_2162,0.0);
}
else
{
if (l9_2163==1)
{
l9_2165=float3(l9_2162.x,(l9_2162.y*0.5)+(0.5-(float(l9_2164)*0.5)),0.0);
}
else
{
l9_2165=float3(l9_2162,float(l9_2164));
}
}
float3 l9_2166=l9_2165;
float3 l9_2167=l9_2166;
float2 l9_2168=l9_2157;
float2 l9_2169=l9_2167.xy;
float l9_2170=l9_2161;
float4 l9_2171=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_2169,bias(l9_2170));
float4 l9_2172=l9_2171;
float4 l9_2173=l9_2172;
float4 l9_2174=l9_2173;
float4 l9_2175=l9_2174;
l9_2076=l9_2175;
}
}
float4 l9_2176=l9_2076;
float3 l9_2177=l9_2176.xyz*(1.0/l9_2176.w);
float3 l9_2178=l9_2177*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_2065=l9_2178;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_2179=(*sc_set2.UserUniforms).sc_Sh[0];
float3 l9_2180=(*sc_set2.UserUniforms).sc_Sh[1];
float3 l9_2181=(*sc_set2.UserUniforms).sc_Sh[2];
float3 l9_2182=(*sc_set2.UserUniforms).sc_Sh[3];
float3 l9_2183=(*sc_set2.UserUniforms).sc_Sh[4];
float3 l9_2184=(*sc_set2.UserUniforms).sc_Sh[5];
float3 l9_2185=(*sc_set2.UserUniforms).sc_Sh[6];
float3 l9_2186=(*sc_set2.UserUniforms).sc_Sh[7];
float3 l9_2187=(*sc_set2.UserUniforms).sc_Sh[8];
float3 l9_2188=-l9_2064;
float l9_2189=l9_2188.x;
float l9_2190=l9_2188.y;
float l9_2191=l9_2188.z;
float l9_2192=l9_2189*l9_2189;
float l9_2193=l9_2190*l9_2190;
float l9_2194=l9_2191*l9_2191;
float l9_2195=l9_2189*l9_2190;
float l9_2196=l9_2190*l9_2191;
float l9_2197=l9_2189*l9_2191;
float3 l9_2198=((((((l9_2187*0.429043)*(l9_2192-l9_2193))+((l9_2185*0.743125)*l9_2194))+(l9_2179*0.886227))-(l9_2185*0.247708))+((((l9_2183*l9_2195)+(l9_2186*l9_2197))+(l9_2184*l9_2196))*0.858086))+((((l9_2182*l9_2189)+(l9_2180*l9_2190))+(l9_2181*l9_2191))*1.02333);
l9_2065=l9_2198*(*sc_set2.UserUniforms).sc_ShIntensity;
}
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_2065+=((*sc_set2.UserUniforms).sc_AmbientLights[0].color*(*sc_set2.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_2065.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_2065+=((*sc_set2.UserUniforms).sc_AmbientLights[1].color*(*sc_set2.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_2065.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_2065+=((*sc_set2.UserUniforms).sc_AmbientLights[2].color*(*sc_set2.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_2065.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_2199=l9_2064;
float3 l9_2200=(*sc_set2.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_2201;
float l9_2202;
int l9_2203=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2203<sc_LightEstimationSGCount_tmp)
{
l9_2201.color=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2203].color;
l9_2201.sharpness=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2203].sharpness;
l9_2201.axis=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2203].axis;
float3 l9_2204=l9_2199;
float l9_2205=dot(l9_2201.axis,l9_2204);
float l9_2206=l9_2201.sharpness;
float l9_2207=0.36;
float l9_2208=1.0/(4.0*l9_2207);
float l9_2209=exp(-l9_2206);
float l9_2210=l9_2209*l9_2209;
float l9_2211=1.0/l9_2206;
float l9_2212=(1.0+(2.0*l9_2210))-l9_2211;
float l9_2213=((l9_2209-l9_2210)*l9_2211)-l9_2210;
float l9_2214=sqrt(1.0-l9_2212);
float l9_2215=l9_2207*l9_2205;
float l9_2216=l9_2208*l9_2214;
float l9_2217=l9_2215+l9_2216;
float l9_2218=l9_2205;
float l9_2219=fast::clamp(l9_2218,0.0,1.0);
float l9_2220=l9_2219;
if (step(abs(l9_2215),l9_2216)>0.5)
{
l9_2202=(l9_2217*l9_2217)/l9_2214;
}
else
{
l9_2202=l9_2220;
}
l9_2220=l9_2202;
float l9_2221=(l9_2212*l9_2220)+l9_2213;
sc_SphericalGaussianLight_t l9_2222=l9_2201;
float3 l9_2223=(l9_2222.color/float3(l9_2222.sharpness))*6.28319;
float3 l9_2224=(l9_2223*l9_2221)/float3(3.14159);
l9_2200+=l9_2224;
l9_2203++;
continue;
}
else
{
break;
}
}
float3 l9_2225=l9_2200;
l9_2065+=l9_2225;
}
float3 l9_2226=l9_2065;
float3 l9_2227=l9_2226;
l9_2008.indirectDiffuse=l9_2227;
SurfaceProperties l9_2228=l9_2005;
float3 l9_2229=l9_2009;
float3 l9_2230=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_2231=l9_2228;
float3 l9_2232=l9_2229;
float3 l9_2233=l9_2231.normal;
float3 l9_2234=reflect(-l9_2232,l9_2233);
float3 l9_2235=l9_2233;
float3 l9_2236=l9_2234;
float l9_2237=l9_2231.roughness;
l9_2234=getSpecularDominantDir(l9_2235,l9_2236,l9_2237);
float l9_2238=l9_2231.roughness;
float l9_2239=pow(l9_2238,0.666667);
float l9_2240=fast::clamp(l9_2239,0.0,1.0);
float l9_2241=l9_2240*5.0;
float l9_2242=l9_2241;
float l9_2243=l9_2242;
float3 l9_2244=l9_2234;
float l9_2245=l9_2243;
float3 l9_2246=l9_2244;
float l9_2247=l9_2245;
float3 l9_2248=l9_2246;
float l9_2249=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float l9_2250=l9_2248.x;
float l9_2251=-l9_2248.z;
float l9_2252=(l9_2250<0.0) ? (-1.0) : 1.0;
float l9_2253=l9_2252*acos(fast::clamp(l9_2251/length(float2(l9_2250,l9_2251)),-1.0,1.0));
float2 l9_2254;
l9_2254.x=l9_2253-1.5708;
l9_2254.y=acos(l9_2248.y);
l9_2254/=float2(6.28319,3.14159);
l9_2254.y=1.0-l9_2254.y;
l9_2254.x+=(l9_2249/360.0);
l9_2254.x=fract((l9_2254.x+floor(l9_2254.x))+1.0);
float2 l9_2255=l9_2254;
float2 l9_2256=l9_2255;
float4 l9_2257;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_2258=floor(l9_2247);
float l9_2259=ceil(l9_2247);
float l9_2260=l9_2247-l9_2258;
float2 l9_2261=l9_2256;
float2 l9_2262=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_2263=l9_2258;
float2 l9_2264=calcSeamlessPanoramicUvsForSampling(l9_2261,l9_2262,l9_2263);
float2 l9_2265=l9_2264;
float l9_2266=l9_2258;
float2 l9_2267=l9_2265;
float l9_2268=l9_2266;
int l9_2269;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2270;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2270=0;
}
else
{
l9_2270=in.varStereoViewID;
}
int l9_2271=l9_2270;
l9_2269=1-l9_2271;
}
else
{
int l9_2272;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2272=0;
}
else
{
l9_2272=in.varStereoViewID;
}
int l9_2273=l9_2272;
l9_2269=l9_2273;
}
int l9_2274=l9_2269;
float2 l9_2275=l9_2267;
int l9_2276=l9_2274;
float l9_2277=l9_2268;
float2 l9_2278=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_2279=l9_2278;
float2 l9_2280=l9_2275;
int l9_2281=sc_EnvmapSpecularLayout_tmp;
int l9_2282=l9_2276;
float l9_2283=l9_2277;
float2 l9_2284=l9_2280;
int l9_2285=l9_2281;
int l9_2286=l9_2282;
float3 l9_2287;
if (l9_2285==0)
{
l9_2287=float3(l9_2284,0.0);
}
else
{
if (l9_2285==1)
{
l9_2287=float3(l9_2284.x,(l9_2284.y*0.5)+(0.5-(float(l9_2286)*0.5)),0.0);
}
else
{
l9_2287=float3(l9_2284,float(l9_2286));
}
}
float3 l9_2288=l9_2287;
float3 l9_2289=l9_2288;
float2 l9_2290=l9_2279;
float2 l9_2291=l9_2289.xy;
float l9_2292=l9_2283;
float4 l9_2293=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_2291,level(l9_2292));
float4 l9_2294=l9_2293;
float4 l9_2295=l9_2294;
float4 l9_2296=l9_2295;
float4 l9_2297=l9_2296;
float4 l9_2298=l9_2297;
float4 l9_2299=l9_2298;
float2 l9_2300=l9_2256;
float2 l9_2301=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_2302=l9_2259;
float2 l9_2303=calcSeamlessPanoramicUvsForSampling(l9_2300,l9_2301,l9_2302);
float2 l9_2304=l9_2303;
float l9_2305=l9_2259;
float2 l9_2306=l9_2304;
float l9_2307=l9_2305;
int l9_2308;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2309;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2309=0;
}
else
{
l9_2309=in.varStereoViewID;
}
int l9_2310=l9_2309;
l9_2308=1-l9_2310;
}
else
{
int l9_2311;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2311=0;
}
else
{
l9_2311=in.varStereoViewID;
}
int l9_2312=l9_2311;
l9_2308=l9_2312;
}
int l9_2313=l9_2308;
float2 l9_2314=l9_2306;
int l9_2315=l9_2313;
float l9_2316=l9_2307;
float2 l9_2317=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_2318=l9_2317;
float2 l9_2319=l9_2314;
int l9_2320=sc_EnvmapSpecularLayout_tmp;
int l9_2321=l9_2315;
float l9_2322=l9_2316;
float2 l9_2323=l9_2319;
int l9_2324=l9_2320;
int l9_2325=l9_2321;
float3 l9_2326;
if (l9_2324==0)
{
l9_2326=float3(l9_2323,0.0);
}
else
{
if (l9_2324==1)
{
l9_2326=float3(l9_2323.x,(l9_2323.y*0.5)+(0.5-(float(l9_2325)*0.5)),0.0);
}
else
{
l9_2326=float3(l9_2323,float(l9_2325));
}
}
float3 l9_2327=l9_2326;
float3 l9_2328=l9_2327;
float2 l9_2329=l9_2318;
float2 l9_2330=l9_2328.xy;
float l9_2331=l9_2322;
float4 l9_2332=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_2330,level(l9_2331));
float4 l9_2333=l9_2332;
float4 l9_2334=l9_2333;
float4 l9_2335=l9_2334;
float4 l9_2336=l9_2335;
float4 l9_2337=l9_2336;
float4 l9_2338=l9_2337;
l9_2257=mix(l9_2299,l9_2338,float4(l9_2260));
}
else
{
float2 l9_2339=l9_2256;
float l9_2340=l9_2247;
float2 l9_2341=l9_2339;
float l9_2342=l9_2340;
int l9_2343;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2344;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2344=0;
}
else
{
l9_2344=in.varStereoViewID;
}
int l9_2345=l9_2344;
l9_2343=1-l9_2345;
}
else
{
int l9_2346;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2346=0;
}
else
{
l9_2346=in.varStereoViewID;
}
int l9_2347=l9_2346;
l9_2343=l9_2347;
}
int l9_2348=l9_2343;
float2 l9_2349=l9_2341;
int l9_2350=l9_2348;
float l9_2351=l9_2342;
float2 l9_2352=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_2353=l9_2352;
float2 l9_2354=l9_2349;
int l9_2355=sc_EnvmapSpecularLayout_tmp;
int l9_2356=l9_2350;
float l9_2357=l9_2351;
float2 l9_2358=l9_2354;
int l9_2359=l9_2355;
int l9_2360=l9_2356;
float3 l9_2361;
if (l9_2359==0)
{
l9_2361=float3(l9_2358,0.0);
}
else
{
if (l9_2359==1)
{
l9_2361=float3(l9_2358.x,(l9_2358.y*0.5)+(0.5-(float(l9_2360)*0.5)),0.0);
}
else
{
l9_2361=float3(l9_2358,float(l9_2360));
}
}
float3 l9_2362=l9_2361;
float3 l9_2363=l9_2362;
float2 l9_2364=l9_2353;
float2 l9_2365=l9_2363.xy;
float l9_2366=l9_2357;
float4 l9_2367=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_2365,level(l9_2366));
float4 l9_2368=l9_2367;
float4 l9_2369=l9_2368;
float4 l9_2370=l9_2369;
float4 l9_2371=l9_2370;
float4 l9_2372=l9_2371;
l9_2257=l9_2372;
}
float4 l9_2373=l9_2257;
float3 l9_2374=l9_2373.xyz*(1.0/l9_2373.w);
float3 l9_2375=l9_2374;
float3 l9_2376=l9_2375*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_2376+=float3(1e-06);
float3 l9_2377=l9_2376;
float3 l9_2378=l9_2377;
SurfaceProperties l9_2379=l9_2231;
float l9_2380=abs(dot(l9_2233,l9_2232));
float3 l9_2381=l9_2378*envBRDFApprox(l9_2379,l9_2380);
l9_2230+=l9_2381;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_2382=l9_2228;
float3 l9_2383=l9_2229;
float l9_2384=fast::clamp(l9_2382.roughness*l9_2382.roughness,0.01,1.0);
float3 l9_2385=(*sc_set2.UserUniforms).sc_LightEstimationData.ambientLight*l9_2382.specColor;
sc_SphericalGaussianLight_t l9_2386;
sc_SphericalGaussianLight_t l9_2387;
sc_SphericalGaussianLight_t l9_2388;
int l9_2389=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2389<sc_LightEstimationSGCount_tmp)
{
l9_2386.color=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2389].color;
l9_2386.sharpness=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2389].sharpness;
l9_2386.axis=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2389].axis;
float3 l9_2390=l9_2382.normal;
float l9_2391=l9_2384;
float3 l9_2392=l9_2383;
float3 l9_2393=l9_2382.specColor;
float3 l9_2394=l9_2390;
float l9_2395=l9_2391;
l9_2387.axis=l9_2394;
float l9_2396=l9_2395*l9_2395;
l9_2387.sharpness=2.0/l9_2396;
l9_2387.color=float3(1.0/(3.14159*l9_2396));
sc_SphericalGaussianLight_t l9_2397=l9_2387;
sc_SphericalGaussianLight_t l9_2398=l9_2397;
sc_SphericalGaussianLight_t l9_2399=l9_2398;
float3 l9_2400=l9_2392;
l9_2388.axis=reflect(-l9_2400,l9_2399.axis);
l9_2388.color=l9_2399.color;
l9_2388.sharpness=l9_2399.sharpness;
l9_2388.sharpness/=(4.0*fast::max(dot(l9_2399.axis,l9_2400),0.0001));
sc_SphericalGaussianLight_t l9_2401=l9_2388;
sc_SphericalGaussianLight_t l9_2402=l9_2401;
sc_SphericalGaussianLight_t l9_2403=l9_2402;
sc_SphericalGaussianLight_t l9_2404=l9_2386;
float l9_2405=length((l9_2403.axis*l9_2403.sharpness)+(l9_2404.axis*l9_2404.sharpness));
float3 l9_2406=(l9_2403.color*exp((l9_2405-l9_2403.sharpness)-l9_2404.sharpness))*l9_2404.color;
float l9_2407=1.0-exp((-2.0)*l9_2405);
float3 l9_2408=((l9_2406*6.28319)*l9_2407)/float3(l9_2405);
float3 l9_2409=l9_2408;
float3 l9_2410=l9_2402.axis;
float l9_2411=l9_2391*l9_2391;
float l9_2412=dot(l9_2390,l9_2410);
float l9_2413=fast::clamp(l9_2412,0.0,1.0);
float l9_2414=l9_2413;
float l9_2415=dot(l9_2390,l9_2392);
float l9_2416=fast::clamp(l9_2415,0.0,1.0);
float l9_2417=l9_2416;
float3 l9_2418=normalize(l9_2402.axis+l9_2392);
float l9_2419=l9_2411;
float l9_2420=l9_2414;
float l9_2421=1.0/(l9_2420+sqrt(l9_2419+(((1.0-l9_2419)*l9_2420)*l9_2420)));
float l9_2422=l9_2411;
float l9_2423=l9_2417;
float l9_2424=1.0/(l9_2423+sqrt(l9_2422+(((1.0-l9_2422)*l9_2423)*l9_2423)));
l9_2409*=(l9_2421*l9_2424);
float l9_2425=dot(l9_2410,l9_2418);
float l9_2426=fast::clamp(l9_2425,0.0,1.0);
float l9_2427=pow(1.0-l9_2426,5.0);
l9_2409*=(l9_2393+((float3(1.0)-l9_2393)*l9_2427));
l9_2409*=l9_2414;
float3 l9_2428=l9_2409;
l9_2385+=l9_2428;
l9_2389++;
continue;
}
else
{
break;
}
}
float3 l9_2429=l9_2385;
l9_2230+=l9_2429;
}
float3 l9_2430=l9_2230;
l9_2008.indirectSpecular=l9_2430;
LightingComponents l9_2431=l9_2008;
LightingComponents l9_2432=l9_2431;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_2432.directDiffuse=float3(0.0);
l9_2432.indirectDiffuse=float3(0.0);
float4 l9_2433;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_2434=out.FragColor0;
float4 l9_2435=l9_2434;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_2435.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_2436=l9_2435;
l9_2433=l9_2436;
}
else
{
float4 l9_2437=gl_FragCoord;
float2 l9_2438=(l9_2437.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_2439=l9_2438;
float2 l9_2440;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_2441=float3(l9_2439,0.0);
int l9_2442=1;
int l9_2443;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2443=0;
}
else
{
l9_2443=in.varStereoViewID;
}
int l9_2444=l9_2443;
int l9_2445=l9_2444;
float3 l9_2446=float3(l9_2439,0.0);
int l9_2447=l9_2442;
int l9_2448=l9_2445;
if (l9_2447==1)
{
l9_2446.y=((2.0*l9_2446.y)+float(l9_2448))-1.0;
}
float2 l9_2449=l9_2446.xy;
l9_2440=l9_2449;
}
else
{
l9_2440=l9_2439;
}
float2 l9_2450=l9_2440;
float2 l9_2451=l9_2450;
float2 l9_2452=l9_2451;
int l9_2453;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_2454;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2454=0;
}
else
{
l9_2454=in.varStereoViewID;
}
int l9_2455=l9_2454;
l9_2453=1-l9_2455;
}
else
{
int l9_2456;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2456=0;
}
else
{
l9_2456=in.varStereoViewID;
}
int l9_2457=l9_2456;
l9_2453=l9_2457;
}
int l9_2458=l9_2453;
float2 l9_2459=l9_2452;
int l9_2460=l9_2458;
float2 l9_2461=l9_2459;
int l9_2462=l9_2460;
float l9_2463=0.0;
float2 l9_2464=(*sc_set2.UserUniforms).sc_ScreenTextureDims.xy;
float2 l9_2465=l9_2464;
float2 l9_2466=l9_2461;
int l9_2467=sc_ScreenTextureLayout_tmp;
int l9_2468=l9_2462;
float l9_2469=l9_2463;
float2 l9_2470=l9_2466;
int l9_2471=l9_2467;
int l9_2472=l9_2468;
float3 l9_2473;
if (l9_2471==0)
{
l9_2473=float3(l9_2470,0.0);
}
else
{
if (l9_2471==1)
{
l9_2473=float3(l9_2470.x,(l9_2470.y*0.5)+(0.5-(float(l9_2472)*0.5)),0.0);
}
else
{
l9_2473=float3(l9_2470,float(l9_2472));
}
}
float3 l9_2474=l9_2473;
float3 l9_2475=l9_2474;
float2 l9_2476=l9_2465;
float2 l9_2477=l9_2475.xy;
float l9_2478=l9_2469;
float4 l9_2479=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_2477,bias(l9_2478));
float4 l9_2480=l9_2479;
float4 l9_2481=l9_2480;
float4 l9_2482=l9_2481;
float4 l9_2483=l9_2482;
float4 l9_2484=l9_2483;
l9_2433=l9_2484;
}
float4 l9_2485=l9_2433;
float4 l9_2486=l9_2485;
float3 l9_2487=l9_2486.xyz;
float3 l9_2488;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2488=float3(pow(l9_2487.x,2.2),pow(l9_2487.y,2.2),pow(l9_2487.z,2.2));
}
else
{
l9_2488=l9_2487*l9_2487;
}
float3 l9_2489=l9_2488;
float3 l9_2490=l9_2489;
l9_2432.transmitted=l9_2490*mix(float3(1.0),l9_1992.albedo,float3(l9_1992.opacity));
l9_1992.opacity=1.0;
}
bool l9_2491=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_2491=true;
}
SurfaceProperties l9_2492=l9_1992;
LightingComponents l9_2493=l9_2432;
bool l9_2494=l9_2491;
float3 l9_2495=l9_2492.albedo*(l9_2493.directDiffuse+(l9_2493.indirectDiffuse*l9_2492.ao));
float3 l9_2496=l9_2493.directSpecular+(l9_2493.indirectSpecular*l9_2492.specularAo);
float3 l9_2497=l9_2492.emissive;
float3 l9_2498=l9_2493.transmitted;
if (l9_2494)
{
float l9_2499=l9_2492.opacity;
l9_2495*=srgbToLinear(l9_2499);
}
float3 l9_2500=((l9_2495+l9_2496)+l9_2497)+l9_2498;
float3 l9_2501=l9_2500;
float4 l9_2502=float4(l9_2501,l9_1992.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_2503=l9_2502.xyz;
float3 l9_2504=linearToneMapping(l9_2503);
l9_2502=float4(l9_2504.x,l9_2504.y,l9_2504.z,l9_2502.w);
}
float3 l9_2505=l9_2502.xyz;
float l9_2506=l9_2505.x;
float l9_2507=l9_2505.y;
float l9_2508=l9_2505.z;
float3 l9_2509=float3(linearToSrgb(l9_2506),linearToSrgb(l9_2507),linearToSrgb(l9_2508));
l9_2502=float4(l9_2509.x,l9_2509.y,l9_2509.z,l9_2502.w);
float4 l9_2510=l9_2502;
l9_1979=l9_2510;
}
else
{
l9_1979=float4(l9_1966,l9_1967);
}
l9_1979=fast::max(l9_1979,float4(0.0));
l9_1965=l9_1979;
float4 l9_2511=float4(0.0);
float3 l9_2512=(*sc_set2.UserUniforms).Port_Albedo_N405;
float l9_2513=(*sc_set2.UserUniforms).Port_Opacity_N405;
float3 l9_2514=l9_388;
float3 l9_2515=(*sc_set2.UserUniforms).Port_Emissive_N405;
float l9_2516=(*sc_set2.UserUniforms).Port_Metallic_N405;
float l9_2517=l9_389;
float3 l9_2518=(*sc_set2.UserUniforms).Port_SpecularAO_N405;
ssGlobals l9_2519=param_4;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_2519.BumpedNormal=float3x3(float3(l9_2519.VertexTangent_WorldSpace),float3(l9_2519.VertexBinormal_WorldSpace),float3(l9_2519.VertexNormal_WorldSpace))*l9_2514;
}
float l9_2520=l9_2513;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_2520<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_2521=gl_FragCoord;
float2 l9_2522=floor(mod(l9_2521.xy,float2(4.0)));
float l9_2523=(mod(dot(l9_2522,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_2520<l9_2523)
{
discard_fragment();
}
}
float4 l9_2524;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
l9_2517=fast::clamp(l9_2517,0.0,1.0);
float3 l9_2525=float3(1.0);
float3 l9_2526=l9_2512;
float l9_2527=l9_2513;
float3 l9_2528=l9_2519.BumpedNormal;
float3 l9_2529=l9_2519.PositionWS;
float3 l9_2530=l9_2519.ViewDirWS;
float3 l9_2531=l9_2515;
float l9_2532=l9_2516;
float l9_2533=l9_2517;
float3 l9_2534=l9_2525;
float3 l9_2535=l9_2518;
SurfaceProperties l9_2536;
l9_2536.albedo=float3(0.0);
l9_2536.opacity=1.0;
l9_2536.normal=float3(0.0);
l9_2536.positionWS=float3(0.0);
l9_2536.viewDirWS=float3(0.0);
l9_2536.metallic=0.0;
l9_2536.roughness=0.0;
l9_2536.emissive=float3(0.0);
l9_2536.ao=float3(1.0);
l9_2536.specularAo=float3(1.0);
l9_2536.bakedShadows=float3(1.0);
SurfaceProperties l9_2537=l9_2536;
SurfaceProperties l9_2538=l9_2537;
l9_2538.opacity=l9_2527;
float3 l9_2539=l9_2526;
float3 l9_2540;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2540=float3(pow(l9_2539.x,2.2),pow(l9_2539.y,2.2),pow(l9_2539.z,2.2));
}
else
{
l9_2540=l9_2539*l9_2539;
}
float3 l9_2541=l9_2540;
l9_2538.albedo=l9_2541;
l9_2538.normal=normalize(l9_2528);
l9_2538.positionWS=l9_2529;
l9_2538.viewDirWS=l9_2530;
float3 l9_2542=l9_2531;
float3 l9_2543;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2543=float3(pow(l9_2542.x,2.2),pow(l9_2542.y,2.2),pow(l9_2542.z,2.2));
}
else
{
l9_2543=l9_2542*l9_2542;
}
float3 l9_2544=l9_2543;
l9_2538.emissive=l9_2544;
l9_2538.metallic=l9_2532;
l9_2538.roughness=l9_2533;
l9_2538.ao=l9_2534;
l9_2538.specularAo=l9_2535;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_2545=l9_2538.positionWS;
l9_2538.ao=evaluateSSAO(l9_2545,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.sc_SSAOTexture,sc_set2.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_2546=l9_2538;
SurfaceProperties l9_2547=l9_2546;
float3 l9_2548=mix(float3(0.04),l9_2547.albedo*l9_2547.metallic,float3(l9_2547.metallic));
float3 l9_2549=mix(l9_2547.albedo*(1.0-l9_2547.metallic),float3(0.0),float3(l9_2547.metallic));
l9_2546.albedo=l9_2549;
l9_2546.specColor=l9_2548;
SurfaceProperties l9_2550=l9_2546;
l9_2538=l9_2550;
SurfaceProperties l9_2551=l9_2538;
LightingComponents l9_2552;
l9_2552.directDiffuse=float3(0.0);
l9_2552.directSpecular=float3(0.0);
l9_2552.indirectDiffuse=float3(1.0);
l9_2552.indirectSpecular=float3(0.0);
l9_2552.emitted=float3(0.0);
l9_2552.transmitted=float3(0.0);
LightingComponents l9_2553=l9_2552;
LightingComponents l9_2554=l9_2553;
float3 l9_2555=l9_2551.viewDirWS;
int l9_2556=0;
float4 l9_2557=float4(l9_2551.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_2558;
LightProperties l9_2559;
int l9_2560=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2560<sc_DirectionalLightsCount_tmp)
{
l9_2558.direction=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_2560].direction;
l9_2558.color=(*sc_set2.UserUniforms).sc_DirectionalLights[l9_2560].color;
l9_2559.direction=l9_2558.direction;
l9_2559.color=l9_2558.color.xyz;
l9_2559.attenuation=l9_2558.color.w;
l9_2559.attenuation*=l9_2557[(l9_2556<3) ? l9_2556 : 3];
l9_2556++;
LightingComponents l9_2561=l9_2554;
LightProperties l9_2562=l9_2559;
SurfaceProperties l9_2563=l9_2551;
float3 l9_2564=l9_2555;
SurfaceProperties l9_2565=l9_2563;
float3 l9_2566=l9_2562.direction;
float l9_2567=dot(l9_2565.normal,l9_2566);
float l9_2568=fast::clamp(l9_2567,0.0,1.0);
float3 l9_2569=float3(l9_2568);
l9_2561.directDiffuse+=((l9_2569*l9_2562.color)*l9_2562.attenuation);
SurfaceProperties l9_2570=l9_2563;
float3 l9_2571=l9_2562.direction;
float3 l9_2572=l9_2564;
l9_2561.directSpecular+=((calculateDirectSpecular(l9_2570,l9_2571,l9_2572)*l9_2562.color)*l9_2562.attenuation);
LightingComponents l9_2573=l9_2561;
l9_2554=l9_2573;
l9_2560++;
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
sc_PointLight_t_1 l9_2574;
LightProperties l9_2575;
int l9_2576=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2576<sc_PointLightsCount_tmp)
{
l9_2574.falloffEnabled=(*sc_set2.UserUniforms).sc_PointLights[l9_2576].falloffEnabled!=0;
l9_2574.falloffEndDistance=(*sc_set2.UserUniforms).sc_PointLights[l9_2576].falloffEndDistance;
l9_2574.negRcpFalloffEndDistance4=(*sc_set2.UserUniforms).sc_PointLights[l9_2576].negRcpFalloffEndDistance4;
l9_2574.angleScale=(*sc_set2.UserUniforms).sc_PointLights[l9_2576].angleScale;
l9_2574.angleOffset=(*sc_set2.UserUniforms).sc_PointLights[l9_2576].angleOffset;
l9_2574.direction=(*sc_set2.UserUniforms).sc_PointLights[l9_2576].direction;
l9_2574.position=(*sc_set2.UserUniforms).sc_PointLights[l9_2576].position;
l9_2574.color=(*sc_set2.UserUniforms).sc_PointLights[l9_2576].color;
float3 l9_2577=l9_2574.position-l9_2551.positionWS;
l9_2575.direction=normalize(l9_2577);
l9_2575.color=l9_2574.color.xyz;
l9_2575.attenuation=l9_2574.color.w;
l9_2575.attenuation*=l9_2557[(l9_2556<3) ? l9_2556 : 3];
float3 l9_2578=l9_2575.direction;
float3 l9_2579=l9_2574.direction;
float l9_2580=l9_2574.angleScale;
float l9_2581=l9_2574.angleOffset;
float l9_2582=dot(l9_2578,l9_2579);
float l9_2583=fast::clamp((l9_2582*l9_2580)+l9_2581,0.0,1.0);
float l9_2584=l9_2583*l9_2583;
l9_2575.attenuation*=l9_2584;
if (l9_2574.falloffEnabled)
{
float l9_2585=length(l9_2577);
float l9_2586=l9_2574.falloffEndDistance;
l9_2575.attenuation*=computeDistanceAttenuation(l9_2585,l9_2586);
}
l9_2556++;
LightingComponents l9_2587=l9_2554;
LightProperties l9_2588=l9_2575;
SurfaceProperties l9_2589=l9_2551;
float3 l9_2590=l9_2555;
SurfaceProperties l9_2591=l9_2589;
float3 l9_2592=l9_2588.direction;
float l9_2593=dot(l9_2591.normal,l9_2592);
float l9_2594=fast::clamp(l9_2593,0.0,1.0);
float3 l9_2595=float3(l9_2594);
l9_2587.directDiffuse+=((l9_2595*l9_2588.color)*l9_2588.attenuation);
SurfaceProperties l9_2596=l9_2589;
float3 l9_2597=l9_2588.direction;
float3 l9_2598=l9_2590;
l9_2587.directSpecular+=((calculateDirectSpecular(l9_2596,l9_2597,l9_2598)*l9_2588.color)*l9_2588.attenuation);
LightingComponents l9_2599=l9_2587;
l9_2554=l9_2599;
l9_2576++;
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
float3 l9_2600;
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_2601=abs(in.varShadowTex-float2(0.5));
float l9_2602=fast::max(l9_2601.x,l9_2601.y);
float l9_2603=step(l9_2602,0.5);
float4 l9_2604=sc_set2.sc_ShadowTexture.sample(sc_set2.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_2603;
float3 l9_2605=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_2604.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float l9_2606=l9_2604.w*(*sc_set2.UserUniforms).sc_ShadowDensity;
l9_2600=mix(float3(1.0),l9_2605,float3(l9_2606));
}
else
{
l9_2600=float3(1.0);
}
float3 l9_2607=l9_2600;
float3 l9_2608=l9_2607;
l9_2554.directDiffuse*=l9_2608;
l9_2554.directSpecular*=l9_2608;
}
SurfaceProperties l9_2609=l9_2551;
float3 l9_2610=l9_2609.normal;
float3 l9_2611=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_2612=l9_2610;
float3 l9_2613=l9_2612;
float l9_2614=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float l9_2615=l9_2613.x;
float l9_2616=-l9_2613.z;
float l9_2617=(l9_2615<0.0) ? (-1.0) : 1.0;
float l9_2618=l9_2617*acos(fast::clamp(l9_2616/length(float2(l9_2615,l9_2616)),-1.0,1.0));
float2 l9_2619;
l9_2619.x=l9_2618-1.5708;
l9_2619.y=acos(l9_2613.y);
l9_2619/=float2(6.28319,3.14159);
l9_2619.y=1.0-l9_2619.y;
l9_2619.x+=(l9_2614/360.0);
l9_2619.x=fract((l9_2619.x+floor(l9_2619.x))+1.0);
float2 l9_2620=l9_2619;
float2 l9_2621=l9_2620;
float4 l9_2622;
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_2623=l9_2621;
float2 l9_2624=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_2625=5.0;
l9_2621=calcSeamlessPanoramicUvsForSampling(l9_2623,l9_2624,l9_2625);
}
float2 l9_2626=l9_2621;
float l9_2627=13.0;
int l9_2628;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2629;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2629=0;
}
else
{
l9_2629=in.varStereoViewID;
}
int l9_2630=l9_2629;
l9_2628=1-l9_2630;
}
else
{
int l9_2631;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2631=0;
}
else
{
l9_2631=in.varStereoViewID;
}
int l9_2632=l9_2631;
l9_2628=l9_2632;
}
int l9_2633=l9_2628;
float2 l9_2634=l9_2626;
int l9_2635=l9_2633;
float l9_2636=l9_2627;
float2 l9_2637=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_2638=l9_2637;
float2 l9_2639=l9_2634;
int l9_2640=sc_EnvmapSpecularLayout_tmp;
int l9_2641=l9_2635;
float l9_2642=l9_2636;
float2 l9_2643=l9_2639;
int l9_2644=l9_2640;
int l9_2645=l9_2641;
float3 l9_2646;
if (l9_2644==0)
{
l9_2646=float3(l9_2643,0.0);
}
else
{
if (l9_2644==1)
{
l9_2646=float3(l9_2643.x,(l9_2643.y*0.5)+(0.5-(float(l9_2645)*0.5)),0.0);
}
else
{
l9_2646=float3(l9_2643,float(l9_2645));
}
}
float3 l9_2647=l9_2646;
float3 l9_2648=l9_2647;
float2 l9_2649=l9_2638;
float2 l9_2650=l9_2648.xy;
float l9_2651=l9_2642;
float4 l9_2652=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_2650,bias(l9_2651));
float4 l9_2653=l9_2652;
float4 l9_2654=l9_2653;
float4 l9_2655=l9_2654;
float4 l9_2656=l9_2655;
l9_2622=l9_2656;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_2657=l9_2621;
float2 l9_2658=(*sc_set2.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_2659=0.0;
l9_2621=calcSeamlessPanoramicUvsForSampling(l9_2657,l9_2658,l9_2659);
float2 l9_2660=l9_2621;
float l9_2661=-13.0;
int l9_2662;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_2663;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2663=0;
}
else
{
l9_2663=in.varStereoViewID;
}
int l9_2664=l9_2663;
l9_2662=1-l9_2664;
}
else
{
int l9_2665;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2665=0;
}
else
{
l9_2665=in.varStereoViewID;
}
int l9_2666=l9_2665;
l9_2662=l9_2666;
}
int l9_2667=l9_2662;
float2 l9_2668=l9_2660;
int l9_2669=l9_2667;
float l9_2670=l9_2661;
float2 l9_2671=(*sc_set2.UserUniforms).sc_EnvmapDiffuseDims.xy;
float2 l9_2672=l9_2671;
float2 l9_2673=l9_2668;
int l9_2674=sc_EnvmapDiffuseLayout_tmp;
int l9_2675=l9_2669;
float l9_2676=l9_2670;
float2 l9_2677=l9_2673;
int l9_2678=l9_2674;
int l9_2679=l9_2675;
float3 l9_2680;
if (l9_2678==0)
{
l9_2680=float3(l9_2677,0.0);
}
else
{
if (l9_2678==1)
{
l9_2680=float3(l9_2677.x,(l9_2677.y*0.5)+(0.5-(float(l9_2679)*0.5)),0.0);
}
else
{
l9_2680=float3(l9_2677,float(l9_2679));
}
}
float3 l9_2681=l9_2680;
float3 l9_2682=l9_2681;
float2 l9_2683=l9_2672;
float2 l9_2684=l9_2682.xy;
float l9_2685=l9_2676;
float4 l9_2686=sc_set2.sc_EnvmapDiffuse.sample(sc_set2.sc_EnvmapDiffuseSmpSC,l9_2684,bias(l9_2685));
float4 l9_2687=l9_2686;
float4 l9_2688=l9_2687;
float4 l9_2689=l9_2688;
float4 l9_2690=l9_2689;
l9_2622=l9_2690;
}
else
{
float2 l9_2691=l9_2621;
float l9_2692=13.0;
int l9_2693;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2694;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2694=0;
}
else
{
l9_2694=in.varStereoViewID;
}
int l9_2695=l9_2694;
l9_2693=1-l9_2695;
}
else
{
int l9_2696;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2696=0;
}
else
{
l9_2696=in.varStereoViewID;
}
int l9_2697=l9_2696;
l9_2693=l9_2697;
}
int l9_2698=l9_2693;
float2 l9_2699=l9_2691;
int l9_2700=l9_2698;
float l9_2701=l9_2692;
float2 l9_2702=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_2703=l9_2702;
float2 l9_2704=l9_2699;
int l9_2705=sc_EnvmapSpecularLayout_tmp;
int l9_2706=l9_2700;
float l9_2707=l9_2701;
float2 l9_2708=l9_2704;
int l9_2709=l9_2705;
int l9_2710=l9_2706;
float3 l9_2711;
if (l9_2709==0)
{
l9_2711=float3(l9_2708,0.0);
}
else
{
if (l9_2709==1)
{
l9_2711=float3(l9_2708.x,(l9_2708.y*0.5)+(0.5-(float(l9_2710)*0.5)),0.0);
}
else
{
l9_2711=float3(l9_2708,float(l9_2710));
}
}
float3 l9_2712=l9_2711;
float3 l9_2713=l9_2712;
float2 l9_2714=l9_2703;
float2 l9_2715=l9_2713.xy;
float l9_2716=l9_2707;
float4 l9_2717=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_2715,bias(l9_2716));
float4 l9_2718=l9_2717;
float4 l9_2719=l9_2718;
float4 l9_2720=l9_2719;
float4 l9_2721=l9_2720;
l9_2622=l9_2721;
}
}
float4 l9_2722=l9_2622;
float3 l9_2723=l9_2722.xyz*(1.0/l9_2722.w);
float3 l9_2724=l9_2723*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_2611=l9_2724;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_2725=(*sc_set2.UserUniforms).sc_Sh[0];
float3 l9_2726=(*sc_set2.UserUniforms).sc_Sh[1];
float3 l9_2727=(*sc_set2.UserUniforms).sc_Sh[2];
float3 l9_2728=(*sc_set2.UserUniforms).sc_Sh[3];
float3 l9_2729=(*sc_set2.UserUniforms).sc_Sh[4];
float3 l9_2730=(*sc_set2.UserUniforms).sc_Sh[5];
float3 l9_2731=(*sc_set2.UserUniforms).sc_Sh[6];
float3 l9_2732=(*sc_set2.UserUniforms).sc_Sh[7];
float3 l9_2733=(*sc_set2.UserUniforms).sc_Sh[8];
float3 l9_2734=-l9_2610;
float l9_2735=l9_2734.x;
float l9_2736=l9_2734.y;
float l9_2737=l9_2734.z;
float l9_2738=l9_2735*l9_2735;
float l9_2739=l9_2736*l9_2736;
float l9_2740=l9_2737*l9_2737;
float l9_2741=l9_2735*l9_2736;
float l9_2742=l9_2736*l9_2737;
float l9_2743=l9_2735*l9_2737;
float3 l9_2744=((((((l9_2733*0.429043)*(l9_2738-l9_2739))+((l9_2731*0.743125)*l9_2740))+(l9_2725*0.886227))-(l9_2731*0.247708))+((((l9_2729*l9_2741)+(l9_2732*l9_2743))+(l9_2730*l9_2742))*0.858086))+((((l9_2728*l9_2735)+(l9_2726*l9_2736))+(l9_2727*l9_2737))*1.02333);
l9_2611=l9_2744*(*sc_set2.UserUniforms).sc_ShIntensity;
}
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_2611+=((*sc_set2.UserUniforms).sc_AmbientLights[0].color*(*sc_set2.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_2611.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_2611+=((*sc_set2.UserUniforms).sc_AmbientLights[1].color*(*sc_set2.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_2611.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_2611+=((*sc_set2.UserUniforms).sc_AmbientLights[2].color*(*sc_set2.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_2611.x+=(1e-06*(*sc_set2.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_2745=l9_2610;
float3 l9_2746=(*sc_set2.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_2747;
float l9_2748;
int l9_2749=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2749<sc_LightEstimationSGCount_tmp)
{
l9_2747.color=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2749].color;
l9_2747.sharpness=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2749].sharpness;
l9_2747.axis=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2749].axis;
float3 l9_2750=l9_2745;
float l9_2751=dot(l9_2747.axis,l9_2750);
float l9_2752=l9_2747.sharpness;
float l9_2753=0.36;
float l9_2754=1.0/(4.0*l9_2753);
float l9_2755=exp(-l9_2752);
float l9_2756=l9_2755*l9_2755;
float l9_2757=1.0/l9_2752;
float l9_2758=(1.0+(2.0*l9_2756))-l9_2757;
float l9_2759=((l9_2755-l9_2756)*l9_2757)-l9_2756;
float l9_2760=sqrt(1.0-l9_2758);
float l9_2761=l9_2753*l9_2751;
float l9_2762=l9_2754*l9_2760;
float l9_2763=l9_2761+l9_2762;
float l9_2764=l9_2751;
float l9_2765=fast::clamp(l9_2764,0.0,1.0);
float l9_2766=l9_2765;
if (step(abs(l9_2761),l9_2762)>0.5)
{
l9_2748=(l9_2763*l9_2763)/l9_2760;
}
else
{
l9_2748=l9_2766;
}
l9_2766=l9_2748;
float l9_2767=(l9_2758*l9_2766)+l9_2759;
sc_SphericalGaussianLight_t l9_2768=l9_2747;
float3 l9_2769=(l9_2768.color/float3(l9_2768.sharpness))*6.28319;
float3 l9_2770=(l9_2769*l9_2767)/float3(3.14159);
l9_2746+=l9_2770;
l9_2749++;
continue;
}
else
{
break;
}
}
float3 l9_2771=l9_2746;
l9_2611+=l9_2771;
}
float3 l9_2772=l9_2611;
float3 l9_2773=l9_2772;
l9_2554.indirectDiffuse=l9_2773;
SurfaceProperties l9_2774=l9_2551;
float3 l9_2775=l9_2555;
float3 l9_2776=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_2777=l9_2774;
float3 l9_2778=l9_2775;
float3 l9_2779=l9_2777.normal;
float3 l9_2780=reflect(-l9_2778,l9_2779);
float3 l9_2781=l9_2779;
float3 l9_2782=l9_2780;
float l9_2783=l9_2777.roughness;
l9_2780=getSpecularDominantDir(l9_2781,l9_2782,l9_2783);
float l9_2784=l9_2777.roughness;
float l9_2785=pow(l9_2784,0.666667);
float l9_2786=fast::clamp(l9_2785,0.0,1.0);
float l9_2787=l9_2786*5.0;
float l9_2788=l9_2787;
float l9_2789=l9_2788;
float3 l9_2790=l9_2780;
float l9_2791=l9_2789;
float3 l9_2792=l9_2790;
float l9_2793=l9_2791;
float3 l9_2794=l9_2792;
float l9_2795=(*sc_set2.UserUniforms).sc_EnvmapRotation.y;
float l9_2796=l9_2794.x;
float l9_2797=-l9_2794.z;
float l9_2798=(l9_2796<0.0) ? (-1.0) : 1.0;
float l9_2799=l9_2798*acos(fast::clamp(l9_2797/length(float2(l9_2796,l9_2797)),-1.0,1.0));
float2 l9_2800;
l9_2800.x=l9_2799-1.5708;
l9_2800.y=acos(l9_2794.y);
l9_2800/=float2(6.28319,3.14159);
l9_2800.y=1.0-l9_2800.y;
l9_2800.x+=(l9_2795/360.0);
l9_2800.x=fract((l9_2800.x+floor(l9_2800.x))+1.0);
float2 l9_2801=l9_2800;
float2 l9_2802=l9_2801;
float4 l9_2803;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_2804=floor(l9_2793);
float l9_2805=ceil(l9_2793);
float l9_2806=l9_2793-l9_2804;
float2 l9_2807=l9_2802;
float2 l9_2808=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_2809=l9_2804;
float2 l9_2810=calcSeamlessPanoramicUvsForSampling(l9_2807,l9_2808,l9_2809);
float2 l9_2811=l9_2810;
float l9_2812=l9_2804;
float2 l9_2813=l9_2811;
float l9_2814=l9_2812;
int l9_2815;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2816;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2816=0;
}
else
{
l9_2816=in.varStereoViewID;
}
int l9_2817=l9_2816;
l9_2815=1-l9_2817;
}
else
{
int l9_2818;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2818=0;
}
else
{
l9_2818=in.varStereoViewID;
}
int l9_2819=l9_2818;
l9_2815=l9_2819;
}
int l9_2820=l9_2815;
float2 l9_2821=l9_2813;
int l9_2822=l9_2820;
float l9_2823=l9_2814;
float2 l9_2824=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_2825=l9_2824;
float2 l9_2826=l9_2821;
int l9_2827=sc_EnvmapSpecularLayout_tmp;
int l9_2828=l9_2822;
float l9_2829=l9_2823;
float2 l9_2830=l9_2826;
int l9_2831=l9_2827;
int l9_2832=l9_2828;
float3 l9_2833;
if (l9_2831==0)
{
l9_2833=float3(l9_2830,0.0);
}
else
{
if (l9_2831==1)
{
l9_2833=float3(l9_2830.x,(l9_2830.y*0.5)+(0.5-(float(l9_2832)*0.5)),0.0);
}
else
{
l9_2833=float3(l9_2830,float(l9_2832));
}
}
float3 l9_2834=l9_2833;
float3 l9_2835=l9_2834;
float2 l9_2836=l9_2825;
float2 l9_2837=l9_2835.xy;
float l9_2838=l9_2829;
float4 l9_2839=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_2837,level(l9_2838));
float4 l9_2840=l9_2839;
float4 l9_2841=l9_2840;
float4 l9_2842=l9_2841;
float4 l9_2843=l9_2842;
float4 l9_2844=l9_2843;
float4 l9_2845=l9_2844;
float2 l9_2846=l9_2802;
float2 l9_2847=(*sc_set2.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_2848=l9_2805;
float2 l9_2849=calcSeamlessPanoramicUvsForSampling(l9_2846,l9_2847,l9_2848);
float2 l9_2850=l9_2849;
float l9_2851=l9_2805;
float2 l9_2852=l9_2850;
float l9_2853=l9_2851;
int l9_2854;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2855;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2855=0;
}
else
{
l9_2855=in.varStereoViewID;
}
int l9_2856=l9_2855;
l9_2854=1-l9_2856;
}
else
{
int l9_2857;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2857=0;
}
else
{
l9_2857=in.varStereoViewID;
}
int l9_2858=l9_2857;
l9_2854=l9_2858;
}
int l9_2859=l9_2854;
float2 l9_2860=l9_2852;
int l9_2861=l9_2859;
float l9_2862=l9_2853;
float2 l9_2863=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_2864=l9_2863;
float2 l9_2865=l9_2860;
int l9_2866=sc_EnvmapSpecularLayout_tmp;
int l9_2867=l9_2861;
float l9_2868=l9_2862;
float2 l9_2869=l9_2865;
int l9_2870=l9_2866;
int l9_2871=l9_2867;
float3 l9_2872;
if (l9_2870==0)
{
l9_2872=float3(l9_2869,0.0);
}
else
{
if (l9_2870==1)
{
l9_2872=float3(l9_2869.x,(l9_2869.y*0.5)+(0.5-(float(l9_2871)*0.5)),0.0);
}
else
{
l9_2872=float3(l9_2869,float(l9_2871));
}
}
float3 l9_2873=l9_2872;
float3 l9_2874=l9_2873;
float2 l9_2875=l9_2864;
float2 l9_2876=l9_2874.xy;
float l9_2877=l9_2868;
float4 l9_2878=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_2876,level(l9_2877));
float4 l9_2879=l9_2878;
float4 l9_2880=l9_2879;
float4 l9_2881=l9_2880;
float4 l9_2882=l9_2881;
float4 l9_2883=l9_2882;
float4 l9_2884=l9_2883;
l9_2803=mix(l9_2845,l9_2884,float4(l9_2806));
}
else
{
float2 l9_2885=l9_2802;
float l9_2886=l9_2793;
float2 l9_2887=l9_2885;
float l9_2888=l9_2886;
int l9_2889;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_2890;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2890=0;
}
else
{
l9_2890=in.varStereoViewID;
}
int l9_2891=l9_2890;
l9_2889=1-l9_2891;
}
else
{
int l9_2892;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2892=0;
}
else
{
l9_2892=in.varStereoViewID;
}
int l9_2893=l9_2892;
l9_2889=l9_2893;
}
int l9_2894=l9_2889;
float2 l9_2895=l9_2887;
int l9_2896=l9_2894;
float l9_2897=l9_2888;
float2 l9_2898=(*sc_set2.UserUniforms).sc_EnvmapSpecularDims.xy;
float2 l9_2899=l9_2898;
float2 l9_2900=l9_2895;
int l9_2901=sc_EnvmapSpecularLayout_tmp;
int l9_2902=l9_2896;
float l9_2903=l9_2897;
float2 l9_2904=l9_2900;
int l9_2905=l9_2901;
int l9_2906=l9_2902;
float3 l9_2907;
if (l9_2905==0)
{
l9_2907=float3(l9_2904,0.0);
}
else
{
if (l9_2905==1)
{
l9_2907=float3(l9_2904.x,(l9_2904.y*0.5)+(0.5-(float(l9_2906)*0.5)),0.0);
}
else
{
l9_2907=float3(l9_2904,float(l9_2906));
}
}
float3 l9_2908=l9_2907;
float3 l9_2909=l9_2908;
float2 l9_2910=l9_2899;
float2 l9_2911=l9_2909.xy;
float l9_2912=l9_2903;
float4 l9_2913=sc_set2.sc_EnvmapSpecular.sample(sc_set2.sc_EnvmapSpecularSmpSC,l9_2911,level(l9_2912));
float4 l9_2914=l9_2913;
float4 l9_2915=l9_2914;
float4 l9_2916=l9_2915;
float4 l9_2917=l9_2916;
float4 l9_2918=l9_2917;
l9_2803=l9_2918;
}
float4 l9_2919=l9_2803;
float3 l9_2920=l9_2919.xyz*(1.0/l9_2919.w);
float3 l9_2921=l9_2920;
float3 l9_2922=l9_2921*(*sc_set2.UserUniforms).sc_EnvmapExposure;
l9_2922+=float3(1e-06);
float3 l9_2923=l9_2922;
float3 l9_2924=l9_2923;
SurfaceProperties l9_2925=l9_2777;
float l9_2926=abs(dot(l9_2779,l9_2778));
float3 l9_2927=l9_2924*envBRDFApprox(l9_2925,l9_2926);
l9_2776+=l9_2927;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_2928=l9_2774;
float3 l9_2929=l9_2775;
float l9_2930=fast::clamp(l9_2928.roughness*l9_2928.roughness,0.01,1.0);
float3 l9_2931=(*sc_set2.UserUniforms).sc_LightEstimationData.ambientLight*l9_2928.specColor;
sc_SphericalGaussianLight_t l9_2932;
sc_SphericalGaussianLight_t l9_2933;
sc_SphericalGaussianLight_t l9_2934;
int l9_2935=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_2935<sc_LightEstimationSGCount_tmp)
{
l9_2932.color=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2935].color;
l9_2932.sharpness=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2935].sharpness;
l9_2932.axis=(*sc_set2.UserUniforms).sc_LightEstimationData.sg[l9_2935].axis;
float3 l9_2936=l9_2928.normal;
float l9_2937=l9_2930;
float3 l9_2938=l9_2929;
float3 l9_2939=l9_2928.specColor;
float3 l9_2940=l9_2936;
float l9_2941=l9_2937;
l9_2933.axis=l9_2940;
float l9_2942=l9_2941*l9_2941;
l9_2933.sharpness=2.0/l9_2942;
l9_2933.color=float3(1.0/(3.14159*l9_2942));
sc_SphericalGaussianLight_t l9_2943=l9_2933;
sc_SphericalGaussianLight_t l9_2944=l9_2943;
sc_SphericalGaussianLight_t l9_2945=l9_2944;
float3 l9_2946=l9_2938;
l9_2934.axis=reflect(-l9_2946,l9_2945.axis);
l9_2934.color=l9_2945.color;
l9_2934.sharpness=l9_2945.sharpness;
l9_2934.sharpness/=(4.0*fast::max(dot(l9_2945.axis,l9_2946),0.0001));
sc_SphericalGaussianLight_t l9_2947=l9_2934;
sc_SphericalGaussianLight_t l9_2948=l9_2947;
sc_SphericalGaussianLight_t l9_2949=l9_2948;
sc_SphericalGaussianLight_t l9_2950=l9_2932;
float l9_2951=length((l9_2949.axis*l9_2949.sharpness)+(l9_2950.axis*l9_2950.sharpness));
float3 l9_2952=(l9_2949.color*exp((l9_2951-l9_2949.sharpness)-l9_2950.sharpness))*l9_2950.color;
float l9_2953=1.0-exp((-2.0)*l9_2951);
float3 l9_2954=((l9_2952*6.28319)*l9_2953)/float3(l9_2951);
float3 l9_2955=l9_2954;
float3 l9_2956=l9_2948.axis;
float l9_2957=l9_2937*l9_2937;
float l9_2958=dot(l9_2936,l9_2956);
float l9_2959=fast::clamp(l9_2958,0.0,1.0);
float l9_2960=l9_2959;
float l9_2961=dot(l9_2936,l9_2938);
float l9_2962=fast::clamp(l9_2961,0.0,1.0);
float l9_2963=l9_2962;
float3 l9_2964=normalize(l9_2948.axis+l9_2938);
float l9_2965=l9_2957;
float l9_2966=l9_2960;
float l9_2967=1.0/(l9_2966+sqrt(l9_2965+(((1.0-l9_2965)*l9_2966)*l9_2966)));
float l9_2968=l9_2957;
float l9_2969=l9_2963;
float l9_2970=1.0/(l9_2969+sqrt(l9_2968+(((1.0-l9_2968)*l9_2969)*l9_2969)));
l9_2955*=(l9_2967*l9_2970);
float l9_2971=dot(l9_2956,l9_2964);
float l9_2972=fast::clamp(l9_2971,0.0,1.0);
float l9_2973=pow(1.0-l9_2972,5.0);
l9_2955*=(l9_2939+((float3(1.0)-l9_2939)*l9_2973));
l9_2955*=l9_2960;
float3 l9_2974=l9_2955;
l9_2931+=l9_2974;
l9_2935++;
continue;
}
else
{
break;
}
}
float3 l9_2975=l9_2931;
l9_2776+=l9_2975;
}
float3 l9_2976=l9_2776;
l9_2554.indirectSpecular=l9_2976;
LightingComponents l9_2977=l9_2554;
LightingComponents l9_2978=l9_2977;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_2978.directDiffuse=float3(0.0);
l9_2978.indirectDiffuse=float3(0.0);
float4 l9_2979;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_2980=out.FragColor0;
float4 l9_2981=l9_2980;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_2981.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_2982=l9_2981;
l9_2979=l9_2982;
}
else
{
float4 l9_2983=gl_FragCoord;
float2 l9_2984=(l9_2983.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_2985=l9_2984;
float2 l9_2986;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_2987=float3(l9_2985,0.0);
int l9_2988=1;
int l9_2989;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2989=0;
}
else
{
l9_2989=in.varStereoViewID;
}
int l9_2990=l9_2989;
int l9_2991=l9_2990;
float3 l9_2992=float3(l9_2985,0.0);
int l9_2993=l9_2988;
int l9_2994=l9_2991;
if (l9_2993==1)
{
l9_2992.y=((2.0*l9_2992.y)+float(l9_2994))-1.0;
}
float2 l9_2995=l9_2992.xy;
l9_2986=l9_2995;
}
else
{
l9_2986=l9_2985;
}
float2 l9_2996=l9_2986;
float2 l9_2997=l9_2996;
float2 l9_2998=l9_2997;
int l9_2999;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_3000;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3000=0;
}
else
{
l9_3000=in.varStereoViewID;
}
int l9_3001=l9_3000;
l9_2999=1-l9_3001;
}
else
{
int l9_3002;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3002=0;
}
else
{
l9_3002=in.varStereoViewID;
}
int l9_3003=l9_3002;
l9_2999=l9_3003;
}
int l9_3004=l9_2999;
float2 l9_3005=l9_2998;
int l9_3006=l9_3004;
float2 l9_3007=l9_3005;
int l9_3008=l9_3006;
float l9_3009=0.0;
float2 l9_3010=(*sc_set2.UserUniforms).sc_ScreenTextureDims.xy;
float2 l9_3011=l9_3010;
float2 l9_3012=l9_3007;
int l9_3013=sc_ScreenTextureLayout_tmp;
int l9_3014=l9_3008;
float l9_3015=l9_3009;
float2 l9_3016=l9_3012;
int l9_3017=l9_3013;
int l9_3018=l9_3014;
float3 l9_3019;
if (l9_3017==0)
{
l9_3019=float3(l9_3016,0.0);
}
else
{
if (l9_3017==1)
{
l9_3019=float3(l9_3016.x,(l9_3016.y*0.5)+(0.5-(float(l9_3018)*0.5)),0.0);
}
else
{
l9_3019=float3(l9_3016,float(l9_3018));
}
}
float3 l9_3020=l9_3019;
float3 l9_3021=l9_3020;
float2 l9_3022=l9_3011;
float2 l9_3023=l9_3021.xy;
float l9_3024=l9_3015;
float4 l9_3025=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_3023,bias(l9_3024));
float4 l9_3026=l9_3025;
float4 l9_3027=l9_3026;
float4 l9_3028=l9_3027;
float4 l9_3029=l9_3028;
float4 l9_3030=l9_3029;
l9_2979=l9_3030;
}
float4 l9_3031=l9_2979;
float4 l9_3032=l9_3031;
float3 l9_3033=l9_3032.xyz;
float3 l9_3034;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3034=float3(pow(l9_3033.x,2.2),pow(l9_3033.y,2.2),pow(l9_3033.z,2.2));
}
else
{
l9_3034=l9_3033*l9_3033;
}
float3 l9_3035=l9_3034;
float3 l9_3036=l9_3035;
l9_2978.transmitted=l9_3036*mix(float3(1.0),l9_2538.albedo,float3(l9_2538.opacity));
l9_2538.opacity=1.0;
}
bool l9_3037=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_3037=true;
}
SurfaceProperties l9_3038=l9_2538;
LightingComponents l9_3039=l9_2978;
bool l9_3040=l9_3037;
float3 l9_3041=l9_3038.albedo*(l9_3039.directDiffuse+(l9_3039.indirectDiffuse*l9_3038.ao));
float3 l9_3042=l9_3039.directSpecular+(l9_3039.indirectSpecular*l9_3038.specularAo);
float3 l9_3043=l9_3038.emissive;
float3 l9_3044=l9_3039.transmitted;
if (l9_3040)
{
float l9_3045=l9_3038.opacity;
l9_3041*=srgbToLinear(l9_3045);
}
float3 l9_3046=((l9_3041+l9_3042)+l9_3043)+l9_3044;
float3 l9_3047=l9_3046;
float4 l9_3048=float4(l9_3047,l9_2538.opacity);
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_3049=l9_3048.xyz;
float3 l9_3050=linearToneMapping(l9_3049);
l9_3048=float4(l9_3050.x,l9_3050.y,l9_3050.z,l9_3048.w);
}
float3 l9_3051=l9_3048.xyz;
float l9_3052=l9_3051.x;
float l9_3053=l9_3051.y;
float l9_3054=l9_3051.z;
float3 l9_3055=float3(linearToSrgb(l9_3052),linearToSrgb(l9_3053),linearToSrgb(l9_3054));
l9_3048=float4(l9_3055.x,l9_3055.y,l9_3055.z,l9_3048.w);
float4 l9_3056=l9_3048;
l9_2524=l9_3056;
}
else
{
l9_2524=float4(l9_2512,l9_2513);
}
l9_2524=fast::max(l9_2524,float4(0.0));
l9_2511=l9_2524;
float4 l9_3057=float4(0.0);
float4 l9_3058=l9_1965;
float l9_3059=l9_57;
float l9_3060=l9_379;
float3 l9_3061=l9_385;
float l9_3062=l9_67;
float4 l9_3063=l9_386;
float l9_3064=l9_84;
float l9_3065=l9_387;
float4 l9_3066=l9_2511;
ssGlobals l9_3067=param_4;
tempGlobals=l9_3067;
float4 l9_3068=float4(0.0);
N31_PbrIn=l9_3058;
N31_EnableTransmission=(int(ENABLE_TRANSMISSION_tmp)!=0);
N31_Opacity=l9_3060;
N31_Background=l9_3061;
N31_EnableSheen=(int(ENABLE_SHEEN_tmp)!=0);
N31_SheenColor=l9_3063;
N31_EnableClearcoat=(int(ENABLE_CLEARCOAT_tmp)!=0);
N31_ClearcoatBase=l9_3065;
N31_ClearcoatColor=l9_3066;
N31_Result=N31_PbrIn;
if ((N31_EnableSheen||N31_EnableTransmission)||N31_EnableClearcoat)
{
float4 l9_3069=N31_Result;
float4 l9_3070;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3070=float4(pow(l9_3069.x,2.2),pow(l9_3069.y,2.2),pow(l9_3069.z,2.2),pow(l9_3069.w,2.2));
}
else
{
l9_3070=l9_3069*l9_3069;
}
float4 l9_3071=l9_3070;
N31_Result=l9_3071;
if (N31_EnableSheen)
{
float l9_3072=N31_SheenColor.w;
float3 l9_3073=(N31_Result.xyz*l9_3072)+N31_SheenColor.xyz;
N31_Result=float4(l9_3073.x,l9_3073.y,l9_3073.z,N31_Result.w);
}
if (N31_EnableTransmission)
{
float4 l9_3074=N31_Result;
float l9_3075=N31_Opacity;
float l9_3076;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3076=pow(l9_3075,2.2);
}
else
{
l9_3076=l9_3075*l9_3075;
}
float l9_3077=l9_3076;
N31_Result=mix(float4(N31_Background,1.0),l9_3074,float4(l9_3077));
N31_Result.w=1.0;
}
if (N31_EnableClearcoat)
{
float l9_3078=N31_ClearcoatBase;
float4 l9_3079=N31_ClearcoatColor;
float4 l9_3080;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3080=float4(pow(l9_3079.x,2.2),pow(l9_3079.y,2.2),pow(l9_3079.z,2.2),pow(l9_3079.w,2.2));
}
else
{
l9_3080=l9_3079*l9_3079;
}
float4 l9_3081=l9_3080;
float4 l9_3082=l9_3081*l9_3078;
float3 l9_3083=N31_Result.xyz+l9_3082.xyz;
N31_Result=float4(l9_3083.x,l9_3083.y,l9_3083.z,N31_Result.w);
}
float4 l9_3084=N31_Result;
float4 l9_3085;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3085=float4(pow(l9_3084.x,0.454545),pow(l9_3084.y,0.454545),pow(l9_3084.z,0.454545),pow(l9_3084.w,0.454545));
}
else
{
l9_3085=sqrt(l9_3084);
}
float4 l9_3086=l9_3085;
N31_Result=l9_3086;
}
l9_3068=N31_Result;
l9_3057=l9_3068;
param_1=l9_3057;
param_3=param_1;
}
else
{
float l9_3087=0.0;
ssGlobals l9_3088=param_4;
float l9_3089;
if ((int(ENABLE_VERTEX_COLOR_BASE_tmp)!=0))
{
l9_3089=1.001;
}
else
{
l9_3089=0.001;
}
l9_3089-=0.001;
l9_3087=l9_3089;
float l9_3090=0.0;
ssGlobals l9_3091=param_4;
float l9_3092;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
l9_3092=1.001;
}
else
{
l9_3092=0.001;
}
l9_3092-=0.001;
l9_3090=l9_3092;
float l9_3093=0.0;
l9_3093=float(NODE_7_DROPLIST_ITEM_tmp);
float4 l9_3094=float4(0.0);
ssGlobals l9_3095=param_4;
float4 l9_3096=(*sc_set2.UserUniforms).baseColorFactor;
l9_3094=l9_3096;
float l9_3097=0.0;
ssGlobals l9_3098=param_4;
float l9_3099;
if ((int(ENABLE_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_3099=1.001;
}
else
{
l9_3099=0.001;
}
l9_3099-=0.001;
l9_3097=l9_3099;
float l9_3100=0.0;
ssGlobals l9_3101=param_4;
float l9_3102;
if ((int(ENABLE_BASE_TEXTURE_TRANSFORM_tmp)!=0))
{
l9_3102=1.001;
}
else
{
l9_3102=0.001;
}
l9_3102-=0.001;
l9_3100=l9_3102;
float2 l9_3103=float2(0.0);
ssGlobals l9_3104=param_4;
float2 l9_3105=(*sc_set2.UserUniforms).baseColorTexture_offset;
l9_3103=l9_3105;
float2 l9_3106=float2(0.0);
ssGlobals l9_3107=param_4;
float2 l9_3108=(*sc_set2.UserUniforms).baseColorTexture_scale;
l9_3106=l9_3108;
float l9_3109=0.0;
ssGlobals l9_3110=param_4;
float l9_3111=(*sc_set2.UserUniforms).baseColorTexture_rotation;
l9_3109=l9_3111;
float3 l9_3112=float3(0.0);
float l9_3113=0.0;
float4 l9_3114=float4(0.0);
float l9_3115=l9_3087;
float l9_3116=l9_3090;
float l9_3117=l9_3093;
float4 l9_3118=l9_3094;
float l9_3119=l9_3097;
float l9_3120=l9_3100;
float2 l9_3121=l9_3103;
float2 l9_3122=l9_3106;
float l9_3123=l9_3109;
ssGlobals l9_3124=param_4;
tempGlobals=l9_3124;
float3 l9_3125=float3(0.0);
float l9_3126=0.0;
float4 l9_3127=float4(0.0);
N35_EnableVertexColor=(int(ENABLE_VERTEX_COLOR_BASE_tmp)!=0);
N35_EnableBaseTexture=(int(ENABLE_BASE_TEX_tmp)!=0);
N35_BaseColorTextureCoord=NODE_7_DROPLIST_ITEM_tmp;
N35_BaseColorFactor=l9_3118;
N35_EnableTextureTransform=(int(ENABLE_TEXTURE_TRANSFORM_tmp)!=0);
N35_BaseTextureTransform=(int(ENABLE_BASE_TEXTURE_TRANSFORM_tmp)!=0);
N35_BaseTextureOffset=l9_3121;
N35_BaseTextureScale=l9_3122;
N35_BaseTextureRotation=l9_3123;
float4 l9_3128=N35_BaseColorFactor;
if (N35_EnableBaseTexture)
{
int l9_3129=N35_BaseColorTextureCoord;
float2 l9_3130=tempGlobals.Surface_UVCoord0;
float2 l9_3131=l9_3130;
if (l9_3129==0)
{
float2 l9_3132=tempGlobals.Surface_UVCoord0;
l9_3131=l9_3132;
}
if (l9_3129==1)
{
float2 l9_3133=tempGlobals.Surface_UVCoord1;
l9_3131=l9_3133;
}
float2 l9_3134=l9_3131;
float2 l9_3135=l9_3134;
if (N35_EnableTextureTransform&&N35_BaseTextureTransform)
{
float2 l9_3136=l9_3135;
float2 l9_3137=N35_BaseTextureOffset;
float2 l9_3138=N35_BaseTextureScale;
float l9_3139=N35_BaseTextureRotation;
float3x3 l9_3140=float3x3(float3(1.0,0.0,0.0),float3(0.0,1.0,0.0),float3(l9_3137.x,l9_3137.y,1.0));
float3x3 l9_3141=float3x3(float3(cos(l9_3139),sin(l9_3139),0.0),float3(-sin(l9_3139),cos(l9_3139),0.0),float3(0.0,0.0,1.0));
float3x3 l9_3142=float3x3(float3(l9_3138.x,0.0,0.0),float3(0.0,l9_3138.y,0.0),float3(0.0,0.0,1.0));
float3x3 l9_3143=(l9_3140*l9_3141)*l9_3142;
float2 l9_3144=(l9_3143*float3(l9_3136,1.0)).xy;
l9_3135=l9_3144;
}
float2 l9_3145=l9_3135;
float4 l9_3146=float4(0.0);
float2 l9_3147=(*sc_set2.UserUniforms).baseColorTextureDims.xy;
float2 l9_3148=l9_3147;
int l9_3149;
if ((int(baseColorTextureHasSwappedViews_tmp)!=0))
{
int l9_3150;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3150=0;
}
else
{
l9_3150=in.varStereoViewID;
}
int l9_3151=l9_3150;
l9_3149=1-l9_3151;
}
else
{
int l9_3152;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3152=0;
}
else
{
l9_3152=in.varStereoViewID;
}
int l9_3153=l9_3152;
l9_3149=l9_3153;
}
int l9_3154=l9_3149;
float2 l9_3155=l9_3148;
int l9_3156=baseColorTextureLayout_tmp;
int l9_3157=l9_3154;
float2 l9_3158=l9_3145;
bool l9_3159=(int(SC_USE_UV_TRANSFORM_baseColorTexture_tmp)!=0);
float3x3 l9_3160=(*sc_set2.UserUniforms).baseColorTextureTransform;
int2 l9_3161=int2(SC_SOFTWARE_WRAP_MODE_U_baseColorTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_baseColorTexture_tmp);
bool l9_3162=(int(SC_USE_UV_MIN_MAX_baseColorTexture_tmp)!=0);
float4 l9_3163=(*sc_set2.UserUniforms).baseColorTextureUvMinMax;
bool l9_3164=(int(SC_USE_CLAMP_TO_BORDER_baseColorTexture_tmp)!=0);
float4 l9_3165=(*sc_set2.UserUniforms).baseColorTextureBorderColor;
float l9_3166=0.0;
bool l9_3167=l9_3164&&(!l9_3162);
float l9_3168=1.0;
float l9_3169=l9_3158.x;
int l9_3170=l9_3161.x;
if (l9_3170==1)
{
l9_3169=fract(l9_3169);
}
else
{
if (l9_3170==2)
{
float l9_3171=fract(l9_3169);
float l9_3172=l9_3169-l9_3171;
float l9_3173=step(0.25,fract(l9_3172*0.5));
l9_3169=mix(l9_3171,1.0-l9_3171,fast::clamp(l9_3173,0.0,1.0));
}
}
l9_3158.x=l9_3169;
float l9_3174=l9_3158.y;
int l9_3175=l9_3161.y;
if (l9_3175==1)
{
l9_3174=fract(l9_3174);
}
else
{
if (l9_3175==2)
{
float l9_3176=fract(l9_3174);
float l9_3177=l9_3174-l9_3176;
float l9_3178=step(0.25,fract(l9_3177*0.5));
l9_3174=mix(l9_3176,1.0-l9_3176,fast::clamp(l9_3178,0.0,1.0));
}
}
l9_3158.y=l9_3174;
if (l9_3162)
{
bool l9_3179=l9_3164;
bool l9_3180;
if (l9_3179)
{
l9_3180=l9_3161.x==3;
}
else
{
l9_3180=l9_3179;
}
float l9_3181=l9_3158.x;
float l9_3182=l9_3163.x;
float l9_3183=l9_3163.z;
bool l9_3184=l9_3180;
float l9_3185=l9_3168;
float l9_3186=fast::clamp(l9_3181,l9_3182,l9_3183);
float l9_3187=step(abs(l9_3181-l9_3186),1e-05);
l9_3185*=(l9_3187+((1.0-float(l9_3184))*(1.0-l9_3187)));
l9_3181=l9_3186;
l9_3158.x=l9_3181;
l9_3168=l9_3185;
bool l9_3188=l9_3164;
bool l9_3189;
if (l9_3188)
{
l9_3189=l9_3161.y==3;
}
else
{
l9_3189=l9_3188;
}
float l9_3190=l9_3158.y;
float l9_3191=l9_3163.y;
float l9_3192=l9_3163.w;
bool l9_3193=l9_3189;
float l9_3194=l9_3168;
float l9_3195=fast::clamp(l9_3190,l9_3191,l9_3192);
float l9_3196=step(abs(l9_3190-l9_3195),1e-05);
l9_3194*=(l9_3196+((1.0-float(l9_3193))*(1.0-l9_3196)));
l9_3190=l9_3195;
l9_3158.y=l9_3190;
l9_3168=l9_3194;
}
float2 l9_3197=l9_3158;
bool l9_3198=l9_3159;
float3x3 l9_3199=l9_3160;
if (l9_3198)
{
l9_3197=float2((l9_3199*float3(l9_3197,1.0)).xy);
}
float2 l9_3200=l9_3197;
float2 l9_3201=l9_3200;
float2 l9_3202=l9_3201;
l9_3158=l9_3202;
float l9_3203=l9_3158.x;
int l9_3204=l9_3161.x;
bool l9_3205=l9_3167;
float l9_3206=l9_3168;
if ((l9_3204==0)||(l9_3204==3))
{
float l9_3207=l9_3203;
float l9_3208=0.0;
float l9_3209=1.0;
bool l9_3210=l9_3205;
float l9_3211=l9_3206;
float l9_3212=fast::clamp(l9_3207,l9_3208,l9_3209);
float l9_3213=step(abs(l9_3207-l9_3212),1e-05);
l9_3211*=(l9_3213+((1.0-float(l9_3210))*(1.0-l9_3213)));
l9_3207=l9_3212;
l9_3203=l9_3207;
l9_3206=l9_3211;
}
l9_3158.x=l9_3203;
l9_3168=l9_3206;
float l9_3214=l9_3158.y;
int l9_3215=l9_3161.y;
bool l9_3216=l9_3167;
float l9_3217=l9_3168;
if ((l9_3215==0)||(l9_3215==3))
{
float l9_3218=l9_3214;
float l9_3219=0.0;
float l9_3220=1.0;
bool l9_3221=l9_3216;
float l9_3222=l9_3217;
float l9_3223=fast::clamp(l9_3218,l9_3219,l9_3220);
float l9_3224=step(abs(l9_3218-l9_3223),1e-05);
l9_3222*=(l9_3224+((1.0-float(l9_3221))*(1.0-l9_3224)));
l9_3218=l9_3223;
l9_3214=l9_3218;
l9_3217=l9_3222;
}
l9_3158.y=l9_3214;
l9_3168=l9_3217;
float2 l9_3225=l9_3155;
float2 l9_3226=l9_3158;
int l9_3227=l9_3156;
int l9_3228=l9_3157;
float l9_3229=l9_3166;
float2 l9_3230=l9_3226;
int l9_3231=l9_3227;
int l9_3232=l9_3228;
float3 l9_3233;
if (l9_3231==0)
{
l9_3233=float3(l9_3230,0.0);
}
else
{
if (l9_3231==1)
{
l9_3233=float3(l9_3230.x,(l9_3230.y*0.5)+(0.5-(float(l9_3232)*0.5)),0.0);
}
else
{
l9_3233=float3(l9_3230,float(l9_3232));
}
}
float3 l9_3234=l9_3233;
float3 l9_3235=l9_3234;
float2 l9_3236=l9_3225;
float2 l9_3237=l9_3235.xy;
float l9_3238=l9_3229;
float4 l9_3239=sc_set2.baseColorTexture.sample(sc_set2.baseColorTextureSmpSC,l9_3237,bias(l9_3238));
float4 l9_3240=l9_3239;
float4 l9_3241=l9_3240;
if (l9_3164)
{
l9_3241=mix(l9_3165,l9_3241,float4(l9_3168));
}
float4 l9_3242=l9_3241;
float4 l9_3243=l9_3242;
l9_3146=l9_3242;
float4 l9_3244=l9_3146;
float4 l9_3245=l9_3244;
float4 l9_3246;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3246=float4(pow(l9_3245.x,2.2),pow(l9_3245.y,2.2),pow(l9_3245.z,2.2),pow(l9_3245.w,2.2));
}
else
{
l9_3246=l9_3245*l9_3245;
}
float4 l9_3247=l9_3246;
l9_3128*=l9_3247;
}
if (N35_EnableVertexColor)
{
float4 l9_3248=tempGlobals.VertexColor;
l9_3128*=l9_3248;
}
N35_BaseColor=l9_3128.xyz;
N35_Opacity=l9_3128.w;
float4 l9_3249=l9_3128;
float4 l9_3250;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3250=float4(pow(l9_3249.x,0.454545),pow(l9_3249.y,0.454545),pow(l9_3249.z,0.454545),pow(l9_3249.w,0.454545));
}
else
{
l9_3250=sqrt(l9_3249);
}
float4 l9_3251=l9_3250;
N35_UnlitColor=l9_3251;
l9_3125=N35_BaseColor;
l9_3126=N35_Opacity;
l9_3127=N35_UnlitColor;
l9_3112=l9_3125;
l9_3113=l9_3126;
l9_3114=l9_3127;
param_2=l9_3114;
param_3=param_2;
}
Output_N17=param_3;
FinalColor=Output_N17;
float4 param_5=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_3252=param_5;
float4 l9_3253=l9_3252;
float l9_3254=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_3254=l9_3253.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_3254=fast::clamp(l9_3253.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_3254=fast::clamp(dot(l9_3253.xyz,float3(l9_3253.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_3254=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_3254=(1.0-dot(l9_3253.xyz,float3(0.33333)))*l9_3253.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_3254=(1.0-fast::clamp(dot(l9_3253.xyz,float3(1.0)),0.0,1.0))*l9_3253.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_3254=fast::clamp(dot(l9_3253.xyz,float3(1.0)),0.0,1.0)*l9_3253.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_3254=fast::clamp(dot(l9_3253.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_3254=fast::clamp(dot(l9_3253.xyz,float3(1.0)),0.0,1.0)*l9_3253.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_3254=dot(l9_3253.xyz,float3(0.33333))*l9_3253.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_3254=1.0-fast::clamp(dot(l9_3253.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_3254=fast::clamp(dot(l9_3253.xyz,float3(1.0)),0.0,1.0);
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
float l9_3255=l9_3254;
float l9_3256=l9_3255;
float l9_3257=(*sc_set2.UserUniforms).sc_ShadowDensity*l9_3256;
float3 l9_3258=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_3252.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float4 l9_3259=float4(l9_3258.x,l9_3258.y,l9_3258.z,l9_3257);
param_5=l9_3259;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_5=float4(param_5.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_3260=param_5;
float4 l9_3261;
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_3262=out.FragColor0;
float4 l9_3263=l9_3262;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_3263.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_3264=l9_3263;
l9_3261=l9_3264;
}
else
{
float4 l9_3265=gl_FragCoord;
float2 l9_3266=(l9_3265.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_3267=l9_3266;
float2 l9_3268;
if (sc_StereoRenderingMode_tmp==1)
{
float3 l9_3269=float3(l9_3267,0.0);
int l9_3270=1;
int l9_3271;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3271=0;
}
else
{
l9_3271=in.varStereoViewID;
}
int l9_3272=l9_3271;
int l9_3273=l9_3272;
float3 l9_3274=float3(l9_3267,0.0);
int l9_3275=l9_3270;
int l9_3276=l9_3273;
if (l9_3275==1)
{
l9_3274.y=((2.0*l9_3274.y)+float(l9_3276))-1.0;
}
float2 l9_3277=l9_3274.xy;
l9_3268=l9_3277;
}
else
{
l9_3268=l9_3267;
}
float2 l9_3278=l9_3268;
float2 l9_3279=l9_3278;
float2 l9_3280=l9_3279;
int l9_3281;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_3282;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3282=0;
}
else
{
l9_3282=in.varStereoViewID;
}
int l9_3283=l9_3282;
l9_3281=1-l9_3283;
}
else
{
int l9_3284;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3284=0;
}
else
{
l9_3284=in.varStereoViewID;
}
int l9_3285=l9_3284;
l9_3281=l9_3285;
}
int l9_3286=l9_3281;
float2 l9_3287=l9_3280;
int l9_3288=l9_3286;
float2 l9_3289=l9_3287;
int l9_3290=l9_3288;
float l9_3291=0.0;
float2 l9_3292=(*sc_set2.UserUniforms).sc_ScreenTextureDims.xy;
float2 l9_3293=l9_3292;
float2 l9_3294=l9_3289;
int l9_3295=sc_ScreenTextureLayout_tmp;
int l9_3296=l9_3290;
float l9_3297=l9_3291;
float2 l9_3298=l9_3294;
int l9_3299=l9_3295;
int l9_3300=l9_3296;
float3 l9_3301;
if (l9_3299==0)
{
l9_3301=float3(l9_3298,0.0);
}
else
{
if (l9_3299==1)
{
l9_3301=float3(l9_3298.x,(l9_3298.y*0.5)+(0.5-(float(l9_3300)*0.5)),0.0);
}
else
{
l9_3301=float3(l9_3298,float(l9_3300));
}
}
float3 l9_3302=l9_3301;
float3 l9_3303=l9_3302;
float2 l9_3304=l9_3293;
float2 l9_3305=l9_3303.xy;
float l9_3306=l9_3297;
float4 l9_3307=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_3305,bias(l9_3306));
float4 l9_3308=l9_3307;
float4 l9_3309=l9_3308;
float4 l9_3310=l9_3309;
float4 l9_3311=l9_3310;
float4 l9_3312=l9_3311;
l9_3261=l9_3312;
}
float4 l9_3313=l9_3261;
float4 l9_3314=l9_3313;
float3 l9_3315=l9_3314.xyz;
float3 l9_3316=l9_3315;
float3 l9_3317=l9_3260.xyz;
float3 l9_3318=definedBlend(l9_3316,l9_3317,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.intensityTexture,sc_set2.intensityTextureSmpSC);
float4 l9_3319;
l9_3319=float4(l9_3318.x,l9_3318.y,l9_3318.z,l9_3319.w);
float3 l9_3320=mix(l9_3315,l9_3319.xyz,float3(l9_3260.w));
l9_3319=float4(l9_3320.x,l9_3320.y,l9_3320.z,l9_3319.w);
l9_3319.w=1.0;
float4 l9_3321=l9_3319;
param_5=l9_3321;
}
else
{
float4 l9_3322=param_5;
float4 l9_3323;
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_3323=float4(mix(float3(1.0),l9_3322.xyz,float3(l9_3322.w)),l9_3322.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_3324=l9_3322.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_3324=fast::clamp(l9_3324,0.0,1.0);
}
l9_3323=float4(l9_3322.xyz*l9_3324,l9_3324);
}
else
{
l9_3323=l9_3322;
}
}
float4 l9_3325=l9_3323;
param_5=l9_3325;
}
}
}
float4 l9_3326=param_5;
FinalColor=l9_3326;
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
float4 l9_3327;
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_3327=float4((*sc_set2.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_3327=float4(0.0);
}
float4 l9_3328=l9_3327;
float4 Cost=l9_3328;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_6=FinalColor;
out.FragColor0=param_6;
float4 param_7=FinalColor;
return out;
}
} // FRAGMENT SHADER
