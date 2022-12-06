import {useParams} from "react-router-dom";
import {Card, Container} from "react-bootstrap";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faContactCard} from "@fortawesome/free-solid-svg-icons";
import React from "react";

function ContactPage (){

    return(
        <Container>
            <Card>
                <Card.Body>
                    <Card.Title>
                        <FontAwesomeIcon icon={faContactCard}></FontAwesomeIcon>
                        contact
                    </Card.Title>
                    <Card.Text>
                        contact info show
                    </Card.Text>
                </Card.Body>
            </Card>

        </Container>
    )

}

export default ContactPage;
