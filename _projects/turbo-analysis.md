---
layout: project
title: Turbocharger Analysis
description: Thermodynamics of a turbocharger and practical performance analysis
technologies: [MATLAB, Python]
image: /assets/images/turbo/screenshot.png
---

## Overview

This project analyzes how a turbocharger works on an internal combustion engine and connects the thermodynamic theory we learned in class to a real device. The write-up covers the main components (compressor, turbine, and center housing), the thermodynamic relations for compression and expansion, and a simple performance example using typical data.

## How a Turbocharger Works (Summary)

- Exhaust gases from the engine drive the turbine section, producing shaft power.
- Shaft power drives the compressor, which pressurizes intake air (boost).
- Increased intake pressure (and mass flow) allows more fuel to be burned, increasing engine power.
- Key performance factors: compressor/turbine maps, efficiency, pressure ratio, mass flow, and thermal limits.

## Thermodynamic Analysis (Concepts and Equations)

- Compressor: relate pressure ratio \(PR = \frac{p_{out}}{p_{in}}\) to ideal (isentropic) outlet temperature:


## 1. Introduction & Basic Operation

A turbocharger is a turbine-driven forced induction device that increases the mass flow and pressure of intake air supplied to an internal combustion engine. By extracting energy from the engine's hot exhaust gas, a turbocharger drives a compressor that pressurizes the intake air (commonly called "boost"). The result is a higher air density at the intake manifold, enabling more fuel to be combusted for a given displacement and thereby increasing engine power and efficiency.

Key components and energy transfer:

- Turbine: exposed to engine exhaust gases; converts a fraction of the exhaust enthalpy drop into shaft power.
- Shaft / Center housing: transfers shaft power from turbine to compressor; includes bearings and seals (mechanical losses occur here).
- Compressor: consumes shaft power to raise intake air pressure and temperature (increase enthalpy and density).

In thermodynamic terms the turbine extracts specific energy (specific enthalpy \(h = u + pv\) for flowing gas) from the exhaust stream. That specific enthalpy drop is partly converted to mechanical shaft work; after accounting for turbine efficiency and mechanical losses, the shaft supplies work to the compressor which increases the enthalpy of the intake air. For a steady operating point, an energy balance equates turbine power (available) to compressor power demand plus losses.

## 2. Thermodynamic Principles

**Turbine Work**

For the turbine expanding exhaust gas from inlet to outlet:

$$w_{\text{turbine}} = h_{\text{in}} - h_{\text{out}}$$

The isentropic (ideal) process sets a baseline; actual turbine has efficiency:

$$\eta_t = \frac{h_{\text{in}} - h_{\text{out}}}{h_{\text{in}} - h_{\text{out,s}}}$$

where the subscript $s$ denotes isentropic outlet state.

**Compressor Work**

For the compressor compressing intake air, the isentropic temperature rise is:

$$T_{2s} = T_1 \left(\frac{p_2}{p_1}\right)^{(k-1)/k}$$

Accounting for real irreversibilities via compressor isentropic efficiency $\eta_c$:

$$T_2 = T_1 + \frac{T_{2s} - T_1}{\eta_c}$$

The specific work required by the compressor:

$$w_{\text{comp}} = c_p (T_2 - T_1)$$

**Power Balance on Shaft**

The turbine produces power and the compressor consumes it. On a steady operating point:

$$\dot{m}_{\text{exh}} \cdot w_{\text{turbine}} \cdot \eta_{\text{mech}} = \dot{m}_{\text{air}} \cdot w_{\text{comp}} + \dot{W}_{\text{losses}}$$

Here $\eta_{\text{mech}}$ accounts for mechanical and bearing losses, and $\dot{W}_{\text{losses}}$ includes drag and leakage.

## 3. Real-World Losses, Efficiency & Exergy

Why ideal/adiabatic assumptions break down:

- Heat transfer between the working fluid and housing (especially in the compressor intercooler and turbine housing) alters enthalpy transfers.
- Mechanical losses in bearings and seals reduce shaft power transmitted from turbine to compressor.
- Leakage (compressor housing, seals) and exhaust manifold pressure drop reduce effective mass flows.
- Non-isentropic processes: shock/boundary-layer losses on blades, tip clearance flows, and viscous dissipation.

