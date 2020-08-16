"""
Aliases for the Unitful package.

Unit types often used in aviation and automotive simulations.

See Unitful.jl:
https://github.com/PainterQubits/Unitful.jl/blob/master/src/pkgdefaults.jl
"""
module Units

using Unitful
using Unitful.DefaultSymbols
import Unitful: ft,
                minute,
                hr,
                mi,
                ge

# Unit definitions
@unit nmi        "nmi"        NauticalMile        1852m        false
@unit kt         "knot"       Knot                1nmi/hr      false

__init__() = Unitful.register(@__MODULE__)

# Unit types
macro unittype(name, unit)
    # Generate code for:
    #   const UnitName = Union{Float64, Int64} of unit type
    #   UnitName(x::OtherUnit) function type constructor for direct conversions
    #   UnitName(x::Any) function for all other conversions (relies on * definition)
    eval(quote
        const $name = Union{typeof(1.0*$unit), typeof(1*$unit)} # Float64 and Int64
        $name(x::Unitful.Quantity) = typeof(1.0*$unit)(x)
        $name(x) = x*$unit
    end)
end

@unittype Foot ft
@unittype Meter m
@unittype Mile mi
@unittype NauticalMile nmi

@unittype Knot kt
@unittype EarthGravity ge

@unittype Second s
@unittype Minute minute
@unittype Hour hr

@unittype Degree °
@unittype Radian rad

export ft, m, s, minute, hr, °, rad, mi, nmi, kt, ge
export Foot, Meter, Second, Minute, Hour, Degree, Radian, Mile, NauticalMile, Knot, EarthGravity


end # module
