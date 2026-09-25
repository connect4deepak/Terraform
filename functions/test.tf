locals {
  namename = "Hello World"
}

variable "functions_test" {
    description = "this is the function"
    type = list(string)
    default = [ "one", "two", "three", "one" ]
}

output "func" {
    # value = upper(local.namename)
    # value = lower(local.namename)
    # value = startswith(local.namename, "world")
    # value = split(" ", local.namename)
    # value = max(1, 2, 3, 4)
    # value = abs(-10)
    # value = length(var.functions_test)
    # value = join(";", var.functions_test)
    # value = contains(var.functions_test, "one")
    # value = var.functions_test
    value = toset(var.functions_test)

}
