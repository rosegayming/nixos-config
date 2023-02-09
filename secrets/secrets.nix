let
  root = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJtg7Hbbr7WQB+DGyq+Wr3zB9cCOVfMEOD/bG6MO9SGN root@mrow";
  users = [root];
in {
  "murmur.age".publicKeys = [root];
}
