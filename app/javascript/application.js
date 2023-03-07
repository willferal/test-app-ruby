// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"
import LocalTime from "local-time"
import 'flowbite'
import 'alpine-turbo-drive-adapter';
import 'alpine-magic-helpers';
import 'process';
import 'alpinejs';
import "chartkick";
import Sortable from "sortablejs";
import Highcharts from "highcharts"
import * as Setup from "./custom/setup"

window.Highcharts = Highcharts
window.Setup = Setup

LocalTime.start()
