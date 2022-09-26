resource "azurerm_kubernetes_clsuter" "kubernetes_cluster" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "default_node_pool" {
    for_each = try(var.default_node_pool, null) != null ? var.default_node_pool : []
    content {
      name                          = try(default_node_pool.vaule.name, null)
      vm_size                       = try(default_node_pool.vaule.vm_size, null)
      capacity_reservation_group_id = try(default_node_pool.value.capacity_reservation_group_id, null)
      enable_auto_scaling           = try(default_node_pool.value.enable_auto_scaling, null)
      enable_host_encryption        = trye(default_node_pool.value.enable_host_encryption, null)

      dynamic "kubelet_config" {
        for_each = try(default_node_pool.value.kubelet_config, null) != null ? [default_node_pool.value.kubelet_config] : []
        content {
          allowed_unsafe_sysctls    = try(kubelet_config.value.allowed_unsafe_sysctls, null)
          container_log_max_line    = try(kubelet_config.value.container_log_max_line, null)
          container_log_max_size_mb = try(kubelet_config.value.container_log_max_size_mb, null)
          cpu_cfs_quota_enabled     = try(kubelet_config.value.cpu_cfs_quota_enabled, null)
          cpu_cfs_quota_period      = try(kubelet_config.value.cpu_cfs_quota_period, null)
          cpu_manager_policy        = try(kubelet_config.value.cpu_manager_policy, null)
          image_gc_high_threshold   = try(kubelet_config.value.image_gc_high_threshold, null)
          image_gc_low_threshold    = try(kubelet_config.value.image_gc_low_threshold, null)
          pod_max_pid               = try(kubelet_config.value.pod_max_pid, null)
          topology_manager_policy   = try(kubelet_config.value.topology_manager_policy, null)
        }
      }

      dynamic "linux_os_config" {
        for_each = try(default_node_pool.value.linux_os_config, null) != null ? [default_node_pool.value.linux_os_config] : []
        content {
          swap_file_size_mb = try(linux_os_config.value.swap_file_size_mb, null)

          dynamic "sysctl_config" {
            for_each = try(linux_os_config.value.sysctl_config, null) != null ? [linux_os_config.value.sysctl_config] : []
            content {
              fs_aio_max_nr                      = try(sysctl_config.value.fs_aio_max_nr, null)
              fs_file_max                        = try(sysctl_config.value.fs_file_max, null)
              fs_inotity_max_user_watches        = try(sysctl_config.value.fs_inotity_max_user_watches, null)
              fs_nr_open                         = try(sysctl_config.value.fs_nr_open, null)
              kernel_threads_max                 = try(sysctl_config.value.kernel_threads_max, null)
              net_core_netdev_max_backlog        = try(sysctl_config.value.net_core_netdev_max_backlog, null)
              net_core_optmem_max                = try(sysctl_config.value.net_core_optmem_max, null)
              net_core_rmem_default              = try(sysctl_config.value.net_core_rmem_default, null)
              net_core_rmem_max                  = try(sysctl_config.value.net_core_rmem_max, null)
              net_core_somaxconn                 = try(sysctl_config.value.net_core_somaxconn, null)
              net_core_wmem_default              = try(sysctl_config.value.net_core_wmem_default, null)
              net_core_wmem_max                  = try(sysctl_config.value.net_core_wmem_max, null)
              net_ipv4_ip_local_port_range_max   = try(sysctl_config.value.net_ipv4_ip_local_port_range_max, null)
              net_ipv4_ip_local_port_range_min   = try(sysctl_config.value.net_ipv4_ip_local_port_range_min, null)
              net_ipv4_neigh_default_gc_thresh1  = try(sysctl_config.value.net_ipv4_neigh_default_gc_thresh1, null)
              net_ipv4_neigh_default_gc_thresh2  = try(sysctl_config.value.net_ipv4_neigh_default_gc_thresh2, null)
              net_ipv4_neigh_default_gc_thresh3  = try(sysctl_config.value.net_ipv4_neigh_default_gc_thresh3, null)
              net_ipv4_tcp_fin_timeout           = try(sysctl_config.value.net_ipv4_tcp_fin_timeout, null)
              net_ipv4_tcp_keepalive_intvl       = try(sysctl_config.value.net_ipv4_tcp_keepalive_intvl, null)
              net_ipv4_tcp_keepalive_probes      = try(sysctl_config.value.net_ipv4_tcp_keepalive_probes, null)
              net_ipv4_tcp_keepalive_time        = try(sysctl_config.value.net_ipv4_tcp_keepalive_time, null)
              net_ipv4_tcp_max_syn_backlog       = try(sysctl_config.value.net_ipv4_tcp_max_syn_backlog, null)
              net_ipv4_tcp_max_tw_buckets        = try(sysctl_config.value.net_ipv4_tcp_max_tw_buckets, null)
              net_ipv4_tcp_tw_reuse              = try(sysctl_config.value.net_ipv4_tcp_tw_reuse, null)
              net_netfilter_nf_conntrack_buckets = try(sysctl_config.value.net_netfilter_nf_conntrack_buckets, null)
              net_netfilter_nf_conntrack_max     = try(sysctl_config.value.net_netfilter_nf_conntrack_maxm, null)
              vm_max_map_count                   = try(sysctl_config.value.vm_max_map_count, null)
              vm_swappiness                      = try(sysctl_config.value.vm_swappiness, null)
              vm_vfs_cache_pressure              = try(sysctl_config.value.vm_vfs_cache_pressure, null)
            }
          }

          transparent_huge_page_defrag  = try(linux_os_config.value.transparent_huge_page_defrag, null)
          transparent_huge_page_enabled = try(linux_os_config.value.transparent_huge_page_enabled, null)
        }
      }

      fips_enabled                 = try(default_node_pool.value.fips_enabled, null)
      kubelet_disk_type            = try(default_node_pool.value.kubelet_disk_type, null)
      max_pods                     = try(default_node_pool.value.max_pods, null)
      node_public_ip_prefix_id     = try(default_node_pool.value.node_public_ip_prefix_id, null)
      node_labels                  = try(default_node_pool.value.node_labels, null)
      only_critical_addons_enabled = try(default_node_pool.value.only_critical_addons_enabled, null)
      orchestrator_version         = try(default_node_pool.value.orchestrator_version, null)
      os_disk_size_gb              = try(default_node_pool.value.os_disk_size_gb, null)
      os_disk_type                 = try(default_node_pool.value.os_disk_type, null)
      os_sku                       = try(default_node_pool.value.os_sku, null)
      pod_subnet_id                = try(default_node_pool.value.pod_subnet_id, null)
      type                         = try(default_node_pool.value.type, null)
      tags                         = try(default_node_pool.value.tags, null)
      ultra_ssd_enabled            = try(default_node_pool.value.ultra_ssd_enabled, null)

      dynamic "upgrade_settings" {
        upgrade_settings = try(default_node_pool.value.upgrade_settings, null) != null ? [default_node_pool.value.upgrade_settings] : []
        content {
          max_surge = try(upgrade_settings.value.max_surge, null)
        }
      }

      vnet_subnet_id = try(default_node_pool.value.vnet_subnet_id, null)
      max_count      = try(default_node_pool.value.max_count, null)
      min_count      = try(default_node_pool.value.min_count, null)
      node_count     = try(default_node_pool.value.node_count, null)
      zones          = try(default_node_pool.value.zones, null)
    }
  }

  dns_prefix                 = try(default_node_pool.value.dns_prefix, null)
  dns_prefix_private_cluster = try(default_node_pool.value.dns_prefix_private_cluster, null)

  dynamic "aci_connector_linux" {
    for_each = try(var.aci_connector_linux, null) != null ? [var.aci_connector_linux] : []
    content {
      subnet_name = try(aci_connector_linux.value.subnet_name, null)
    }
  }

  automatic_channel_upgrade       = var.automatic_channel_upgrade
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges

  dynamic "auto_scaler_profile" {
    for_each = try(var.auto_scaler_profile, null) != null ? [var.auto_scaler_profile] : []
    content {
      balance_similar_node_groups      = try(auto_scaler_profile.value.balance_similar_node_groups, null)
      expander                         = try(auto_scaler_profile.value.expander, null)
      max_graceful_termination_sec     = try(auto_scaler_profile.value.max_graceful_termination_sec, null)
      max_node_provisioning_time       = try(auto_scaler_profile.value.max_node_provisioning_time, null)
      max_unready_nodes                = try(auto_scaler_profile.value.max_unready_nodes, null)
      max_unready_percentage           = try(auto_scaler_profile.value.max_unready_percentage, null)
      new_pod_scale_up_delay           = try(auto_scaler_profile.value.new_pod_scale_up_delay, null)
      scale_down_delay_after_add       = try(auto_scaler_profile.value.scale_down_delay_after_add, null)
      scale_down_delay_after_delete    = try(auto_scaler_profile.value.scale_down_delay_after_delete, null)
      scale_down_delay_after_failure   = try(auto_scaler_profile.value.scale_down_delay_after_failure, null)
      scan_interval                    = try(auto_scaler_profile.value.scan_interval, null)
      scale_down_unneeded              = try(auto_scaler_profile.value.scale_down_unneeded, null)
      scale_down_unready               = try(auto_scaler_profile.value.scale_down_unready, null)
      scale_down_utilization_threshold = try(auto_scaler_profile.value.scale_down_utilization_threshold, null)
      empty_bulk_delete_max            = try(auto_scaler_profile.value.empty_bulk_delete_max, null)
      skip_nodes_with_local_storage    = try(auto_scaler_profile.value.skip_nodes_with_local_storage, null)
      skip_nodes_with_system_pods      = try(auto_scaler_profile.value.skip_nodes_with_system_pods, null)
    }
  }

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = try(var.azure_active_directory_role_based_access_control, null) != null ? [var.azure_active_directory_role_based_access_control] : []
    content {
      managed                = try(azure_active_directory_role_based_access_control.value.managed, null)
      tenant_id              = try(azure_active_directory_role_based_access_control.value.tenant_id, null)
      admin_group_object_ids = try(azure_active_directory_role_based_access_control.value.admin_group_object_ids, null)
      azure_rbac_enabled     = try(azure_active_directory_role_based_access_control.value.azure_rbac_enabled, null)
      client_app_id          = try(azure_active_directory_role_based_access_control.value.client_app_id, null)
      server_app_id          = try(azure_active_directory_role_based_access_control.value.server_app_id, null)
      server_app_secret      = try(azure_active_directory_role_based_access_control.value.server_app_secret, null)
    }
  }

  azure_policy_enabled             = var.azure_policy_enabled
  disk_encryption_set_id           = var.disk_encryption_set_id
  http_application_routing_enabled = var.http_application_routing_enabled

  dynamic "http_proxy_config" {
    for_each = try(var.http_proxy_config, null) != null ? [var.http_proxy_config] : []
    content {
      http_proxy  = try(http_proxy_config.value.http_proxy, null)
      https_proxy = try(http_proxy_config.value.https_proxy, null)
      no_proxy    = try(http_proxy_config.value.no_proxy, null)
      trusted_ca  = try(http_proxy_config.value.trusted_ca)
    }
  }

  dynamic "identity" {
    for_each = try(var.identity, null) != null ? [var.identity] : []
    content {
      type         = try(identity.value.type, null)
      identity_ids = try(identity.value.identity_ids, null)
    }
  }

  dynamic "ingress_application_gateway" {
    for_each = try(var.ingress_application_gateway, null) != null ? [var.ingress_application_gateway] : []
    content {
      gateway_id   = try(ingress_appliation_gateway.value.gateway_id, null)
      gateway_name = try(ingress_appliation_gateway.value.gateway_name, null)
      subnet_cidr  = try(ingress_appliation_gateway.value.subnet_cidr, null)
      subnet_id    = try(ingress_appliation_gateway.value.subnet_id, null)
    }
  }

  dynamic "key_vault_secrets_provider" {
    for_each = try(var.key_vault_secrets_provider, null) != null ? [var.key_vault_secrets_provider] : []
    content {
      secret_rotation_enabled  = try(key_vault_secrets_provider.value.secret_rotation_enabled, null)
      secret_rotation_interval = try(key_vault_secrets_provider.value.secret_rotation_interval, null)
    }
  }

  dynamic "kubelet_identity" {
    for_each = try(var.kubelet_identity, null) != null ? [var.kubelet_identity] : []
    content {
      client_id                 = try(kubelet_identity.value.client_id, null)
      object_id                 = try(kubelet_identity.value.object_id, null)
      user_assigned_identity_id = try(kubelet_identity.value.user_assigned_identity_id, null)
    }
  }

  kubernetes_version = var.kubernetes_version

  dynamic "linux_profile" {
    for_each = try(var.linux_profile, null) != null ? [var.linux_profile] : []
    content {
      admin_username = try(linux_profile.value.admin_username, null)

      dynamic "ssh_key" {
        for_each = try(linux_profile.value.ssh_key, null) != null ? [linux_profile.value.ssh_key] : []
        content {
          key_data = try(ssh_key.value.key_data, null)
        }
      }
    }
  }

  local_account_disabled = var.local_account_disabled

  dynamic "maintenance_window" {
    for_each = try(var.maintenance_window, null) != null ? [var.maintenance_window] : []
    content {
      dynamic "allowed" {
        for_each = try(maintenance_window.value.allowed, null) != null ? [maintenance_window.value.allowed] : []
        content {
          day   = try(allowed.value.day, null)
          hours = try(allowed.value.hours, null)
        }
      }

      dynamic "not_allowed" {
        for_each = try(maintenance_window.value.not_allowed, null) != null ? [maintenance_window.value.not_allowed] : []
        content {
          end   = try(not_allowed.value.end, null)
          start = try(not_allowed.value.start, null)
        }
      }
    }
  }

  dynamic "microsoft_defender" {
    for_each = try(var.microsoft_defender, null) != null ? [var.microsoft_defender] : []
    content {
      log_analytics_workspace_id = try(microsoft_defender.value.log_analytics_workspace_id, null)
    }
  }

  dynamic "network_profile" {
    for_each = try(var.network_profile, null) != null ? [var.network_profile] : []
    content {
      network_plugin     = try(network_profile.value.network_plugin, null)
      network_mode       = try(network_profile.value.network_mode, null)
      network_policy     = try(network_profile.value.network_policy, null)
      dns_service_ip     = try(network_profile.value.dns_service_ip, null)
      docker_bridge_cidr = try(network_profile.value.docker_bridge_cidr, null)
      outbound_type      = try(network_profile.value.outbound_type, null)
      pod_cidr           = try(network_profile.value.pod_cidr, null)
      service_cidr       = try(network_profile.value.service_cidr, null)
      ip_versions        = try(network_profile.value.ip_versions, null)
      load_balancer_sku  = try(network_profile.value.load_balancer_sku, null)

      dynamic "load_balancer_profile" {
        for_each = try(network_profile.value.load_balancer_profile, null) != null ? [network_profile.value.load_balancer_profile] : []
        content {
          idle_timeout_in_minutes   = try(load_balancer_profile.value.idle_timeout_in_minutes, null)
          managed_outbound_ip_count = try(load_balancer_profile.value.managed_outbound_ip_count, null)
          outbound_ip_address_ids   = try(load_balancer_profile.value.outbound_ip_address_ids, null)
          outbound_ip_prefix_ids    = try(load_balancer_profile.value.outbound_ip_prefix_ids, null)
          outbound_ports_allocated  = try(load_balancer_profile.value.outbound_ports_allocated, null)
        }
      }

      dynamic "nat_gateway_profile" {
        for_each = try(network_profile.value.nat_gateway_profile, null) != null ? [network_profile.value.nat_gateway_profile] : []
        content {
          idle_timeout_in_minutes   = try(nat_gateway_profile.value.idle_timeout_in_minutes, null)
          managed_outbound_ip_count = try(nat_gateway_profile.value.managed_outbound_ip_count, null)
        }
      }
    }
  }

  node_resource_group = var.node_resource_group
  oidc_issuer_enabled = var.oidc_issuer_enabled

  dynamic "oms_agent" {
    for_each = try(var.oms_agent, null) != null ? [var.oms_agent] : []
    content {
      log_analytics_workspace_id = try(oms_agent.value.log_analytics_workspace_id, null)
    }
  }

  open_service_mesh_enabled           = var.open_service_mesh_enabled
  private_cluster_enabled             = var.private_cluster_enabled
  private_dns_zone_id                 = var.private_dns_zone_id
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled
  public_network_access_enabled       = var.public_network_access_enabled
  role_based_access_control_enabled   = var.role_based_access_control_enabled
  run_command_enabled                 = var.run_command_enabled

  dynamic "service_principal" {
    for_each = try(var.service_principal, null) != null ? [var.service_principal] : []
    content {
      client_id     = try(service_principal.value.client_id, null)
      client_secret = try(service_principal.value.client_secret, null)
    }
  }

  sku_tier = var.sku_tier
  tags     = var.tags

  dynamic "windows_profile" {
    for_each = try(var.windows_profile, null) != null ? [var.windows_profile] : []
    content {
      admin_username = try(windows_profile.value.admin_username, null)
      admin_password = try(windows_profile.value.admin_password, null)
      license        = try(windows_profile.value.license, null)
    }
  }
}