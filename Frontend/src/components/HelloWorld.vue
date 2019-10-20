<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <p>
      To view the API documentation for seriousandprogamers.com visit
      <a href="https://api.seriousandprogamers.com" target="_blank" rel="noopener">https://api.seriousandprogamers.com</a>.
    </p>
    <h3>Press the button to test the API</h3>
    <button v-on:click="ping()">Ping</button>
    <p>Response: {{ pingResponse }}</p>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "HelloWorld",
  props: {
    msg: String
  },
  data() {
    return {
      pingResponse: "",
      environment: "https://api.seriousandprogamers.com/v1"
    };
  },
  methods: {
    ping() {
      axios
        .get(this.environment + "/ping")
        .then(response => (this.pingResponse = response.data));
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
