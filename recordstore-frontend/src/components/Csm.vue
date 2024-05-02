<template>
  <div class="csm-container" style="display: flex; flex-direction: row; ">
    <div v-if="!selectedConversation" style="width: 330px; border: white solid 1px; margin-top: 6px; margin-left:2px">
      <br><br>
      <LeftPanel @conversation-selected="handleConversationSelected" />
    </div>
    <div v-else style="flex: 1; display: flex; flex-direction: row; background-color: #E6F2FF">
      <LeftPanel @conversation-selected="handleConversationSelected" style="flex: 0 0 25%; border: white 1px;" />
      <CenterPanel v-if="selectedConversation" :conversation="selectedConversation" style="flex: 1; border: white 1px" />
      <RightPanel v-if="selectedConversation" :conversation="selectedConversation" style="flex: 0 0 25%; border: white 1px" />
    </div>
  </div>
</template>

<script>
import LeftPanel from './LeftPanel.vue';
import CenterPanel from './CenterPanel.vue';
import RightPanel from './RightPanel.vue';

export default {
  name: 'Csm',
  components: { LeftPanel, CenterPanel, RightPanel },
  data() {
    return {
      selectedConversation: null,
    };
  },
  methods: {
    async handleConversationSelected(conversation) {
      this.selectedConversation = conversation;
    },
  },
};
</script>

<style>

</style>
