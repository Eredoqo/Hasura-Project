import './App.css';

import {useEffect, useState} from 'react';

import axios from 'axios';



function App() {

  const [rooms, setRooms] = useState([]);



  useEffect(() => {

    axios

      .get(

        "https://8080-eredoqo-hasuraproject-zfvtua812rj.ws-eu47.gitpod.io/api/rest/messages"

      )

      .then((res) => {

        console.log(res.data.messages);

        setRooms(res.data.messages);

      });

  }, []);

  return (

    <div className="App">

      <center>

      <h1>Chatroom Details</h1>

      <thead>
          <tr>
            <th style={{ border: "2px solid black" }}>ID</th>
            <th style={{ border: "2px solid black" }}>User_ID</th>
            <th style={{ border: "2px solid black" }}>Room_Id</th>
            <th style={{ border: "2px solid black" }}>Message</th>
            <th style={{ border: "2px solid black" }}>Created at</th>
          </tr>
        </thead>

      <tbody>

        {rooms.map((room) => (

          <tr key={room.id}>

            <td style={{ border: "2px solid black" }}>

              ID: {room.id}

            </td>

            <td style={{ border: "2px solid black" }}>

            User_ID{room.user_id}

            </td>
            <td style={{ border: "2px solid black" }}>

            Room_Id{room.room_id}

            </td>
            <td style={{ border: "2px solid black" }}>

            Message {room.message}

            </td>
            <td style={{ border: "2px solid black" }}>

            Created at {room.created_at}

              </td>

          </tr>

        ))}

      </tbody>

      </center>

    </div>

  );

}

export default App;

