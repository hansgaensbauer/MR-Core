# Assembly Guide

## Attaching the MRC Board to the Heatsink
Both designs are designed to have all of the hardware components mounted on a heatsink (Wakefield Thermal 125325). 

The MRC board is attached with 4-40 standoffs, and the gradient current limiting resistors and linear regulators need to be attached to the bottom of the MRC board so that they can be bolted to the heatsink. In practice, the easiest way to get the height right is to solder the resistors and regulators only after everything is bolted together.

![The position of the resistors and regulators on the heatsink](/Documentation/Photos/Board%20Offset.png)

## Frontends

The main MR-Core PCB does not include an analog frontend, so that the ADC/DAC board can be used with a variety of frontends suited for different purposes. 

This repository includes two example frontends that can be used for low power experiments or as a first stage for larger power amplifiers. The first design uses connectorized components from Mini-Circuits, the second (currently only in the 96wp branch) is integrated and includes a programmable attenuator and a T/R switch. 

### Connectorized Frontend

The mechanical designs for the first frontend can be found here: [MRC-ASSY-V3 Onshape](https://cad.onshape.com/documents/08d5cc469933dcf1f3680b8f/w/019d42becb6093bd4138e05a/e/b85e3df62a5811d6b4cc045a?renderMode=0&uiState=6979326bf122fc4615e7638b)

In addition to the two filter boards in the MRR-AFE folder, the following connectorized components are required:

- ZX60-100VH+
- C-2081888-1
- 2x ZX60-3018G-S+

### MRC-AFE Frontend

The mechanical designs for the second frontend can be found here: [MRC3_Case Onshape](https://cad.onshape.com/documents/a6a315e3a86249716985f9ad/w/217173f5852425dc1e41f329/e/d7597495945d9f2bb802a412?renderMode=0&uiState=697932bb78f8488f172080e4). The PCB design files and BoM for the AFE are currently only in the 96wp branch.

<img src="/Documentation/Photos/MRC-AFE.jpg" width=50%>

The AFE board is supported by two aluminum shields. The shields are designed to be straightforward to machine, and the designs can be found in the Onshape linked above.
