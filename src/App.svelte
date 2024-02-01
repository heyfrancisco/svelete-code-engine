<script>
  import TodoItem from "./TodoItem.svelte";
  let todos = [];
  let newTodo = "";

  function randomId(length = 10) {
    return Math.random()
      .toString(36)
      .substring(2, length + 2);
  }

  function addTodo() {
    if (newTodo.trim()) {
      todos = [...todos, { id: randomId(), text: newTodo, done: false }];
      newTodo = "";
    }
  }

  function deleteTodo(id) {
    todos = todos.filter((todo) => todo.id !== id);
  }
</script>

<main>
  <h1>TODO</h1>
  <input
    bind:value={newTodo}
    on:keyup={(e) => e.key === "Enter" && addTodo()}
  />
  <button on:click={addTodo}>Add</button>
  <ul>
    {#each todos as todo}
      <TodoItem {todo} {deleteTodo} />
    {/each}
  </ul>
</main>

<style>
  main {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    background-color: #f7f7f7;
    color: #333;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
      "Helvetica Neue", Arial, sans-serif;
    text-align: center;
    padding: 20px;
  }

  h1 {
    font-size: 2em;
    margin-bottom: 20px;
  }

  input,
  button {
    padding: 10px;
    margin: 5px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 1em;
  }

  ul {
    list-style: none;
    padding: 0;
  }
</style>
