Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A873812E9
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 23:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872267; cv=pass; b=LsR0xOUw1m3nAFKhVybHqkySZLcYkoGCBM13u0VSLeWwDcFxJK4JN+McNPPbGd9YrpE++b+s+jcZG9DQaTA+wEHLO8DkUfdlozjAiHNUU4/DPNl7XWDz/p7ZqEl1sYqj7DtzgH2+5mqEqhye8mMAA0LKjOfZFWlv5bEc6bdGgiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872267; c=relaxed/simple;
	bh=ykliYNlRp0ZTa9p8bjUi+k7K0Pia3lpKqIyQaZvT8lU=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=EyNhm4dfyywsd7F5KyHksevlbjGQnjVHXkK+RmOlmT/E4Sl3sZsImzs1Ihb1aKqUBUuOZ/Fjm8DVJEXkDYdNozNPUDba/KtVRgLxf3WYuVkxr+7h7y+qPb4pPxNSNCokN/sU0Dz+fJ1Qg9Qj4xOZ8y7vOPaMjoxVlaNGzVspGAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=Rb25D2b1; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="Rb25D2b1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d7195706f1so4613425ad.0
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 16:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787872266; cv=none;
        d=google.com; s=arc-20260327;
        b=KgNXGehhknciffe/dqJS1dRln5PNq1MOOdlwFHfr5XCu2WFrwLtJO7fnxaPTfNj/Kp
         OfZs6PdqhpTXnmCTks1I5fWXMLQ+1KEMxVI/qnEMabbzKXTK36NTOfN14d6bjpHo0n/P
         EcIUZpoI9h5nPepbyWoAuymkxKlCvn43MMsseEc3dvBSANaf2CvOKcxGoYgN4bEeJgdD
         N2sgQ/v6nH/etmc6D0QEq9toSRBw+gNjFRxoySoA6RNa0em+ySd6rrFfG03fvz4/LspS
         bwJ5fd6SvTRe8QcvzB4e4SC7Cxr8DHDj9oWCDhlas+J1U+H5gASiGNDCem6LEv5WABzn
         B12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=OaOHOksjpEwsETf/w29tNkN0mLCmHUAIdh293WQTJbQ=;
        fh=umjAsMVrL/kuQQek0XUcVkbKGlbBKMpczWSNdzf0N5o=;
        b=HcDeeKYS8blFvvOTKyKjt680UBqa+pLLuez9Gz+OM10jtX4n+qag+vPAnD8ij4wz6g
         SyXYmjk+1R5ZiJmnFkOXHtFSzLvVOYF2ftp0Obkezf+EuohBISsS+e8lPKjOL5/eKg5g
         X8Vh37T9qhysLtKyFQNtgNrTCmcwBYn/qrN9/4jL/THbVko9wbMg3I/A5j6DiuUbxCz+
         QtZb2RT57ouRhqFf5joN7IU3QcbCL1FjMQMK+dnIbCbH5sLhMrM6G4hQrQ18P6+x9J+d
         UvCkNWF6X8FYSYCTOSb/pBqmh7adXMyPFy7NWZn6LLgsyGYE3cMlsFPuUkqVOGVnrTmD
         hwqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787872266; x=1788477066; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OaOHOksjpEwsETf/w29tNkN0mLCmHUAIdh293WQTJbQ=;
        b=Rb25D2b1kzf45RPgRrJfTIdlRwBYjMWHB+kseMlqvjTDfQZMod5ZndwHZKN8IbVhB5
         EXSuLTERpUPNRev+n5Qln3p2zAf2xi88DYEYwI5TawaPNvBh27LVXicgco+BibU1oTJR
         ZYG+Wyi5g1XT6J15NP/++ch28gqFr7pYB1skfLawMk9VbWjll4BcdqHjndqLeW6NT2+c
         z8mfF1to4UWsqFjWJ8bX3hPu+GWFwz70rAU5rzHorJL9FOZSb3MJ6azjS3Iq1PqeUsP4
         zYL83Qe6abaSL3IyIekQxL4u1V/t+/Zv4RRDXE7eITvBjUOZZu/geP1D2S7AaNSaCDAp
         nuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872266; x=1788477066;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OaOHOksjpEwsETf/w29tNkN0mLCmHUAIdh293WQTJbQ=;
        b=NOpiVolqJ749swa3wBW8IM9wmJzo3qX9zMFEDfYhATx2Coyx/P4zY3+WfMUvnVd+wM
         S5jr1rltpVVVQX7dEXhBGerWpCWsJJhlaRRpBaxrRaaPJBLmnQxKGN7WCJPASXkFH+Zh
         +lcNidwJOUtTJ2qnG/JR4L/H7381ML4ysluO4y17jGVZb0KzYvx5CBTzg5v1qbKr9QWl
         VNw+xXVjvkxfwuxFuabFHgDXSZS2Q6cFfwhWHb0G5PIhjveGKEbTHvlkA8ebCkexktke
         MIF/qfhWS4sg9dzo2qz/uXFbvpEwnvXMaq+2Gp3wrAyFWihi4erqsxuKyMBVeCEmaJkw
         vNQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9QmzLj2kTylC2CK8uZGKCtQwn5mnnF7JcUxrrvRpaPzStmttWHypd+yesSlplz/1ewJcVuqslv8UpHw==@vger.kernel.org
