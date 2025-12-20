---
layout: project
title: Turbocharger Analysis
description: Thermodynamic analysis of turbocharger compression and expansion cycles
technologies: [MATLAB, Python]
image: /assets/images/turbo/screenshot.png
---

## Overview

A turbocharger is a turbine-driven compressor that increases engine intake-air density and mass flow by extracting energy from the exhaust gas stream. This analysis examines the thermodynamic principles governing turbocharger operation, with emphasis on steady-flow energy balances, isentropic efficiency definitions, and real-world performance limitations.

## Device Description and Energy Flow

The turbocharger consists of three primary sections:

- **Turbine rotor:** Exposed to hot, high-pressure exhaust gas; extracts enthalpy and converts it to shaft mechanical work.
- **Compressor rotor:** Pressurizes cool intake air; consumes shaft mechanical work to increase enthalpy and density.
- **Center housing and bearings:** Mechanically couples the turbine and compressor; introduces friction and leakage losses.

Energy flows in a closed cycle: exhaust enthalpy $\rightarrow$ turbine power $\rightarrow$ shaft $\rightarrow$ compressor power $\rightarrow$ intake enthalpy. At steady state, available turbine power must exceed compressor power demand plus mechanical losses.

## Thermodynamic Modeling Assumptions

The following assumptions enable rigorous analysis:

1. **Steady-flow processes:** Inlet and outlet conditions at each component remain constant over time.
2. **Negligible kinetic and potential energy changes:** Focus on enthalpy differences.
3. **Perfect gas behavior:** Specific heats are constant; $pV = mRT$ applies.
4. **Adiabatic boundaries (first approximation):** Heat transfer effects are secondary; irreversibilities dominate.
5. **Isentropic reference states:** Ideal (reversible, adiabatic) processes set thermodynamic bounds.

Real turbochargers deviate from these assumptions; deviations are quantified by isentropic efficiency.

## Compressor Thermodynamic Analysis

### Steady-Flow Energy Equation

For a compressor as a control volume, the specific work input (per unit mass) is:

$$w_{in} = h_2 - h_1$$

**Variables:**
- $h_1$ = specific enthalpy at compressor inlet (J/kg)
- $h_2$ = specific enthalpy at compressor outlet (J/kg)

For a perfect gas with constant specific heat $c_p$:

$$w_{in} = c_p (T_2 - T_1)$$

**Variables:**
- $T_1$ = inlet temperature (K)
- $T_2$ = outlet temperature (K)
- $c_p$ = specific heat at constant pressure (J/kg·K)

### Isentropic Reference Process

The isentropic (reversible, adiabatic) compression from inlet pressure $p_1$ to outlet pressure $p_2$ sets a minimum work requirement:

$$T_{2s} = T_1 \left( \frac{p_2}{p_1} \right)^{\frac{k-1}{k}}$$

**Variables:**
- $p_1$ = inlet pressure (Pa)
- $p_2$ = outlet pressure (Pa)
- $k$ = specific heat ratio $c_p / c_v$ (dimensionless)
- $T_{2s}$ = isentropic outlet temperature (K)

### Isentropic Efficiency Definition

Compressor isentropic efficiency is defined as the ratio of ideal to actual work:

$$\eta_c = \frac{w_{in,s}}{w_{in}} = \frac{T_{2s} - T_1}{T_2 - T_1}$$

Rearranging for actual outlet temperature:

$$T_2 = T_1 + \frac{T_{2s} - T_1}{\eta_c}$$

**Variables:**
- $\eta_c$ = isentropic efficiency (typically 0.65–0.85)

### Pressure Ratio

The pressure ratio across the compressor is:

$$\text{PR} = \frac{p_2}{p_1}$$

Typical boost levels range from 1.5 to 3.0 bar absolute (0.5–2.0 bar gauge).

## Turbine Thermodynamic Analysis

### Steady-Flow Energy Equation

For a turbine as a control volume, the specific work output (per unit mass) is:

$$w_{out} = h_1 - h_2$$

**Variables:**
- $h_1$ = specific enthalpy at turbine inlet, exhaust gas (J/kg)
- $h_2$ = specific enthalpy at turbine outlet (J/kg)

For a perfect gas:

$$w_{out} = c_p (T_1 - T_2)$$

**Variables:**
- $T_1$ = inlet (exhaust) temperature, typically 900–1000 K
- $T_2$ = outlet temperature (K)
- $c_p$ = specific heat of exhaust gas (J/kg·K)

### Isentropic Reference Process

The isentropic expansion from inlet pressure $p_1$ to outlet pressure $p_2$ sets a maximum work potential:

$$T_{2s} = T_1 \left( \frac{p_2}{p_1} \right)^{\frac{k-1}{k}}$$

**Variables:** (same as compressor section)

### Isentropic Efficiency Definition

Turbine isentropic efficiency is defined as the ratio of actual to ideal work:

$$\eta_t = \frac{w_{out}}{w_{out,s}} = \frac{T_1 - T_2}{T_1 - T_{2s}}$$

Rearranging for actual outlet temperature:

