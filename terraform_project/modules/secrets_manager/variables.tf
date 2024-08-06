variable "secrets" {
  description = "Map of secret names and their values"
  type = map(map(string))
}
