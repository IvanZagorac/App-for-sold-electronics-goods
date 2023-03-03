import React, {useEffect, useState} from 'react';
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {Card, Container, Row} from 'react-bootstrap'
import {faHome} from '@fortawesome/free-solid-svg-icons';
import {Link, useNavigate} from "react-router-dom";
import api, {ApiResponse, getIdentity} from "../../api/api";
import RoledMainMenu from "../RoledMainMenu/RoledMainMenu";


function AdministratorDashboard() {
    const[isAdministratorLogin,setIsAdministratorLogin]=useState<boolean>(true);
    const navigate=useNavigate()

    const getLoginData=()=>{
        const username=getIdentity("administrator");
        api('api/administrator/'+username,"GET",{},"administrator")
            .then((res:ApiResponse)=>{
                if(res.status==="error"|| res.status==='login'){
                    setIsAdministratorLogin(false);
                    return;
                }


            })
    }

    useEffect( () => {
        getLoginData();
    }, []);

    if(!isAdministratorLogin){
        navigate('administrator/login')
    }



    return (
        <Container>
            <RoledMainMenu role="administrator"/>
            <Card>
                <Card.Body>
                    <Card.Title>
                        <FontAwesomeIcon icon={faHome}></FontAwesomeIcon>
                        Administrator Dashboard
                    </Card.Title>
                    <Row>
                        <ul>
                            <li>
                                <Link to="/administrator/dashboard/category">Categories</Link>
                                <Link to="/administrator/dashboard/article">Articles</Link>
                            </li>
                        </ul>
                    </Row>

                </Card.Body>
            </Card>

        </Container>
    );
}

export default AdministratorDashboard;
