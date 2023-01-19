export default interface ArticleType{
    articleId:number;
    name:string;
    /*categoryId:number;
    articlePrices:{
        price:number,
        createdAt:string;
    }[];*/
    excerpt:string;
    description:string;
    imageUrl:string;
    price:number;
}