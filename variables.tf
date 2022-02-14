variable "client_name" {
  description = "Name of client."
  type        = string
}

variable "environment" {
  description = "Name of application's environnement."
  type        = string
}

variable "stack" {
  description = "Name of application stack."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the application ressource group, herited from infra module."
  type        = string
}

variable "location" {
  description = "Azure location."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

# --------
# r-postgresql-flexible.tf
variable "tier" {
  description = "Tier for PostgreSQL Flexible server sku : https://docs.microsoft.com/en-us/azure/postgresql/flexible-server/concepts-compute-storage. Possible values are: GeneralPurpose, Burstable, MemoryOptimized."
  type        = string
  default     = "GeneralPurpose"
}

variable "size" {
  description = "Size for PostgreSQL Flexible server sku : https://docs.microsoft.com/en-us/azure/postgresql/flexible-server/concepts-compute-storage."
  type        = string
  default     = "D2ds_v4"
}

variable "storage_mb" {
  description = "Storage allowed for PostgresSQL Flexible server. Possible values : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server#storage_mb."
  type        = number
  default     = 32768
}

variable "postgre_version" {
  description = "Version of PostgreSQL Flexible Server."
  type        = number
}

variable "zone" {
  description = "Specify availability-zone for PostgreSQL Flexible main Server."
  type        = number
  default     = 1
}

variable "standby_zone" {
  description = "Specify availability-zone to enable high_availability and create standby PostgreSQL Flexible Server."
  type        = number
  default     = 2
}

variable "administrator_login" {
  description = "PostgreSQL administrator login."
  type        = string
}

variable "administrator_password" {
  description = "PostgreSQL administrator password. Strong Password : https://docs.microsoft.com/en-us/sql/relational-databases/security/strong-passwords?view=sql-server-2017."
  type        = string
}

variable "backup_retention_days" {
  description = "Backup retention days for the PostgreSQL Flexible Server (Between 7 and 35 days)."
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Enable Geo Redundant Backup for the PostgreSQL Flexible Server."
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "Map of maintenance window configuration"
  type        = map(number)
  default     = null
}

variable "private_dns_zone_id" {
  description = "ID of the private DNS zone to create The PostgreSQL Flexible Server."
  type        = string
  default     = null
}

variable "delegated_subnet_id" {
  description = "Id of the subnet to create the PostgreSQL Flexible Server. (Should not have any resource deployed in)"
  type        = string
  default     = null
}

variable "databases_names" {
  description = "List of databases names to create."
  type        = list(string)
}

variable "databases_charset" {
  description = "Valid PostgreSQL charset : https://www.postgresql.org/docs/current/multibyte.html#CHARSET-TABLE"
  type        = map(string)
  default     = {}
}

variable "databases_collation" {
  description = "Valid PostgreSQL collation : http://www.postgresql.cn/docs/13/collation.html - be careful about https://docs.microsoft.com/en-us/windows/win32/intl/locale-names?redirectedfrom=MSDN"
  type        = map(string)
  default     = {}
}

variable "postgresql_configurations" {
  description = "PostgreSQL configurations to enable."
  type        = map(string)
  default     = {}
}

# --------
# r-firewall.tf
variable "allowed_cidrs" {
  description = "Map of authorized cidrs."
  type        = map(string)
  default     = {}
}

# --------
# r-users.tf
variable "create_databases_users" {
  description = "True to create a user named <db>_user per database with generated password and role db_owner."
  type        = bool
  default     = true
}

# --------
# r-vnetrules.tf
variable "vnet_rules" {
  description = "Map of vnet rules to create."
  type        = map(string)
  default     = {}
}
