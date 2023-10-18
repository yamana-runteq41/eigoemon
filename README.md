# はつめい屋　英語えもん
## - わざわざ学ばなくてもよいことだけが学べるWebアプリ -

![ogp2](https://github.com/yamana-runteq41/eigoemon/assets/121042778/1c805842-2281-40a1-8b57-ae16b0aba45d)


## アプリのURL：[はつめい屋　英語えもん](https://www.eigoemon.com/)

## 「はつめい屋　英語えもん」とは？
プログラミング学習中によく見かける英単語を、ネイティブ「っぽく」読めるようになるサービスです。

### 【ターゲットユーザー】
- 勉強が好きではない小学生
- 勉強が好きではないプログラミングや英語の初学者

### 【具体的なサービス内容】
ただふだん通りにひらがなを読み上げるだけで、まるでネイティブが英語を読んでいるかのような発音ができるように、英単語にふりがなをふりました。<br>
また、ふりがなによる曖昧さを取り除くため、Youglishが提供するJavaScript APIを使用し、ネイティブによる単語の発音を動画で確認できるようにしています。これにより、たとえば「bundle install」など、日常で使用する英単語でない単語やフレーズの発音も確認ができます。さらに、同じ単語を発音している別の動画を複数観たり、同じ単語の国による発音の違いを確認したりすることも簡単に行うことができます。

**1. レベル上げ（2択クイズ機能）：** <br>
1つの英単語に対して2択のふりがなを提示し、正解だと思う回答をユーザーに選択していただきます。<br>
ユーザーが回答を選ぶとその単語の解説画面に遷移し、以下の情報を確認することができます。
  - 正解となるふりがな
  - プログラミングにおいてその単語がどのように使用されるかという初学者向けの解説
  - ネイティブがじっさいにその単語を発音している動画
  
    **ポイント1：** <br>
    ユーザーが楽しめるよう、以下の実装をしました。<br>
    一定の条件により、ユーザーのレベルが1ずつあがるように設定しています。<br>
    前回よりもレベルが上がった状態で初めてクイズを解くタイミングでモーダルウィンドウを表示し、その中でこのWebアプリの主役による会話を展開しています。<br>
    会話の内容は、発音ハック技やタイムマシンの作り方など多岐に渡り、好奇心を刺激します。<br>
  
    **ポイント2：** <br>
    「メモ機能」、「通知機能」、「復習機能」を設けることにより、学習効果を高めています。<br>
    メモ機能は、クイズ回答後に遷移する解説ページをお気に入り登録し、その解説にすぐにアクセスできる機能です。<br>
    通知機能では、最終ログイン日から1ヶ月が経過したユーザーに、再度クイズにアクセスするようメール通知ができるようになっています。<br>
    復習機能は、以下の条件で問題を出題するように実装しています。<br>
    通常のクイズの出題機能は、クイズの回答が2週目以上にならない限り、同じ単語が繰り返し出題されることがないように実装しています。<br>
  それに対して、復習機能を設けることで、偶然にも正解ができてしまった問題を確実に習熟できるまで解きなおしたり、誤答した問題を集中的に回答したりすることができます。<br>
  復習機能の出題条件：
    - 正答であれ誤答であれ、1度出題された問題のなかから出題
    - 誤答した問題は、回答した日と同日以降に復習問題として出題
    - 正解した問題は、その問題の連続正解数がいくらかによって出題のタイミングを変化させる
      - 連続正解数が1：回答した日と同日以降に復習問題として出題
      - 連続正解数が2：回答した日から5日後以降に復習問題として出題
      - 連続正解数が3以上：復習問題から除外（復習問題コーナーからは出題されない）
  
  **2. 図書館：** <br>
  クイズに使用している全単語に関して、それぞれの単語の発音についての解説を読むことができます。<br>
  クイズの解説ページと同様に、ふりがなとネイティブが発音している動画を同ページ内に設置しています。<br>

  **ポイント：** <br>
  プログラミングに関する情報を一切記載しないことにより、英語学習者にも使用していただくことができます。

### ユーザーが抱えている課題感と提供するサービスでどのように解決するのか
  ひらがなで英単語の読みを表記するという一種の不真面目さが、他の学習系サービスにはない価値を与えうると考えています。<br>
  【英語学習者に与えうる価値】<br>
    多くの発音学習教材には、「『え』のくちの形で『あ』と発音しましょう」といった発音の説明が書かれていますが、実際に試してみればわかるように、その説明だけでは発音をイメージするのが非常に難しいです。そのような教材で得た正当な知識とひらがな読みを組み合わせることで、実際の発音がイメージしやすくなり、発音の練習がしやすくなると考えられます。

  【プログラミング学習者に与えうる価値】<br>
    英単語に対する耐性が低い場合、それだけでプログラミングにとっつきにくさを感じる可能性があります。見慣れたひらがなを添えることで英単語に慣れてもらえるのと同時に、似たスペルの単語を見間違えて記載することよるエラーの発生を防ぐことができると考えられます。

## このアプリを開発するに至った経緯
### このWebアプリの本来の目的は、「プログラミングで使用する英単語をネイティブっぽく読めるようになること」ではありません。

このWebアプリは、「超長期的・クレーム撲滅キャンペーン」の一環として作成しました。<br>
学習を嫌う人・自分で調べ、解決しようとする習慣がない人が何かトラブルに直面した場合、その人が唯一できることは、ただ近くの人に文句を言うことだけです。私の考えではこのように、現在時おり問題になっている過度なクレームの問題は、生活に関わる多くの事柄を人任せにしてきたことに起因します。そしてその問題を少しでも解消するためには、人が自分で何かを調べたり、学んだりして自分の力で一定程度は問題解決ができるようになることが不可欠であると考えています。

このWebアプリは「英単語の発音学習アプリ」ではありますが、作成した狙いはより根本的な点にあります。すなわち、「学習する」という行動のハードルを、もっと低くすること、そしてそれによって、何であれ学習をするというのは面白いことだとユーザーに思わせることです。多くの人が「学習なんて辛いことだ・勉強は苦痛だ」と考える原因は、受験勉強や資格試験の勉強に代表される、実用性のみを追求した学習の印象の強さにあるように思われます。そこでこのWebアプリでは、そのような実用性を排除し、「プログラミングで使う英単語をネイティブ風に言えるようにする」という、わざわざ知っている必要のない事柄についての学習教材を提供することで、その狙いを達成したいと考えました。
  

## ER図
https://drive.google.com/file/d/1wIcB0QP2TyUq3VXy716XLM17_A58Nt2x/view?usp=sharing


## 画面遷移図
https://www.figma.com/file/6K7Iuk07SWtxB96VsAeS89/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=WjIcjeRtFwV3zJnd-1

### 使用技術 
【フレームワーク/言語】Ruby on Rails (7.0.6), Ruby (3.2.2), JavaScript<br>
【UI】Tailwind CSS, daisy UI<br>
【データベース】PostgreSQL<br>
【デプロイ】heroku<br>