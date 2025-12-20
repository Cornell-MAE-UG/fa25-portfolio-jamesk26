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

In thermodynamic terms the turbine extracts specific energy (specific enthalpy h = u + pv for flowing gas) from the exhaust stream. That specific enthalpy drop is partly converted to mechanical shaft work; after accounting for turbine efficiency and mechanical losses, the shaft supplies work to the compressor which increases the enthalpy of the intake air. For a steady operating point, an energy balance equates turbine power (available) to compressor power demand plus losses.

Sources that explain turbocharger operation in engineering terms:

- Wikipedia — "Turbocharger" (summary and links to theory and history): https://en.wikipedia.org/wiki/Turbocharger
- Garrett Motion — technical resources and tutorials (practical guides, compressor/turbine maps): https://www.garrettmotion.com/technical-resources/
- Heywood, J.B., "Internal Combustion Engine Fundamentals" — textbook covering forced induction and engine thermodynamics (standard reference).

## 2. Thermodynamic Principles

Apply the First Law (steady-flow energy balance) to control volumes around the turbine and compressor. For a steady-flow device the specific work extracted or required relates to the change in specific enthalpy (neglecting kinetic/potential terms when small):

- Turbine (per unit mass of exhaust gas):

	w_turbine = h_{in,ex} - h_{out,ex} \quad(\text{ideal/isentropic use }h_{out,ex,s})

	With turbine isentropic efficiency $\eta_t$ defined as:

	$$\eta_t = \frac{h_{in,ex} - h_{out,ex}}{h_{in,ex} - h_{out,ex,s}}$$

	where subscript $s$ denotes the isentropic (ideal) expansion end-state at the same outlet pressure.

- Compressor (per unit mass of intake air):

	For an ideal isentropic compression between pressures $p_1\rightarrow p_2$ for a perfect gas (constant $k$):

	$$T_{2s} = T_1 \; PR^{(k-1)/k}, \quad PR = \frac{p_2}{p_1}$$

	With compressor isentropic efficiency $\eta_c$:

	$$T_2 = T_1 + \frac{T_{2s} - T_1}{\eta_c}$$

	Compressor specific work (per unit mass of intake air):

	$$w_{comp} = c_p (T_2 - T_1)$$

The shaft power balance (per unit time) then becomes:

$$\dot{m}_{exh} \; w_{turbine,avail} \; \eta_{mech} = \dot{m}_{air} \; w_{comp} + \dot{W}_{losses}$$

where $\eta_{mech}$ accounts for mechanical and bearing transmission losses between turbine and compressor, and $\dot{W}_{losses}$ includes bearing drag, internal leakage, and auxiliary parasitics.

If the turbine and compressor operate on the same shaft, careful attention must be paid to mass-flow rates: $\dot{m}_{exh}$ (exhaust gas) generally differs from $\dot{m}_{air}$ (intake air) because of fuel addition and changes across the engine; the turbine's available energy is based on the exhaust mass flow and enthalpy drop.

Practical forms of the isentropic relations (for ideal gas with constant specific heats):

$$\frac{T_{2s}}{T_1} = \left(\frac{p_2}{p_1}\right)^{(k-1)/k}$$

$$w_{comp,ideal} = c_p (T_{2s} - T_1)$$

Corrected mass flow and speed (for map interpolation):

$$\dot{m}_{corr} = \dot{m} \sqrt{\frac{T_{ref}}{T}} \cdot \frac{p}{p_{ref}}$$

These relations are the backbone of compressor and turbine performance maps and matching.

References for energy/exergy analyses:

- Bejan, A., Tsatsaronis, G., Moran, M., "Thermal Design and Optimization" — exergy-based methods and irreversibility analysis.
- Selected SAE papers and journal articles on exergy analysis and turbocharger performance (see References section).

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

Representative studies and findings:

- Experimental papers report measurable heat transfer in turbine housings and irreversible losses in blade rows (see References).
- Manufacturer datasheets and compressor/turbine maps provide measured efficiency islands which quantify real performance across flow/PR axes.

## 4. Performance Mapping & Operating Behavior

Compressor and turbine manufacturers publish maps showing contours of constant isentropic efficiency and operating islands in the corrected mass-flow vs. pressure-ratio (or corrected speed) plane. Key map features:

- Surge line (low flow limit) where unstable flow (rotating stall) begins — operation left of the surge line is unsafe and causes performance loss or damage.
- Choke (high flow limit) where mass flow cannot be increased for a given geometry.
- Efficiency islands: closed contours showing where the compressor is most efficient.

Surge and stall: typically caused by excessive pressure rise at low flow; surge control in engines uses wastegates, blow-off valves (recirc), and active control strategies.

Transient behavior — turbo lag:

- Turbo lag is the delay between a driver demand for torque (throttle input) and the pressurization of intake air by the compressor. It is governed by the turbine/compressor inertia, exhaust energy availability, and system piping volumes. Modern strategies (VGT, electronic boost control, twin-scroll manifolds) reduce lag.

## 5. Figures & Illustrations

Below are simple embedded figures (SVG) illustrating the turbocharger layout, an indicator-style sketch of temperature/pressure changes, and a placeholder compressor map. Replace these with manufacturer maps or device-specific diagrams to support a strong submission.

![Turbo schematic]({{ "/assets/images/turbo/schematic.svg" | relative_url }}){: .inline-image }
*Figure 1 — Turbocharger schematic: exhaust turbine drives the compressor via central shaft.*

![T–s / P–T sketch]({{ "/assets/images/turbo/pressure_temp.svg" | relative_url }}){: .inline-image }
*Figure 2 — Qualitative pressure/temperature changes across turbine and compressor.*

![Compressor map placeholder]({{ "/assets/images/turbo/compressor-map.svg" | relative_url }}){: .inline-image }
*Figure 3 — Placeholder compressor map (replace with manufacturer map for specific model).*

## 6. References & Citations

Below are accessible technical resources and textbooks to cite. For peer-reviewed papers, search SAE and journals for "turbocharger exergy" or "turbocharger efficiency"; if you pick a specific turbo model I can fetch exact datasheets and papers.

- "Turbocharger" — Wikipedia. https://en.wikipedia.org/wiki/Turbocharger
- Garrett Motion — Technical Resources and Papers. https://www.garrettmotion.com/technical-resources/
- Heywood, J.B., "Internal Combustion Engine Fundamentals", McGraw-Hill — textbook treatment of forced induction and engine thermodynamics.
- Bejan, A., Tsatsaronis, G., Moran, M., "Thermal Design and Optimization" — exergy approaches and irreversibility.
- HowStuffWorks — "How Turbochargers Work" — accessible engineering overview: https://auto.howstuffworks.com/turbo.htm
- Manufacturer application notes (examples): BorgWarner, Garrett, Honeywell/Continental technical papers and compressor map datasheets (see manufacturer websites).

---

If you'd like, I can now:

- Fetch a specific turbocharger model's compressor map and datasheet and embed it in the page.
- Run a Python notebook that computes a matched operating point (compressor PR, corrected mass flow, and required turbine power) for a chosen engine operating point and add plots/screenshots to `assets/images/turbo/`.
