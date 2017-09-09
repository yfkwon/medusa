#ifndef __CONFIG_CONFIG_H__
#define __CONFIG_CONFIG_H__

//////////////////////////////////////////////////////////////////////////////////////////
// platform
// 
// NI_PLATFORM_LINUX
// NI_PLATFORM_WIN32
// NI_PLATFORM_OSX
// NI_PLATFORM_ANDROID
// NI_PLATFORM_IOS
//
//////////////////////////////////////////////////////////////////////////////////////////

#define NI_PLATFORM_LINUX


//////////////////////////////////////////////////////////////////////////////////////////
// solution features
// warning: memory pool, usage checker and leak checker decrease the total performance.
//////////////////////////////////////////////////////////////////////////////////////////

// memory
#define NI_SHM_PAUSE        0
#define NI_SHM_ABORT        1
#define NI_SHM_PASS         2

#define NI_SAFE_HEAP_METHOD NI_SHM_PAUSE

// debug only features
//#define USE_MEMORY_USAGE_CHECKER
//#define USE_MEMORY_LEAK_CHECKER
//#define USE_LOG_BACKTRACE


// log
#define USE_RELEASE_LOG

#ifndef interface
#define interface struct
#endif

#endif // #ifndef __CONFIG_CONFIG_H__


