# By HuangYingNing

SRC_NAME=ngrok-c
THISDIR = $(shell pwd)

ifndef ROOTDIR
ROOTDIR=../..
endif

CC?=gcc
CXX?=g++

# static link gcc and stdc++
CFLAGS	+= -I$(STAGEDIR)/include 
# shared link gcc and stdc++
#CFLAGS	+= -I$(STAGEDIR)/include -fPIC -O2
# CFLAGS	+= -I$(STAGEDIR)/include  -fPIC -O1
# CFLAGS	+= -fexceptions -DOPENSSL=1 -O2

# static link gcc and stdc++
LDFLAGS	+= -L$(ROOTDIR)/../toolchain-mipsel/toolchain-3.4.x/mipsel-linux-uclibc/lib -L$(STAGEDIR)/lib -L$(ROOTDIR)/libs/libstd 
# shared link gcc and stdc++
#LDFLAGS	+= -L$(STAGEDIR)/lib -L$(ROOTDIR)/libs/libstd  -fPIC -Wl,-shared -lgcc -lgcc_s -lstdc++ 
#LDFLAGS	+= -L$(STAGEDIR)/lib -L$(ROOTDIR)/libs/libstd  -fPIC -shared  -lgcc_s -lstdc++ 
# LDFLAGS	+= -L$(STAGEDIR)/lib -L$(ROOTDIR)/libs/libstd -shared-libgcc_s -shared-libstdc++ 

# CXXFLAGS+= -L$(ROOTDIR)/../toolchain-mipsel/toolchain-3.4.x/mipsel-linux-uclibc/lib -L$(STAGEDIR)/lib -L$(ROOTDIR)/libs/libstd 
# CXXFLAGS+= -fexceptions -DOPENSSL=1 -O2

LIBS=sendmsg.o openssldl.o cJSON.o nonblocking.o sslbio.o ngrok.o main.o

#CFLAGS_STR := $(CFLAGS:\\/=-)
#CFLAGS_STR := $(patsubst %/%,%\/%,$(CFLAGS))

vpath %.cpp $(THISDIR)/$(SRC_NAME)

#all:: ngrokc $(LIBS)
#ngrokc: $(LIBS)
#	$(CXX) $(LDFLAGS) -s $(LIBS) -o ngrokc -lssl -lcrypto -ldl
#sendmsg.o: sendmsg.cpp
#openssldl.o: openssldl.cpp
#cJSON.o: cJSON.h
#nonblocking.o: nonblocking.cpp
#sslbio.o: sslbio.cpp
#ngrok.o: ngrok.cpp
#main.o: sendmsg.cpp openssldl.cpp sslbio.cpp ngrok.cpp cJSON.cpp bytestool.cpp nonblocking.cpp

all: config_test
	$(MAKE) -C $(SRC_NAME)

config_test:
	( if [ -f ./config_done ]; then \
		echo "the same configuration"; \
	else \
		git submodule init ; \
		git submodule update ; \
		make configure && touch config_done; \
	fi )

configure:
	( cd $(SRC_NAME) ; \
	cp -f Makefile.openssl Makefile ; \
	export CFLAGS="$(CFLAGS)" ; \
	export LDFLAGS="$(LDFLAGS)" ; \
	bash ../fix.sh ; \
	)

clean:
	if [ -f $(SRC_NAME)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME) clean ; \
		rm -f $(SRC_NAME)/Makefile ; \
	fi ; \
	rm -f config_done
	rm -f $(LIBS) ngrokc

romfs:
	$(ROMFSINST) /usr/bin/ngrok.sh
	$(ROMFSINST) -p +x /usr/bin/ngrok.sh
	$(ROMFSINST) $(THISDIR)/$(SRC_NAME)/ngrokc /usr/bin/ngrokc
#	tar -xzf ./ngrokc.tar.gz -C $(INSTALLDIR)/usr/bin
#	chmod 777 $(INSTALLDIR)/usr/bin/ngrokc
	mkdir -p $(INSTALLDIR)/usr/share/bkye
	cp -f $(THISDIR)/ngrok.asp $(THISDIR)/../www/n56u_ribbon_fixed/ngrok.asp
#	tar -xzf ./bkye.tar.gz -C $(INSTALLDIR)/usr/share/bkye
#	tar -xvzf ./bkye.tar.gz -C $(INSTALLDIR)/lib/
#	$(ROMFSINST) /lib/libgcc_s.so.1
#	$(ROMFSINST) /lib/libstdc++.so.6
