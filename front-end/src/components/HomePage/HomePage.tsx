import React from 'react';
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import { Container} from 'react-bootstrap'
import {faHome} from '@fortawesome/free-solid-svg-icons';



function HomePage() {
  return (
    <Container>
      <FontAwesomeIcon icon={faHome}></FontAwesomeIcon>Home
    </Container>
  );
}

export default HomePage;
