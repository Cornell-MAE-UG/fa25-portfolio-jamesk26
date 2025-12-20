---
layout: project
title: Turbocharger Analysis
description: Thermodynamic analysis of turbocharger compression and expansion cycles
technologies: [MATLAB, Python]
image: /assets/images/turbo/screenshot.png
---

## Overview

A turbocharger is a turbine-driven compressor that increases engine intake-air density and mass flow by extracting energy from the exhaust gas stream. This analysis examines the thermodynamic principles governing turbocharger operation, with emphasis on steady-flow energy balances, isentropic efficiency definitions, and real-world performance limitations.

## Device Description & Energy Flow

The turbocharger consists of three primary sections:

- **Turbine rotor:** Exposed to hot, high-pressure exhaust gas; extracts enthalpy and converts it to shaft mechanical work.
- **Compressor rotor:** Pressurizes cool intake air; consumes shaft mechanical work to increase enthalpy and density.
- **Center housing and bearings:** Mechanically couples the turbine and compressor; introduces friction and leakage losses.

Energy flows in a closed cycle: exhaust enthalpy → turbine power → shaft → compressor power → intake enthalpy. At steady state, available turbine power must exceed compressor power demand plus mechanical losses.

## Thermodynamic Modeling Assumptions

The following assumptions enable rigorous analysis:

1. **Steady-flow processes:** Inlet and outlet conditions at each component remain constant over time.
2. **Negligible kinetic and potential energy changes:** Focus on enthalpy differences.
3. **Perfect gas behavior:** Specific heats are constant; $pV = mRT$ applies.
4. **Adiabatic boundaries (first approximation):** Heat transfer effects are secondary; irreversibilities dominate.
5. **Isentropic reference states:** Ideal (reversible, adiabatic) processes set thermodynamic bounds.

Real turbochargers deviate from these assumptions; deviations are quantified by isentropic efficiency.

## Compressor Analysis

### Steady-Flow Energy Equation

For a compressor as a control volume, the specific work input (per unit mass) is:

$$w_{\text{in}} = h_2 - h_1$$

where:
- $h_1$ = specific enthalpy at compressor inlet
- $h_2$ = specific enthalpy at compressor outlet

For a perfect gas with constant specific heat $c_p$:

$$w_{\text{in}} = c_p (T_2 - T_1)$$

**Variables:**
- $T_1$ = inlet temperature
- $T_2$ = outlet temperature
- $c_p$ = specific heat at constant pressure

### Isentropic Reference Process

The isentropic (reversible, adiabatic) compression from inlet pressure $p_1$ to outlet pressure $p_2$ sets a minimum work requirement:

$$T_{2s} = T_1 \left( \frac{p_2}{p_1} \right)^{(k-1)/k}$$

**Variables:**
- $p_1$ = inlet pressure
- $p_2$ = outlet pressure
- $k$ = specific heat ratio $c_p / c_v$
- $T_{2s}$ = isentropic outlet temperature

### Isentropic Efficiency

Compressor isentropic efficiency is defined as the ratio of ideal to actual work:

$$\eta_c = \frac{w_{\text{in,s}}}{w_{\text{in}}} = \frac{T_{2s} - T_1}{T_2 - T_1}$$

Rearranging for actual outlet temperature:

$$T_2 = T_1 + \frac{T_{2s} - T_1}{\eta_c}$$

**Typical range:** $\eta_c$ = 0.65–0.85, depending on operating point and blade design.

### Pressure Ratio Relation

The pressure ratio across the compressor is:

$$\text{PR} = \frac{p_2}{p_1}$$

For high-efficiency operation, typical boost levels are 1.5–3.0 bar absolute (0.5–2.0 bar gauge).

## Turbine Analysis

### Steady-Flow Energy Equation

For a turbine as a control volume, the specific work output (per unit mass) is:

$$w_{\text{out}} = h_1 - h_2$$

where:
- $h_1$ = specific enthalpy at turbine inlet (exhaust gas)
- $h_2$ = specific enthalpy at turbine outlet

For a perfect gas:

$$w_{\text{out}} = c_p (T_1 - T_2)$$

**Variables:**
- $T_1$ = inlet (exhaust) temperature (typically 900–1000 K)
- $T_2$ = outlet temperature
- $c_p$ = specific heat (exhaust gas)

### Isentropic Reference Process

The isentropic expansion from inlet pressure $p_1$ to outlet pressure $p_2$ sets a maximum work potential:

$$T_{2s} = T_1 \left( \frac{p_2}{p_1} \right)^{(k-1)/k}$$

**Variables:** (same as compressor section)

### Isentropic Efficiency

Turbine isentropic efficiency is defined as the ratio of actual to ideal work:

$$\eta_t = \frac{w_{\text{out}}}{w_{\text{out,s}}} = \frac{T_1 - T_2}{T_1 - T_{2s}}$$

Rearranging for actual outlet temperature:

$$T_2 = T_1 - \eta_t (T_1 - T_{2s})$$

**Typical range:** $\eta_t$ = 0.60–0.80; variable-geometry turbines achieve higher efficiency across a broader flow range.

