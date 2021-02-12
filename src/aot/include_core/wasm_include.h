#pragma once
#include "j9pool.h"
#include "omrsrp.h"

#include <string.h> // for memcmp


// this is the J9UTF8 struct as defined in genBinaryBlob.hpp (which exists in the guts of OMR,
// but seems to be intended only for use in its DDR interface). 
struct OMRUTF8 {
  uint16_t length;
  uint8_t data[2];
};

typedef struct OMRSharedDataDescriptor {
	U_8* address;
	UDATA length;
	UDATA type;
	UDATA flags;
} OMRSharedDataDescriptor;
  
#define OMRUTF8_LENGTH(j9UTF8Address) (((struct OMRUTF8 *)(j9UTF8Address))->length)
#define OMRUTF8_SET_LENGTH(j9UTF8Address, len) (((struct OMRUTF8 *)(j9UTF8Address))->length = (len))
#define OMRUTF8_DATA(j9UTF8Address) (((struct OMRUTF8 *)(j9UTF8Address))->data)

#define OMRNAMEANDSIG_NAME(base) NNSRP_GET(base->name, struct OMRUTF8*)
#define OMRNAMEANDSIG_SIGNATURE(base) NNSRP_GET(base->signature, struct OMRUTF8*)
  
#define OMRUTF8_DATA_EQUALS(data1, length1, data2, length2) ((((length1) == (length2)) && (memcmp((data1), (data2), (length1)) == 0)))
#define OMRUTF8_EQUALS(utf1, utf2) (((utf1) == (utf2)) || (OMRUTF8_DATA_EQUALS(OMRUTF8_DATA(utf1), OMRUTF8_LENGTH(utf1), OMRUTF8_DATA(utf2), OMRUTF8_LENGTH(utf2))))
#define OMRUTF8_LITERAL_EQUALS(data1, length1, cString) (OMRUTF8_DATA_EQUALS((data1), (length1), (cString), sizeof(cString) - 1))
  
typedef struct OMRSharedCacheDescriptor {
	struct OMRSharedCacheHeader* cacheStartAddress;
	void* romclassStartAddress;
	void* metadataStartAddress;
	UDATA cacheSizeBytes;
	void* deployedROMClassStartAddress;
	struct OMRSharedCacheDescriptor* next;
} OMRSharedCacheDescriptor;

/* @ddr_namespace: map_to_type=OMRSharedInternSRPHashTableEntry */

typedef struct OMRSharedInternSRPHashTableEntry {
	J9SRP utf8SRP;
	U_16 flags;
	U_16 internWeight;
	J9SRP prevNode;
	J9SRP nextNode;
} OMRSharedInternSRPHashTableEntry;

typedef struct MethodNameAndSignature {
	J9SRP name;
	J9SRP signature;
} MethodNameAndSignature;

typedef struct OMRSharedInvariantInternTable {
	UDATA  ( *performNodeAction)(struct OMRSharedInvariantInternTable *sharedInvariantInternTable, struct OMRSharedInternSRPHashTableEntry *node, UDATA action, void* userData) ;
	UDATA flags;
	omrthread_monitor_t tableInternFxMutex;
	struct J9SRPHashTable* sharedInvariantSRPHashtable;
	struct OMRSharedInternSRPHashTableEntry* headNode;
	struct OMRSharedInternSRPHashTableEntry* tailNode;
	J9SRP* sharedTailNodePtr;
	J9SRP* sharedHeadNodePtr;
	U_32* totalSharedNodesPtr;
	U_32* totalSharedWeightPtr;
//	struct J9ClassLoader* systemClassLoader;
} J9SharedInvariantInternTable;

#define STRINGINTERNTABLES_NODE_FLAG_UTF8_IS_SHARED  4
#define STRINGINTERNTABLES_ACTION_VERIFY_BOTH_TABLES  10
#define STRINGINTERNTABLES_ACTION_VERIFY_LOCAL_TABLE_ONLY  13

#define J9SHAREDINTERNSRPHASHTABLEENTRY_UTF8SRP(base) SRP_GET((base)->utf8SRP, struct J9UTF8*)
#define J9SHAREDINTERNSRPHASHTABLEENTRY_PREVNODE(base) SRP_GET((base)->prevNode, struct OMRSharedInternSRPHashTableEntry*)
#define J9SHAREDINTERNSRPHASHTABLEENTRY_NEXTNODE(base) SRP_GET((base)->nextNode, struct OMRSharedInternSRPHashTableEntry*)

