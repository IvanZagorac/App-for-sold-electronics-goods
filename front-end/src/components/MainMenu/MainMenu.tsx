import { Col,  Nav, NavLink, Row} from "react-bootstrap";
import React from "react";
import Cart from "../Cart/Cart";

export class MainMenuItem{
    text:string='';
    link:string='';
    constructor(text:string,link:string ) {
    this.text=text;
    this.link=link;
    }
}


interface MainMenuProperties{
    items:MainMenuItem[];
    showCart?:boolean;
}

const makeNavLink=(item:MainMenuItem)=>{
     const handleLogOut = () => {
    // Brišemo token iz lokalne pohrane
    localStorage.removeItem('api_tokenuser');
    localStorage.removeItem('alreadyLoaded');
    localStorage.removeItem('api_refresh_tokenuser');
    localStorage.removeItem('api_tokenadministrator');
    localStorage.removeItem('api_refresh_tokenadministrator');
    localStorage.removeItem('api_identityadministrator')


};
    return(
        <NavLink className="linkovi" href={item.link} onClick={item.text === 'Log Out' ? handleLogOut : undefined}>
            {item.text}
        </NavLink>
    );
}

function MainMenuPage (mainMenu:MainMenuProperties){
    return(
            <Nav className="navigacija" variant="tabs">
                <Row>
                    <Col className="disp-flex" xs="10" sm="10" md="10" lg="10">
                    {mainMenu.items.map(makeNavLink)}
                    </Col>
                    <Col xs="2" sm="2" md="2" lg="2">
                        {mainMenu.showCart ? <Cart/> : '' }

                    </Col>
                </Row>
            </Nav>
    )

}

export default MainMenuPage;
