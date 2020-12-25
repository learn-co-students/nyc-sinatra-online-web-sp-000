class Helper
    def self.any_landmarks?(params)
        !!self.find_or_create_landmarks(params)
    end

    def self.any_titles?(params)
        !!self.find_or_create_titles(params)
    end
    def self.find_or_create_titles(params)
        if !!params[:figure][:title_ids]
            titles = params[:figure][:title_ids].map do |title_id|
                Title.find(title_id.gsub(/([title_])/, ''))
            end
        else
            titles = []
        end
        if !params[:title][:name].empty?
            titles << Title.new(name: params[:title][:name])
        end
        titles
    end

    def self.find_or_create_landmarks(params)
        if !!params[:figure][:landmark_ids]     
            landmarks = params[:figure][:landmark_ids].map do |landmark_id|
                Landmark.find(landmark_id.gsub(/([landmark_])/, ''))
            end
        else
            landmarks = []
        end
        if !params[:landmark][:name].empty?
            landmarks << Landmark.new(name: params[:landmark][:name])
        end
        landmarks
    end

    def self.create_figure(params)
        if self.any_landmarks?(params) && self.any_titles?(params)
            titles = Helper.find_or_create_titles(params)
            landmarks = Helper.find_or_create_landmarks(params)
            figure = Figure.create(name: params[:figure][:name], titles: titles, landmarks: landmarks)
        elsif self.any_landmarks?(params) && !self.any_titles?(params)
            landmarks = Helper.find_or_create_landmarks(params)
            figure = Figure.create(name: params[:figure][:name], landmarks: landmarks)
        elsif !self.any_landmarks?(params) && self.any_titles?(params)
            titles = Helper.find_or_create_titles(params)
            figure = Figure.create(name: params[:figure][:name], titles: titles)
        else
            figure = Figure.create(name: params[:figure][:name])
        end
    end

    def self.update_figure(params)
        figure = Figure.find(params[:id])
        if self.any_landmarks?(params) && self.any_titles?(params)
            titles = Helper.find_or_create_titles(params)
            landmarks = Helper.find_or_create_landmarks(params)
            figure.update(name: params[:figure][:name], titles: titles, landmarks: landmarks)
        elsif self.any_landmarks?(params) && !self.any_titles?(params)
            landmarks = Helper.find_or_create_landmarks(params)
            figure.update(name: params[:figure][:name], landmarks: landmarks)
        elsif !self.any_landmarks?(params) && self.any_titles?(params)
            titles = Helper.find_or_create_titles(params)
            figure.update(name: params[:figure][:name], titles: titles)
        else
            figure.update(name: params[:figure][:name])
        end
    end
end