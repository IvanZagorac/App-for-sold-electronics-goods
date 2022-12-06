import { useNavigate, } from "react-router-dom";
import {Alert, Button, Card, Col, Container, Form} from "react-bootstrap";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faSignIn} from "@fortawesome/free-solid-svg-icons";
import React,{useState} from "react";
import api, {ApiResponse, saveRefreshToken, saveToken} from "../../api/api";




function UserLoginPage (){
    const [email,setEmail]=useState<string >('');
    const [password,setPassword]=useState<string>('');
    const [errorMessage,setErrorMessage]=useState<string>('');
    const [isLoggedIn,setIsLoggedIn]=useState<boolean>(false);
    const navigate=useNavigate()


    const doLogin=()=>{
        api(
            'auth/user/login',
            'POST',
            {email,password})
            .then((res:ApiResponse)=>{
                if(res.status==='error'){
                    console.log(res.data)
                    return;
                }

                if(res.status==='ok'){
                    if(res.data.statusCode!==undefined){
                        let message:any={errorMessage}
                        switch (res.data.statusCode){
                            case -3001:message='Bad e-mail!';break;
                            case -3002:message='Bad password';break;

                        }
                        setErrorMessage(message);
                        return;
                    }
                    saveToken(res.data.token);
                    saveRefreshToken(res.data.refreshToken)

                    setIsLoggedIn(true);

                    navigate("/", {
                        replace: true,
                    });
                }

            });

    }




    return(

        <Container>
            <Col md={{span:6,offset:3}}>
                <Card>
                    <Card.Body>
                        <Card.Title>
                            <FontAwesomeIcon icon={faSignIn}></FontAwesomeIcon>
                            User Login
                        </Card.Title>
                            <Form>
                                <Form.Group>
                                    <Form.Label htmlFor="email"> E-mail:</Form.Label>
                                    <Form.Control
                                        type="email"
                                        id="email"
                                        value={email}
                                        onChange={event=>setEmail(event.target.value)}
                                    />
                                </Form.Group>
                                <Form.Group>
                                    <Form.Label htmlFor="password">Password</Form.Label>
                                    <Form.Control
                                        type="password"
                                        id="password"
                                        value={password}
                                        onChange={event=>setPassword(event.target.value)}

                                    />
                                </Form.Group>
                                <Form.Group>
                                    <Button onClick={()=>doLogin()} variant="primary"> Log in</Button>
                                </Form.Group>

                            </Form>
                        <Alert variant="danger" className={errorMessage ? '' : 'd-none'}>{errorMessage}</Alert>
                    </Card.Body>
                </Card>
            </Col>


        </Container>
    )


}

export default UserLoginPage;
