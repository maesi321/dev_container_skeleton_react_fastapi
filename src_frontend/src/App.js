import axios from "axios";
import React from "react";

function App() {
  const [data, setData] = React.useState("nothing");

  function updateData() {
    axios.request({
      method: "get",
      baseURL: "http://localhost:8000",
      url: "/api/v1/hello"
    })
    .then((response) => setData(response.data.data))
    .catch((error) => console.log(error));
  }


  return (
    <div>
      <button onClick={updateData}>click me</button>
      <p>{data}</p>
    </div>
  );
}

export default App;
