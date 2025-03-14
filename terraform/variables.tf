variable "my_ip" {
    description = "IP Address block of current local machine"
    type = string
}

variable "config" {
    description = "FDO Stack configuration"
    type = object({
      stack = string,
      base_domain = string,
      region = string,
      ssh_key = string,
      admin_user = string,
      admin_user_password = string,

      dbs = list(object({
        name          = string,
        instance_type = string,
        user          = string,
      })),

      manufacturing = object({
        name            = string,
        dns_prefix      = string,
        instance_type   = string
        port            = number,
        replicas        = number, 
      }),
      rendezvous = object({
        name            = string,
        dns_prefix      = string,
        instance_type   = string
        port            = number,
        replicas        = number, 
      }),
      owneronboarding = object({
        name            = string,
        dns_prefix      = string,
        instance_type   = string
        port            = number,
        replicas        = number, 
      }),
    })
    default = {
      stack                = ""
      base_domain         = "",
      region              = "",
      ssh_key             = "",
      admin_user          = "admin",
      admin_user_password = "R3dh4t1!",
      dbs = [
        {
          name            = "mfgownervouchers",
          instance_type   = "db.t4g.micro",
          user            = "mfgdbuser",
        },
        {
          name            = "rvsregistered",
          instance_type   = "db.t4g.micro",
          user            = "rvsdbuser",
        },
        {
          name            = "ownervouchers",
          instance_type   = "db.t4g.micro",
          user            = "oobdbuser",        
        }
      ],
      manufacturing = {
        name            = "manufacturing-node",
        dns_prefix      = "manufacturing"
        instance_type   = "t2.large",
        port            = 8080,
        replicas        = 1,
      },
      rendezvous = { 
        name          = "rendezvous-node",
        dns_prefix    = "rendezvous",
        instance_type = "t2.large",
        port          = 8082
        replicas      = 1,
      },
      owneronboarding = {
        name            = "owner-node",
        dns_prefix      = "owneronboarding",
        instance_type   = "t2.large",
        port            = 8081
        replicas        = 1,
      }
    }
}
