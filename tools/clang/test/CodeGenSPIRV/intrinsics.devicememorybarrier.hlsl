// Run: %dxc -T cs_6_0 -E main

void main() {
// CHECK: OpMemoryBarrier %uint_1 %uint_512
  DeviceMemoryBarrier();
}
