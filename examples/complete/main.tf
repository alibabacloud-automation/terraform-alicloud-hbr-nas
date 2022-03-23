resource "alicloud_hbr_vault" "default" {
  vault_name = "tf-test-hbr-nas"
}

resource "alicloud_nas_file_system" "default" {
  protocol_type = "NFS"
  storage_type  = "Performance"
  description   = "tf-test-hbr-nas"
  encrypt_type  = "1"
}

data "alicloud_nas_file_systems" "default" {
  ids = [alicloud_nas_file_system.default.id]
}

data "alicloud_hbr_snapshots" "nas_snapshots" {
  source_type    = "NAS"
  vault_id       = alicloud_hbr_vault.default.id
  file_system_id = alicloud_nas_file_system.default.id
  create_time    = data.alicloud_nas_file_systems.default.systems.0.create_time
}

module "example" {
  source = "../.."

  #alicloud_hbr_nas_backup_plan
  create_backup_plan = true
  name               = var.name
  file_system_id     = alicloud_nas_file_system.default.id
  schedule           = var.schedule
  vault_id           = alicloud_hbr_vault.default.id
  retention          = var.retention
  path               = var.path

  #alicloud_hbr_restore_job
  create_restore_job    = false
  snapshot_hash         = length(data.alicloud_hbr_snapshots.nas_snapshots.snapshots) > 0 ? data.alicloud_hbr_snapshots.nas_snapshots.snapshots.0.snapshot_hash : var.snapshot_hash
  snapshot_id           = length(data.alicloud_hbr_snapshots.nas_snapshots.snapshots) > 0 ? data.alicloud_hbr_snapshots.nas_snapshots.snapshots.0.snapshot_id : var.snapshot_id
  target_file_system_id = alicloud_nas_file_system.default.id
  target_create_time    = data.alicloud_nas_file_systems.default.systems.0.create_time
  target_path           = var.target_path
  options               = "{\"includes\":[], \"excludes\":[]}"
}