X-Gm-Message-State: AFuF++k20LO/dDtkP7TP43xULRC/8/GTi2f9LcUDc7evpJrcRdcGtSqK
	xIlEPmgOAxPL+k6d9eZ5328sOZiIJnD8oHL+QQj8BlK5OgZXQGCeeoYCffZ03tnnVBN3cbq/wAr
	etXAjPUPlsk1Z9kfDTAGIupt3RXPLQLKAGHS9zg+r
X-Gm-Gg: AR+sD13oMK669mNMtKCzu5RuyJFURiuupBphJsX63eKSraM8cTmIPdggnGdg/yUoFx6
	e87dEzMpgvSUn0Lq8vdYtsQCx2xsBuKsL+vEyYjxchnZt+3xoOErL8Iht1+YRsdBmprT8beFjFh
	W/wN1ELrjuwoRDp41VggJPGPFAHu7qmOuvDlEvKYnYDy5U7gM//s/iaRGyV/hdT9IfpIFsv/8IA
	nMkSpOKkphAoAMpK7Uaq8YRPZE+01PiLT4Q23M5wUFrxPWuO8UbFheZChOaFg9BXAZLy3JXqUGM
	WXiwBX61YrZjPkxMAW1+OH5FnPMDmlJ7mzjyL/cwBxyFXXczYotZ6DqYwg6toQINAsVgWvm3w6+
	NxyNiEAa1TjFrG46E0PHfud2pgUsyON8T
X-Received: by 2002:a17:903:2b0e:b0:2d7:3f6e:5cb9 with SMTP id
 d9443c01a7336-2d74dc910cemr45136225ad.8.1787872264814; Thu, 27 Aug 2026
 16:11:04 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 23:11:03 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 23:11:03 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 23:11:03 +0000
X-Gm-Features: AcwNN1UCO-DyGHnolg4whJRtG0xeWHR7MKGEgfF-XdSV1SZOaJOw9sTbLP3xi4c
Message-ID: <CA+0ovCj+WxdpjdJWJmrkjjcK6WsZYg1agfiAPE-CYOr=13kjPQ@mail.gmail.com>
Subject: [BUG] v4l2_ctrl_request_unbind -- KASAN slab-use-after-free
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Mauro Carvalho Chehab,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/119-media-vim2m-uaf-v4l2_ctrl_request_unbind/

  ==================================================================
  BUG: KASAN: slab-use-after-free in
v4l2_ctrl_request_unbind+0x5b/0x2d0
drivers/media/v4l2-core/v4l2-ctrls-request.c:101
  Read of size 8 at addr ffff88803e2ae8a8 by task syz.4.148/13541

  CPU: 0 UID: 0 PID: 13541 Comm: syz.4.148 Not tainted 7.1.0-rc5 #1
PREEMPT(full)
  Call Trace:
   <TASK>
   dump_stack_lvl+0x94/0xd0 lib/dump_stack.c:120
   print_address_description+0x55/0x1e0 mm/kasan/report.c:378
   print_report+0x58/0x70 mm/kasan/report.c:482
   kasan_report+0x130/0x170 mm/kasan/report.c:595
   v4l2_ctrl_request_unbind+0x5b/0x2d0
drivers/media/v4l2-core/v4l2-ctrls-request.c:101
   media_request_object_unbind+0x25a/0x530 drivers/media/mc/mc-request.c:474
   media_request_clean+0x11b/0x480 drivers/media/mc/mc-request.c:49
   media_request_release drivers/media/mc/mc-request.c:72 [inline]
   kref_put include/linux/kref.h:65 [inline]
   media_request_put+0x98/0x1e0 drivers/media/mc/mc-request.c:83
   media_request_close+0x38/0x50 drivers/media/mc/mc-request.c:91
   __fput+0x435/0xa40 fs/file_table.c:510

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
