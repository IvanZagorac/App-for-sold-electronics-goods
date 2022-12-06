import {useParams} from "react-router-dom";
import {Card, Container} from "react-bootstrap";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faListAlt} from "@fortawesome/free-solid-svg-icons";
import React from "react";

function CategoryPage (){
    let { cId }=useParams();

    return(
<Container>
    <Card>
        <Card.Body>
            <Card.Title>
                <FontAwesomeIcon icon={faListAlt}></FontAwesomeIcon>
                category {cId}
            </Card.Title>
            <Card.Text>
                Category show
            </Card.Text>
        </Card.Body>
    </Card>

</Container>
)

}

export  default CategoryPage;
