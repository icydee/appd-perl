#include <stdlib.h>
#include <stdio.h>

#include "proxy.h"

struct appd_config *newConfig() {

    struct appd_config *cfg = malloc(sizeof(struct appd_config));

    return cfg;
}

void set_app_name(struct appd_config *cfg, const char *app_name) {
#ifdef DEBUG
    printf("app name %s\n", app_name);
#endif
    cfg->app_name = app_name;
}

void set_tier_name(struct appd_config *cfg, const char *tier_name) {
#ifdef DEBUG
    printf("tier name %s\n", tier_name);
#endif
    cfg->tier_name = tier_name;
}

void set_node_name(struct appd_config *cfg, const char *node_name) {
#ifdef DEBUG
    printf("node name %s\n", node_name);
#endif
    cfg->node_name = node_name;
}

/*
 * Controller settings
 */
void set_controller_host(struct appd_config *cfg, const char *host) {
#ifdef DEBUG
    printf("controller host %s\n", host);
#endif
    cfg->controller.host = host;
}

void set_controller_port(struct appd_config *cfg, unsigned short port) {
#ifdef DEBUG
    printf("controller port %d\n", port);
#endif
    cfg->controller.port = port;
}

void set_controller_account(struct appd_config *cfg, const char *account) {
#ifdef DEBUG
    printf("controller account %s\n", account);
#endif
    cfg->controller.account = account;
}

void set_controller_access_key(struct appd_config *cfg, const char *access_key) {
#ifdef DEBUG
    printf("controller access key %s\n", access_key);
#endif
    cfg->controller.access_key = access_key;
}

void set_controller_use_ssl(struct appd_config *cfg, char use_ssl) {
#ifdef DEBUG
    printf("controller use ssl %c\n", use_ssl);
#endif
    cfg->controller.use_ssl = use_ssl;
}

void set_init_timeout_ms(struct appd_config *cfg, int init_timeout_ms) {
#ifdef DEBUG
    printf("controller init timeout ms %d\n", init_timeout_ms);
#endif
    cfg->init_timeout_ms = init_timeout_ms;
}

/*
 * Proxy settings
 */
void set_http_proxy_host(struct appd_config *cfg, const char *host) {
#ifdef DEBUG
    printf("proxy host %s\n", host);
#endif
    cfg->controller.http_proxy.host = host;
}

void set_http_proxy_port(struct appd_config *cfg, unsigned short port) {
#ifdef DEBUG
    printf("proxy port %d\n", port);
#endif
    cfg->controller.http_proxy.port = port;
}

void set_http_proxy_username(struct appd_config *cfg, const char *username) {
#ifdef DEBUG
    printf("proxy username %s\n", username);
#endif
    cfg->controller.http_proxy.username = username;
}

void set_http_proxy_password_file(struct appd_config *cfg, const char *password_file) {
#ifdef DEBUG
    printf("proxy password_file %s\n", password_file);
#endif
    cfg->controller.http_proxy.password_file = password_file;
}

/*
 * Debug
 */
void dump_config(struct appd_config *cfg) {
    printf("app name %s\n", cfg->app_name);
    printf("tier name %s\n", cfg->tier_name);
    printf("node name %s\n", cfg->node_name);
    printf("\n");
    printf("controller host %s\n", cfg->controller.host);
    printf("controller port %d\n", cfg->controller.port);
    printf("controller account %s\n", cfg->controller.account);
    printf("controller access key %s\n", cfg->controller.access_key);
    printf("controller use ssl %c\n", cfg->controller.use_ssl);
    printf("\n");
    printf("init timeout ms %d\n", cfg->init_timeout_ms);
    printf("\n");
    printf("http proxy host %s\n", cfg->controller.http_proxy.host);
    printf("http proxy port %d\n", cfg->controller.http_proxy.port);
    printf("http proxy username %s\n", cfg->controller.http_proxy.username);
    printf("http proxy password file %s\n", cfg->controller.http_proxy.password_file);
}
