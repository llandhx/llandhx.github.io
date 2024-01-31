import router from '@ohos.router'
interface arrType{
  img1:string,
  tit1:string,
  tit2:string
  time:string,
  img2:string
}

@Entry
@Component
struct Fensi {
  @State arr:arrType[]=[
    {img1:'/images/tou1.jpg',tit1:'校长',tit2:'赞了你的菜谱',time:'2-20',img2:'/images/pisa.webp'},
    {img1:'/images/tou2.jpg',tit1:'主任',tit2:'赞了你的菜谱',time:'2-17',img2:'/images/huoguo.webp'},
    {img1:'/images/tou3.jpg',tit1:'小张',tit2:'赞了你的菜谱',time:'2-8',img2:'/images/roushi.webp'},
    {img1:'/images/tou4.jpg',tit1:'小飞',tit2:'赞了你的菜谱',time:'2-5',img2:'/images/lamian.webp'},
    {img1:'/images/tou5.jpg',tit1:'小刘',tit2:'赞了你的菜谱',time:'2-5',img2:'/images/niupai.jpg'},
    {img1:'/images/tou6.jpg',tit1:'小江',tit2:'赞了你的菜谱',time:'2-2',img2:'/images/dangao.jpg'},
    {img1:'/images/tou7.jpg',tit1:'小胡',tit2:'赞了你的菜谱',time:'2-1',img2:'/images/niupai.jpg'},
    {img1:'/images/tou8.png',tit1:'小尹',tit2:'赞了你的菜谱',time:'2-3',img2:'/images/roushi.webp'}


  ]

  build() {

    Column() {
      Row() {
        Column(){
          Image('/images/left.png')
            .onClick(()=>{
              router.back()
            })
            .width(30)
            .height(30)
            .offset({x:-20})
        }
        Column(){
          Text('收到的赞').fontSize(25).textAlign(TextAlign.Center).margin({left:30})
        }
        .offset({x:-125})
      }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding({left:30,right:30})
      ForEach(this.arr,(v,i)=>{
        Column(){
          Row(){
            Column(){
              Image(v.img1)
                .offset({x:-17})
            }

            .width(42)
            .height(42)
            .offset({x:-15})
            Column(){
              Row(){
                Text(v.tit1).fontSize(19)
              }.offset({x:-137})
              Row(){
                Column(){
                  Text(v.tit2)
                }.offset({x:-75})
                Column(){
                  Text(v.time)
                }
                .offset({x:-65})
                Column(){
                  Image(v.img2).width(30).height(30)
                }
                .offset({x:25})
              }

            }

          }
          .width(360).justifyContent(FlexAlign.SpaceEvenly).margin({top:30})
        }

      })
    }
    .height('100%')
    .width(360)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}