$$T_2 = T_1 - \eta_t (T_1 - T_{2s})$$

**Variables:**
- $\eta_t$ = isentropic efficiency (typically 0.60–0.80); variable-geometry turbines achieve higher efficiency across a broader flow range.

## Shaft Power Balance

At steady state, the mechanical power produced by the turbine must equal the mechanical power consumed by the compressor plus all losses:

$$\dot{W}_{turbine} = \dot{W}_{compressor} + \dot{W}_{losses}$$

In terms of mass flow rates and specific work:

$$\dot{m}_{exh} \cdot w_{out} = \dot{m}_{air} \cdot w_{in} + \dot{W}_{losses}$$

**Variables:**
- $\dot{m}_{exh}$ = mass flow rate through turbine (kg/s)
- $\dot{m}_{air}$ = mass flow rate through compressor (kg/s)
- $\dot{W}_{losses}$ = parasitic mechanical losses: bearings, seals, windage (W)

### Mass Flow Difference

Note that $\dot{m}_{exh} > \dot{m}_{air}$ because fuel is injected upstream of the turbine, adding mass to the exhaust stream. Engine breathing efficiency and exhaust valve timing also affect exhaust mass flow. Typical difference: $\dot{m}_{exh} \approx 1.05$–$1.10 \times \dot{m}_{air}$ for gasoline engines.

### Power Requirement

The turbine must produce sufficient power to overcome both compressor work and mechanical losses. This imposes a fundamental constraint on matching: undersized turbines cannot supply required compressor power, while oversized turbines cause excessive turbo lag.

## Losses, Efficiency, and Real-World Effects

### Mechanical Losses

**Bearing friction and windage:**
- Typical mechanical efficiency $\eta_{mech}$ = 0.95–0.98
- Accounts for bearing drag, oil shearing, and rotor windage in the center housing

**Leakage:**
- Compressor housing leakage: 0.5–3% of compressor flow
- Seal bypass reduces effective boost delivery to the engine

### Thermal Effects

**Heat transfer:**
- Turbine rotor surface temperature: 850–950 K; heat loss to housing reduces available work
- Compressor discharge temperature increases air density; intercooling recovers 5–15% of compressor power

**Non-isentropic processes:**
- Blade-passage shock losses on rotor
- Boundary-layer separation at off-design conditions
- Tip-clearance flows in compressor reduce effective area

### Efficiency Operating Envelope

Compressor and turbine performance varies strongly with operating point:

- **Compressor:** Efficiency peaks at 50–80% of maximum mass flow; falls sharply at low flow (surge limit) and high flow (choke point).
- **Turbine:** Efficiency degrades at very high or very low expansion ratios due to blade incidence mismatch and recirculation.

## Performance Maps and Operating Limits

Manufacturers publish corrected performance maps displaying pressure ratio versus corrected mass flow, with efficiency contours. Key operating limits include:

**Surge limit:** Minimum stable flow at a given speed. Operation left of the surge line causes unstable reverse flow and compressor damage. Typical surge margin: 10–20% flow above surge line.

**Choke condition:** Maximum achievable mass flow. Further flow increases require geometry change (variable-geometry compressor).

**Temperature limit:** Compressor outlet temperature is limited to prevent intercooler and engine damage. Typical limit: $T_2 \leq$ 150–180 °C for air.

**Pressure ratio limit:** Mechanical stress on the rotor increases with $(PR)^2$. Typical limit: $\text{PR} \leq$ 3.5–4.0 bar absolute (2.5–3.0 bar gauge).

## Conclusion

Turbocharger performance is governed by the steady-flow energy equation applied to the turbine and compressor as separate control volumes. Isentropic efficiency definitions quantify real-world irreversibilities; typical values are 0.65–0.85 (compressor) and 0.60–0.80 (turbine).

The shaft power balance couples the two components and explains why turbine expansion must significantly exceed compressor compression in enthalpy terms. Mass flow differences arise from fuel addition and exhaust dynamics, and mechanical losses account for 2–5% of available power.

Real turbochargers operate within narrow performance envelopes defined by surge, choke, thermal, and mechanical limits. Matching the turbine and compressor requires careful consideration of engine operating points, exhaust flow characteristics, and desired boost levels. Engineers must balance rapid spool-up (small turbine, short time constant) against maximum power output (large turbine, high flow capacity).

## References

- Heywood, J. B. *Internal Combustion Engine Fundamentals.* McGraw-Hill, 2nd ed., 2018.
- Moran, M. J., Shapiro, H. N., Boettner, D. D., & Bailey, M. B. *Fundamentals of Engineering Thermodynamics.* John Wiley & Sons, 9th ed., 2018.
- Bejan, A., Tsatsaronis, G., & Moran, M. *Thermal Design and Optimization.* John Wiley & Sons, 1996.
- BorgWarner Turbocharger Technical Resources. https://www.borgwarner.com/en/products-and-solutions/turbo-technology
- Garrett Motion Turbocharger Documentation. https://www.garrettmotion.com/technical-resources/
- SAE International. "Turbocharger Nomenclature and Terminology" (SAE J922_201309).
