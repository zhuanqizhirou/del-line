;;delete line(forward/backward/whole line) or word(forward/backward) directly,Without copying to kill ring.
;;Tested only on windows system.
;;Author: pw(破妄/PoWang)
;;Date: 2016.08.10

(defun pw-delete-line-forward()
  "delete text from current position to end of line char.
This command does not push text to 'kill-ring'"
  (interactive)
  (delete-region
   (point)
   (progn (end-of-line 1)(point))
   )
  )
(defun pw-delete-line-backward()
  "delete text from start of line char to current position.
This cmmand doesnot push text to 'kill-ring'"
  (interactive)
  (let (p1 p2)
    (setq p1 (point))
    (beginning-of-line 1)
    (setq p2 (point))
    (delete-region p1 p2)))
(defun pw-delete-line()
  "delete whole line"
  (interactive)
  (progn
    (beginning-of-line)
    (pw-delete-line-forward)
    (delete-char 1);;delete 换行符
    ))

(global-set-key (kbd "C-S-j") 'pw-delete-line-backward)
(global-set-key (kbd "C-S-k") 'pw-delete-line-forward)
(global-set-key (kbd "C-S-l") 'pw-delete-line)
;;==================================================
;;word操作
;;M-f forward-word
;;M-b backward-word
;;M-d kill-word
;;M-DEL/M-backspace backward-kill-word
;;C-y,会恢复多次删除的内容,(point不变的话?)
;;==================================================

(defun pw-delete-word-forward(arg)
  "Delete characters forward until encountering the end of a word.
With argument,do this many times.
This command does not push text to 'kill-ring'"
  (interactive "p");;
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))
(defun pw-delete-word-backward(arg)
    "Delete characters backward until encountering the beginning of a word.
With argument,do this many times.
This command does not push text to 'kill-ring'"
    (interactive "p")
    (pw-delete-word-forward (- arg)))

(global-set-key (kbd "C-S-d") 'pw-delete-word-forward)
(global-set-key (kbd "C-S-b") 'pw-delete-word-backward)
