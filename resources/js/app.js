require("./bootstrap");

window.Vue = require("vue").default;

Vue.component("app", require("./layout/App.vue").default);

import { BootstrapVue, BootstrapVueIcons } from "bootstrap-vue";
Vue.use(BootstrapVue);
Vue.use(BootstrapVueIcons);

import * as VueGoogleMaps from "vue2-google-maps";

Vue.use(VueGoogleMaps, {
    load: {
        key: "AIzaSyDNkMQQI-5MB2iN5dSqcGmqi4ozv0qFLZ8",
        libraries: "places",
        v: 3.38,
    },
});

const app = new Vue({
    el: "#app",
});
