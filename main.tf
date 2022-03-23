resource "alicloud_hbr_nas_backup_plan" "backup_plan" {
  count                = var.create_backup_plan ? 1 : 0
  nas_backup_plan_name = var.name
  file_system_id       = var.file_system_id
  schedule             = var.schedule
  backup_type          = "COMPLETE"
  vault_id             = var.vault_id
  retention            = var.retention
  path                 = var.path
}

resource "alicloud_hbr_restore_job" "restore_job" {
  count                 = var.create_restore_job ? 1 : 0
  snapshot_hash         = var.snapshot_hash
  vault_id              = var.vault_id
  source_type           = "NAS"
  restore_type          = "NAS"
  snapshot_id           = var.snapshot_id
  target_file_system_id = var.target_file_system_id
  target_create_time    = var.target_create_time
  target_path           = var.target_path
  options               = var.options
}

