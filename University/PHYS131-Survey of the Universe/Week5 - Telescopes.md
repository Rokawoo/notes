# Telescopes

## Core Concepts

Telescopes are tools that collect, focus, and magnify electromagnetic radiation (light). Their fundamental purpose is to gather more light than the human eye can collect, enabling us to observe fainter and more distant objects in the universe.

## Light Gathering Power

The light gathering power of a telescope depends on its collecting area:

```haskell
Light Gathering Power ∝ Diameter²
```

This relationship means:
- 2x the diameter = 4x the collecting area
- 4x the collecting area = 4x the light collected
- More light = ability to see fainter objects
- Fainter objects are usually farther away

Bigger telescopes can see fainter objects at greater distances.

## Resolution

Resolution is the ability to distinguish two objects that are next to each other. Larger telescopes collect more light, which provides more information and reveals more detail.

What you see up close or with a big telescope shows fine details. What you see from far away or with a small telescope appears blurred together.

### Angular Resolution

Since what we perceive depends on both the separation between two objects and their distance from us, resolution is measured in terms of angular separations rather than linear distance.

### Diffraction Limit

The diffraction limit is the theoretical best resolution a telescope could achieve if it were only limited by the wave nature of light:

```haskell
Resolution ∝ Wavelength / Diameter
```

This reveals two key principles:
- Longer wavelengths produce poorer resolution
- Larger telescope diameters provide better resolution

## Atmospheric Effects

### Seeing

Seeing is the smearing and blurring of light as it passes through Earth's atmosphere. As light travels through pockets of air at different temperatures, it undergoes constant redirection (refraction). This atmospheric turbulence smears the image of astronomical targets.

For ground-based observations, seeing primarily limits the resolution of images—not the telescope's size or light absorption between the observer and source.

### Active and Adaptive Optics

Modern telescopes counteract atmospheric distortion through a four-step process:

1. Find a bright star or shine a laser into the sky
2. Observe how the known shape gets smeared by the atmosphere
3. Change the shape of the telescope's mirror in real time
4. Diminish the effects of seeing

## Telescope Design

### Types of Telescopes

Two fundamental designs exist:

**Reflector**: Uses mirrors to collect and focus light

**Refractor**: Uses lenses to collect and focus light

### Reflection vs Refraction

Reflection occurs when light bounces off a surface. Refraction occurs when light bends as it passes through a material.

### Yerkes Observatory

The Yerkes Observatory houses the largest refractor in the world, with a 40-inch diameter lens.

### Refractor Limitations

All modern scientific telescopes are reflectors because refractors have fundamental problems:
- Some light traveling through a lens is absorbed
- Large lenses are very heavy and can only be supported at their edges
- Light traveling through a lens is refracted differently depending on wavelength (dispersion causes chromatic aberration)

### Reflecting Telescopes

In reflector designs, secondary mirrors redirect the focused light to a more convenient location for instruments or eyepieces.

## Ground-Based vs Space-Based Telescopes

### Ground-Based Telescopes

**Advantages:**
- Can be built with bigger mirrors
- Cost less than space missions
- More mechanically stable
- Easier to upgrade and repair

**Disadvantages:**
- Suffer from seeing effects
- Atmosphere blocks many wavelengths

Building telescopes on tall mountains (like in the Atacama Desert or on Mauna Kea) provides:
- Minimal light pollution (remote locations)
- Less atmosphere to look through (high altitude at ~4000 meters)
- Dry conditions with good weather
- Access to some infrared wavelengths before atmospheric absorption

### Space-Based Telescopes

**Advantages:**
- No seeing effects
- Can observe all wavelengths of light
- Can control light pollution
- No atmospheric absorption

**Disadvantages:**
- Limited to smaller mirrors (launch constraints)
- Much more expensive
- Difficult or impossible to repair

**Notable Examples:**
- Hubble Space Telescope: 2.4-meter (8-foot) mirror
- James Webb Space Telescope: 6.6-meter (22-foot) mirror, optimized for infrared

### Comparison Summary

| Ground-Based | Space-Based |
|:-------------|:------------|
| Bigger mirrors | Smaller mirrors |
| Cost less | Expensive |
| More stable | Launch constraints |
| Seeing limits resolution | No seeing |
| Atmosphere blocks wavelengths | All wavelengths observable |

## Major Telescope Projects

### Extremely Large Telescope

The world's largest ground-based optical telescope is under construction:
- Mirror diameter: 39.3 meters (130 feet)
- Location: Atacama Desert, Chile
- Construction started: 2014
- Expected completion: 2027
- Cost: ~1.5 billion Euros = $1.7 billion USD

**Site Selection Factors:**
- Remote location (no light pollution)
- High altitude at 4000 meters (minimizes atmosphere)
- Extremely dry climate (good weather)

### Largest Optical Telescopes

Notable ground-based facilities include:
- Keck Observatory: Twin 10-meter telescopes
- Subaru: 8.3-meter mirror
- Very Large Telescope: Multiple large instruments

### Mauna Kea, Hawaii

Mauna Kea hosts multiple world-class observatories due to its excellent observing conditions at high altitude in a dry, dark environment.

## Radio Astronomy

Radio telescopes observe the longest wavelengths in the electromagnetic spectrum. Radio wavelengths have important characteristics:

**Advantages:**
- Clouds, rain, snow, and other intervening material don't interfere with observations
- Can observe through weather that blocks optical light

**Disadvantages:**
- For the same collecting area, resolution is worse than optical telescopes (due to longer wavelengths)

### Notable Radio Telescopes

**Arecibo**: 300-meter (990-foot) dish (now collapsed)

**FAST (Five Hundred Meter Aperture Spherical Radio Telescope)**: Currently the world's largest single-dish radio telescope

**Very Large Array (VLA)**: Multiple dishes with baselines between 1 kilometer (0.62 miles) and 36 kilometers (22 miles)

### Interferometry

Interferometry combines information from two or more telescopes to approximate a single larger telescope. Several facilities use this technique:

**Keck Observatory**: Twin telescopes can work together

**Very Large Telescope (VLT)**: Multiple instruments combine observations

**Atacama Large Millimeter Array (ALMA)**: Extensive array working together

### Event Horizon Telescope

The Event Horizon Telescope represents the ultimate application of interferometry:
- Uses observations from 8+ radio telescopes around the globe
- Creates an effective collecting area with a diameter equal to Earth's
- Resolution allows astronomers to take pictures of black holes
- Successfully imaged Sagittarius A* (the supermassive black hole at our galaxy's center)

## Advanced Observational Techniques

### Multiwavelength Astronomy

Comprehensive understanding requires observations across multiple wavelengths of the electromagnetic spectrum. The same object can reveal completely different features when observed in different wavelengths (radio, infrared, visible, ultraviolet, X-ray, gamma-ray).

Much can be learned by looking at the same objects at different wavelengths.

### Multimessenger Astrophysics

Modern astronomy extends beyond electromagnetic observations to include other types of signals:

**Neutrinos**: Captured by detectors like IceCube

**Gravitational Waves**: Detected by observatories like LIGO Hanford

Combining electromagnetic observations with neutrinos and gravitational waves provides a more complete understanding of extreme cosmic events than any single observation type could achieve alone.