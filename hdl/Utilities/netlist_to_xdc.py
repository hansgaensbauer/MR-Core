
#turns a .net file (given as a command line argument) with a single FPGA into an xdc
#written for MR-Core Rev 3. Not guaranteed to work for anything else - please check results!
#you'll have to cut out power and ground and stuff and maybe play with which ones are which voltages/protocols
#this just assumes everything wants to be LVCMOS18

import sys

#sample pin. Key is U2 means Artix-7, USB_DATA_26 is our name, and N16 is the pin
"""
(net (code "183") (name "/Artix-7/USB_DATA_26")
      (node (ref "RN10") (pin "14") (pinfunction "R3.2") (pintype "passive"))
      (node (ref "U2") (pin "N16") (pinfunction "IO_L7N_T1_D10_14") (pintype "bidirectional")))
"""

"""
set_property -dict { PACKAGE_PIN P6    IOSTANDARD LVCMOS33 } [get_ports { rst_n }];
"""

FPGA_REF = "U2"

PRINT_FILE_DEBUG = False
PRINT_PINS_DEBUG = False

if __name__ == "__main__":
    filename = sys.argv[1]

    print(f"Opening {filename}...")
    filecontents = "ERROR"
    with open(filename, "r") as file:
        filecontents = file.read()

    if PRINT_FILE_DEBUG:
        print("File contents:")
        print(filecontents)

    nets = filecontents.split("(net (code \"")

    xdc_contents = ""

    print("parsing...")
    for net in nets:
        #find if it's about the FPGA
        if f"(node (ref \"{FPGA_REF}\")" not in net:
            continue

        #find the FPGA pin and human name
        pin = net.split(f"(node (ref \"{FPGA_REF}\") (pin \"")[1].split("\"")[0]
        name = net.split("(name \"")[1].split("\"")[0].split("/")[-1]

        if PRINT_PINS_DEBUG:
            print(f"{name}: {pin}")
        
        xdc_contents += f"set_property -dict {{ PACKAGE_PIN {pin} IOSTANDARD LVCMOS18 }} [get_ports {{ {name} }}]\n"
        
    output_filename = filename.replace(".net", ".xdc")

    print("writing xdc...")

    with open(output_filename, "w") as file:
        file.write(xdc_contents)
    
    print(f"Done! Output at {output_filename}")
    

    

