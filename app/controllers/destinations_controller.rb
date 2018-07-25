class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]
  before_action :set_countries, only: [:new, :create]

  # GET /destinations
  # GET /destinations.json
  def index
    @destinations = Destination.order('created_at DESC')
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
  end

  # GET /destinations/new
  def new
    @destination = Destination.new
  end

  # GET /destinations/1/edit
  def edit
  end

  # POST /destinations
  # POST /destinations.json
  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      flash[:success] = "Destination added!"
      redirect_to destinations_path
    else
      p '*********************'
      p @destination.errors
      render 'new'
    end
    # @destination = Destination.new(destination_params)
    #
    # respond_to do |format|
    #   if @destination.save
    #     format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
    #     format.json { render :show, status: :created, location: @destination }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @destination.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /destinations/1
  # PATCH/PUT /destinations/1.json
  def update
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
        format.json { render :show, status: :ok, location: @destination }
      else
        format.html { render :edit }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination.destroy
    respond_to do |format|
      format.html { redirect_to destinations_url, notice: 'Destination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_params
      params.require(:destination).permit(:title, :address, :current, :latitutde, :longitude, :country_id)
    end

    def set_countries
      @countries = [
       {name:'Afghanistan', country_code: 'af'},
       {name:'Aland Islands', country_code: 'ax'},
       {name:'Albania', country_code: 'al'},
       {name:'Algeria', country_code: 'dz'},
       {name:'American Samoa', country_code: 'as'},
       {name:'Andorra', country_code: 'ad'},
       {name:'Angola', country_code: 'ao'},
       {name:'Anguilla', country_code: 'ai'},
       {name:'Antarctica', country_code: 'aq'},
       {name:'Antigua And Barbuda', country_code: 'ag'},
       {name:'Argentina', country_code: 'ar'},
       {name:'Armenia', country_code: 'am'},
       {name:'Aruba', country_code: 'aw'},
       {name:'Australia', country_code: 'au'},
       {name:'Austria', country_code: 'at'},
       {name:'Azerbaijan', country_code: 'az'},
       {name:'Bahamas', country_code: 'bs'},
       {name:'Bahrain', country_code: 'bh'},
       {name:'Bangladesh', country_code: 'bd'},
       {name:'Barbados', country_code: 'bb'},
       {name:'Belarus', country_code: 'by'},
       {name:'Belgium', country_code: 'be'},
       {name:'Belize', country_code: 'bz'},
       {name:'Benin', country_code: 'bj'},
       {name:'Bermuda', country_code: 'bm'},
       {name:'Bhutan', country_code: 'bt'},
       {name:'Bolivia', country_code: 'bo'},
       {name:'Bosnia And Herzegovina', country_code: 'ba'},
       {name:'Botswana', country_code: 'bw'},
       {name:'Bouvet Island', country_code: 'bv'},
       {name:'Brazil', country_code: 'br'},
       {name:'British Indian Ocean Territory', country_code: 'io'},
       {name:'Brunei Darussalam', country_code: 'bn'},
       {name:'Bulgaria', country_code: 'bg'},
       {name:'Burkina Faso', country_code: 'bf'},
       {name:'Burundi', country_code: 'bi'},
       {name:'Cambodia', country_code: 'kh'},
       {name:'Cameroon', country_code: 'cm'},
       {name:'Canada', country_code: 'ca'},
       {name:'Cape Verde', country_code: 'cv'},
       {name:'Cayman Islands', country_code: 'ky'},
       {name:'Central African Republic', country_code: 'cf'},
       {name:'Chad', country_code: 'td'},
       {name:'Chile', country_code: 'cl'},
       {name:'China', country_code: 'cn'},
       {name:'Christmas Island', country_code: 'cx'},
       {name:'Cocos (Keeling) Islands', country_code: 'cc'},
       {name:'Colombia', country_code: 'co'},
       {name:'Comoros', country_code: 'km'},
       {name:'Congo', country_code: 'cg'},
       {name:'Congo, Democratic Republic', country_code: 'cd'},
       {name:'Cook Islands', country_code: 'ck'},
       {name:'Costa Rica', country_code: 'cr'},
       {name:'Cote D\'Ivoire', country_code: 'ci'},
       {name:'Croatia', country_code: 'hr'},
       {name:'Cuba', country_code: 'cu'},
       {name:'Cyprus', country_code: 'cy'},
       {name:'Czech Republic', country_code: 'cz'},
       {name:'Denmark', country_code: 'dk'},
       {name:'Djibouti', country_code: 'dj'},
       {name:'Dominica', country_code: 'dm'},
       {name:'Dominican Republic', country_code: 'do'},
       {name:'Ecuador', country_code: 'ec'},
       {name:'Egypt', country_code: 'eg'},
       {name:'El Salvador', country_code: 'sv'},
       {name:'Equatorial Guinea', country_code: 'gq'},
       {name:'Eritrea', country_code: 'er'},
       {name:'Estonia', country_code: 'ee'},
       {name:'Ethiopia', country_code: 'et'},
       {name:'Falkland Islands (Malvinas)', country_code: 'fk'},
       {name:'Faroe Islands', country_code: 'fo'},
       {name:'Fiji', country_code: 'fj'},
       {name:'Finland', country_code: 'fi'},
       {name:'France', country_code: 'fr'},
       {name:'French Guiana', country_code: 'gf'},
       {name:'French Polynesia', country_code: 'pf'},
       {name:'French Southern Territories', country_code: 'tf'},
       {name:'Gabon', country_code: 'ga'},
       {name:'Gambia', country_code: 'gm'},
       {name:'Georgia', country_code: 'ge'},
       {name:'Germany', country_code: 'de'},
       {name:'Ghana', country_code: 'gh'},
       {name:'Gibraltar', country_code: 'gi'},
       {name:'Greece', country_code: 'gr'},
       {name:'Greenland', country_code: 'gl'},
       {name:'Grenada', country_code: 'gd'},
       {name:'Guadeloupe', country_code: 'gp'},
       {name:'Guam', country_code: 'gu'},
       {name:'Guatemala', country_code: 'gt'},
       {name:'Guernsey', country_code: 'gg'},
       {name:'Guinea', country_code: 'gn'},
       {name:'Guinea-Bissau', country_code: 'gw'},
       {name:'Guyana', country_code: 'gy'},
       {name:'Haiti', country_code: 'ht'},
       {name:'Heard Island & Mcdonald Islands', country_code: 'hm'},
       {name:'Holy See (Vatican City State)', country_code: 'va'},
       {name:'Honduras', country_code: 'hn'},
       {name:'Hong Kong', country_code: 'hk'},
       {name:'Hungary', country_code: 'hu'},
       {name:'Iceland', country_code: 'is'},
       {name:'India', country_code: 'in'},
       {name:'Indonesia', country_code: 'id'},
       {name:'Iran, Islamic Republic Of', country_code: 'ir'},
       {name:'Iraq', country_code: 'iq'},
       {name:'Ireland', country_code: 'ie'},
       {name:'Isle Of Man', country_code: 'im'},
       {name:'Israel', country_code: 'il'},
       {name:'Italy', country_code: 'it'},
       {name:'Jamaica', country_code: 'jm'},
       {name:'Japan', country_code: 'jp'},
       {name:'Jersey', country_code: 'je'},
       {name:'Jordan', country_code: 'jo'},
       {name:'Kazakhstan', country_code: 'kz'},
       {name:'Kenya', country_code: 'ke'},
       {name:'Kiribati', country_code: 'ki'},
       {name:'Korea', country_code: 'kr'},
       {name:'Kuwait', country_code: 'kw'},
       {name:'Kyrgyzstan', country_code: 'kg'},
       {name:'Lao People\'s Democratic Republic', country_code: 'la'},
       {name:'Latvia', country_code: 'lv'},
       {name:'Lebanon', country_code: 'lb'},
       {name:'Lesotho', country_code: 'ls'},
       {name:'Liberia', country_code: 'lr'},
       {name:'Libyan Arab Jamahiriya', country_code: 'ly'},
       {name:'Liechtenstein', country_code: 'li'},
       {name:'Lithuania', country_code: 'lt'},
       {name:'Luxembourg', country_code: 'lu'},
       {name:'Macao', country_code: 'mo'},
       {name:'Macedonia', country_code: 'mk'},
       {name:'Madagascar', country_code: 'mg'},
       {name:'Malawi', country_code: 'mw'},
       {name:'Malaysia', country_code: 'my'},
       {name:'Maldives', country_code: 'mv'},
       {name:'Mali', country_code: 'ml'},
       {name:'Malta', country_code: 'mt'},
       {name:'Marshall Islands', country_code: 'mh'},
       {name:'Martinique', country_code: 'mq'},
       {name:'Mauritania', country_code: 'mr'},
       {name:'Mauritius', country_code: 'mu'},
       {name:'Mayotte', country_code: 'yt'},
       {name:'Mexico', country_code: 'mx'},
       {name:'Micronesia, Federated States Of', country_code: 'fm'},
       {name:'Moldova', country_code: 'md'},
       {name:'Monaco', country_code: 'mc'},
       {name:'Mongolia', country_code: 'mn'},
       {name:'Montenegro', country_code: 'me'},
       {name:'Montserrat', country_code: 'ms'},
       {name:'Morocco', country_code: 'ma'},
       {name:'Mozambique', country_code: 'mz'},
       {name:'Myanmar', country_code: 'mm'},
       {name:'Namibia', country_code: 'na'},
       {name:'Nauru', country_code: 'nr'},
       {name:'Nepal', country_code: 'np'},
       {name:'Netherlands', country_code: 'nl'},
       {name:'Netherlands Antilles', country_code: 'an'},
       {name:'New Caledonia', country_code: 'nc'},
       {name:'New Zealand', country_code: 'nz'},
       {name:'Nicaragua', country_code: 'ni'},
       {name:'Niger', country_code: 'ne'},
       {name:'Nigeria', country_code: 'ng'},
       {name:'Niue', country_code: 'nu'},
       {name:'Norfolk Island', country_code: 'nf'},
       {name:'Northern Mariana Islands', country_code: 'mp'},
       {name:'Norway', country_code: 'no'},
       {name:'Oman', country_code: 'om'},
       {name:'Pakistan', country_code: 'pk'},
       {name:'Palau', country_code: 'pw'},
       {name:'Palestinian Territory, Occupied', country_code: 'ps'},
       {name:'Panama', country_code: 'pa'},
       {name:'Papua New Guinea', country_code: 'pg'},
       {name:'Paraguay', country_code: 'py'},
       {name:'Peru', country_code: 'pe'},
       {name:'Philippines', country_code: 'ph'},
       {name:'Pitcairn', country_code: 'pn'},
       {name:'Poland', country_code: 'pl'},
       {name:'Portugal', country_code: 'pt'},
       {name:'Puerto Rico', country_code: 'pr'},
       {name:'Qatar', country_code: 'qa'},
       {name:'Reunion', country_code: 're'},
       {name:'Romania', country_code: 'ro'},
       {name:'Russian Federation', country_code: 'ru'},
       {name:'Rwanda', country_code: 'rw'},
       {name:'Saint Barthelemy', country_code: 'bl'},
       {name:'Saint Helena', country_code: 'sh'},
       {name:'Saint Kitts And Nevis', country_code: 'kn'},
       {name:'Saint Lucia', country_code: 'lc'},
       {name:'Saint Martin', country_code: 'mf'},
       {name:'Saint Pierre And Miquelon', country_code: 'pm'},
       {name:'Saint Vincent And Grenadines', country_code: 'vc'},
       {name:'Samoa', country_code: 'ws'},
       {name:'San Marino', country_code: 'sm'},
       {name:'Sao Tome And Principe', country_code: 'st'},
       {name:'Saudi Arabia', country_code: 'sa'},
       {name:'Senegal', country_code: 'sn'},
       {name:'Serbia', country_code: 'rs'},
       {name:'Seychelles', country_code: 'sc'},
       {name:'Sierra Leone', country_code: 'sl'},
       {name:'Singapore', country_code: 'sg'},
       {name:'Slovakia', country_code: 'sk'},
       {name:'Slovenia', country_code: 'si'},
       {name:'Solomon Islands', country_code: 'sb'},
       {name:'Somalia', country_code: 'so'},
       {name:'South Africa', country_code: 'za'},
       {name:'South Georgia And Sandwich Isl.', country_code: 'gs'},
       {name:'Spain', country_code: 'es'},
       {name:'Sri Lanka', country_code: 'lk'},
       {name:'Sudan', country_code: 'sd'},
       {name:'Suriname', country_code: 'sr'},
       {name:'Svalbard And Jan Mayen', country_code: 'sj'},
       {name:'Swaziland', country_code: 'sz'},
       {name:'Sweden', country_code: 'se'},
       {name:'Switzerland', country_code: 'ch'},
       {name:'Syrian Arab Republic', country_code: 'sy'},
       {name:'Taiwan', country_code: 'tw'},
       {name:'Tajikistan', country_code: 'tj'},
       {name:'Tanzania', country_code: 'tz'},
       {name:'Thailand', country_code: 'th'},
       {name:'Timor-Leste', country_code: 'tl'},
       {name:'Togo', country_code: 'tg'},
       {name:'Tokelau', country_code: 'tk'},
       {name:'Tonga', country_code: 'to'},
       {name:'Trinidad And Tobago', country_code: 'tt'},
       {name:'Tunisia', country_code: 'tn'},
       {name:'Turkey', country_code: 'tr'},
       {name:'Turkmenistan', country_code: 'tm'},
       {name:'Turks And Caicos Islands', country_code: 'tc'},
       {name:'Tuvalu', country_code: 'tv'},
       {name:'Uganda', country_code: 'ug'},
       {name:'Ukraine', country_code: 'ua'},
       {name:'United Arab Emirates', country_code: 'ae'},
       {name:'United Kingdom', country_code: 'gb'},
       {name:'United States', country_code: 'us'},
       {name:'United States Outlying Islands', country_code: 'um'},
       {name:'Uruguay', country_code: 'uy'},
       {name:'Uzbekistan', country_code: 'uz'},
       {name:'Vanuatu', country_code: 'vu'},
       {name:'Venezuela', country_code: 've'},
       {name:'Viet Nam', country_code: 'vn'},
       {name:'Virgin Islands, British', country_code: 'vg'},
       {name:'Virgin Islands, U.S.', country_code: 'vi'},
       {name:'Wallis And Futuna', country_code: 'wf'},
       {name:'Western Sahara', country_code: 'eh'},
       {name:'Yemen', country_code: 'ye'},
       {name:'Zambia', country_code: 'zm'},
       {name:'Zimbabwe', country_code: 'zw'}]
    end
end
