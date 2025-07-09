# Replit Nix environment configuration

{ pkgs }: {
  # Specify the packages to install
  # This includes Python, ffmpeg for audio processing, and PostgreSQL for the database
  deps = [
    pkgs.python311Full  # Matches the Python version in pyproject.toml (>=3.13, but 3.11 is widely available and stable)
                        # Replit's stable-23_11 channel might have a specific version, adjust if needed.
                        # We'll aim for python 3.11 as a common version.
    pkgs.ffmpeg
    pkgs.postgresql
    pkgs.git # For uv and other potential version control needs
    pkgs.docker # For docker compose
    pkgs.docker-compose # For docker compose
    # Add any other system-level dependencies here
  ];

  # Environment variables can also be set here, but it's generally better
  # to use Replit's built-in secrets manager for sensitive data.
  # Example:
  # env = {
  #   MY_VARIABLE = "some_value";
  # };

  # You can also specify services to run, though this is often handled
  # by the .replit file's `run` command or `[hooks]`.
  # services = [
  #   {
  #     name = "postgres";
  #     pkg = pkgs.postgresql;
  #     command = "${pkgs.postgresql}/bin/postgres -D $REPL_HOME/postgres_data";
  #     # Ensure data directory exists
  #     preStart = "mkdir -p $REPL_HOME/postgres_data && initdb -D $REPL_HOME/postgres_data || true";
  #   }
  # ];
}

# For more information on configuring replit.nix, see:
# https://docs.replit.com/programming-ide/configuring-repl#thenix-file
