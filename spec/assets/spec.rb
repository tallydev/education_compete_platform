class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy,:detail]
  before_action :orders_search, only: [:index, :export, :supplier, :courier]
  #before_action :order_file, only: [:index, :export]
  #导出orders excel
  def export

      package = Axlsx::Package.new
      workbook = package.workbook
      workbook.styles do |s|
        title_cell = s.add_style :b=>true, :sz => 20, :alignment => { :horizontal => :center,:vertical => :center}
        date_cell = s.add_style :b=>true, :sz => 12, :alignment => { :horizontal => :center,:vertical => :center}
        head_cell = s.add_style  :b=>true, :sz => 11,:bg_color=>"FFCC66", :alignment => { :horizontal => :center,:vertical => :center}
        order_cell = s.add_style :sz => 11, :alignment => {:horizontal => :center,:vertical => :center}
        product_cell =  s.add_style  :sz => 11, :alignment => {:horizontal => :center,:vertical => :center}
        workbook.add_worksheet(:name => "Orders_#{@pay_style}") do |sheet|


        sheet.add_row ["","","","GROUPMALL","ORDERS","SHEET","",""], :style=>title_cell,:height=> 35
         row_count=0

        sheet.add_row ["","","",params[:begin_time],"-->", params[:end_time]], :style=>date_cell,:height=> 30

        sheet.add_row ['ID',"Status","Type","Name",'MP','Date',"Area","Address","Product Name","Quantity","Payment","Cost","Channel","Sharer","Delivery Cost","Profit","Deliveried","Coupon","Remarks"],
                      :style=>head_cell,:height=> 30
        row_count +=1

        @orders.each do |order|
          order.order_items.each do |item|
            sheet.add_row [order.id,order.status_text,item.promotion.nil?? 'selection': item.promotion.tag,order.name,order.phone,order.created_at.strftime("%Y-%m-%d"),order.area,order.address,
              item.en_name,item.quantity,item.price*item.quantity+item.freight.to_i,item.cost.to_f*item.quantity,order.channel.try(:name),order.sharer.try(:name),"","","","",order.remarks],
            :style=>product_cell,:height=> 30

          end
        end
      end
    end

    send_data package.to_stream.read,:filename=>"orders_#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.xlsx"
  end

#导出 courier excel
  def courier


    # if params[:supplier_id].to_i == 0
    #   @order_items = OrderItem.all
    # else
    #   @order_items = OrderItem.where("supplier_id = ?", params[:supplier_id])
    # end

      package = Axlsx::Package.new
      workbook = package.workbook
      workbook.styles do |s|
        title_cell = s.add_style :b=>true, :sz => 20, :alignment => { :horizontal => :center,:vertical => :center}
        remark_cell = s.add_style :b=>true, :sz => 12
        remark1_cell = s.add_style :sz => 12
        date_cell = s.add_style :b=>true, :sz => 15, :alignment => { :horizontal => :center,:vertical => :center}
        head_cell = s.add_style  :b=>true, :sz => 11,:bg_color=>"FFCC66", :alignment => { :horizontal => :center,:vertical => :center}
        order_cell = s.add_style :sz => 11, :alignment => {:horizontal => :center,:vertical => :center}
        product_cell =  s.add_style  :sz => 11, :alignment => {:horizontal => :center,:vertical => :center}
        workbook.add_worksheet(:name => "Couriers_#{@pay_status}") do |sheet|

        sheet.add_row ["","GROUPMALL","COURIER","SHEET","","",""], :style=>title_cell,:height=> 35

        sheet.add_row ["",params[:begin_time],"-->", params[:end_time]], :style=>date_cell,:height=> 30


        sheet.add_row ["P.S. packing request :"], :style=>remark_cell,:height=> 30
         sheet.add_row ["1. No receipt inside the box"], :style=>remark1_cell,:height=> 30
         sheet.add_row ["2. No QR code or contact infos on/in the package"], :style=>remark1_cell,:height=> 30
         sheet.add_row ["3. Our sticker need to put on the box"], :style=>remark1_cell,:height=> 30
        sheet.add_row ['ID',"Name",'MP',"Address"],
                      :style=>head_cell,:height=> 30
        row_count =0
        @order_items.each do |order_item|
          sheet.add_row [order_item.order.id,order_item.order.name,order_item.order.phone,order_item.order.address],
          :style=>order_cell,:height=> 30
          row_count +=1
        end
      end
    end
    send_data package.to_stream.read,:filename=>"couriers_#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.xlsx"
  end
