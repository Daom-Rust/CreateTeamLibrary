# 도메인 설계 방향
## 엔터티
- 종류와 속성을 데이터에 붙이는 식으로 진행.
종류에 따라서는 팀 내 포지션이 결정되는 식으로 운용.
속성은 팀 구성에 영향을 미치는 방향으로 운용.

- 종류에 대한 추가 사항.
수업은 다른 수업과 동시에 같은 팀에 존재할 수 없다. 
조장/운전자는 팀의 핵심으로 팀에 반드시 1개(이상) 존재해야 한다.
조장/운전자/스피커는 팀내에 주어진 특수 역할을 감당해야 한다.

- 역할에 대해서
각 엔터티는 팀에서 담당할 역할을 부여받게 된다.
같은 역할의 엔터티들을 그룹이라고 명명한다.
엔터티는 1개 이상의 역할을 부여받게 된다.

- 다중역할에 대해서
두개 이상의 역할을 부여받은 엔티티는 다중역할 엔터티라고 한다.
다중역할 엔티티는 팀에 따라서 역할을 다르게 부여 받을 수 있다.


## 팀 구성조건
- 팀은 구성역할로 이루어져 있고, 구성역할에는 제약조건을 붙일 수 있다.
구성역할에 붙일 수 있는 조건들은 핵심역할, 그룹베타, 인원수 이다.

- 구성 역할에 대해
팀을 구성할 때 들어가야하는 역할을 설정할 수 있다.
팀을 구성할때 들어가는 역할을 나타낸다.
구성역할 마다 조건을 붙일 수 있다.

- 핵심역할조건에 대해서
구성역할에 핵심역할조건이 있는 경우 해당 구성역할을 가진 엔터티가 반드시 하나 이상 들어가야 한다.

- 그룹베타조건에 대해서
구성역할에 그룹베타조건이 있는 경우 해당 구성역할을 가진 엔터티가 두 개 이상 들어가면 안된다.

- 인원수조건에 대해서
구성역할에 인원수조건이 있는 경우 해당 구성역할을 가진 엔터티의 개수가 지정한 인원수 범위안에 만족해야한다.

## 예시1 `클레스미팅`
- 클래스 미팅에 들어가야하는 상황
- 엔터티는 수업과 참가자(스피커,보조) 두 가지이다.
- 팀은 수업(핵심, 그룹베타), 스피커(핵심, 1), 보조(1~2) 으로 3개의 역할로 구성해라

- 참가자 : 참가자는 스티커와 보조 두 역할을 감당할 수 있다. 팀에 소속 될때는 스피커와 보조 중 하나의 역할을 가지고 참가하게 된다.

- 수업 : 그룹베터조건과 핵심역할 조건이 있어서 반드시 팀에 하나의 수업이 배정된다.

- 스피커 : 핵심역할조건과 인원수 제한(1)이 있어 반드시 팀에 하나의 스피커가 배정된다.

- 보조 : 인원수 제한이 있어 최소 1명 최대 2명의 보조가 팀에 배정된다.