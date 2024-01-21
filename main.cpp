
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"

using namespace llvm;

Function *makeFunction(Module &M) {
  LLVMContext &Context = M.getContext();
  Type *voidTy = Type::getVoidTy(Context);
  FunctionType *FT = FunctionType::get(voidTy, false);
  Function *F = Function::Create(FT, GlobalValue::ExternalLinkage, "fact", M);
  return F;
}

int main() {
  LLVMContext Context;
  Module M("mod", Context);
  Function *F = makeFunction(M);
  BasicBlock *BB = BasicBlock::Create(Context, "", F);

  auto call = CallInst::Create(F, {}, "", BB);
  ReturnInst::Create(Context, BB);

  M.dump();
  return 0;
}
