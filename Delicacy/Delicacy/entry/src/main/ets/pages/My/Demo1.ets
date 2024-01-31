//装饰器 Component 这是一个组件
@Component
struct Demo1 {//名字要和文件名一样
  build(){//用来构建页面的方法
    Text('demo1')//内容
  }
}

//把写的组件导出去
export default Demo1;

// console.log('截取:',msg2.substring(4,9))
// console.log('.startWith:',msg2.startsWith('u'))

