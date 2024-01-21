
LLVM_PATH = /usr/local
Args = -I $(LLVM_PATH)/include -std=c++14 -g -Og -fno-exceptions -fno-rtti -D_GNU_SOURCE -D_DEBUG -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
LLVMLibs = -L $(LLVM_PATH)/lib -lLLVMX86Disassembler -lLLVMX86AsmParser -lLLVMX86CodeGen -lLLVMX86Desc -lLLVMX86Info -lLLVMSupport -lLLVMAnalysis -lLLVMCodeGen -lLLVMCore -lLLVMipo -lLLVMAggressiveInstCombine -lLLVMInstCombine -lLLVMInstrumentation -lLLVMMC -lLLVMMCParser -lLLVMObjCARCOpts -lLLVMOption -lLLVMScalarOpts -lLLVMSupport -lLLVMTransformUtils -lLLVMVectorize -lLLVMAsmPrinter -lLLVMGlobalISel -lLLVMSelectionDAG -lLLVMCFGuard -lLLVMMCDisassembler -lLLVMCoverage -lLLVMLTO -lLLVMCodeGen -lLLVMExtensions -lLLVMPasses -lLLVMObjCARCOpts -lLLVMTarget -lLLVMCoroutines -lLLVMipo -lLLVMInstrumentation -lLLVMVectorize -lLLVMBitWriter -lLLVMIRReader -lLLVMAsmParser -lLLVMLinker -lLLVMWindowsDriver -lLLVMOption -lLLVMFrontendOpenMP -lLLVMScalarOpts -lLLVMAggressiveInstCombine -lLLVMInstCombine -lLLVMTransformUtils -lLLVMAnalysis -lLLVMProfileData -lLLVMSymbolize -lLLVMDebugInfoDWARF -lLLVMDebugInfoPDB -lLLVMDebugInfoMSF -lLLVMObject -lLLVMMCParser -lLLVMMC -lLLVMDebugInfoCodeView -lLLVMBitReader -lLLVMTextAPI -lLLVMCore -lLLVMBinaryFormat -lLLVMRemarks -lLLVMBitstreamReader -lLLVMSupport -lLLVMDemangle -lLLVMMIRParser -lrt -ldl -lpthread -lm -lz -ltinfo

main: main.o
	g++ main.o -o main $(LLVMLibs)

main.o: main.cpp Makefile
	ccache g++ main.cpp $(Args) -c

clean:
	rm main main.o