#define J9SHAREDCACHEHEADER_UPDATECOUNTPTR(base) WSRP_GET((base)->updateCountPtr, UDATA*)
#define J9SHAREDCACHEHEADER_LOCKEDPTR(base) WSRP_GET((base)->lockedPtr, U_32*)
#define J9SHAREDCACHEHEADER_CORRUPTFLAGPTR(base) WSRP_GET((base)->corruptFlagPtr, U_8*)
#define J9SHAREDCACHEHEADER_SHAREDSTRINGHEAD(base) SRP_GET((base)->sharedStringHead, struct OMRSharedInternSRPHashTableEntry*)
#define J9SHAREDCACHEHEADER_SHAREDSTRINGTAIL(base) SRP_GET((base)->sharedStringTail, struct OMRSharedInternSRPHashTableEntry*)
#define J9SHAREDCACHEHEADER_UNUSED01(base) SRP_GET((base)->unused01, void*)

#define J9_SHARED_CLASS_CACHE_DEFAULT_SIZE_64BIT_PLATFORM (300 * 1024 * 1024)
#define J9_SHARED_CLASS_CACHE_DEFAULT_SIZE (16 * 1024 * 1024)  

typedef struct J9ShrCompositeCacheCommonInfo {
	omrthread_tls_key_t writeMutexEntryCount;
	struct OMR_VMThread* hasWriteMutexThread;
	struct OMR_VMThread* hasReadWriteMutexThread;
	struct OMR_VMThread* hasRefreshMutexThread;
	struct OMR_VMThread* hasRWMutexThreadMprotectAll;
	U_16 vmID;
	U_32 writeMutexID;
	U_32 readWriteAreaMutexID;
	UDATA cacheIsCorrupt;
	UDATA stringTableStarted;
	UDATA oldWriterCount;
} J9ShrCompositeCacheCommonInfo;

