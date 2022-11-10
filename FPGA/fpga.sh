ql_symbiflow -compile -src /data/data/com.termux/files/home/fpga-examples/blink -d ql-eos-s3 -P PU64 -v helloworldfpga.v -t helloworldfpga -p pygmy.pcf -dump binary


scp helloworldfpga.bin nikhil@192.168.166.241:
