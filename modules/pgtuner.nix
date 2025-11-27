{ mkServerModule, ... }:
{
  imports = [ (mkServerModule {
    name = "pgtuner";
  }) ];
}
