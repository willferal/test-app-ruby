import { Controller } from "@hotwired/stimulus";
import $ from 'jquery';
import 'jquery-mask-plugin';

// Connects to data-controller="mask"
export default class extends Controller {
  connect() {
    this.maskFields();
  }
  
  maskFields() {
    $('[data-mask-target="cpf"]').mask('000.000.000-00');
    $('[data-mask-target="cnpj"]').mask('00.000.000/0000-00');
  }
}
