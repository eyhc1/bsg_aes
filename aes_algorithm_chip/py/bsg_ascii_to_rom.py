#!/usr/bin/python

#
# input format:
#  lines of verilog binary strings, e.g.
#    1001_10101_10011_1101
#  comments beginning with # sign
#  lines with just whitespace
#
# output format:
#  a module that implements a rom
#
# usage: bsg_ascii_to_rom.py <filename> <modulename>
#
# to compress out zero entries with a default 0 setting:
#
# usage: bsg_ascii_to_rom.py <filename> <modulename> zero  
# 
 
from __future__ import print_function
import sys
import os
import binascii

def bsg_ascii_to_rom(filename, modulename, zero=0, spool=sys.stdout):
    i = 0
    print("// auto-generated by bsg_ascii_to_rom.py from " + os.path.abspath(filename) + "; do not modify", file=spool)
    print("module " + modulename + " #(`BSG_INV_PARAM(width_p), `BSG_INV_PARAM(addr_width_p))", file=spool)
    print("(input  [addr_width_p-1:0] addr_i", file=spool)
    print(",output logic [width_p-1:0]      data_o", file=spool)
    print(");", file=spool)
    print("always_comb case(addr_i)", file=spool)
    all_zero = set("0_")
    with open(filename,"r") as myFile:
        for line in myFile.readlines() :
            line = line.strip()
            if (len(line)!=0):
                if (line[0] != "#") :
                    if (not zero or not (set(line) <= all_zero)) :
                        digits_only = "".join(filter(lambda m:m.isdigit(), str(line)))

                        # http://stackoverflow.com/questions/2072351/python-conversion-from-binary-string-to-hexadecimal
                        hstr = '%0*X' % ((len(digits_only) + 3) // 4, int(digits_only, 2))

                        # print(str(i).rjust(10)+": data_o = width_p ' (" + str(len(digits_only))+ "'b"+line+");"+" // 0x"+hstr, file=spool)
                        # EDT
                        print(str(i).rjust(10)+": data_o = " + str(len(digits_only))+ "'b"+line+";"+" // 0x"+hstr, file=spool)
                    i = i + 1
                else :
                    print("                                 // " + line, file=spool)
    if (zero) : 
        print("default".rjust(10) + ": data_o = { width_p { 1'b0 } };", file=spool)
    else :
        print("default".rjust(10) + ": data_o = 'X;", file=spool)
    print("endcase", file=spool)
    print("endmodule", file=spool)
    print("`BSG_ABSTRACT_MODULE(" + modulename + ")", file=spool)

if __name__ == "__main__":
    if ((len(sys.argv)!=3) and (len(sys.argv)!=4)) :
        print("Usage ascii_to_rom.py <filename> <modulename>")
        sys.exit(-1)
    zero = 0
    if ((len(sys.argv)==4) and sys.argv[3]=="zero") :
        zero = 1
    bsg_ascii_to_rom(sys.argv[1], sys.argv[2], zero)

