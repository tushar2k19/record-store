<template>
  <div class="center-panel" v-if="conversation"><br><br>
    <div class="chat-header">
      <h3>Conversation with {{ conversation.name }}</h3>
    </div>
    <div class="chat-history-container" ref="chatHistory">
      <div class="chat-message" v-for="message in messages" :key="message.id">
        <div class="message-sender">
          <span>{{ message.senderName || 'Unknown' }}</span>
          <span class="message-time">{{ message.sentAt }}</span>
        </div>
        <p class="message-content">{{ message.content }}</p>
      </div>
    </div>
    <div class="message-composer" style="margin-top: -20px">
      <textarea class="chat-area" v-model="newMessage" :maxlength="300" placeholder="Type your message..." @keyup.enter="handleSendMessage"></textarea>
      <button class="button" v-disabled="!newMessage || newMessage.length === 0" @click="handleSendMessage">Send</button>
      <span v-if="newMessage.length > 300" class="error-message">Message exceeds character limit (300 characters)</span>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    conversation: Object,
  },
  data() {
    return {
      newMessage: '',
      messages: [],
      conv_id: -1,
      temp_msg: '',
    };
  },
  mounted() {
    this.fetchMessages();
    this.$nextTick(() => {
      this.$refs.chatHistory.scrollTop = this.$refs.chatHistory.scrollHeight;
    });
  },
  updated(){
      this.$refs.chatHistory.scrollTop = this.$refs.chatHistory.scrollHeight;
  },
  watch: {
    conversation: {
      handler(newVal, oldVal) {
        this.fetchMessages();
      },
      deep: true,
      immediate: true,
    },
    messages: {
      handler() {
        this.scrollToBottom();
      },
      deep: true,
    },
  },
  methods: {
    fetchMessages() {
      this.newMessage = '';
      this.$http.secured.get('/conversation_messages',
        {
          params: {
            conversation_id: this.conversation.id
          }
        })
        .then(response => {
          this.messages = response.data.messages
        });
    },
     handleSendMessage() {
      this.temp_msg = this.newMessage
       this.newMessage = ''
      this.$http.secured.post('/conversation_messages/send',
        {
            conversation_id: this.conversation.id,
            message: this.temp_msg
        })
        .then( response => {
           this.fetchMessages();
          alert("Message Sent!!");
        }).catch(e=>{
        this.newMessage = '';
          alert("OOPS!! Something Went Wrong.")
      });
    },
    scrollToBottom(){
      this.$refs.chatHistory.scrollTop = this.$refs.chatHistory.scrollHeight;
    }
  },
};
</script>

<!--<style scoped>-->
<!--.chat-history {-->
<!--  height: calc(100vh - 150px); /* Adjust height as needed */-->
<!--  overflow-y: auto; /* Enable scrolling for long conversation history */-->
<!--}-->

<!--.message-composer {-->
<!--  display: flex;-->
<!--  align-items: center;-->
<!--}-->

<!--.textarea {-->
<!--  flex: 1; /* Allow textarea to grow horizontally */-->
<!--  padding: 10px;-->
<!--  border: 1px solid #ccc;-->
<!--  border-radius: 4px;-->
<!--}-->

<!--.message-time {-->
<!--  font-size: 0.8em;-->
<!--  color: #aaa;-->
<!--}-->

<!--.error-message {-->
<!--  color: red;-->
<!--  font-size: 0.8em;-->
<!--  margin-top: 5px;-->
<!--}-->
<!--.center-panel {-->
<!--  padding: 1rem;-->
<!--  border-radius: 4px;-->
<!--  background-color: #f5f5f5;-->
<!--}-->

<!--.chat-header {-->
<!--  padding-bottom: 1rem;-->
<!--  border-bottom: 1px solid #eee;-->
<!--}-->

<!--.chat-history-container {-->
<!--  height: calc(100vh - 250px); /* Adjusted height for header and composer */-->
<!--  overflow-y: auto; /* Enable scrolling for long conversation history */-->
<!--}-->

