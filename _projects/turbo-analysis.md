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

- Compressor: relate pressure ratio (PR = p_out / p_in) to ideal (isentropic) outlet temperature:

- Ideal (isentropic) compressor temperature rise (approx):

-   T2s = T1 * PR^{(k-1)/k}

- With compressor isentropic efficiency η_c:

-   T2 = T1 + (T2s - T1) / η_c

- Work required (per unit mass):

-   w_c = c_p * (T2 - T1)

- Turbine (driven by exhaust): with expansion ratio and turbine efficiency η_t, similar isentropic relations apply. The available turbine work must exceed compressor work plus mechanical and bearing losses.

## Example (Simple Numbers)

- Choose a baseline engine intake conditions: T1 = 300 K, p1 = 101.3 kPa.
- Desired compressor pressure ratio PR = 1.5 (boost ≈ 0.5 bar above ambient).
- Air properties: k = 1.4, c_p ≈ 1005 J/(kg·K).
- Assume compressor isentropic efficiency η_c = 0.72.

- Compute T2s = 300 * 1.5^{(1.4-1)/1.4} ≈ 330 K (ideal). With efficiency, T2 ≈ 300 + (330-300)/0.72 ≈ 341.7 K.
- Compressor work per kg: w_c = 1005 * (341.7 - 300) ≈ 42.7 kJ/kg.

- Use turbine side data (from a datasheet or typical exhaust conditions) to verify the turbine can deliver > 42.7 kJ/kg of shaft work after accounting for mechanical losses.

This example should be expanded with real device data (compressor map points, turbine maps, or datasheet values) to earn the higher credit described below.

## What to Include for the Course Extra-Credit

- Minimum standard (1%): include a clear analysis of a thermo device (the turbocharger), with equations, at least one worked example (numbers as above), and images embedded in the page.
- Strong submission (up to 3%): analyze a specific turbocharger model (cite datasheets or papers), use compressor/turbine map data or manufacturer numbers, compute expected boost and shaft power for a chosen operating point, and discuss assumptions and limitations. Embed clear, appropriately sized figures (schematics, maps, photos) and label axes on plots.

## Assets / Images

Add images to `assets/images/turbo/` including:
- `turbo-schematic.png` — labeled schematic of turbo flow and components
- `compressor-map.png` — compressor map or typical compressor curve (if available)
- `screenshot.png` — any plot or photo you'd like to show as the project thumbnail

## Notes / Next Steps

- Replace placeholder numbers with real datasheet values for a specific turbo model to reach the 3% standard.
- If you want, I can help fetch a compressor map for a specific turbo (supply a model) and perform the calculations in MATLAB or Python and add plots to this page.
