/* simple swig test */

%module appd
%{
#include <appdynamics.h>
#include "proxy.h"
%}

/*
 * Wrapper
 */
extern struct appd_config *newConfig();
extern void set_app_name(struct appd_config *cfg, const char *app_name);
extern void set_tier_name(struct appd_config *cfg, const char *tier_name);
extern void set_node_name(struct appd_config *cfg, const char *node_name);

extern void set_controller_host(struct appd_config *cfg, const char *host);
extern void set_controller_port(struct appd_config *cfg, unsigned short port);
extern void set_controller_account(struct appd_config *cfg, const char *account);
extern void set_controller_access_key(struct appd_config *cfg, const char *access_key);
extern void set_controller_use_ssl(struct appd_config *cfg, char use_ssl);
extern void set_init_timeout_ms(struct appd_config *cfg, int init_timeout_ms);

extern void set_http_proxy_host(struct appd_config *cfg, const char *host);
extern void set_http_proxy_port(struct appd_config *cfg, unsigned short port);
extern void set_http_proxy_username(struct appd_config *cfg, const char *username);
extern void set_http_proxy_password_file(struct appd_config *cfg, const char *password_file);

extern void dump_config(struct appd_config *cfg);

/*
 * AppD exit call types
 */
#define APPD_BACKEND_HTTP "HTTP"
#define APPD_BACKEND_DB "DB"
#define APPD_BACKEND_CACHE "CACHE"
#define APPD_BACKEND_RABBITMQ "RABBITMQ"
#define APPD_BACKEND_WEBSERVICE "WEB_SERVICE"

#define APPD_CORRELATION_HEADER_NAME "singularityheader"

/*
 * AppD error levels for BT errors
 */
enum appd_error_level
{
    APPD_LEVEL_NOTICE,
    APPD_LEVEL_WARNING,
    APPD_LEVEL_ERROR
};

/*
 * AppD functions
 */
extern void appd_config_init(struct appd_config *cfg);
extern int appd_sdk_init(struct appd_config *cfg);
extern void appd_sdk_term(void);

// BT
extern appd_bt_handle appd_bt_begin(const char *name, const char *correlation_header);
extern void appd_bt_end(appd_bt_handle bt);
extern void appd_bt_add_error(appd_bt_handle bt, enum appd_error_level level, const char *message, int mark_bt_as_error);
extern void appd_bt_store(appd_bt_handle bt, const char *guid);
extern appd_bt_handle appd_bt_get(const char *guid);
extern char appd_bt_is_snapshotting(appd_bt_handle bt);
extern void appd_bt_add_user_data(appd_bt_handle bt, const char *key, const char *value);
extern void appd_bt_set_url(appd_bt_handle bt, const char *url);

// Backend
extern void appd_backend_declare(const char *type, const char *unregistered_name);
extern int appd_backend_set_identifying_property(const char *backend, const char *key, const char *value);
extern int appd_backend_add(const char *backend);
extern int appd_backend_prevent_agent_resolution(const char *backend);

// Exit calls
extern appd_exitcall_handle appd_exitcall_begin(appd_bt_handle bt, const char *backend);
extern void appd_exitcall_end(appd_exitcall_handle exitcall);
extern void appd_exitcall_add_error(appd_exitcall_handle exitcall, enum appd_error_level level, const char *message, int mark_bt_as_error);
extern const char * appd_exitcall_get_correlation_header(appd_exitcall_handle exitcall);
extern void appd_exitcall_store(appd_exitcall_handle exitcall, const char *guid);
extern appd_exitcall_handle appd_exitcall_get(const char *guid);

