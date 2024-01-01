<img src="https://capsule-render.vercel.app/api?type=waving&color=87CEEB&height=150&section=header" style="width:100%;" />

<h1 style="text-align:center; font-size:3em;">📚도서관 프로젝트</h1>





## 목차
- (기간)[#기간]
- (스킬)[#스킬]
- (상세)[#상세]
- (다이어그램)[#다이어그램]
- (권한)[#권한]
- (기능)[#기능]
- (문제)[#문제]
  
## 기간

23/11/27 ~ 23/12/15

## 스킬
![js](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white)
![css](https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white)
![html](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![jQuery](	https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white)
![Spring](	https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![MYSQL](	https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)


## 상세
- API : `카카오 로그인` `썸머노트` `네이버 메일전송` `카카오 우편검색`
- Language : `Java(11)` 
- Library : `Spring(5.3.23)` `Junit(4.12)` `Servlet(4.0.1)` `Spring Security`
- Database : `MySQL(8.0.35)`
- Target : `Web Browser`
- Tool : `SpringSource Tool Suite (STS) 3.9.18.RELEASE`


  

##  다이어그램

<details>
<summary  style="font-size:1.5em;">유스케이스</summary>
  <img width="1250" alt="유스케이스1" src="https://github.com/dregun1/Library_Project/assets/122992960/6b61f42f-7f61-4a0d-9978-b910c89bfd75">
  <img width="1250" alt="유스케이스2" src="https://github.com/dregun1/Library_Project/assets/122992960/eca7f834-b37e-4500-a12b-d95d1eb899a1">
  <img width="1250" alt="유스케이스3" src="https://github.com/dregun1/Library_Project/assets/122992960/54b16cbc-2e37-4edd-bcf0-37030d377b7b">
</details>
<details>
<summary  style="font-size:1.5em;">클래스다이어그램</summary>
  <img width="1250" alt="클래스1" src="https://github.com/dregun1/Library_Project/assets/122992960/ca886896-a857-410c-a1b9-73c5f5ab8b5f">
  <img width="1250" alt="클래스2" src="https://github.com/dregun1/Library_Project/assets/122992960/062ebf45-f0a1-4969-bd4e-3edbadbfe059">
  <img width="1250" alt="클래스3" src="https://github.com/dregun1/Library_Project/assets/122992960/f671e783-2ba4-4ec1-bf8e-24f4299877c6"><br>
</details>
<details>
<summary  style="font-size:1.5em;">ER다이어그램</summary>
  <img width="1250" alt="ER다이어그램" src="https://github.com/dregun1/Library_Project/assets/122992960/42da6e3a-e59f-452c-b4e5-c2a57fc68c1f">
</details>





## 권한

#### 일반 회원
- 로그인 및 소셜로그인
- 로그아웃
- 신간,인기,통합도서 조회
- 도서 검색
- 독후감 작성
- 공지사항 조회
- 예약하기
- 관심도서 등록
- 내 서재(내 관심도서, 예약도서 조회, 지난 예약도서, 대여도서 조회, 반납도서 조회) 
- 정보 수정

#### 비로그인 회원
- 공지사항 조회
- 독후감 조회
- 신간,인기,통합도서 조회
- 도서 검색

#### 관리자
- 관리자페이지 (도서등록, 도서관리, 예약관리, 대여관리, 회원권한부여)
- 공지사항 작성

## 기능

### 메인화면
<details>
<img width="1250" alt="슬라이드2" src="https://github.com/dregun1/Library_Project/assets/122992960/85306a45-b213-4e27-b704-0cc1a2f5b92c">

- 인기도서 조회
- 신간도서 조회
</details>
<br>

### 해더
<details>
  <img width="1250" alt="슬라이드3" src="https://github.com/dregun1/Library_Project/assets/122992960/24653988-a097-46df-afe1-848dd45ff76a">
  <details>
  <summary>- 검색기능</summary>
    <img width="1250" alt="슬라이드4" src="https://github.com/dregun1/Library_Project/assets/122992960/1e378153-bad4-4870-836b-0634e5bcf4e5">
  </details>
  <details>
  <summary>- 로그인</summary>
    <img width="1250" alt="슬라이드5" src="https://github.com/dregun1/Library_Project/assets/122992960/2230d439-924d-467d-a343-b991caac70d6">
    <img width="1250" alt="슬라이드6" src="https://github.com/dregun1/Library_Project/assets/122992960/52b4d994-0f22-4f87-98cd-f72a421c7104">
    <img width="1250" alt="슬라이드7" src="https://github.com/dregun1/Library_Project/assets/122992960/94d0e95f-14cd-4bc0-83da-adebeca6286e">
    <img width="1250" alt="슬라이드8" src="https://github.com/dregun1/Library_Project/assets/122992960/daefe981-74d1-4ff8-a118-6b9a25ca83dc">
  </details>
</details>
<br>

### 도서 조회
<details>
<img width="1250" alt="슬라이드9" src="https://github.com/dregun1/Library_Project/assets/122992960/c9ee5e32-77c5-4d93-80e6-0e77e7c9d647">
<img width="1250" alt="슬라이드10" src="https://github.com/dregun1/Library_Project/assets/122992960/b1892487-64f0-4f1f-9504-fd6f3c497302">
</details>
<br>


### 댓글 기능
<details>
<img width="1250" alt="슬라이드11" src="https://github.com/dregun1/Library_Project/assets/122992960/923bfae2-edda-4a8c-a411-86d4468ea6ff">
</details>
<br>

### 내 서재
<details>
<img width="1250" alt="슬라이드13" src="https://github.com/dregun1/Library_Project/assets/122992960/d00179ad-0a99-4645-9af4-b5c7c1b9dfae">
<img width="1250" alt="슬라이드14" src="https://github.com/dregun1/Library_Project/assets/122992960/b018f42f-3177-4020-bc16-ef6dad75d55a">
<img width="1250" alt="슬라이드15" src="https://github.com/dregun1/Library_Project/assets/122992960/a0bfa73a-ae94-464b-ba4b-cfa727ab7820">
</details>
<br>

### 관리자 페이지

<details>
<img width="1250" alt="슬라이드16" src="https://github.com/dregun1/Library_Project/assets/122992960/d8f949ba-e9c1-44b7-81e3-104268a8348f">
<img width="1250" alt="슬라이드17" src="https://github.com/dregun1/Library_Project/assets/122992960/a3f22b55-b1e2-420a-9b11-ebd9a495c244">
<img width="1250" alt="슬라이드18" src="https://github.com/dregun1/Library_Project/assets/122992960/e24edcbe-12b5-4e1a-8736-f6b4add5420e">
<img width="1250" alt="슬라이드19" src="https://github.com/dregun1/Library_Project/assets/122992960/26b7a462-2104-4392-805c-56b51cae7240">
<img width="1250" alt="슬라이드20" src="https://github.com/dregun1/Library_Project/assets/122992960/b945be3f-65fd-46a8-a480-bf3ebed49385">
</details>
<br>

### 공지사항

<details>
<img width="1250" alt="슬라이드21" src="https://github.com/dregun1/Library_Project/assets/122992960/ba35f33b-2c42-4d6d-a769-9872fbb17188">
<img width="1250" alt="슬라이드22" src="https://github.com/dregun1/Library_Project/assets/122992960/3bba5426-2eec-4d56-a0e1-6ddec62badb7">
</details>
<br>

### 독후감

<details>
<img width="1250" alt="슬라이드23" src="https://github.com/dregun1/Library_Project/assets/122992960/60c45505-ff44-4703-a9db-56147eb97639">
</details>
<br>

### 부족한 점

<details>
<img width="1250" alt="슬라이드24" src="https://github.com/dregun1/Library_Project/assets/122992960/24e77eca-8247-48b9-a151-67593ea36873">
</details>

## 문제점

### 1. 로그인을 하면 설정해놓은 에러페이지로 접속하는 문제.


```java
@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
  @Oaverride
  public void handle(HttpServletRequest request, HttpServletResponse response,
          AccessDeniedException accessDeniedException)
            thorws IOException, ServletException {
  log.error("Redirect2........ Access Denied: " + accessDeniedException.getMessage());
      response.sendRedirect("/accessError");
            }
}
```
<img width="1250" alt="에러페이지2" src="https://github.com/dregun1/Library_Project/assets/122992960/a1589de7-61c4-47aa-a721-937e5afc3bd5" style="border: 1px solid #ccc;">

권한 설정할 때 "hasAnyRole('01')"을 "hasAuthority('01')"로 변경.

```java
<security:http auto-config="true" use-expressions="true">

  <security:intercept-url pattern="/" access="permitAll"/>
  <security:intercept-url pattern="/member/manager" access="hasAnyRole('01')"/>

  ...
```

```java
<security:http auto-config="true" use-expressions="true">

  <security:intercept-url pattern="/" access="permitAll"/>
  <security:intercept-url pattern="/member/manager" access="hasAuthority('01')"/>

  ...
```

이미지 등록 오류로 CSRF토큰 설정 바꿈.

```java
<security:http auto-config="true" use-expressions="true">

  <security:csrf disabled="true">

  ...
```

### 2. 해결하지 못한 문제

이미지 등록 후 지연.
<details>
<img width="1250" alt="이미지지연" src="https://github.com/dregun1/Library_Project/assets/122992960/75c4a4e9-e42c-4115-9379-44dbecdc0dbb">
<img width="1250" alt="이미지지연2" src="https://github.com/dregun1/Library_Project/assets/122992960/58f2ef05-bf39-448c-95b2-102dc907ac71">
</details>
<br>

### 3. 미구현

공지사항.

<img src="https://capsule-render.vercel.app/api?type=waving&color=87CEEB&height=150&section=footer" style="width:100%;" />
