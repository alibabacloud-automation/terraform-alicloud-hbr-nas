#################
# Nas Backup Plan
#################
variable "name" {
  description = "The specification of module name."
  type        = string
  default     = "tf-test-hbr-nas"
}

variable "schedule" {
  description = "(Required) Backup strategy. Optional format: I|{startTime}|{interval}. It means to execute a backup task every {interval} starting from {startTime}. The backup task for the elapsed time will not be compensated. If the last backup task has not completed yet, the next backup task will not be triggered.startTime Backup start time, UNIX time seconds.interval ISO8601 time interval. E.g: PT1H means one hour apart. P1D means one day apart."
  type        = string
  default     = "I|1646827682|PT2H"
}

variable "retention" {
  description = "(Required) Backup retention days, the minimum is 1."
  type        = number
  default     = 1
}

variable "path" {
  description = "(Required) List of backup path. Up to 65536 characters. e.g.['/home', '/var']. Note You should at least specify a backup path, empty array not allowed here."
  type        = list(string)
  default     = ["/"]
}

#################
# Nas Restore Job
#################
variable "snapshot_hash" {
  description = "(Required while create_restore_job is true, ForceNew) The hashcode of Snapshot."
  type        = string
  default     = ""
}

variable "snapshot_id" {
  description = "(Required while create_restore_job is true, ForceNew) The ID of Snapshot."
  type        = string
  default     = ""
}

variable "target_path" {
  description = "(Required while create_restore_job is true, ForceNew) The target file path of (ECS) instance. WARNING: If this value filled in incorrectly, the task may not start correctly, so please check the parameters before executing the plan."
  type        = string
  default     = "/"
}