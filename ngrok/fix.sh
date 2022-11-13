#!/bin/bash
# By HuangYingNing

echo CFLAGS=${CFLAGS} LDFLAGS=${LDFLAGS}
CFLAGS_STR=${CFLAGS//\//\\\/}
LDFLAGS_STR=${LDFLAGS//\//\\\/}
# echo CFLAGS_STR=${CFLAGS}

#sed -i "s/CFLAGS+=/CFLAGS+= ${CFLAGS_STR} /g" Makefile
#sed -i "s/CXXFLAGS=/CXXFLAGS= ${CFLAGS_STR} /g" Makefile
#sed -i "s/[$][\(]CXX[\)]/$\(CXX\) ${LDFLAGS_STR} /g" Makefile
sed -i "s/ -Wl,-static / /g" Makefile
# sed -i "s/ -static-libgcc / -lgcc_s /g" Makefile
# sed -i "s/ -static-libstdc++ / -lstdc++ /g" Makefile
sed -i "s/ -static / /g" Makefile

sed -i "s/CFLAGS+=/CFLAGS+= ${CFLAGS_STR} /g" Makefile
sed -i "s/CXXFLAGS=/CXXFLAGS= ${CFLAGS_STR} /g" Makefile
sed -i "s/[$][\(]CXX[\)]/$\(CXX\) ${LDFLAGS_STR} /g" Makefile
