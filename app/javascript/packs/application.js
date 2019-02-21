import "bootstrap";
import 'slick-carousel'
import 'slick-carousel/slick/slick.scss'
import 'slick-carousel/slick/slick-theme.scss'


import { sweetAlert } from '../plugins/sweetalert'

sweetAlert()

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import {initAutocomplete} from '../plugins/init_autocomplete';

initAutocomplete();

// $(document).ready(function(){
//   $('.slider').slick({
//     setting-name: setting-value
//   });
// });
import {slick} from '../plugins/slicker';
slick();
