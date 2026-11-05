tjeneste = "ordre"
runtime  = "vm"
prefix   = "10.10.0.0/24"

# Offentlig nøkkel uten privat nøkkel. Den private nøkkelen skal aldri i repoet.
ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGMQ32gu8mGVI86gkUex5JsBeg7WC58bsUOVuxmeHDJW oblig2-ingen-privat-nokkel"

ekstra_regler = {
  allow-tcp-8927 = { port = "8927", source = "172.16.69.0/24", priority = 110 }
}
