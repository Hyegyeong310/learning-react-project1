# learning-react-project1

- docker에 nvm을 까는 것부터 시작했으나...실패ㅜㅜ
  일단은 nvm install 되는 것까지만 살림.

- local에 create-react-app을 이용해서 만든 react app을 docker로 띄우는 걸로 변경

- create-react-app install<br/>
  `npm install create-react-app --global`

- react app 생성<br/>
  `create-react-app ${APP NAME}`

- react app으로 이동 및 브라우저 테스트<br>
  `cd ${APP NAME} && yarn start`

- docker image 가져오기<br>
  `docker pull hyegyeong310/react-docker-app1`

- docker 실행<br>
  `docker run -it -p ${PORT}:80 hyegyeong310/react-docker-app1`