<!--.chat-message {-->
<!--  display: flex; /* Messages displayed horizontally */-->
<!--  flex-direction: column; /* Stack sender and content vertically */-->
<!--  padding: 1rem;-->
<!--  border-bottom: 1px solid #eee;-->
<!--  margin-bottom: 0.5rem; /* Spacing between messages */-->
<!--  background-color: #fff; /* Lighter background for messages */-->
<!--  border-radius: 4px; /* Rounded corners for messages */-->
<!--}-->

<!--.message-sender {-->
<!--  display: flex;-->
<!--  align-items: center;-->
<!--  color: #aaa; /* Subdued color for sender and time */-->
<!--}-->

<!--.message-time {-->
<!--  margin-left: 1rem;-->
<!--}-->

<!--.message-content {-->
<!--  font-size: 0.9rem;-->
<!--  line-height: 1.5;-->
<!--}-->

<!--.message-composer {-->
<!--  display: flex;-->
<!--  align-items: center;-->
<!--}-->

<!--.textarea {-->
<!--  flex: 1; /* Allow textarea to grow horizontally */-->
<!--  padding: 10px;-->
<!--  border: 1px solid #ccc;-->
<!--  border-radius: 4px;-->
<!--}-->

<!--.error-message {-->
<!--  color: red;-->
<!--  font-size: 0.8em;-->
<!--  margin-top: 5px;-->
<!--}-->
<!--</style>-->

<style scoped>
.chat-history {
  height: calc(100vh - 150px); /* Adjust height as needed */
  overflow-y: auto; /* Enable scrolling for long conversation history */
}

.message-composer {
  display: flex;
  align-items: center;
  padding: 50px;
  width: 75%;
}

.textarea {
  flex: 1; /* Allow textarea to grow horizontally */
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.message-time {
  font-size: 0.8em;
  color: #aaa;
}

.error-message {
  color: red;
  font-size: 0.8em;
  margin-top: 5px;
}
.center-panel {
  padding: 1rem;
  border-radius: 4px;
  background-color: #f5f5f5;
}

.chat-header {
  padding-bottom: 1rem;
  border-bottom: 1px solid #eee;
}

.chat-history-container {
  height: calc(100vh - 250px); /* Adjusted height for header and composer */
  overflow-y: auto; /* Enable scrolling for long conversation history */
}

.chat-message {
  display: flex; /* Messages displayed horizontally */
  flex-direction: column; /* Stack sender and content vertically */
  padding: 1rem;
  border-bottom: 1px solid #eee;
  margin-bottom: 0.5rem; /* Spacing between messages */
  background-color: #fff; /* Lighter background for messages */
  border-radius: 4px; /* Rounded corners for messages */
}

.message-sender {
  display: flex;
  align-items: center;
  color: #aaa; /* Subdued color for sender and time */
}

.message-time {
  margin-left: 1rem;
}

.message-content {
  font-size: 0.9rem;
  line-height: 1.5;
}

.message-composer {
  display: flex;
  align-items: center;
}

.textarea {
  flex: 1; /* Allow textarea to grow horizontally */
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.chat-card{
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add box shadow */
  padding: 20px;
  width: 300px;
}

.error-message {
  color: red;
  font-size: 0.8em;
  margin-top: 5px;
}
.chat-area {
  width: calc(100% - 100px);
  margin-right: 15px;
}
.chat-area::placeholder {
  font-size: 16px; /* Adjust the font size as needed */
}
.button {
  appearance: none;
  outline: none;
  border: none;
  background: none;
  cursor: pointer;

  display: inline-block;
  padding: 15px 25px;
  background-image: linear-gradient(to right, #2c6df8, #51a0fa);
  border-radius: 8px;

  color: #FFF;
  font-size: 18px;
  font-weight: 700;

  box-shadow: 3px 3px rgba(0, 0, 0, 0.4);
  transition: 0.4s ease-out;

  &:hover {
    box-shadow: 6px 6px rgba(0, 0, 0, 0.6);
  }
}
</style>
