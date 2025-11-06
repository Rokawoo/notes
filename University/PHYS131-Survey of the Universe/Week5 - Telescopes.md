# Telescopes

## Core Concepts

Telescopes are instruments designed to collect, focus, and magnify electromagnetic radiation. The fundamental purpose of any telescope is to gather more light than the human eye can collect on its own, enabling us to observe fainter and more distant objects in the universe.

### Light Gathering Power

The light gathering power of a telescope is directly proportional to its collecting area, which scales with the square of the diameter. This relationship can be expressed as:

```haskell
Light Gathering Power ∝ Diameter²
```

Doubling the diameter of a telescope quadruples its collecting area, which in turn quadruples the amount of light collected. This increased light collection allows larger telescopes to detect fainter objects, which are typically located at greater distances from Earth.

## Resolution

Resolution refers to a telescope's ability to distinguish two objects that appear close together in the sky. Higher resolution means the telescope can separate objects that are closer together, revealing finer details in astronomical observations.

### Angular Resolution

Since what we perceive depends on both the physical separation between two objects and their distance from the observer, resolution is measured in terms of angular separation rather than linear distance. Objects that appear well-separated when viewed up close or with a large telescope may be indistinguishable when viewed from far away or with a small telescope.

### Diffraction Limit

The diffraction limit represents the theoretical best resolution a telescope could achieve if its performance were only limited by the wave nature of light. This limit is determined by two factors:

```haskell
Resolution ∝ Wavelength / Diameter
```

This relationship reveals two important principles:
- Longer wavelengths produce poorer resolution
- Larger telescope diameters provide better resolution

## Atmospheric Effects

### Seeing

Seeing describes the smearing and blurring of light as it passes through Earth's atmosphere. As light travels through pockets of air at different temperatures, it undergoes constant redirection through refraction. This atmospheric turbulence causes the image of astronomical objects to blur and shimmer, limiting the effective resolution of ground-based telescopes regardless of their size.

For ground-based observations, seeing primarily limits the resolution of images rather than the telescope's size or light absorption between the observer and the source.

### Active and Adaptive Optics

Modern telescopes employ sophisticated techniques to counteract atmospheric distortion:

1. A bright reference star is selected, or a laser beam is projected into the sky to create an artificial guide star
2. The telescope observes how the atmosphere distorts the known shape of this reference
3. Deformable mirrors in the telescope adjust their shape in real time
4. These adjustments compensate for atmospheric distortion, effectively reducing the effects of seeing

## Telescope Design

### Reflector Telescopes

Reflector telescopes use mirrors to collect and focus light. Secondary mirrors redirect the focused light to a more convenient location for instruments or eyepieces. All modern scientific telescopes are reflectors due to the significant limitations of refractive designs.

### Refractor Telescopes

Refractor telescopes use lenses to collect and focus light. The Yerkes Observatory houses the largest refractor in the world, with a 40-inch diameter lens.

### Refractor Limitations

Several fundamental problems make refractors impractical for large scientific instruments:
- Glass lenses absorb some of the light passing through them, reducing efficiency
- Large lenses become extremely heavy and can only be mechanically supported at their edges, causing sagging under their own weight
- Dispersion causes different wavelengths of light to refract by different amounts when passing through a lens, creating chromatic aberration

These limitations explain why all modern large scientific telescopes employ reflective designs.

## Ground-Based vs Space-Based Telescopes

### Ground-Based Advantages

Ground-based telescopes offer several practical advantages. They can be built with much larger mirror diameters than space-based instruments, providing superior light gathering power. Construction and maintenance costs are substantially lower than space missions, and the mechanical stability of a ground-based installation allows for easier upgrades and repairs.

Building telescopes on tall mountains, particularly in locations like the Atacama Desert or Mauna Kea, provides access to dry, stable atmospheric conditions with minimal light pollution. High altitude sites also allow observation of some infrared wavelengths before atmospheric absorption blocks them.

### Ground-Based Disadvantages

All ground-based observations suffer from seeing effects caused by atmospheric turbulence. The atmosphere also blocks many wavelengths of electromagnetic radiation, particularly most infrared, ultraviolet, X-ray, and gamma-ray wavelengths.

### Space-Based Advantages

Space-based telescopes operate above Earth's atmosphere, eliminating seeing entirely. They can observe across the entire electromagnetic spectrum without atmospheric absorption. Space telescopes can also control their observing environment, avoiding light pollution and selecting optimal viewing times.

The Hubble Space Telescope operates with a 2.4-meter mirror, while the James Webb Space Telescope employs a 6.6-meter mirror optimized for infrared observations.

### Space-Based Disadvantages

Space telescopes are limited to smaller mirror sizes due to launch vehicle constraints and the challenges of deploying large structures in orbit. Mission costs are substantially higher than equivalent ground-based facilities, and repairs or upgrades require expensive servicing missions or are impossible altogether.

## Major Telescope Projects

### Extremely Large Telescope

Construction began in 2014 on what will become the world's largest ground-based optical telescope, featuring a 39.3-meter primary mirror. Located in the Atacama Desert of Chile, the facility is expected to reach completion in 2027 at a cost of approximately 1.5 billion Euros. The site selection reflects ideal conditions: remote location with minimal light pollution, high altitude at 4000 meters to minimize atmospheric interference, and extremely dry climate ensuring excellent weather conditions.

### Notable Optical Telescopes

The Keck Observatory operates twin 10-meter telescopes, while the Subaru telescope features an 8.3-meter mirror. The Very Large Telescope facility operates multiple large instruments that can work in combination.

## Radio Astronomy

Radio telescopes observe the longest wavelengths in the electromagnetic spectrum. These longer wavelengths provide significant advantages: clouds, rain, snow, and other atmospheric interference don't affect radio observations. However, for equivalent collecting areas, radio telescopes achieve worse resolution than optical telescopes due to the relationship between wavelength and the diffraction limit.

Notable radio facilities include the Arecibo Observatory with its 300-meter dish (now collapsed), the Five Hundred Meter Aperture Spherical Radio Telescope (FAST), and the Very Large Array (VLA) with baselines extending from 1 to 36 kilometers.

### Interferometry

Interferometry combines observations from two or more telescopes to simulate a single larger instrument. The Keck Observatory can operate its twin telescopes as an interferometer, while the Very Large Telescope array does the same with multiple instruments.

The Atacama Large Millimeter Array (ALMA) uses this technique extensively. The Event Horizon Telescope represents the ultimate application of this concept, combining observations from eight or more radio telescopes distributed around the globe. This configuration creates an effective collecting area with a diameter equal to Earth itself, achieving resolution sufficient to image the event horizons of supermassive black holes like Sagittarius A*.

## Advanced Observational Techniques

### Multiwavelength Astronomy

Comprehensive understanding of astronomical objects requires observations across multiple wavelengths of the electromagnetic spectrum. The same object can reveal completely different features when observed in radio, infrared, visible, ultraviolet, X-ray, or gamma-ray wavelengths.

### Multimessenger Astrophysics

Modern astronomy extends beyond electromagnetic observations to include other types of signals. Neutrino detectors like IceCube capture these elusive particles from astronomical sources. Gravitational wave observatories such as LIGO detect ripples in spacetime caused by extreme cosmic events. Combining these different types of observations provides a more complete understanding of violent astronomical phenomena than any single observation type could achieve alone.