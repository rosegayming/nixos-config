let
	quartz = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGO6jAizB9gUq8J/hbEsXrCc+qtS11zGVVLN/njIi+Q4 quartz@mrow";
	users = [quartz];
in
{
	"murmur.age".publicKeys = [quartz];
}
