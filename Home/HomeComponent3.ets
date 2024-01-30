import router from '@ohos.router'
@Entry
@Component
struct ScrollComponent3 {
  @State params: any = router.getParams()
  @State recommendtion: any[] = [
    { src: '/images/50.jpeg', name: '酱汁烤鸭', writer: '爱吃小丸子' ,image:'/images/touxiang.webp'},
    { src: '/images/niupai.jpg', name: '牛排', writer: '爱吃小丸子',image:'/images/touxiang.webp' },
    { src: '/images/24.jpeg', name: '下午茶', writer: '爱吃小丸子' ,image:'/images/touxiang.webp'},
    { src: '/images/lamian.webp', name: '拉面', writer: '爱吃小丸子' ,image:'/images/touxiang.webp'},
    { src: '/images/shali.jpg', name: '沙拉', writer: '爱吃小丸子' ,image:'/images/touxiang.webp'},
    { src: '/images/tangguo.webp', name: '菌汤锅', writer: '超级大力士',image:'/images/touxiang2.webp' },
    { src: '/images/pisa.webp', name: '披萨', writer: '超级大力士' ,image:'/images/touxiang2.webp'},
    { src: '/images/huoguo.webp', name: '中式火锅', writer: '超级大力士' ,image:'/images/touxiang2.webp'}
  ]
  build() {
    Row() {
      Column() {
        Flex({
          direction:FlexDirection.Row,//横向排列
          wrap:FlexWrap.Wrap,//换行
          //justifyContent:FlexAlign.SpaceAround
        }) {
        ForEach(this.recommendtion, (e) => {
            Column() {
              Image(e.src).width(130).height(130).borderRadius(10)
              Text(e.name).fontSize(30)
              // Text(e.writer)
              Row(){
                Image(e.image).width(20).border({radius:20})
                Text(e.writer).textAlign(TextAlign.End)
              }
            }.width('50%').height(200)
        })
        }.height(600)
      }.height(800)
    }
  }
}
export default ScrollComponent3