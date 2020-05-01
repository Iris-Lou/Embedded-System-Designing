# Embedded-System-Designing
# Upload some assignments in the course of Embedded System Designing. 
## 1. memory_test:
      Design the data memory tester of IAP15W4K58S4 singlechip, you need to achieve the following functions:
  (1) If switch K1 is off, switch K2 is on, test whether the unit of the internal data memory 00-FFH of the singlechip functions properly.<br>
     If all the memory cells function properly, turn on indicator L1 and write 0AAH to the memory cell 89H.<br>
     If there is an error, L1 flash and write 55H to memory cell 89H.<br>
  (2) If switch K2 is on, switch K1 is off, test whether off-chip memory works properly. 
     If all the memory cells function properly, turn on L2 and write 0AAH to 800H in the off-chip memory.
     If there is an error, L2 flash and write 55H to 800H in the off-chip memory.
  (3) The switches K1 and K2 are all off or on, the detection is stopped, and the indicator lights L1 and L2 are off.
  Draw circuit schematics and write programs. Briefly describe whether the test program is written in the correct way.
