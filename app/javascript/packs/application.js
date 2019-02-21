import "bootstrap";
import slick from 'slick-carousel'

import { sweetAlert } from '../plugins/sweetalert'

sweetAlert()

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
