import router from '@ohos.router'
@Entry
@Component
struct Video1 {
  @State arr1: any = [
    { src: '/images/49.jpeg', image: '/images/touxiang.webp', text1: '会做饭的西瓜', text2: '经典人气甜品系列' },
    { src: '/images/68.jpeg', image: '/images/touxiang4.webp', text1: '香蕉派', text2: '经典人气甜品系列' },
    { src: '/images/52.jpeg', image: '/images/touxiang2.jpg', text1: '吃货小天才', text2: '经典人气甜品系列' },
    { src: '/images/71.jpeg', image: '/images/touxiang1.jpg', text1: '美食猎人', text2: '经典人气甜品系列' }
  ]
  @State arr2: any = [
    { src: '/images/40.jpeg', image: '/images/touxiang4.webp', text1: '橘子公主', text2: '网红糕点' },
    { src: '/images/4.jpeg', image: '/images/touxiang3.jpg', text1: '食刻在线', text2: '网红糕点' },
    { src: '/images/61.gif', image: '/images/touxiang.webp', text1: '蓝莓可可颂', text2: '网红糕点' },
    { src: '/images/1.jpg', image: '/images/touxiang2.webp', text1: '草莓卷曲奇', text2: '网红糕点' }
  ]

  build() {
    Column() {
      Row() {
        Text('课程')
          .fontSize(25)
      }.margin({top:15,bottom:10})
      Row() {
        Search({ placeholder: '输入搜索内容' })
          .searchButton('搜索')
          .onSubmit((v) => {
            console.log(v)
          })
      }

      Row() {
        Text('热门美食').offset({x:0}).fontSize(20)
      }.width('100%').margin({top:20,bottom:10})

      Row() {
        Scroll(){
          Row(){
            ForEach(this.arr1, (v) => {
              Column() {
                Row(){
                  Image(v.src).width(150).height(200).onClick(()=>{
                    router.pushUrl({
                      url: 'pages/Video/Video2'
                    })
                  })

                }
                Row() {
                  Image(v.image).width(20).height(20).border({radius:15})
                  Text(v.text1).fontColor(Color.Gray).fontSize(13)
                }.width(150).margin({top:5,bottom:5})
                Row() {
                  Text(v.text2).fontSize(15)
                }
              }.width(150).margin({right:10})
            })
          }
        }.width(360).scrollable(ScrollDirection.Horizontal)
      }.width('100%')
      //图片上有文字等内容利用堆叠布局

      Row() {
        Text('更多推荐').fontSize(20)//.offset({x:0})
      }.width('100%').margin({top:20,bottom:10})

      Row() {
        Row(){
          ForEach(this.arr2, (v) => {
            Column() {
              Row(){
                Image(v.src).width(150).height(200).onClick(()=>{
                  router.pushUrl({
                    url: 'pages/Video/Video2'
                  })
                })
              }
              Row() {
                Image(v.image).width(20).height(20).border({radius:15})
                Text(v.text1).fontColor(Color.Gray).fontSize(13)
              }.width(150).margin({top:5,bottom:5})
              Row() {
                Text(v.text2).fontSize(15).offset({x:-30})
              }
            }.width(150).margin({right:10})
          })
        }
      }
    }.width('100%')
  }
}
export default Video1





