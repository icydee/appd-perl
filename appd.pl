#!/usr/bin/perl -w

use appd;

$cfg = appd::newConfig();
print "Created config $cfg\n";
appd::appd_config_init($cfg);
print "Config init OK\n";

# set AppD SDK config
appd::set_app_name($cfg, "Perl");
appd::set_tier_name($cfg, "Foo");
appd::set_node_name($cfg, "bar");

appd::set_controller_host($cfg, "localhost");
appd::set_controller_port($cfg, 8090);
appd::set_controller_account($cfg, "customer1");
appd::set_controller_access_key($cfg, "6ca84575-ffec-470d-8099-9e527ade5033");
appd::set_controller_use_ssl($cfg, 0);
appd::set_init_timeout_ms($cfg, 0);

# Debug
appd::dump_config($cfg);
$rc = appd::appd_sdk_init($cfg);
print "SDK init $rc\n";

if($rc == 0) {
    # add a backend
    $backendname = "foobar";
    appd::appd_backend_declare($appd::APPD_BACKEND_HTTP, $backendname);
    $rc = appd::appd_backend_set_identifying_property($backendname, "HOST", "myhost.com");
    if($rc != 0) {
        die "Failed to set host on backend\n";
    }
    $rc = appd::appd_backend_add($backendname);
    if($rc != 0) {
        die "Failed to add backend\n";
    }
    # Loop through a BT a few times
    for($i = 1; $i <= 10; $i++) {
        print "Starting BT\n";
        $bt = appd::appd_bt_begin("foobar", "");
        print "BT started $bt\n";
        sleep(1);
        $exit = appd::appd_exitcall_begin($bt, $backendname);
        print "Exit call started $exit\n";
        sleep(1);
        appd::appd_exitcall_end($exit);
        appd::appd_bt_end($bt);
        print "BT ended\n";
    }

    # The SDK does not like short running processes
    print "Wait before exit\n";
    sleep(60);
    appd::appd_sdk_term();
    print "The End\n\n";
}

exit;

