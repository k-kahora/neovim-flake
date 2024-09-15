{ pkgs, src }:
pkgs.vimUtils.buildVimPlugin {
  name = "nvim-grey";
  inherit src;
}
