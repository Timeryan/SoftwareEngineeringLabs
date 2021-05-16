class MarksController < ApplicationController

  LETTER = {
    1..34 => "F",
    35..59 => "FX",
    60..66 => "E",
    67..74 => "D",
    75..81 => "C",
    82..89 => "B",
    90..100 => "A",
  }
  def new
    @mark = Mark.new
  end

  def create
    points = mark_params[:points].to_i
    @mark = Mark.create(points: points, letter: LETTER.select {|f| f === points }.values.first)

    if points > 0 && points <= 100
    @lab = Lab.find(params[:lab_id])
    @lab.mark = @mark
    end

    if @mark.valid?
      redirect_to "/"
    else
      render "new"
    end
  end

  private def mark_params
    params.require(:mark).permit(:points)
  end
end
