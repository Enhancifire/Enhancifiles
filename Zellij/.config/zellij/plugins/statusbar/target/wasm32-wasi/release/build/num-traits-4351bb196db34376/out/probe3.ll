; ModuleID = 'probe3.bd4083b1-cgu.0'
source_filename = "probe3.bd4083b1-cgu.0"
target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32-unknown-wasi"

; probe3::probe
; Function Attrs: nounwind
define hidden void @_ZN6probe35probe17hd10adb8a1dc2842dE() unnamed_addr #0 {
start:
  %0 = alloca i32, align 4
  store i32 -2147483648, ptr %0, align 4
  %1 = load i32, ptr %0, align 4, !noundef !0
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare hidden i32 @llvm.bitreverse.i32(i32) #1

attributes #0 = { nounwind "target-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!0 = !{}
