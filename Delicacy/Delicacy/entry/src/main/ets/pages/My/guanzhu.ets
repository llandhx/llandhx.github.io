import router from '@ohos.router'
interface arrType{
  tit:string,
  sex:string,
  time:string,
  guanzhu:boolean
  img:string
}

@Entry
@Component
struct Fensi {
  @State arr:arrType[]=[
    {img:'/images/tou1.jpg',"tit":"校长",sex:'男',time:'2021年加入',guanzhu:false},
    {img:'/images/tou2.jpg',tit:'主任',sex:'女',time:'2022年加入',guanzhu:false},
    {img:'/images/tou3.jpg',tit:'小张',sex:'女',time:'2019年加入',guanzhu:false},
    {img:'/images/tou4.jpg',tit:'小飞',sex:'男',time:'2018年加入',guanzhu:false},
    {img:'/images/tou5.jpg',tit:'小刘',sex:'男',time:'2009年加入',guanzhu:false},
    {img:'/images/tou6.jpg',tit:'小江',sex:'女',time:'2015年加入',guanzhu:false},
    {img:'/images/tou7.jpg',tit:'小胡',sex:'男',time:'2004年加入',guanzhu:false},
    {img:'/images/tou8.png',tit:'小胡',sex:'男',time:'2004年加入',guanzhu:false},
    {img:'/images/touxiang.webp',tit:'小胡',sex:'男',time:'2004年加入',guanzhu:false}


  ]

  build() {

    Column() {
      Row() {
        Column(){
          Image('/images/left.png')
            .onClick(()=>{
              router.back()
            })
            .width(27)
            .height(27)
            .offset({x:10})
        }
        Column(){
          Text('粉丝').fontSize(25).textAlign(TextAlign.Center).offset({x:-160})
        }
      }.margin({left:10})
      .width('100%')
      .offset({y:-10})
      .justifyContent(FlexAlign.SpaceBetween)
        ForEach(this.arr,(v,i)=>{
          Column(){
            Row(){
              Column(){
                Image(v.img)
              }

              .width(35)
              .height(35)
              .offset({x:-15})
              Column(){
                Row(){
                  Text(v.tit)
                }.offset({x:-60})
                Row(){
                  Column(){
                    Text(v.sex)
                  }.offset({x:-25})
                  Column(){
                    Text(v.time)
                  }
                  .offset({x:-15})
                }

              }

              Button(this.arr[i].guanzhu?'已关注':'+关注').onClick((event: ClickEvent) => {
                let _arr=JSON.parse(JSON.stringify(this.arr));
                _arr[i].guanzhu=!_arr[i].guanzhu
                this.arr=_arr;
              })
                .offset({x:20})
                .backgroundColor(this.arr[i].guanzhu?'#ccc':'#399')
            }
            .width(360).justifyContent(FlexAlign.SpaceEvenly).margin({top:15})
          }.offset({y:-12})

        })
      }
    .height('100%')
    .width(360)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}