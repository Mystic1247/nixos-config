{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Mytic";
        email = "mysticsoulseeker2@gmail.com";
      };

      init.defaultBranch = "main";
    };
  };
}
