class PriceEntriesController < ApplicationController
  before_action :set_price_entry, only: [:show, :edit, :update, :destroy]
  before_action :set_footer

  # GET /price_entries
  # GET /price_entries.json
  def index
    @price_entries = PriceEntry.all
  end

  # GET /price_entries/1
  # GET /price_entries/1.json
  def show
  end

  # GET /price_entries/new
  def new
    @price_entry = PriceEntry.new
  #  @package = Package.all.map { |i| [i.product.name, i.id]}
    @package = Package.all.map do |i| 
      str = i.product.name + "/" + i.pkgsize.to_s + "/" + i.size.to_s + "/" + i.unit.name
      [str, i.id]
    end 

    @sale_type = SaleType.all.map { |i| [i.name, i.id]}
    @distributor = Distributor.all.map { |i| [i.name, i.id]}

  end

  # GET /price_entries/1/edit
  def edit
    @package = Package.all.map { |i| [i.product.name, i.id]}
    @distributor = Distributor.all.map { |i| [i.name, i.id]}
    @sale_type = SaleType.all.map { |i| [i.name, i.id]}

  end

  # POST /price_entries
  # POST /price_entries.json
  def create
    @price_entry = PriceEntry.new(price_entry_params)
    @price_entry.user = current_user

    respond_to do |format|
      if @price_entry.save
        format.html { redirect_to @price_entry, notice: 'Price entry was successfully created.' }
        format.json { render :show, status: :created, location: @price_entry }
      else
        format.html { render :new }
        format.json { render json: @price_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_entries/1
  # PATCH/PUT /price_entries/1.json
  def update
    respond_to do |format|
      if @price_entry.update(price_entry_params)
        format.html { redirect_to @price_entry, notice: 'Price entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @price_entry }
      else
        format.html { render :edit }
        format.json { render json: @price_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_entries/1
  # DELETE /price_entries/1.json
  def destroy
    @price_entry.destroy
    respond_to do |format|
      format.html { redirect_to price_entries_url, notice: 'Price entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_entry
      @price_entry = PriceEntry.find(params[:id])
    end

    def set_footer
      @next = ""
      @previous = "packages"
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def price_entry_params
      params.require(:price_entry).permit(:package_id, :distributor_id, :price, :expiration_date, :sale_type_id)
    end
end
