# AXIOM Beta Main board
- Equivalent to a PC's motherboard for the camera
- A central hub, where all the data from sensors and camera are routed as per
need
- Bottom side interfaces with the power board, followed by MicroZed board
- Top side interfaces with the interface board, and shields

## Components at Bottom side
- A Centre Solder-On (CSO) area used to interface chips like orientation sensors,
    acceleration etc. (as directly behind the image sensor)
- 2x Board connectors (JX1 & JX2) at North and South of board, connect directly
    to the Zynq SoC GPIOs (on the MicroZed board) through the power board
- 2x PCIE connectors (North and South), used to interface plugins (USB, HDMI etc.)
- 2x Board connectors (PB-NW & PB-SE), interface with the power board for
    power and I2C buses (coming from Zynq)
- 4x Power headers (PWR-XX), to receive various power rails from power board
- 2x PIC16s (West and East), to interface with the routing fabrics through
    various interfaces like JTAG, I2C, SPI etc.

## Components at Top side
- A Centre Solder-On (CSO) area
- 2x board interface connectors (X-WEST & X-EAST) that interface with the 
    interface board 
- 2x pin header connectors each on the West (HDR-XW) and East (HDR-XE) side, to 
    interface with the West shield and East shield respectively
- 2x Lattice MachXO2 FPGAs (RFW & RFE) used as routing fabrics, to route connections
    from the shields, plugins and centre area to the Zynq SoC (on MicroZed board)

## Connections

### CSO
- 2x 4 GPIOs, to RFW and RFE 
- 2x power rails, to PWR-XX
- 2x power rails, to JX1 & JX2

### JX1 & JX2
- Comes from power board, which in turn is from MicroZed
- 2x 24 LVDS pairs (High speed) as GPIOs
- 7x BANK-13 LVDS pairs as GPIOs
- 1x BANK-13 pin as power rail, to RFW and its PIC16
- 2x JXX pairs as power rails, one pin to RFE and its PIC16
- Various other control/debug pins and power rails to CSO, PCIEs, Shields etc.

### PCIE-NORTH & PCIE-SOUTH
- Power rails from JXX
- 6x Zynq LVDS pairs (High speed) each, to JXX
- 8x GPIOs each, to RFW and RFE 
- 1x I2C bus each, muxed and connected to RFW and its PIC16
- I2C bus power supply from JX2

### PB-NW & PB-SE
- 1x I2C bus each, to each PIC16 (Zynq to PIC16 communication)
- Various power rails, to X-WEST and X-EAST

### PIC16s (West and East) 
- VDD from PWR-NW and PWR-SE
- ICSP clock and data through I2C bus, from PB-NW & PB-SE
- VPP from PB-NW & PB-SE (supply for programming)
- JTAG, I2C & SPI interface pins (through IO ports), to RFW & RFE
- Various control signal pins for the FPGAs

### X-WEST & X-EAST
- JTAG, I2C & SPI interface pins, to RFW & RFE
- 18x LVDS pairs (High speed) each, to JX1 & JX2
- Various power rails from PB-NW & PB-SE

### HDR-XW & HDR-XE 
- HDR-NW & HDR-SW form West shield, HDR-NE & HDR-SE form East shield
- 20x GPIOs (10 North, 10 South) each, to RFW & RFE 
- For West shield, 4x LVDS pairs (2 North, 2 South) each, to RFW 
- For East shield, 4x LVDS pairs (2 North, 2 South) each (High Speed), to JX1 &
    JX2
- Power rails from PWR-NW & PWR-SE

### RFW
- Supply for IOs and VCC from PWR-NW
- GPIOs from PCIE-NORTH & PCIE-SOUTH
- Shield GPIOs from HDR-XW 
- LVDS pairs from HDR-XW
- GPIOs from Centre area (West)  
- SPI & JTAG interfaces to X-WEST
- 2x I2C buses to X-WEST
- 1x BANK13 LVDS pair, to JX1
- SPI & JTAG interfaces to PIC16 (West)
- A common I2C bus to PIC16 (West) as well as the PCIE connectors (muxed)
- MachXO2 FPGA controls (DONE, INITN, PROGRAMN, etc.), to PIC16 (West) 

### RFE
- Supply for IOs and VCC from PWR-SE
- Shield GPIOs from HDR-XE 
- GPIOs from Centre area (East)
- 2x SPI buses to X-EAST
- 2x I2C buses to X-EAST
- 2x Zynq LVDS pairs, to JX1 & JX2 respectively
- I2C, SPI & JTAG interfaces to PIC16 (East)
- MachXO2 FPGA controls, to PIC16 (East)
- Various unused GPIOs
