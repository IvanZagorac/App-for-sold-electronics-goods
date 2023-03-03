
import {Button, Card, Col, FormControl, FormGroup, Row} from "react-bootstrap";
import React, {useState} from "react";
import {apiConfig} from "../../config/api.config";
import {Link} from "react-router-dom";
import ArticleType from "../../types/ArticleType";
import api, {ApiResponse} from "../../api/api";



function SingleArticlePreview (article:ArticleType){
    const[quantity,setQuantity]=useState<number>(1);
    const [ error, setError ] = useState<string>("");

    const refreshPage=()=>{
        window.location.reload();
    }

    const addToCart=()=>{
        const bodyData={
            articleId:article.articleId,
            quantity:quantity
        }

        api("api/user/cart/addToCart","POST",bodyData)
            .then((res:ApiResponse) => {
                if (res.status !== "ok") {
                    throw new Error("Could not add this item!");
                }
                window.alert("Artikl uspjesno dodan u kosaricu")
               refreshPage();
                console.log(res.data)
                return res.data;

            })
            .catch(e => {
                setError(e?.message);

                setTimeout(() => {
                    setError("");
                }, 5000);
            });
    }

    return(
        <Col md="4" sm="6" xs="12">
            <Card className="mb-3">
                <Card.Header>
                    <img className="w-100" alt={article.name}
                         src={apiConfig.PHOTO_PATH+article.imageUrl}/>
                </Card.Header>
                <Card.Body>
                    <Card.Title as="p">
                        <strong>{article.name}</strong>
                    </Card.Title>
                    <Card.Text>
                        {article.excerpt}
                    </Card.Text>
                    <Card.Text>
                        Price:{Number(article.price).toFixed(2)}EUR
                    </Card.Text>
                    <FormGroup>
                        <Row>
                            <Col xs="7">
                                <FormControl
                                    type="number"
                                    min="1" step="1" value={quantity}
                                    onChange={event=>setQuantity(Number(event.target.value))}
                                ></FormControl>
                            </Col>
                            <Col xs="5">
                                <Button variant="btn btn-block btn-secondary"   onClick={addToCart}>Buy</Button>
                            </Col>
                        </Row>
                    </FormGroup>
                    <button className="gumb" onClick={refreshPage}>
                        <Link to={`/article/${article.articleId}`}
                              className="btn btn-primary btn-block btn-sm">
                            Open article page
                        </Link>
                    </button>
                </Card.Body>
            </Card>
        </Col>
    )

}

export default SingleArticlePreview;
