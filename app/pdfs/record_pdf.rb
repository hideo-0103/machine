class RecordPdf < Prawn::Document

  # recordにモデルなどのデータを渡します
  def initialize(repair,user)
    super()
    # stroke_axis
    # 複数メソッドで利用できるようにするため
    # インスタンス変数に代入
    @repair = repair
    @user = user
    # 全体のフォントを設定
    font 'app/assets/fonts/ipaexg00401/ipaexg.ttf'
    
    # ヘッダー部分の表示
    title
    # ヘッダーリード部分の表示
    repair_num
    create_day
    implementer
    # テーブル部分の表示
    move_down 150
    table_content
    boss_approval
  end

    def title
      text_box "修復歴", :at => [0, 650], :width => 550, :height => 50, :align => :center, :valign => :center, :size => 25
    end
    def boss_approval
       # カーソルを指定
       y_position = cursor - 30

       text_box "上長承認　氏名　　　　　　　　　　印", :at => [340, 50], :width => 200, :height => 40, :align => :center, :valign => :center, :size => 10
       line_width = 2    
       stroke_color "000000"
       stroke_line [400, 20], [535, 20]
       # bounding_boxで記載箇所を指定して、textメソッドでテキストを記載
       # bounding_box([100, y_position], :width => 270, :height => 50) do
       # end
      
    end

    def implementer
      # カーソルを指定
      y_position = cursor - 30

      text_box "作成者  　#{@user.name}", :at => [0, 620], :width => 80, :height => 40, :align => :center, :valign => :center, :size => 10
      line_width = 2    
      stroke_color "000000"
      stroke_line [3, 590], [100, 590]

      # bounding_boxで記載箇所を指定して、textメソッドでテキストを記載
      # bounding_box([100, y_position], :width => 270, :height => 50) do
      # end
    end
    def create_day
      # カーソルを指定
      y_position = cursor - 30

      text_box "作成日  　#{@repair.created_at.strftime('%Y/%m/%d')}", :at => [1, 720], :width => 120, :height => 40, :align => :center, :valign => :center, :size => 10
      line_width = 2    
      stroke_color "000000"
      stroke_line [3, 690], [120, 690]

      # bounding_boxで記載箇所を指定して、textメソッドでテキストを記載
      # bounding_box([100, y_position], :width => 270, :height => 50) do
      # end
    end


    def repair_num
      # カーソルを指定
      y_position = cursor - 30

      text_box "修復No：  #{@repair.id}", :at => [430, 720], :width => 80, :height => 40, :align => :center, :valign => :center, :size => 10
      line_width = 2    
      stroke_color "000000"
      stroke_line [430, 690], [510, 690]
      # bounding_boxで記載箇所を指定して、textメソッドでテキストを記載
      # bounding_box([100, y_position], :width => 270, :height => 50) do
      # end
    end

    def table_content
      # tableメソッドは2次元配列を引数(line_item_rows)にとり、それをテーブルとして表示する
      # ブロック(do...end)内でテーブルの書式の設定をしている
      
      def add_parts
        row = ["使用部品"]
        @repair.parts.each do |part|
          row.push("・#{part.name}")
        end
        return row
      end
      parts = add_parts
      rows = [["修復箇所",@repair.title],
              ["修復内容",@repair.text],
              parts
              ]

      table rows do
        # 全体設定
        cells.padding = 8          # セルのpadding幅
        cells.borders = [:bottom,] # 表示するボーダーの向き(top, bottom, right, leftがある)
        cells.border_width = 1.5   # ボーダーの太さ
  
        # 個別設定
        # row(0) は0行目、row(-1) は最後の行を表す
        row(0).border_width = 1.5
        row(0).borders = [:left,:bottom,:top]
        row(0).column(1).borders = [:left,:bottom,:right,:top]
        row(1).borders = [:left,:bottom,:top]
        row(1).height = 400
        row(1).column(1).borders = [:left,:bottom,:right,:top]
        row(-1).borders = [:left,:bottom]
        row(-1).column(1).borders = [:left,:bottom,:right]
  
        self.header     = false  # 1行目をヘッダーとするか否か
        self.row_colors = ['ffffff'] # 列の色
        self.column_widths = [70, 460] # 列の幅
      end
    end

end
