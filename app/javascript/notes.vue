<template>
  <div>
    <ul v-for="note of notes" :key="note.id">
      <li>{{ note.title }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      notes: []
    };
  },
  mounted() {
    fetch("/api/v1/notes")
      .then(response => response.json())
      .then(data => {
        this.notes = data;
      });
  }
};
</script>

