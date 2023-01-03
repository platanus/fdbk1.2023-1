import { computed } from 'vue';
import type { Tag } from 'api/tags';

let colors = ['gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan',
  'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'];

const colorsCopy = [...colors];

function randomItem(arr: Array<string>) {
  return arr.splice((Math.random() * arr.length), 1)[0];
}

export default function giveTagsColor(tags : Tag[]) {
  function resetColors() {
    colors = [...colorsCopy];

    return randomItem(colors);
  }

  const tagsColor = computed(() => tags.map(tag => ({
    ...tag,
    color: colors.length > 0 ? randomItem(colors) : resetColors(),
  })));

  return tagsColor;
}
