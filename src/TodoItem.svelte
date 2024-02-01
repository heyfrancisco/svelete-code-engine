<script>
  export let todo;
  export let deleteTodo; // Remove the default empty function
</script>

<li>
  {todo.text} ({todo.id})
  <button on:click={() => deleteTodo(todo.id)}>Delete</button>
</li>

<style>
  li {
    margin: 10px 0;
    padding: 10px;
    background-color: white;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  button {
    margin: 5px;
    padding: 5px 10px;
    border-radius: 5px;
    border: none;
    background-color: #007aff;
    color: white;
    cursor: pointer;
  }

  button:hover {
    background-color: #0056b3;
  }
</style>