Efficiency ranges seen in practice (typical ballpark values):

- Compressor isentropic efficiency $\eta_c$: roughly 0.65 – 0.85 depending on operating point and map island.
- Turbine isentropic efficiency $\eta_t$: roughly 0.6 – 0.8 (variable-geometry turbines tend to give improved performance at low flow).

Exergy perspective: irreversible processes (entropy generation) reduce the extractable work. Several studies quantify exergy destruction in turbocharged engines, showing significant fractions of available exergy lost in exhaust heat and through irreversibilities in turbine and compressor passage. Intercooling and recuperation strategies can reduce exergy destruction but add complexity and weight.

Several experimental studies report measurable heat transfer in turbine housings and irreversible losses in blade rows. Manufacturer datasheets and compressor/turbine maps provide measured efficiency islands which quantify real performance across flow and pressure-ratio axes.

## 4. Thermodynamic Cycle Representation

**T-S Diagram for Turbine Expansion**

The turbine expands hot exhaust gas from high pressure to lower pressure. On a T-S diagram:

- **Process 1→2s (isentropic):** Vertical line downward (no entropy change)
- **Process 1→2 (actual):** Sloped line downward and rightward (entropy increases due to irreversibility)

The enthalpy drop from inlet to outlet defines available work:

$$w_{\text{available}} = h_1 - h_2$$

Turbine efficiency measures how well this work is captured:

$$\eta_t = \frac{h_1 - h_2}{h_1 - h_{2s}} \quad \text{(typically 0.6–0.8)}$$

**T-S Diagram for Compressor Compression**

The compressor pressurizes cool intake air. On a T-S diagram:

- **Process 1→2s (isentropic):** Vertical line upward (no entropy change, minimum work needed)
- **Process 1→2 (actual):** Sloped line upward and rightward (entropy increases, more work required)

The work required exceeds the isentropic minimum:

$$w_{\text{comp,actual}} = \frac{w_{\text{comp,ideal}}}{\eta_c} = \frac{h_{2s} - h_1}{\eta_c}$$

Compressor efficiency is typically 0.65–0.85 depending on operating point.

**P-V Representation**

For a perfect gas, the compressor and turbine processes can also be visualized on a P-V (pressure-volume) diagram:

- Compressor: Follows roughly $pV^k = \text{const}$ (isentropic) or $pV^{n} = \text{const}$ with $n < k$ (real process)
- Turbine: Expands along similar polytropic path from high to low pressure

The area under the curve on a P-V diagram represents the flow work and internal energy changes. Real processes have larger areas (more work input for compression, less work output for expansion) than ideal processes.

## 5. Figures & Illustrations

The following diagrams illustrate key thermodynamic concepts and the physical turbocharger layout.

![Turbo schematic]({{ "/assets/images/turbo/schematic.svg" | relative_url }}){: .inline-image }
*Figure 1 — Turbocharger schematic: exhaust turbine drives the compressor via central shaft.*

![T–s / P–T sketch]({{ "/assets/images/turbo/pressure_temp.svg" | relative_url }}){: .inline-image }
*Figure 2 — T-S diagram showing isentropic (ideal) versus actual expansion in turbine and compression in compressor.*

![Compressor map placeholder]({{ "/assets/images/turbo/compressor-map.svg" | relative_url }}){: .inline-image }
*Figure 3 — P-V representation of turbocharger processes (placeholder).*

## 6. References & Citations

- "Turbocharger" — Wikipedia. https://en.wikipedia.org/wiki/Turbocharger
- Garrett Motion — Technical Resources and Papers. https://www.garrettmotion.com/technical-resources/
- Heywood, J.B., "Internal Combustion Engine Fundamentals", McGraw-Hill — textbook treatment of forced induction and engine thermodynamics.
- Bejan, A., Tsatsaronis, G., Moran, M., "Thermal Design and Optimization" — exergy approaches and irreversibility.
- HowStuffWorks — "How Turbochargers Work" — accessible engineering overview: https://auto.howstuffworks.com/turbo.htm
- Manufacturer application notes (examples): BorgWarner, Garrett, Honeywell/Continental technical papers and compressor map datasheets (see manufacturer websites).
