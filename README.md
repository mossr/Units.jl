# Units.jl
A simple convenience wrapper around [Unitful.jl](https://github.com/PainterQubits/Unitful.jl/blob/master/src/pkgdefaults.jl
) that provides type aliases and exports units often used in aviation or automotive simulations.

# Unit Types
These units are exported from Unitful with added type aliases.
Note, `nmi` and `kt` were added.

```julia
ft::Foot
m::Meter
mi::Mile
nmi::NauticalMile

kt::Knot
ge::EarthGravity

s::Second
minute::Minute
hr::Hour

°::Degree
rad::Radian
```

# Examples
```julia
julia> x = 1nmi

julia> x/hr == 1kt
true
```

```julia
julia> sim(x::Foot, y::Foot) = x^2 + y^2

julia> sim(1ft, 2ft)
5 ft^2

julia> sim(1m, 2m)
ERROR: MethodError
```