typedef struct OMRSharedCacheConfig {
 	void* sharedClassCache;
        OMRSharedCacheDescriptor* cacheDescriptorList;
   // all of this being part of the SharedCache.. yeah, I dunno. obviously, they are
   // java specific. we do not need them here.
 //	omrthread_monitor_t jclCacheMutex;
 //	struct J9Pool* jclClasspathCache;
 //	struct J9Pool* jclURLCache;
 //	struct J9Pool* jclTokenCache;
 //	struct J9HashTable* jclURLHashTable;
 //	struct J9HashTable* jclUTF8HashTable;
 //	struct J9Pool* jclJ9ClassPathEntryPool;
 //	struct J9SharedStringFarm* jclStringFarm;
 //	struct J9ClassPathEntry* lastBootstrapCPE;

   // this, I think, is more java-related stuff that ought not to be preserved here.
 //	void* bootstrapCPI;
 	U_64 runtimeFlags;
 	UDATA verboseFlags;
 //	UDATA findClassCntr;
   // we want monitor-based concurrency support, which omr already has. clearly.
 	omrthread_monitor_t configMonitor;
   // I guess because of the comment, we'll keep it?
 	UDATA configLockWord; /* The VM no longer uses this field, but the z/OS JIT doesn't build without it */
 	const struct J9UTF8* modContext;
        void* sharedAPIObject;
 	const char* ctrlDirName;
 	UDATA  ( *getCacheSizeBytes)(struct OMR_VM* vm) ;
 	UDATA  ( *getTotalUsableCacheBytes)(struct OMR_VM* vm);
 	void  ( *getMinMaxBytes)(struct OMR_VM* vm, U_32 *softmx, I_32 *minAOT, I_32 *maxAOT, I_32 *minJIT, I_32 *maxJIT);
 	I_32  ( *setMinMaxBytes)(struct OMR_VM* vm, U_32 softmx, I_32 minAOT, I_32 maxAOT, I_32 minJIT, I_32 maxJIT);
 	void (* increaseUnstoredBytes)(struct OMR_VM *vm, U_32 aotBytes, U_32 jitBytes);
 	void (* getUnstoredBytes)(struct OMR_VM *vm, U_32 *softmxUnstoredBytes, U_32 *maxAOTUnstoredBytes, U_32 *maxJITUnstoredBytes);
 	UDATA  ( *getFreeSpaceBytes)(struct OMR_VM* vm) ;
 	IDATA  ( *findSharedData)(struct OMR_VMThread* currentThread, const char* key, UDATA keylen, UDATA limitDataType, UDATA includePrivateData, OMRSharedDataDescriptor* firstItem, const J9Pool* descriptorPool) ;
 	const U_8*  ( *storeSharedData)(struct OMR_VMThread* vmThread, const char* key, UDATA keylen, const OMRSharedDataDescriptor* data) ;
 	UDATA  ( *storeAttachedData)(struct OMR_VMThread* vmThread, const void* addressInCache, const OMRSharedDataDescriptor* data, UDATA forceReplace) ;
 	const U_8*  ( *findAttachedData)(struct OMR_VMThread* vmThread, const void* addressInCache, OMRSharedDataDescriptor* data, IDATA *dataIsCorrupt) ;
 	UDATA  ( *updateAttachedData)(struct OMR_VMThread* vmThread, const void* addressInCache, I_32 updateAtOffset, const OMRSharedDataDescriptor* data) ;
 	UDATA  ( *updateAttachedUDATA)(struct OMR_VMThread* vmThread, const void* addressInCache, UDATA type, I_32 updateAtOffset, UDATA value) ;
 	void  ( *freeAttachedDataDescriptor)(struct OMR_VMThread* vmThread, OMRSharedDataDescriptor* data) ;
  const U_8*  ( *findCompiledMethodEx1)(struct OMR_VMThread* vmThread, const MethodNameAndSignature* methodNameAndSignature, UDATA* flags);
 	const U_8*  ( *storeCompiledMethod)(struct OMR_VMThread* vmThread, const MethodNameAndSignature* methodNameAndSignature, const U_8* dataStart, UDATA dataSize, const U_8* codeStart, UDATA codeSize, UDATA forceReplace) ;
 	UDATA  ( *existsCachedCodeForROMMethod)(struct OMR_VMThread* vmThread, const MethodNameAndSignature* methodNameAndSignature) ;
 	UDATA  ( *acquirePrivateSharedData)(struct OMR_VMThread* vmThread, const struct OMRSharedDataDescriptor* data) ;
 	UDATA  ( *releasePrivateSharedData)(struct OMR_VMThread* vmThread, const struct OMRSharedDataDescriptor* data) ;
  // 	UDATA  ( *getJavacoreData)(struct OMR_VM *vm, struct J9SharedClassJavacoreDataDescriptor* descriptor) ;
 	UDATA  ( *isBCIEnabled)(struct OMR_VM *vm) ;
  //	void  ( *freeClasspathData)(struct OMR_VM *vm, void *cpData) ;
  //	void  ( *jvmPhaseChange)(struct OMR_VMThread *currentThread, UDATA phase);
 	struct J9MemorySegment* metadataMemorySegment;
 	J9Pool* classnameFilterPool;
 	U_32 softMaxBytes;
 	I_32 minAOT;
 	I_32 maxAOT;
 	I_32 minJIT;
 	I_32 maxJIT;
} OMRSharedCacheConfig;

typedef struct OMRSharedCachePreinitConfig {
	UDATA sharedClassCacheSize;
	IDATA sharedClassInternTableNodeCount;
	IDATA sharedClassMinAOTSize;
	IDATA sharedClassMaxAOTSize;
	IDATA sharedClassMinJITSize;
	IDATA sharedClassMaxJITSize;
	IDATA sharedClassReadWriteBytes;
	IDATA sharedClassDebugAreaBytes;
	IDATA sharedClassSoftMaxBytes;
} OMRSharedCachePreinitConfig;
  
typedef struct OMRSharedCacheAPI
{
    char* ctrlDirName;
    char* cacheName;
    char* modContext;
    char* expireTime;
    U_64 runtimeFlags;
    UDATA verboseFlags;
    UDATA cacheType;
    UDATA parseResult;
    UDATA storageKeyTesting;
    UDATA xShareClassesPresent;
    UDATA cacheDirPerm;

//    IDATA  ( *iterateSharedCaches)(struct OMR_VM *vm, const char *cacheDir, UDATA groupPerm, BOOLEAN useCommandLineValues, IDATA (*callback)(struct OMR_VM *vm, OMRSharedCacheInfo *event_data, void *user_data), void *user_data) ;
//    IDATA  ( *destroySharedCache)(struct OMR_VM *vm, const char *cacheDir, const char *name, U_32 cacheType, BOOLEAN useCommandLineValues) ;
    UDATA printStatsOptions;
    char* methodSpecs;
    U_32 softMaxBytes;
    I_32 minAOT;
    I_32 maxAOT;
    I_32 minJIT;
    I_32 maxJIT;
    U_8 sharedCacheEnabled;
} OMRSharedCacheAPI;

