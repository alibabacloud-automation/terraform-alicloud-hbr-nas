output "backup_plan_id" {
  value = concat(alicloud_hbr_nas_backup_plan.backup_plan.*.id, [""])[0]
}

output "backup_plan_name" {
  value = concat(alicloud_hbr_nas_backup_plan.backup_plan.*.nas_backup_plan_name, [""])[0]
}

output "file_system_id" {
  value = concat(alicloud_hbr_nas_backup_plan.backup_plan.*.file_system_id, [""])[0]
}

output "backup_plan_schedule" {
  value = concat(alicloud_hbr_nas_backup_plan.backup_plan.*.schedule, [""])[0]
}

output "restore_job_id" {
  value = concat(alicloud_hbr_restore_job.restore_job.*.id, [""])[0]
}



