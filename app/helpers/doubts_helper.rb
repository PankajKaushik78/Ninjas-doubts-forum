module DoubtsHelper
    def doubt_author(doubt)
        user_signed_in? && current_user.id == doubt.user_id
    end

    def comment_author(comment)
        user_signed_in? && current_user.id == comment.user_id
    end
end
