module Admin::InboxHelper
	def replies_tree_for(inboxes)
    inboxes.map do |inbox, nested_comments|
      render(inbox) +
          (nested_comments.size > 0 ? content_tag(:div, replies_tree_for(nested_comments), class: "replies") : nil)
    end.join.html_safe
  end
end