#define OMRSHRDATA_IS_PRIVATE  1
#define OMRSHRDATA_ALLOCATE_ZEROD_MEMORY  2
#define OMRSHRDATA_PRIVATE_TO_DIFFERENT_JVM  4
#define OMRSHRDATA_USE_READWRITE  8
#define OMRSHRDATA_NOT_INDEXED  16
#define OMRSHRDATA_SINGLE_STORE_FOR_KEY_TYPE  32

typedef struct OMRSharedCacheInfo {
	const char* name;
	UDATA isCompatible;
	UDATA cacheType;
	UDATA os_shmid;
	UDATA os_semid;
	UDATA modLevel;
	UDATA addrMode;
	UDATA isCorrupt;
	UDATA cacheSize;
	UDATA freeBytes;
	I_64 lastDetach;
	UDATA softMaxBytes;
} OMRSharedCacheInfo;

typedef struct OMRSharedCacheHeader {
	U_32 totalBytes;
	U_32 readWriteBytes;
	UDATA updateSRP;
	UDATA readWriteSRP;
	UDATA segmentSRP;
	UDATA updateCount;
	J9WSRP updateCountPtr;
	volatile UDATA readerCount;
	UDATA unused2;
	UDATA writeHash;
	UDATA unused3;
	UDATA unused4;
	UDATA crashCntr;
	UDATA aotBytes;
	UDATA jitBytes;
	U_16 vmCntr;
	U_8 corruptFlag;
	U_8 roundedPagesFlag;
	I_32 minAOT;
	I_32 maxAOT;
	U_32 locked;
	J9WSRP lockedPtr;
	J9WSRP corruptFlagPtr;
	J9SRP sharedStringHead;
	J9SRP sharedStringTail;
	J9SRP unused1;
	U_32 totalSharedStringNodes;
	U_32 totalSharedStringWeight;
	U_32 readWriteFlags;
	UDATA readWriteCrashCntr;
	UDATA readWriteRebuildCntr;
	UDATA osPageSize;
	UDATA ccInitComplete;
	UDATA crcValid;
	UDATA crcValue;
	UDATA containsCachelets;
	UDATA cacheFullFlags;
	UDATA readWriteVerifyCntr;
	UDATA extraFlags;
	UDATA debugRegionSize;
	UDATA lineNumberTableNextSRP;
	UDATA localVariableTableNextSRP;
	I_32 minJIT;
	I_32 maxJIT;
	IDATA sharedInternTableBytes;
	IDATA corruptionCode;
	UDATA corruptValue;
	UDATA lastMetadataType;
	UDATA writerCount;
	UDATA unused5;
	UDATA unused6;
	U_32 softMaxBytes;
	UDATA unused8;
	UDATA unused9;
	UDATA unused10;
} OMRSharedCacheHeader;

//typedef struct J9SharedClassTransaction {
//	struct OMR_VMThread* ownerThread;
//  //	struct J9ClassLoader* classloader;
//	I_16 entryIndex;
//	UDATA loadType;
//	U_16 classnameLength;
//	U_8* classnameData;
//	UDATA transactionState;
//	IDATA isOK;
//	struct OMRUTF8* partitionInCache;
//	struct OMRUTF8* modContextInCache;
//	IDATA helperID;
//	void* allocatedMem;
//	U_32 allocatedLineNumberTableSize;
//	U_32 allocatedLocalVariableTableSize;
//	void* allocatedLineNumberTable;
//	void* allocatedLocalVariableTable;
//	void* ClasspathWrapper;
//	void* cacheAreaForAllocate;
//	void* newItemInCache;
//  //	j9object_t updatedItemSize;
//	void* findNextRomClass;
//	void* findNextIterator;
//	void* firstFound;
//	UDATA oldVMState;
//	UDATA isModifiedClassfile;
//	UDATA takeReadWriteLock;
//} J9SharedClassTransaction;
//
typedef struct J9SharedStringTransaction {
	struct OMR_VMThread* ownerThread;
	UDATA transactionState;
	IDATA isOK;
} J9SharedStringTransaction;

/* @ddr_namespace: map_to_type=J9GenericByID */

typedef struct J9GenericByID {
	U_8 magic;
	U_8 type;
	U_16 id;
	struct J9ClassPathEntry* jclData;
	void* cpData;
} J9GenericByID;

struct OMRSharedCacheConfig* sharedClassConfig;
struct OMRSharedCacheAPI* sharedCacheAPI;
struct OMRSharedInvariantInternTable* sharedInvariantInternTable;
struct OMRSharedCachePreinitConfig* sharedCachePreinitConfig;
