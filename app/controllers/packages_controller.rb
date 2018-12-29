class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]
  before_action :set_footer
  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.all


  end

  # GET /packages/1
  # GET /packages/1.json
  def show
    @price_entry_select = PriceEntry.where("package_id = ?", params[:id])
    @price_entry_select_price = PriceEntry.where("package_id = ?", params[:id]).select(:price, :distributor_id)


    @distributors = Distributor.all
    @units = Unit.all

    @price_entry_distributor_id = []
    @price_entry_max = []
    @price_entry_min = []
    @price_entry_recent = []

    @distributors.each do |distributor|

      @price_entry_temp = @price_entry_select_price.where("distributor_id = ?", distributor.id)
      price_entry_list = []

      @price_entry_temp.each do |price|
        price_entry_list << price.price
      end

      if !@price_entry_temp.blank? 
        @price_entry_distributor_id << distributor.id
        @price_entry_max << price_entry_list.max
        @price_entry_min << price_entry_list.min
        @price_entry_recent << price_entry_list.last
      end

    end

  end

  # GET /packages/new
  def new
    @package = Package.new
    @product = Product.all.map { |i| [i.name, i.id]}
    @unit = Unit.all.map { |i| [i.name, i.id]}

  end

  # GET /packages/1/edit
  def edit
    @product = Product.all.map { |i| [i.name, i.id]}
    @unit = Unit.all.map { |i| [i.name, i.id]}

    
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    def set_footer
      @next = "price_entries"
      @previous = "products"
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:product_id, :barcode, :pkgsize, :size, :unit_id)
    end
end
