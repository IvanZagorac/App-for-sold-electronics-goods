import axios, {AxiosRequestConfig, AxiosResponse} from "axios";
import {apiConfig} from "../config/api.config";

export interface ApiResponse{
    status:'ok'|'error'|'login';
    data:any;
}





export default function api(
    path:string,
    method:'GET'|'POST'| 'PATCH'|'DELETE',
    body:any)
{


    return new Promise<ApiResponse>((resolve)=>{
        const requestData={
            method:method,
            baseURL: apiConfig.API_URL,
            url: path,
            data:body ? JSON.stringify(body) : undefined,
            headers:{
                'Content-Type':'application/json',
                'Authorization':getToken()
            },
        }
        axios(requestData)
            .then(res=> {
                console.log(requestData)
                return responseHandler(res, resolve);
                console.log("uso u axios")
            })
            .catch(async err=> {
                console.log("uso u error")
                console.log(requestData)
                console.log(err.response)
                if(err.response.status===401){
                    console.log("status 401")
                    const newToken=await refreshToken();
                    console.log(newToken)

                    if(!newToken){
                        console.log("neema refresha")
                        const response:ApiResponse={
                            status:'login',
                            data:err.response.data,
                        }
                        return resolve(response);
                    }

                    saveToken(newToken);

                    requestData.headers!.Authorization=getToken();
                    console.log(requestData.headers.Authorization=getToken())

                    return await repeatRequest(requestData,resolve)
                }

                const response:ApiResponse={
                    status:'error',
                    data:err
                }
                 resolve(response)


            });
    });

}


async function responseHandler(
    res: AxiosResponse<any>,
    resolve: (value: ApiResponse | PromiseLike<ApiResponse>) => void)
{
    if(res.status<200|| res.status>=300){
        console.log("status manji od 200 ili veci od 300")
        const response:ApiResponse={
            status:'error',
            data:res.data,
        }

        return resolve(response);
    }
    let response:ApiResponse;
    if(res.data.statusCode()<0){
        console.log("status code manji do 0")
        response={
            status:'login',
            data:null
        }

    }else {
        console.log("status oke")
        response = {
            status: 'ok',
            data: res.data,
        };
    }


    return resolve(response);
}



function getToken():string{
    const token=localStorage.getItem('api_token');

    return 'Bearer ' +token;
}


export function saveToken(token:string){
    localStorage.setItem('api_token',token);
}


function getRefreshToken():string{
    const refreshToken=localStorage.getItem('api_refresh_token');

    return refreshToken+'';
}


export function saveRefreshToken(refreshToken:string){
    localStorage.setItem('api_refresh_token',refreshToken);
}



async function refreshToken():Promise<string|null>{
    const path='auth/user/refresh';
    const data={
        token:getRefreshToken()
    }
    console.log(data)
    const refreshTokenData:AxiosRequestConfig= {
        method: 'POST',
        url: apiConfig.API_URL + path,
        data: JSON.stringify(data),
        headers: {
            'Content-Type': 'application/json',
        },
    };

    const refreshTokenResponse:{data:{token:string|undefined}}=await axios(refreshTokenData)

    if(!refreshTokenResponse.data.token){
        console.log("ne postoji token iz")
        return null;
    }

    console.log(refreshTokenResponse.data.token)

    return refreshTokenResponse.data.token
}


async function repeatRequest(
    requestData:AxiosRequestConfig,
    resolve:(value:ApiResponse| PromiseLike<ApiResponse>)=>void
){
    axios(requestData)
        .then(res=>{
            let response:ApiResponse;
            if(res.status===401){
                response={
                    status:'login',
                    data:null,
                }
                return resolve(response);

            }else{
                response={
                    status:'ok',
                    data:res,
                }
            }

            return resolve(response)
        })
        .catch(err=>{
            const response:ApiResponse={
                status:'error',
                data:err,
            };
            return resolve(response)
        })
}