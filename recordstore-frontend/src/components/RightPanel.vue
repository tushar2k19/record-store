<!--<template>-->
<!--  <div class="right-panel" v-if="conversation">-->
<!--    <h3>Notes for {{ conversation.name }}</h3>-->
<!--    <div class="notes-section">-->
<!--      <textarea v-model="newNote" placeholder="Add notes..."></textarea>-->
<!--      <button v-disabled="!newNote" @click="handleAddNote">Save</button>-->
<!--    </div>-->
<!--    <h3>Existing Notes</h3>-->
<!--    <div class="notes-container" v-if="notes.length > 0">-->
<!--      <div class="notes-list">-->
<!--        <div class="note-item" v-for="note in notes" :key="note.id">-->
<!--          <p class="note-content">{{ note.content }}</p>-->
<!--          <span class="note-time">{{ note.createdAt }}</span>-->
<!--        </div>-->
<!--      </div>-->
<!--    </div>-->
<!--    <p v-if="!notes.length">No notes found.</p>-->
<!--  </div>-->
<!--</template>-->
<template>
  <div class="right-panel" v-if="conversation">
    <h3>Notes for {{ conversation.name }}</h3>
    <div class="notes-section">
      <textarea class = "add-notes-area" v-model="newNote" placeholder="Add notes..."></textarea>
      <button class="button" v-disabled="!newNote" @click="handleAddNote">Save</button>
    </div>
    <h3>Existing Notes</h3>
    <div class="notes-container" v-if="notes.length > 0">
      <div class="notes-list">
        <div class="note-item" v-for="note in notes" :key="note.id">
          <p class="note-content">{{ note.content }}</p>
          <span class="note-time">{{ note.createdAt }}</span>
        </div>
      </div>
    </div>
    <p v-if="!notes.length">No notes found.</p>
  </div>
</template>

<script>
export default {
  props: {
    conversation: Object,
  },
  data() {
    return {
      newNote: '',
      notes: [],
    };
  },
  mounted() {
    console.log("inside right panel", this.conversation.id)
     this.fetchNotes(this.conversation.id);
  },
  watch: {
    conversation: {
      handler(newVal, oldVal) {
        this.fetchNotes();
      },
      deep: true,
      immediate: true,
    },
  },

  methods: {
    async fetchNotes(conversationId) {
      this.$http.secured.get('/notes',
        {
          params: {
            conversation_id: this.conversation.id
          }
        })
        .then(response => {
          console.log( this.conversation.id, response.data.data)
          this.notes = response.data.data.reverse();
        });
    },
    handleAddNote() {
      this.$http.secured.post('/new_note', {
        conversation_id: this.conversation.id,
        note: this.newNote
      })
        .then(response => {
          alert("Note Saved");
          this.newNote = '';
          this.fetchNotes(this.conversation.id);
        });
    },
  },
};
</script>

<!--<style scoped>-->
<!--.right-panel {-->
<!--  padding: 1rem;-->
<!--  border-radius: 4px;-->
<!--  background-color: #f5f5f5;-->
<!--}-->

<!--.notes-section {-->
<!--  display: flex;-->
<!--  align-items: center;-->
<!--  margin-bottom: 1rem;-->
<!--}-->

<!--.textarea {-->
<!--  flex: 1; /* Allow textarea to grow horizontally */-->
<!--  padding: 10px;-->
<!--  border: 1px solid #ccc;-->
<!--  border-radius: 4px;-->
<!--}-->

<!--.notes-container {-->
<!--  height: calc(100vh - 200px); /* Adjusted height based on content */-->
<!--  overflow-y: auto; /* Enable scrolling */-->
<!--}-->

<!--.notes-list {-->
<!--  margin: 0;-->
<!--  padding: 0;-->
<!--  list-style: none; /* Remove bullet points */-->
<!--}-->

<!--.note-item {-->
<!--  display: flex;-->
<!--  flex-direction: column; /* Stack content and time vertically */-->
<!--  padding: 1rem;-->
<!--  border-bottom: 1px solid #eee;-->
<!--  margin-bottom: 0.5rem; /* Spacing between notes */-->
<!--  background-color: #fff; /* Lighter background for notes */-->
<!--  border-radius: 4px; /* Rounded corners for notes */-->
<!--}-->

<!--.note-content {-->
<!--  font-size: 0.9rem;-->
<!--  line-height: 1.5;-->
<!--}-->

<!--.note-time {-->
<!--  font-size: 0.8em;-->
<!--  color: #aaa; /* Subdued color for time */-->
<!--}-->
<!--</style>-->

<style scoped>
.right-panel {
  padding: 1rem;
  border-radius: 4px;
  background-color: #f5f5f5;
}

.button {
  margin-top: 15px;
  padding: 8px 16px;
  border: 1px solid #ddd;
  background-image: linear-gradient(to right, #2c6df8, #51a0fa);
  color: #FFFF;
  cursor: pointer;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.notes-section {
  display: flex;
  align-items: center;
  margin-bottom: 1rem;
}
.add-notes-area{
  width: calc(100% - 100px);
  margin-right: 15px;
  margin-top: 15px;
}

.textarea {
  flex: 1; /* Allow textarea to grow horizontally */
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.notes-container {
  height: calc(100vh - 200px); /* Adjusted height based on content */
  overflow-y: auto; /* Enable scrolling */
}

.notes-list {
  margin: 0;
  padding: 0;
  list-style: none; /* Remove bullet points */
}

.note-item {
  display: flex;
  flex-direction: column; /* Stack content and time vertically */
  padding: 1rem;
  border-bottom: 1px solid #eee;
  margin-bottom: 0.5rem; /* Spacing between notes */
  background-color: #fff; /* Lighter background for notes */
  border-radius: 4px; /* Rounded corners for notes */
}

.note-content {
  font-size: 0.9rem;
  line-height: 1.5;
}

.note-time {
  font-size: 0.8em;
  color: #aaa; /* Subdued color for time */
}
</style>
