(defun package-reinstall-activated ()
  "Reinstall all activated packages."
  (interactive)
  (dolist (package-name package-activated-list)
    (when (package-installed-p package-name)
      (unless (ignore-errors                   ;some packages may fail to install
                (package-reinstall package-name)
                (warn "Package %s failed to reinstall" package-name))))))

(provide 'cust-func)
