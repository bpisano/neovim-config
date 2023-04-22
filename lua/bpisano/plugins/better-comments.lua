local status, better_comment = pcall(require, "better-comment")
if not status then
	return
end

better_comment.Setup()
