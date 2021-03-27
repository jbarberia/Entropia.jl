# Entropia

[![Build Status](https://travis-ci.com/jbarberia/Entropia.jl.svg?branch=master)](https://travis-ci.com/jbarberia/Entropia.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/jbarberia/Entropia.jl?svg=true)](https://ci.appveyor.com/project/jbarberia/Entropia-jl)
[![Coverage](https://codecov.io/gh/jbarberia/Entropia.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/jbarberia/Entropia.jl)
[![Coverage](https://coveralls.io/repos/github/jbarberia/Entropia.jl/badge.svg?branch=master)](https://coveralls.io/github/jbarberia/Entropia.jl?branch=master)

Este paquete centraliza diferentes tipos de entropias de la información.

# Descarga e instalación

En el terminal de julia se corre los siguientes comandos:

```julia
using Pkg
Pkg.add("Github url")
```

# Uso:
```julia
using Entropia
x = [4, 7, 9, 10, 6, 11, 3]

e1 = bandt_and_pompe(x, 3)
e2 = bandt_and_pompe_normal(x, 3)
e3 = weight_entropy(x, 3)
```
Cada función de entropia tiene los siguientes parametros:

* `x::Array`: Señal a analizar
* `m::Int`: Dimensión de embedding
* `t::Int`: Delay de muestreo de la señal
