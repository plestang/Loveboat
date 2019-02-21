import "bootstrap";

import "../plugins/flatpickr";
import slick from 'slick-carousel';

import { toggleDateInputs } from "../plugins/flatpickr";

import { sweetAlert } from '../plugins/sweetalert';

sweetAlert()

toggleDateInputs();
