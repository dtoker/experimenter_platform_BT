/*
 * MATLAB Compiler: 4.1 (R14SP1)
 * Date: Thu May 19 14:44:53 2011
 * Arguments: "-B" "macro_default" "-m" "-W" "main" "-T" "link:exe" "WMTask.m" 
 */

#include <stdio.h>
#include "mclmcr.h"
#ifdef __cplusplus
extern "C" {
#endif
extern const unsigned char __MCC_WMTask_public_data[];
extern const char *__MCC_WMTask_name_data;
extern const char *__MCC_WMTask_root_data;
extern const unsigned char __MCC_WMTask_session_data[];
extern const char *__MCC_WMTask_matlabpath_data[];
extern const int __MCC_WMTask_matlabpath_data_count;
extern const char *__MCC_WMTask_classpath_data[];
extern const int __MCC_WMTask_classpath_data_count;
extern const char *__MCC_WMTask_mcr_runtime_options[];
extern const int __MCC_WMTask_mcr_runtime_option_count;
extern const char *__MCC_WMTask_mcr_application_options[];
extern const int __MCC_WMTask_mcr_application_option_count;
#ifdef __cplusplus
}
#endif

static HMCRINSTANCE _mcr_inst = NULL;


static int mclDefaultPrintHandler(const char *s)
{
    return fwrite(s, sizeof(char), strlen(s), stdout);
}

static int mclDefaultErrorHandler(const char *s)
{
    int written = 0, len = 0;
    len = strlen(s);
    written = fwrite(s, sizeof(char), len, stderr);
    if (len > 0 && s[ len-1 ] != '\n')
        written += fwrite("\n", sizeof(char), 1, stderr);
    return written;
}

bool WMTaskInitializeWithHandlers(
    mclOutputHandlerFcn error_handler,
    mclOutputHandlerFcn print_handler
)
{
    if (_mcr_inst != NULL)
        return true;
    if (!mclmcrInitialize())
        return false;
    if (!mclInitializeComponentInstance(&_mcr_inst, __MCC_WMTask_public_data,
                                        __MCC_WMTask_name_data,
                                        __MCC_WMTask_root_data,
                                        __MCC_WMTask_session_data,
                                        __MCC_WMTask_matlabpath_data,
                                        __MCC_WMTask_matlabpath_data_count,
                                        __MCC_WMTask_classpath_data,
                                        __MCC_WMTask_classpath_data_count,
                                        __MCC_WMTask_mcr_runtime_options,
                                        __MCC_WMTask_mcr_runtime_option_count,
                                        true, NoObjectType, ExeTarget, NULL,
                                        error_handler, print_handler))
        return false;
    return true;
}

bool WMTaskInitialize(void)
{
    return WMTaskInitializeWithHandlers(mclDefaultErrorHandler,
                                        mclDefaultPrintHandler);
}

void WMTaskTerminate(void)
{
    if (_mcr_inst != NULL)
        mclTerminateInstance(&_mcr_inst);
}

int main(int argc, const char **argv)
{
    int _retval;
    if (!mclInitializeApplication(__MCC_WMTask_mcr_application_options,
                                  __MCC_WMTask_mcr_application_option_count))
        return 0;
    
    if (!WMTaskInitialize())
        return -1;
    _retval = mclMain(_mcr_inst, argc, argv, "wmtask", 0);
    if (_retval == 0 /* no error */) mclWaitForFiguresToDie(NULL);
    WMTaskTerminate();
    mclTerminateApplication();
    return _retval;
}
