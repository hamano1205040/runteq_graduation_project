class TrainingRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_training_record, only: %i[ show edit update destroy ]

  # GET /training_records or /training_records.json
  def index
    @training_records = current_user.training_records.order(trained_on: :desc)
  end

  # GET /training_records/1 or /training_records/1.json
  def show
  end

  # GET /training_records/new
  def new
    @training_record = current_user.training_records.build
  end

  # GET /training_records/1/edit
  def edit
  end

  # POST /training_records or /training_records.json
  def create
    @training_record = current_user.training_records.build(training_record_params)

    respond_to do |format|
      if @training_record.save
        format.html { redirect_to training_records_path, notice: "トレーニング記録を作成しました。" }
        format.json { render :show, status: :created, location: @training_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @training_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_records/1 or /training_records/1.json
  def update
    respond_to do |format|
      if @training_record.update(training_record_params)
        format.html { redirect_to training_records_path, notice: "トレーニング記録を更新しました。", status: :see_other }
        format.json { render :show, status: :ok, location: @training_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_records/1 or /training_records/1.json
  def destroy
    @training_record.destroy

    respond_to do |format|
      format.html { redirect_to training_records_path, notice: "トレーニング記録を削除しました。", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_record
      @training_record = current_user.training_records.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def training_record_params
      params.require(:training_record).permit(:trained_on, :content)
    end
end
