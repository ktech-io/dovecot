class dovecot::imap (
  $mail_plugins                = '$mail_plugins imap_quota',
  $mail_max_userip_connections = 10,
  $imap_idle_notify_interval   = '2 mins'
  ) {

  include dovecot

  dovecot::config::dovecotcfmulti { 'imap':
    config_file => 'conf.d/20-imap.conf',
    changes     => [
      "set protocol[ . = \"imap\"]/mail_plugins \"${mail_plugins}\"",
      "set protocol[ . = \"imap\"]/mail_max_userip_connections \"${mail_max_userip_connections}\"",
      "set protocol[ . = \"imap\"]/imap_idle_notify_interval \"${imap_idle_notify_interval}\"",
      ]
  }
}
