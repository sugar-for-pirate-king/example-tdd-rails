<template>
  <div>
    <h4>Add Note</h4>
    <p v-if="message">{{ message }}</p>
    <form>
      <p>
        <label for="note_title">Title</label>
        <input type="text" id="note_title" v-model="note.title">
      </p>
      <p>
        <label for="note_body">Body</label>
        <input type="text" id="note_body" v-model="note.body">
      </p>
      <p>
        <button @click.prevent="create()">Submit</button>
      </p>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: null,
      note: {
        title: "",
        body: ""
      }
    };
  },
  methods: {
    create() {
      let csrf_token_dom = document.querySelector('meta[name="csrf-token"]');
      let csrf_token = "";
      if (csrf_token_dom) {
        csrf_token = csrf_token_dom.content;
      }

      let request = new Request("/api/v1/notes", {
        method: "POST",
        headers: {
          "Content-type": "application/json",
          "X-CSRF-Token": csrf_token
        },
        body: JSON.stringify(this.note)
      });

      fetch(request)
        .then(response => response.json())
        .then(data => {
          if (data.success == true) {
            this.message = data.message;
            this.note.title = "";
            this.note.body = "";
          } else {
            this.message = data.message;
          }
        });
    }
  }
};
</script>

