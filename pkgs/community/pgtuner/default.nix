{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "pgtuner-mcp";
  version = "unstable-2025-11-27";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "isdaniel";
    repo = "pgtuner_mcp";
    rev = "20ad402d0853db7df1e7e6d2298de40483f7eedc";
    hash = "sha256-X7E+p8BxHMrgmt9EFIC2CuabdbJkAQRSXF7H8I8pwtE=";
  };

  build-system = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  dependencies = with python3.pkgs; [
    mcp
    pglast
    psycopg
    psycopg-pool
  ];

  optional-dependencies = with python3.pkgs; {
    dev = [
      pytest
      pytest-asyncio
      pytest-cov
      ruff
    ];
    sse = [
      starlette
      uvicorn
    ];
  };

  pythonImportsCheck = [
    "pgtuner_mcp"
  ];

  meta = {
    description = "Provides AI-powered PostgreSQL performance tuning capabilities";
    homepage = "https://github.com/isdaniel/pgtuner_mcp";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "pgtuner-mcp";
  };
}
