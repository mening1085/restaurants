<template>
    <div>
        <div class="row con-div">
            <div class="con-left col-4 mr-0 pr-0">
                <div class="p-3">
                    <div class="title">
                        Restaurants
                    </div>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span
                                class="input-group-text"
                                id="inputGroup-sizing-default"
                            >
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="16"
                                    height="16"
                                    fill="currentColor"
                                    class="bi bi-search"
                                    viewBox="0 0 16 16"
                                >
                                    <path
                                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"
                                    />
                                </svg>
                            </span>
                        </div>
                        <gmap-autocomplete
                            class="form-control"
                            placeholder="ค้นหาร้านอาหาร"
                            @place_changed="setPlace"
                        />
                    </div>
                </div>

                <div class="box-item">
                    <div
                        class="card-item card mx-3 my-1 p-2 mb-2"
                        v-for="(restaurant, i) in restaurants"
                        :key="i"
                        @click="setView(restaurant)"
                    >
                        <div class="row">
                            <div class="col-12">
                                <div class="font-weight-bold">
                                    <b-img
                                        width="20"
                                        :src="restaurant.icon"
                                        fluid
                                        alt="Responsive image"
                                    ></b-img>
                                    {{ restaurant.name }}
                                </div>
                                <div class="rating">
                                    <span class="font-weight-bold"
                                        >Rating :</span
                                    >
                                    <b-icon
                                        class="mr-1"
                                        v-for="(rate, r) in restaurant.rating"
                                        :key="r"
                                        icon="star-fill"
                                        style="color: rgb(252, 194, 5);"
                                    ></b-icon>
                                </div>
                                <div class="tel">
                                    <span class="font-weight-bold">
                                        Tel :
                                    </span>
                                    {{ restaurant.tel }}
                                </div>
                                <div class="address">
                                    <b-icon
                                        icon="geo-alt-fill"
                                        style="color: red;"
                                    ></b-icon>

                                    <span style="font-size: 10px">
                                        {{ restaurant.address }}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-8 m-0 p-0">
                <GmapMap :center="mapCenter" :zoom="13" class="google-map">
                    <GmapInfoWindow
                        :options="infoWindowOptions"
                        :position="infoWindowPosition"
                        :opened="infoWindowOpened"
                        @closeclick="handleInfoWindowClose"
                    >
                        <div class="info-window" v-if="activeRestaurant">
                            <div class="font-weight-bold">
                                <b-img
                                    width="20"
                                    :src="activeRestaurant.icon"
                                    fluid
                                    alt="Responsive image"
                                ></b-img>
                                {{ activeRestaurant.name }}
                            </div>
                            <div
                                class="d-flex justify-content-between align-items-center"
                            >
                                <div>
                                    <div class="rating">
                                        <b-icon
                                            class="mr-1"
                                            v-for="(rate,
                                            r) in activeRestaurant.rating"
                                            :key="r"
                                            icon="star-fill"
                                            style="color: rgb(252, 194, 5);"
                                        ></b-icon>
                                    </div>
                                    <div class="open_now">
                                        <span class="font-weight-bold">
                                            สถานะ :
                                        </span>
                                        {{
                                            activeRestaurant.is_open
                                                ? "เปิด"
                                                : "ปิด"
                                        }}
                                    </div>
                                </div>
                                <div>
                                    <b-icon
                                        @click="
                                            onClickAdd(
                                                activeRestaurant.place_id
                                            )
                                        "
                                        font-scale="2"
                                        class="mr-1"
                                        style="cursor: pointer"
                                        icon="bookmark-star-fill"
                                        variant="success"
                                    ></b-icon>
                                </div>
                            </div>
                        </div>
                    </GmapInfoWindow>
                    <GmapMarker
                        v-for="(restaurant, index) in restaurants"
                        :key="index"
                        :position="getPosition(restaurant)"
                        :clickable="true"
                        :draggable="false"
                        @click="handleMarkerClicked(restaurant)"
                    />

                    <GmapMarker
                        v-if="isActiveRestaurant"
                        :position="{
                            lat: parseFloat(this.activeRestaurant.latitude),
                            lng: parseFloat(this.activeRestaurant.longitude)
                        }"
                    />
                </GmapMap>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            keyword: "",
            restaurants: [],
            latLng: null,
            infoWindowOptions: {
                pixelOffset: {
                    width: 0,
                    height: -35
                }
            },
            activeRestaurant: {},
            infoWindowOpened: false,
            markers: [],
            isActiveRestaurant: false
        };
    },
    created() {
        this.getRestaurants();
    },
    methods: {
        getRestaurants() {
            axios
                .get("/api/restaurants")
                .then(response => (this.restaurants = response.data))
                .catch(error => console.error(error));
        },
        getPosition(restaurant) {
            return {
                lat: parseFloat(restaurant.latitude),
                lng: parseFloat(restaurant.longitude)
            };
        },
        handleMarkerClicked(restaurant) {
            this.activeRestaurant = restaurant;
            this.infoWindowOpened = true;
        },
        handleInfoWindowClose() {
            this.activeRestaurant = {};
            this.infoWindowOpened = false;
            this.isActiveRestaurant = false;
            this.keyword = "";
        },
        setMapCenter(lat, lng) {
            this.mapCenter = {
                lat: parseFloat(lat),
                lng: parseFloat(lng)
            };
        },
        setView(place) {
            console.log(place);
            this.infoWindowOpened = true;
            this.isActiveRestaurant = true;
            this.activeRestaurant = {
                place_id: place.place_id,
                name: place.name,
                address: place.address,
                tel: place.tel,
                latitude: place.latitude,
                longitude: place.longitude,
                is_open: place.is_open,
                rating: parseInt(place.rating),
                icon: place.icon
            };
        },
        setPlace(place) {
            console.log(place);
            this.infoWindowOpened = true;
            this.isActiveRestaurant = true;
            this.activeRestaurant = {
                place_id: place.place_id,
                name: place.name,
                address: place.formatted_address,
                tel: place.formatted_phone_number
                    ? place.formatted_phone_number
                    : "-",
                latitude: place.geometry?.location?.lat(),
                longitude: place.geometry?.location?.lng(),
                is_open: place.opening_hours ? place.opening_hours.isOpen() : 0,
                rating: parseInt(place.rating),
                icon: place.icon
            };
        },
        onClickAdd(place_id) {
            if (this.activeRestaurant) {
                if (this.restaurants.find(item => item.place_id === place_id)) {
                    alert("ร้านนี้ได้ปักหมุดไปแล้ว");
                } else {
                    axios
                        .post("/api/restaurants", this.activeRestaurant)
                        .then(response => {
                            alert("ปักหมุดเรียบร้อย");
                            this.restaurants.push(this.activeRestaurant);
                        })
                        .catch(error => console.error(error));
                }
            }
        }
    },
    computed: {
        mapCenter() {
            if (!this.activeRestaurant.length) {
                return {
                    lat: 13.803071,
                    lng: 100.5370008
                };
            }

            return {
                lat: parseFloat(this.activeRestaurant.latitude),
                lng: parseFloat(this.activeRestaurant.longitude)
            };
        },
        infoWindowPosition() {
            return {
                lat: parseFloat(this.activeRestaurant.latitude),
                lng: parseFloat(this.activeRestaurant.longitude)
            };
        }
    }
};
</script>

<style scoped>
.con-div {
    width: 100vw;
    height: 100vh;
}
.card-item:hover {
    cursor: pointer;
    background-color: rgba(170, 170, 170, 0.164);
}
.card {
    border-radius: 0;
}
.form-control {
    box-shadow: unset;
}
.google-map {
    width: 100%;
    height: 100%;
    /* border: 2px solid #000; */
}
.title {
    font-size: 24px;
    border-bottom: 1px solid #000;
    margin-bottom: 1rem;
}
.box-item {
    height: calc(100vh - 142px);
    overflow: scroll;
}
</style>
