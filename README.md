Terraform module which creates Hybrid Backup Recovery (HBR) for NAS on Alibaba Cloud.

terraform-alicloud-hbr-nas
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbr-nas/blob/main/README-CN.md)

This module is used to create Hybrid Backup Recovery (HBR) for NAS on Alibaba Cloud.

These types of resources are supported:

* [alicloud_hbr_nas_backup_plan](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/hbr_nas_backup_plan)
* [alicloud_hbr_restore_job](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/hbr_restore_job)

## Usage

<div style="display: block;margin-bottom: 40px;"><div class="oics-button" style="float: right;position: absolute;margin-bottom: 10px;">
  <a href="https://api.aliyun.com/terraform?source=Module&activeTab=document&sourcePath=terraform-alicloud-modules%3A%3Ahbr-nas&spm=docs.m.terraform-alicloud-modules.hbr-nas&intl_lang=EN_US" target="_blank">
    <img alt="Open in AliCloud" src="https://img.alicdn.com/imgextra/i1/O1CN01hjjqXv1uYUlY56FyX_!!6000000006049-55-tps-254-36.svg" style="max-height: 44px; max-width: 100%;">
  </a>
</div></div>

```hcl
module "example" {
  source             = "terraform-alicloud-modules/hbr-nas/alicloud"
  create_backup_plan = true
  name               = "tf-test-hbr-nas"
  file_system_id     = "your_file_system_id"
  schedule           = "I|1646827682|PT2H"
  backup_type        = "COMPLETE"
  vault_id           = "v-0006******q"
  retention          = 1
  path               = ["/"]
  create_restore_job = false
}
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbr-nas/tree/main/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.133.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.133.0 |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)

