import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  static targets = ["id"];

  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this),
    });
  }

  end(event) {
    let url = this.element.dataset.dragUrl;
    let data = new FormData();
    let id = event.item.dataset.id;
    data.append("position", event.newIndex + 1);

    fetch(url.replace(":id", id), {
      body: data,
      method: "PATCH",
      credentials: "include",
      headers: {
        "X-CSRF-Token": getMetaValue("csrf-token"),
      },
    });
  }
}

export function findElements(root, selector) {
  if (typeof root == "string") {
    selector = root;
    root = document;
  }
  const elements = root.querySelectorAll(selector);
  return toArray(elements);
}

export function findElement(root, selector) {
  if (typeof root == "string") {
    selector = root;
    root = document;
  }
  return root.querySelector(selector);
}

export function getMetaValue(name) {
  const element = findElement(document.head, `meta[name="${name}"]`);
  if (element) {
    return element.getAttribute("content");
  }
}