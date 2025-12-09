---
layout: project
title: Mechanism Analysis
description: Lever mechanism with actuator
technologies: [MATLAB, python]
image: "/assets/images/screenshot.png"
---


I designed a planar lifting mechanism within a constrained 2D design space of 150 cm by 50 cm to maximize both lifted weight and vertical displacement. The mechanism consists of a rigid lever arm pinned to ground at one end, a second ground-mounted pin, and a high-force linear actuator (NSX series) placed perpendicular to the lever arm at its farthest practical location. This placement was chosen to maximize the moment arm and lifting capacity. A suspended load was positioned near midspan to balance lifting height and structural demands.

![Mechanism Problem Setup]({{ "/assets/images/Hw-70.jpg" | relative_url }}){: .inline-image-l }
![Free Body Diagram]({{ "/assets/images/Hw-71.jpg" | relative_url }}){: .inline-image-l }
![Beam Analysis]({{ "/assets/images/Hw-72.jpg" | relative_url }}){: .inline-image-l }

Using static force and moment equilibrium, I determined that the actuator’s maximum output force of 294 kN enables a maximum lift force of approximately 588 kN. Kinematic analysis showed the lever arm could rotate up to 60° about the primary pin, corresponding to a vertical lift height of approximately 65 cm for the load. The actuator’s 1.5 m stroke was verified to be sufficient for this range of motion while remaining perpendicular to the lever throughout operation.

The bar was then modeled as a bending beam subjected to transverse forces from the actuator and suspended load. Assuming quasi-static loading, rigid supports, negligible self-weight relative to the applied load, linear elastic material behavior, and small deflections, I identified the maximum bending moment at the load application point. Beam deflection was computed using Euler–Bernoulli beam theory.

To satisfy a design requirement limiting vertical deflection to less than 2% of the beam length (0.013 m), I designed a mass-efficient rectangular beam using Aluminum Alloy 2014-T6 (E = 75 GPa). The optimal cross-section was selected by minimizing area while meeting stiffness constraints, resulting in a minimum characteristic dimension of 2.57 cm. The final beam geometry satisfies both strength and deflection requirements while remaining lightweight and manufacturable.

