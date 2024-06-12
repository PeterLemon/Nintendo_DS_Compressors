#!/bin/sh

# This script compresses the LICENSE file of this repository with all possible
# algorithms, decompresses it, and checks if the result is the same as the
# original file. The license text is pretty long, so this is a decent test file.

set -e
set -x

rm -rf tmp
mkdir tmp

# BLZ

./blz -en LICENSE tmp/blz_en.bin
./blz -eo LICENSE tmp/blz_eo.bin

./blz -d tmp/blz_en.bin tmp/blz_en.txt
./blz -d tmp/blz_eo.bin tmp/blz_eo.txt

diff LICENSE tmp/blz_en.txt
diff LICENSE tmp/blz_eo.txt

# HUFFMAN

./huffman -e8 LICENSE tmp/huffman_e8.bin
./huffman -e4 LICENSE tmp/huffman_e4.bin

./huffman -d tmp/huffman_e8.bin tmp/huffman_e8.txt
./huffman -d tmp/huffman_e4.bin tmp/huffman_e4.txt

diff LICENSE tmp/huffman_e8.txt
diff LICENSE tmp/huffman_e4.txt

# LZE

./lze -e LICENSE tmp/lze.bin

./lze -d tmp/lze.bin tmp/lze.txt

diff LICENSE tmp/lze.txt

# LZSS

./lzss -evn LICENSE tmp/lzss_evn.bin
./lzss -ewn LICENSE tmp/lzss_ewn.bin
./lzss -evf LICENSE tmp/lzss_evf.bin
./lzss -ewf LICENSE tmp/lzss_ewf.bin
./lzss -evo LICENSE tmp/lzss_evo.bin
./lzss -ewo LICENSE tmp/lzss_ewo.bin

./lzss -d tmp/lzss_evn.bin tmp/lzss_evn.txt
./lzss -d tmp/lzss_ewn.bin tmp/lzss_ewn.txt
./lzss -d tmp/lzss_evf.bin tmp/lzss_evf.txt
./lzss -d tmp/lzss_ewf.bin tmp/lzss_ewf.txt
./lzss -d tmp/lzss_evo.bin tmp/lzss_evo.txt
./lzss -d tmp/lzss_ewo.bin tmp/lzss_ewo.txt

diff LICENSE tmp/lzss_evn.txt
diff LICENSE tmp/lzss_ewn.txt
diff LICENSE tmp/lzss_evf.txt
diff LICENSE tmp/lzss_ewf.txt
diff LICENSE tmp/lzss_evo.txt
diff LICENSE tmp/lzss_ewo.txt

# LZX

./lzx -evb LICENSE tmp/lzx_evb.bin
./lzx -ewb LICENSE tmp/lzx_ewb.bin
./lzx -evl LICENSE tmp/lzx_evl.bin
./lzx -ewl LICENSE tmp/lzx_ewl.bin

./lzx -d tmp/lzx_evb.bin tmp/lzx_evb.txt
./lzx -d tmp/lzx_ewb.bin tmp/lzx_ewb.txt
./lzx -d tmp/lzx_evl.bin tmp/lzx_evl.txt
./lzx -d tmp/lzx_ewl.bin tmp/lzx_ewl.txt

diff LICENSE tmp/lzx_evb.txt
diff LICENSE tmp/lzx_ewb.txt
diff LICENSE tmp/lzx_evl.txt
diff LICENSE tmp/lzx_ewl.txt

# RLE

./rle -e LICENSE tmp/rle.bin

./rle -d tmp/rle.bin tmp/rle.txt

diff LICENSE tmp/rle.txt

rm -rf tmp

echo "ALL TEST PASSED!"
