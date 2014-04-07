#include "mex.h" 
#include "base.hpp"

extern "C"
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){
  if(nlhs!=0){
    mexErrMsgTxt("Expected nlhs = 0.");
  }

  if(nrhs!=1){
    mexErrMsgTxt("Expected nrhs = 1.");
  }
  
  mxArray* in = prhs[0];
  if (mxGetNumberOfElements(in) != 1 || mxGetClassID(in) != mxUINT64_CLASS || mxIsComplex(in))
    mexErrMsgTxt("Input must be a real uint64 scalar.");
  Base* b = reinterpret_cast<Derived *>(*((uint64_t *)mxGetData(in)));
  
  int a = b->foo();
  mexPrintf("a = %d \n",a);
}