#导出 supplier excel
def supplier

      # if params[:supplier_id].to_i == 0
      #   @order_items = OrderItem.all
      # else
      #   @order_items = OrderItem.where("supplier_id = ?", params[:supplier_id])
      # end

      package = Axlsx::Package.new
      workbook = package.workbook
      workbook.styles do |s|
        title_cell = s.add_style :b=>true, :sz => 20, :alignment => { :horizontal => :center,:vertical => :center}
        date_cell = s.add_style :b=>true, :sz => 12, :alignment => { :horizontal => :center,:vertical => :center}
        head_cell = s.add_style  :b=>true, :sz => 11,:bg_color=>"FFCC66", :alignment => { :horizontal => :center,:vertical => :center}
        order_cell = s.add_style :sz => 11, :alignment => {:horizontal => :center,:vertical => :center}
       item_cell =  s.add_style  :sz => 11, :alignment => {:horizontal => :center,:vertical => :center}
        workbook.add_worksheet(:name => "Suppliers_#{@pay_status}") do |sheet|

        sheet.add_row ["","GROUPMALL","SUPPLIER","SHEET","","",""], :style=>title_cell,:height=> 35

        sheet.add_row ["",params[:begin_time],"-->", params[:end_time]], :style=>date_cell,:height=> 30

        sheet.add_row ['ID',"Product Name",'Quantity',"City"],
                      :style=>head_cell,:height=> 30
        row_count=0

        @order_items.each do |order_item|

            sheet.add_row [order_item.order.id,order_item.en_name,order_item.quantity,order_item.order.address],
            :style=>item_cell,:height=> 30
            row_count +=1

        end
      end
    end

    send_data package.to_stream.read,:filename=>"suppliers_#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.xlsx"
  end


  # GET /admin/orders
  # GET /admin/orders.json
  def index
    @orders = @orders.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /admin/orders/1
  # GET /admin/orders/1.json
  def show
  end


  # GET /admin/orders/new
  def new
    @order = Order.new
  end

  # GET /admin/orders/1/edit
  def edit
    
  end


  # POST /admin/orders
  # POST /admin/orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/orders/1
  # PATCH/PUT /admin/orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to admin_orders_url, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_orders_url }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /admin/orders/1
  # DELETE /admin/orders/1.json
  def destroy
    @order.update_attribute(:status, '-1')
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {}).permit!
    end

    # def order_file
    #   if params[:pay_style]=="1"
    #         @pay_style="paid"
    #       elsif params[:pay_style]=="0"
    #         @pay_style="unpaid"
    #       elsif params[:pay_style]=="100"
    #         @pay_style="All"
    #       end
    #       @pay_style
    # end


    def orders_search
      @keyword_field = params[:keyword_field]
      # @keyowrd_field ||= 'id'

      @pay_status = params[:pay_status]
      @pay_status ||= '1'

      pay_status = "and pay_status = '#{@pay_status}'"
      if @pay_status == '100'
        pay_status = ''
      end

      @ship_status = params[:ship_status]
      @ship_status ||= '100'

      ship_status = "and ship_status = '#{@ship_status}'"
      if @ship_status == '100'
        ship_status = ''
      end

      @end_time = params[:end_time]
      @end_time = @end_time.nil?? Time.now : DateTime.parse(@end_time)

      @begin_time = params[:begin_time]
      @begin_time = @begin_time.nil?? @end_time -1.month : DateTime.parse(@begin_time)
      if @keyword_field.present?
        @keyword = params[:keyword].gsub(' ','')
        case @keyword_field
        when 'id','user_id','phone'
          @orders = Order.where("#{@keyword_field}=#{@keyword}")
        when 'name'
            @orders = Order.where("#{@keyword_field} like '%#{@keyword}%'")
        else
          @orders = nil
        end
      else
        @orders = Order.where("created_at>='#{@begin_time}' and created_at<='#{@end_time}' #{pay_status} #{ship_status}")
      end
      # @order_items = OrderItem.where("created_at>='#{@begin_time}' and created_at<='#{@end_time}'")
      #
      #   if params[:supplier_id].to_i == 0
      #   @order_items = @order_items.all
      # else
      #   @order_items = @order_items.where("supplier_id = ?", params[:supplier_id])
      # end

    end
end
