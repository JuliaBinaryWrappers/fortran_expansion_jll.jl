module fortran_expansion_jll
using Pkg.BinaryPlatforms, Pkg.Artifacts, Libdl

platforms = Platform[
    Windows(:x86_64, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    Linux(:armv7l, libc=:glibc, call_abi=:eabihf, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Windows(:x86_64, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    MacOS(:x86_64, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    Linux(:armv7l, libc=:glibc, call_abi=:eabihf, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    Linux(:i686, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:aarch64, libc=:musl, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    Windows(:x86_64, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:x86_64, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    Linux(:powerpc64le, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    Linux(:armv7l, libc=:musl, call_abi=:eabihf, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:x86_64, libc=:musl, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:i686, libc=:musl, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    FreeBSD(:x86_64, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    MacOS(:x86_64, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    Linux(:i686, libc=:musl, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:armv7l, libc=:musl, call_abi=:eabihf, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    FreeBSD(:x86_64, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:aarch64, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:aarch64, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    Linux(:armv7l, libc=:glibc, call_abi=:eabihf, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    MacOS(:x86_64, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:powerpc64le, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    Linux(:i686, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    Linux(:aarch64, libc=:musl, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:x86_64, libc=:musl, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    FreeBSD(:x86_64, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    Windows(:i686, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:x86_64, libc=:musl, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    Linux(:armv7l, libc=:musl, call_abi=:eabihf, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    Linux(:aarch64, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    Linux(:powerpc64le, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:aarch64, libc=:musl, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    Linux(:x86_64, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"4.0.0")),
    Linux(:i686, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    Linux(:i686, libc=:musl, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
    Windows(:i686, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    Linux(:x86_64, libc=:glibc, compiler_abi=CompilerABI(libgfortran_version=v"3.0.0")),
    Windows(:i686, compiler_abi=CompilerABI(libgfortran_version=v"5.0.0")),
]

# From the available options, choose the best platform
best_platform = select_platform(Dict(p => triplet(p) for p in platforms))

# Load the appropriate wrappers
include(joinpath(@__DIR__, "wrappers", "$(best_platform).jl"))

end  # module fortran_expansion_jll
