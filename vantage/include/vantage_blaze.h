#ifndef VANTAGE_BLAZE_H
#define VANTAGE_BLAZE_H

#include <stdint.h>
#include <stdbool.h>

void blaze_init(void);

void blaze_digest(const uint8_t *data_ptr, uint32_t data_len,
                   uint8_t *digest_out);

bool blaze_verify(const uint8_t *name_ptr, const uint8_t *data_ptr,
                   uint32_t data_len);

int32_t blaze_catalog_add(const uint8_t *digest_ptr,
                           const uint8_t *path_ptr, uint32_t path_len,
                           uint64_t size);

uint32_t blaze_catalog_count(void);

uint32_t blaze_catalog_list(uint8_t *buf_ptr, uint32_t buf_len);

bool blaze_catalog_get_digest(const uint8_t *path_ptr, uint32_t path_len,
                               uint8_t *digest_out);

uint32_t blaze_catalog_save(uint8_t *out_ptr, uint32_t out_len);

bool blaze_catalog_load(const uint8_t *data_ptr, uint32_t data_len);

int32_t blaze_selftest(void);

#endif
