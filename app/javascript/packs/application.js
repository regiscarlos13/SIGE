require("@rails/ujs").start()

require("@rails/activestorage").start()
require("channels")


import $ from 'jquery'
global.$ = $
global.jQuery = $


require('data-confirm-modal')


import 'bootstrap'
import '@fortawesome/fontawesome-free/js/all'

import '../css/application'
import '../js/index'
import 'cocoon-js'
import "controllers"

require.context('../images', true, /\.(gif|jpg|png|svg)$/i)