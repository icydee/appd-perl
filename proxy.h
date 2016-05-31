#ifndef PROXY_H
#define PROXY_H

#include <appdynamics.h>

#define DEBUG

struct appd_config *newConfig();
void set_app_name(struct appd_config *cfg, const char *app_name);
void set_tier_name(struct appd_config *cfg, const char *tier_name);
void set_node_name(struct appd_config *cfg, const char *node_name);

void set_controller_host(struct appd_config *cfg, const char *host);
void set_controller_port(struct appd_config *cfg, unsigned short port);
void set_controller_account(struct appd_config *cfg, const char *account);
void set_controller_access_key(struct appd_config *cfg, const char *access_key);
void set_controller_use_ssl(struct appd_config *cfg, char use_ssl);
void set_init_timeout_ms(struct appd_config *cfg, int init_timeout_ms);

void set_http_proxy_host(struct appd_config *cfg, const char *host);
void set_http_proxy_port(struct appd_config *cfg, unsigned short port);
void set_http_proxy_username(struct appd_config *cfg, const char *username);
void set_http_proxy_password_file(struct appd_config *cfg, const char *password_file);

void dump_config(struct appd_config *cfg);


#endif


