#ifndef OMR_RELO_RECORD
#define OMR_RELO_RECORD
#ifndef OMR_RELOCATION_RECORD_CONNECTOR
#define OMR_RELOCATION_RECORD_CONNECTOR
namespace OMR{ class RelocationRecord;}
namespace OMR{ typedef OMR::RelocationRecord OMRRelocationRecordConnector;}
#endif
#ifndef OMR_RELOCATION_RECORD_BINARY_TEMPLATE_CONNECTOR
#define OMR_RELOCATION_RECORD_BINARY_TEMPLATE_CONNECTOR
namespace OMR{ class RelocationRecordBinaryTemplate;}
namespace OMR{ typedef OMR::RelocationRecordBinaryTemplate OMRRelocationRecordBinaryTemplateConnector;}
#endif

#include <time.h>
#include "runtime/RelocationTarget.hpp"

namespace TR { class RelocationRecord;}
namespace OMR{
class RelocationRecord{
    public:
        RelocationRecord(int kind);
        static TR::RelocationRecord* create(int kind);
        int getKind();
        virtual void initialize(int dataOne,int dataTwo);
    private:
        int _kind;
};
class RelocationRecordZero: public RelocationRecord{
    public:
        RelocationRecordZero(int kind);
        virtual void initialize(int dataOne,int dataTwo);
};
class RelocationRecordOne: public RelocationRecord {
    public:
        RelocationRecordOne(int kind);
        virtual void initialize(int dataOne,int dataTwo);
};

class RelocationRecordBinaryTemplate {
      public:
         RelocationRecordBinaryTemplate(){};
         void setType(TR::RelocationTarget*, uint8_t kind);
         void setSize(TR::RelocationTarget*, uint16_t size);
         void setFlags(TR::RelocationTarget*, uint8_t flags);
         void setExtra(TR::RelocationTarget*, uint32_t extra);
         uint8_t type(TR::RelocationTarget *reloTarget);
         uint16_t _size;
         uint8_t _type;
         uint8_t _flags;
         #if defined(TR_HOST_64BIT)
         uint32_t _extra; //holds prePrologue offset
         #endif
};

}
#endif
