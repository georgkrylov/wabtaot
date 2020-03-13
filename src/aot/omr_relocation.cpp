#include "omr_relocation.h"
#include <iostream>
OMR::RelocationRecord::RelocationRecord(int kind){
    std::cout<<"Hello from OMRRelocationRecord, with kind "<<kind<<std::endl;
    _kind = kind;
}
OMR::RelocationRecordZero::RelocationRecordZero(int kind):RelocationRecord(kind){
    std::cout<<"Hello from OMRRelocationRecordZero, with kind "<<kind<<std::endl;
}
OMR::RelocationRecordOne::RelocationRecordOne(int kind):RelocationRecord(kind){
    std::cout<<"Hello from OMRRelocationRecordOne, with kind "<<kind<<std::endl;
}
TR::RelocationRecord* OMR::RelocationRecord::create(int kind){
    TR::RelocationRecord* record;
    switch (kind)
    {
        case 0 : record = reinterpret_cast<TR::RelocationRecord*>(new OMR::RelocationRecordZero(0));
        break;
        case 1 : record = reinterpret_cast<TR::RelocationRecord*>( new OMR::RelocationRecordOne(1));
        break;
        default:
            std::cout<<"CANNOT CREATE OMR RELOCATION RECORD WITH KIND"<< kind<<std::endl;
            exit(0);
    }
    return reinterpret_cast<TR::RelocationRecord*>(record);
}
int OMR::RelocationRecord::getKind(){
    return _kind;

}

void OMR::RelocationRecord::initialize(int dataOne, int dataTwo){
    std::cerr<<"An initialize method for your relocation fell back to the dispatch class in OMR namespace, this should never happen, please implement an initialization method for your relocation!"<<std::endl;
    
}
void OMR::RelocationRecordZero::initialize(int dataOne, int dataTwo){
    std::cout<<"ReloRecord of type Zero is initialized with dataOne="<<dataOne<<" and dataTwo="<<dataTwo<<std::endl;
}
void OMR::RelocationRecordOne::initialize(int dataOne, int dataTwo){
    std::cout<<"ReloRecord of type One is initialized with dataOne="<<dataOne<<" and dataTwo="<<dataTwo<<std::endl;
}