## Shaft Power Balance

At steady state, the mechanical power produced by the turbine must equal the mechanical power consumed by the compressor plus all losses:

$$\dot{W}_{\text{turbine}} = \dot{W}_{\text{compressor}} + \dot{W}_{\text{losses}}$$

In terms of mass flow rates and specific work:

$$\dot{m}_{\text{exh}} \cdot w_{\text{turbine}} = \dot{m}_{\text{air}} \cdot w_{\text{comp}} + \dot{W}_{\text{losses}}$$

**Variables:**
- $\dot{m}_{\text{exh}}$ = mass flow rate through turbine (kg/s)
- $\dot{m}_{\text{air}}$ = mass flow rate through compressor (kg/s)
- $\dot{W}_{\text{losses}}$ = parasitic mechanical losses (bearings, seals, windage) (W)

### Mass Flow Difference

Note that $\dot{m}_{\text{exh}} > \dot{m}_{\text{air}}$ because:
- Fuel is injected upstream of the turbine, adding mass to the exhaust stream.
- Engine breathing efficiency and exhaust valve timing affect exhaust mass flow.

Typical difference: $\dot{m}_{\text{exh}}$ ≈ 1.05–1.10 × $\dot{m}_{\text{air}}$ for gasoline engines.

## Losses, Efficiency, and Real-World Effects

### Mechanical Losses

**Bearing friction and windage:**
- Typical mechanical efficiency $\eta_{\text{mech}}$ ≈ 0.95–0.98
- Accounts for bearing drag, oil shearing, and rotor windage

**Leakage:**
- Compressor housing leakage (0.5–3% of compressor flow)
- Seal bypass reduces effective boost delivery

### Thermal Effects

**Heat transfer:**
- Turbine rotor surface temperature: 850–950 K; heat loss to housing reduces available work.
- Compressor discharge heat raises inlet air temperature; intercooling recovers 5–15% of power.

**Non-isentropic processes:**
- Blade-passage shock losses
- Boundary-layer separation at off-design conditions
- Tip-clearance flows in compressor

### Efficiency Operating Envelope

Compressor and turbine performance varies strongly with operating point:
- **Compressor:** Efficiency peaks at 50–80% of maximum flow; falls sharply at low flow (surge) and high flow (choke).
- **Turbine:** Efficiency degrades at very high or very low expansion ratios due to blade incidence mismatch.

## Performance Maps & Operating Limits

### Compressor Map Structure

Manufacturers publish corrected performance maps showing:

- **X-axis:** Corrected mass flow $\dot{m}_{\text{corr}} = \dot{m} \sqrt{T_{\text{ref}} / T} \cdot (p / p_{\text{ref}})$
- **Y-axis:** Pressure ratio $\text{PR} = p_{\text{outlet}} / p_{\text{inlet}}$
- **Islands:** Contours of constant isentropic efficiency (\%)
- **Surge line:** Lower flow limit; operation left of this line causes unstable reverse flow.
- **Choke line:** Upper flow limit; mass flow cannot increase further.

### Operating Constraints

**Surge margin:**
- Surge occurs when compressor cannot match engine backpressure at a given speed.
- Typical margin: 10–20% flow above surge line.

**Temperature limit:**
- Compressor outlet temperature is limited to prevent intercooler and engine damage.
- Typical limit: $T_2$ ≤ 150–180 °C for air.

**Pressure ratio limit:**
- Mechanical stress on rotor increases with $\text{PR}^2$.
- Typical limit: $\text{PR}$ ≤ 3.5–4.0 bar absolute (2.5–3.0 bar gauge).

## Conclusion

Turbocharger performance is governed by the steady-flow energy equation applied to the turbine and compressor as separate control volumes. Isentropic efficiency definitions quantify real-world irreversibilities; typical values are 0.65–0.85 (compressor) and 0.60–0.80 (turbine).

The shaft power balance couples the two components and explains why turbine expansion must significantly exceed compressor compression in enthalpy terms. Mass flow differences arise from fuel addition and exhaust dynamics, and mechanical losses account for 2–5% of available power.

Real turbochargers operate within narrow performance envelopes defined by surge, choke, thermal, and mechanical limits. Matching the turbine and compressor requires careful consideration of engine operating points, exhaust flow characteristics, and desired boost levels.

## References

- Heywood, J. B. "Internal Combustion Engine Fundamentals." McGraw-Hill, 2nd ed., 2018.
- Moran, M. J., Shapiro, H. N., Boettner, D. D., & Bailey, M. B. "Fundamentals of Engineering Thermodynamics." John Wiley & Sons, 9th ed., 2018.
- Bejan, A., Tsatsaronis, G., & Moran, M. "Thermal Design and Optimization." John Wiley & Sons, 1996.
- BorgWarner Turbocharger Technical Resources. https://www.borgwarner.com/en/products-and-solutions/turbo-technology
- Garrett Motion Turbocharger Documentation. https://www.garrettmotion.com/technical-resources/
- SAE International. "Turbocharger Nomenclature and Terminology" (SAE J922_201309).
