// RUN: %dxc -E main -T ps_6_0 -Zi %s | FileCheck %s

// Test that the debug information for the result of a texture sample
// is preserved after scalarization and optims.

// CHECK: call %dx.types.ResRet.f32 @dx.op.sample.f32
// CHECK: call void @llvm.dbg.value
// CHECK: extractvalue %dx.types.ResRet.f32
// CHECK: extractvalue %dx.types.ResRet.f32
// CHECK: extractvalue %dx.types.ResRet.f32
// CHECK: extractvalue %dx.types.ResRet.f32
// CHECK: call void @dx.op.storeOutput.f32
// CHECK: call void @dx.op.storeOutput.f32
// CHECK: call void @dx.op.storeOutput.f32
// CHECK: call void @dx.op.storeOutput.f32

// Exclude quoted source file (see readme)
// CHECK: {{!"[^"]*\\0A[^"]*"}}

sampler samp;
Texture2D<float4> tex;
float4 main() : SV_Target
{
    float4 texel = tex.Sample(samp, 0);
    return texel;
}