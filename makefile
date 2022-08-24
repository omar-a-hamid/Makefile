PWD=$(shell pwd)
CURDIR=$(notdir ${PWD})
BUILD=$(CURDIR)
#################################
#DEFINE:


#BUILD := build
#project name

SRC := src
#sources sub directory
INCLUDES = inc
#include sub directories
OBJ := obj
#objects sub directory
BINDER := bin
#bin sub directory


SHELL := /bin/bash
CC = gcc
CFLAGS  = -g -Wall -I $(SRC)/$(INCLUDES)

############################################

SOURCES=$(wildcard ${SRC}/*.c)
OBJECTS=$(patsubst ${SRC}%.c, ${OBJ}%.o, $(SOURCES))

FILES=$(patsubst ${SRC}/%.c, %, $(SOURCES))
OFILES=$(patsubst %, %.o, $(FILES))





all: ${BUILD}

	
${BUILD}: $(BINDER)/${BUILD}
	

$(BINDER)/${BUILD}: ${OBJECTS}
	@mkdir -p  $(BINDER)
	gcc $(CFLAGS) -o $@  ${OBJECTS}

${OBJECTS}: ${OBJ}%.o : ${SRC}%.c
	@mkdir -p $(OBJ)
	$(CC) $(CFLAGS) -o $@  -c $<

${FILES}: % : ${OBJ}/%.o
	@

${OFILES}: % : ${OBJ}/%
	@

%.o: dump
	@

%.c: ${SRC}/%.c
	@
	
.PRECIOUS: ${SRC}/%.c
${SRC}/%.c: 
	@./.creates_c_source_and_header_files_with_guards.sh $(patsubst ${SRC}/%.c,%, $(@));

	@-if [ -f "$(patsubst ${SRC}/%.c,%.c, $(@))" ]; then \
	mv $(patsubst ${SRC}/%.c,%.c,$(@)) ./${SRC} -i || true; mv  file dir/ 2>/dev/null || true ;\
	mv $(patsubst ${SRC}/%.c,%.h,$(@)) ./${SRC}/$(INCLUDES) -i ||true; \
	fi \


clean:
	@echo cleaning..
	@rm -f ${BINDER}/${BUILD} ${OBJ}/*

run: ${BUILD}
	@echo "running.."
	@./${BINDER}/${BUILD}


dump: 
	@echo no matching files
	


%:
	@echo no matching commands
