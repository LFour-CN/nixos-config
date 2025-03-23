{ lib,  pkgs,  ... }:
{
  # Select our kernel packages (kernel and modules).
  boot.kernelPackages =
    with pkgs; # Cut down on repeated `pkgs.` declarations
    let
      llvm = llvmPackages_latest;
      kernel = linux_latest;
    in
    # Generate kernel modules for our custom kernel.
    linuxPackagesFor (
      # Override our chosen kernel version with our custom settings.
      (kernel.override {
        # Set our chosen version of LLVM as our standard environment.
        stdenv = overrideCC llvm.stdenv (
          # Tell our C compiler (Clang) to use LLVM bintools--normally GNU
          # binutils are used even with Clang as the compiler.
          llvm.stdenv.cc.override {
            bintools = llvm.bintools;
          }
        );

        # Tell Linux that we're compiling with Clang and LLVM.
        extraMakeFlags = [ "LLVM=1" ];

        # If you'd like to edit your kernel configuration, use
        # `structuredExtraConfig`. For example, some options available to us
        # when compiling with Clang and linking with LLD:
        structuredExtraConfig = {
          CFI_CLANG = lib.kernel.yes;
          LTO_CLANG_THIN = lib.kernel.yes;
        };
      }
    ).overrideAttrs
      # Work around another NixOS specific issue where builds with WERROR=y
      # are stopped by a benign error. See reference 1 below for details.
      # Technically, this fix is only necessary with WERROR=y but the issue
      # still causes a warning on builds where WERROR is unset.
      { env.NIX_CFLAGS_COMPILE = "-Wno-unused-command-line-argument"; }
    );
}
