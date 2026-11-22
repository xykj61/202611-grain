#ifndef VANTAGE_MARKET_H
#define VANTAGE_MARKET_H

#include <stdint.h>

/* Council sky topology constants */
uint32_t market_galaxies(void);
uint32_t market_stars_per_galaxy(void);
uint32_t market_planets_per_star(void);
uint32_t market_total_seats(void);

/* Market deck dispatch (returns SHA3 seal) */
int32_t market_deck_dispatch(
    uint32_t action_id,
    uint32_t point_number,
    uint32_t galaxy_id,
    uint64_t price_wood,
    uint32_t payload_bytes,
    uint8_t *seal_out);

/* Sky view frame compose */
int32_t sky_view_compose_galaxy(
    uint32_t galaxy_id,
    uint16_t *x_out,
    uint16_t *y_out);

#endif
