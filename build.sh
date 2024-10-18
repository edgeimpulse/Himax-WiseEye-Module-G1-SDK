#!/bin/bash
#
# Edge Impulse ingestion SDK
# Copyright (c) 2024 EdgeImpulse Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -e

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

for i in "$@"; do
  case $i in
    -b|--build)
      BUILD=1
      shift # past argument
      ;;
    -c|--clean)
      CLEAN=1
      shift # past argument
      ;;
    -f|--flash)
      FLASH=1
      shift # past argument
      ;;
    *)
      shift # past argument
      ;;
  esac
done

if [ ! -z ${CLEAN} ];
then
    make clean
    if [ $? -ne 0 ]; then
        echo "Clean error"
        exit 1
    fi
fi

if [ ! -z ${BUILD} ];
then
    make -j `nproc`
    make flash
    # cd ${SCRIPTPATH}/we2_image_gen_local/
    # cp ${SCRIPTPATH}/WE2_CM55M_APP_S/obj_epii_evb_icv30_bdv10/gnu_epii_evb_QFN88/WE2_CM55M_gnu_epii_evb_QFN88_s.elf input_case1_secboot/
    # ./we2_local_image_gen project_case1_blp_wlcsp.json
    # cp output_case1_sec_wlcsp/output.img ${SCRIPTPATH}/firmware.img
fi

if [ ! -z ${FLASH} ];
then
    echo "Flashing not supported yet!"
    # cd ${SCRIPTPATH}
    # himax-flash-tool -d WiseEye2 -f firmware.img
fi
