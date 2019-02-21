import "bootstrap";

import 'slick-carousel'
import 'slick-carousel/slick/slick.scss'
import 'slick-carousel/slick/slick-theme.scss'

import "../plugins/flatpickr";
import slick from 'slick-carousel';

import { toggleDateInputs } from "../plugins/flatpickr";

import { sweetAlert } from '../plugins/sweetalert';

sweetAlert()


import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import {initAutocomplete} from '../plugins/init_autocomplete';

initAutocomplete();

import { slicker } from '../plugins/slicker';
slicker()
toggleDateInputs();
