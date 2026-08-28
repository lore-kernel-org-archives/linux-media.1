Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098BE3C0A0E
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895457; cv=pass; b=MRlC4QKRIJNdyvT1no1kyuig6hoxJJ0FUf/IXUls/vKpsQrABujyfDfcWG8KHzgBYYExVpcw5zI8Q/sfoylVl4TmAZ/WdKJ/Jygm/Ypk2T9g+QZ8USlYpLbaa8mpSTphN71kjKHK6W4PLqgrtTEuQGfLGXe2QOu0LaeeO37LGUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895457; c=relaxed/simple;
	bh=iR2eV7An+9QCkOabByhQ/5Vb3H/WY3q1I65SThFR6TI=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=BQExp16m9ZGdePWu9dbcjqVFC/8s5d2iDJ0RLbgnnR6+Gh1boDVqjKTeMjsKzEwtfaBgSNbOWZQGffSgjo4t1SflFjuB93HOfbGHiovumjWumB3k5d1KCoO7+f/q6/fOBbW6GGcxhABRalNxd3pZaq1MpyokxXLruW/YMxV5/lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=adYE7VVR; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="adYE7VVR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caced6038eso6735775ad.0
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895455; cv=none;
        d=google.com; s=arc-20260327;
        b=fWQ641+Ua+/8XtyCFv8u0iRPFdBeKCRB++/FDxZq8OKoWC9qa+44c+0Z6qroVdau4f
         yb81p2JVj6xrwAdpbroq2yGHt03Oh8Q4he3VuupFSiH/uZe6ek7CR/zNFge3ABFP0d5x
         xJPhiMNUVvGHVfk/Pzzo15MXjnc9cfWSlCkvQWSYOt9qPr9w36mHMKQ/W9mR7px0OwMp
         rgQ38vCOQZj1Qg6SkChbJeZF0acr2Whjo5PjUxK02hHCGAA29pk6+o9DIWYYP13t/x6a
         J1MBg01b9U2lqFL0tu9i5UYqD15z6eKmiLDSygOkZtVQSt3lDVe+t+XFc84+8T5i+OsS
         nbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=uazr0O6gDLZWNMRZa/tj6YkhQjpykfNiEkV9xS0SmNQ=;
        fh=XDeceswcmk8xbU3mzvhM7P1O6g8WEauXzg+iD9lrcMA=;
        b=cG+kkuzfdaXo0f4DbEQDMl50Qzv79soOFKACxTUEHjedR5/jhW5wVZJRwLlwtAi5VH
         8JhoqOiqPYG70C6kIhlroVefvoHlUGhUPMHOt/TnIuxZfddLD5Y4cJI6A+BVfUp5x8c6
         zWUo5n7NlW6XUloey4wcoZK6+45aqGp+7NdneC5v1PdzDCgc4I7/PEznV1i25nbkyqrA
         LTn9DTT842v9SvXD6ahuFhhpiQVClEFAutHtEloHRbzbYV9mb70Qwb74lPJ10B9yK+GT
         SNkRK4gewJJ/Kd+VYszt1z8YGAfSNd2YhFAZfITch4T4LW8OO3vgV+VEwGnojLYtnV4J
         JWDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895455; x=1788500255; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uazr0O6gDLZWNMRZa/tj6YkhQjpykfNiEkV9xS0SmNQ=;
        b=adYE7VVRESBmHB8rtab/yAkXfiyNnhLIeOMsyZAwg9XHZGP1YVb2NQ4djemth5kwPZ
         JMR/z4P81zCeY/+ylNcJ74owp9WGKo0M/1e8NgTILIYbxLPvAraPuBdbNDED4RS7ahPo
         XEQhDUo0VdBrBDRyEXDpYJ/y1ci7d5TBfyrEmP6Ek+s4c7HJ0PPp5CJhwI5LaBG/NG78
         IxheFsql1ZVbXIYMGYJAkkyqrdqO8+wCtHHzScQDks2Lz92AMtBc0Qb5wJmawQTC5B9X
         K06IOsdhIbOLz7ueJCO8wfHp4ldIbdHH0jHrTNE3G/nYlvK7K1nyi792pQZOGXWHpQHZ
         DqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895455; x=1788500255;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uazr0O6gDLZWNMRZa/tj6YkhQjpykfNiEkV9xS0SmNQ=;
        b=UKt2HrhSI49BzAZcs4luKDwy6hxWy0HEhDbm8CHFaWY8ZXSbmk+wXg4OyThtZDhnFu
         +pFXb296ng33VESWOFPqLbDfPLqOuPAm/rq96AaGMMDs+NbRxrmeHGuHVWMu3Opv6f1l
         P8dETCI7Rd3xb4Fi72ExICBkiCk8zfSpUlC1XBNxqFeZyhYqm6H64oSzJjcy5Oi0hXpA
         ytkb+2i3/O/a1Clglr3iP8bhTXQJrbbS00K8GJNlIb1P7ahh+cR5EiPSIFxAHj9nj9Qi
         mxEd0avXeIX8l8sJOqeCMRwOxOXq//0XCVBQ9LEtgSCJ9kjt9SOXdtrouDtLLjv0l6V4
         WITQ==
X-Forwarded-Encrypted: i=1; AHgh+RoppNzQ2YpS25HoZ65mXfFQtpHIgX9D0YtVldAxBVV5Uw2KaU0NkzgPr3EJeoSqz25dvoNo6EOj1s6YlQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ldA481gSVX70dLO/nDwi48Y1gAgE5omB72efPRI7Dab1MvdTW7
	peYmulWE+gigSH22sRHkZJ2Xwh2B/LSLTBzyL/ndU25Q3OHrkNXcWTKi9/4d5YygjTjP3ntnwBv
	7vFX0kEOF9Fv/5YxTp3DfZLdKVgTE9YQczsqKZcMX
X-Gm-Gg: AR+sD128hrchbtXPzZ9OHb0sSc7kfSG0VuiKVqZRBOQTc/XiAKY/KH85PrhOu7phLaS
	7GjfMBAkx283rNTipnLl4CRcM/HCfzchLz2W4TKvLdu8gJiaXxkZqs3Roo8tR6hmx0xCvl4SKGI
	VpTofeqLG1qNQcUHfAnzhReKOu2Y7rAA1KN+adE8poNkfkXnmFcunKVtHpHUTeBxCyvwNvDpAc/
	34s5/mKdKBtkNnLTEHdKhLveB4XDs1S0wp3sJ8if7Vs0cnqa4kR1PTBmei8tvOHcc4rYfmX3BcU
	9Yw+7Ys0SfttnHz16m7PvMtNFwuEdOijI5Sjq6E4VVhD51TeIGXS5PbK53UPLGJ7YQksTqd1Uv4
	1Wyn2jMTWjD65UwEXhCVwgF/7FHmkR58QyEj/F51+9NU=
X-Received: by 2002:a17:902:ccd0:b0:2bd:2c3a:2a36 with SMTP id
 d9443c01a7336-2d725acf14bmr162990945ad.0.1787895454308; Thu, 27 Aug 2026
 22:37:34 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:37:33 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:37:33 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:37:33 -0700
X-Gm-Features: AcwNN1Ur-VZBys6jqZPJvpYfVeYnoLAAwZu7Edvu0_9GADMTO4Gd8qQ90541flU
Message-ID: <CA+0ovChZw1S2gbV34WOFquXtW=e=-XUjpcfpTD-1KZ=gDpD2ow@mail.gmail.com>
Subject: [BUG] dev_WARN_ONCE "BOGUS control dir" -- drivers/usb/core/urb.c:413 (dtcs033)
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/156-gspca-dtcs033-control-urb-wrong-pipe-dir/

  usb 3-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType 40
  WARNING: drivers/usb/core/urb.c:413 at usb_submit_urb+0x1074/0x18c0,
CPU#1: repro/9497
  Call Trace:
   usb_start_wait_urb+0x13f/0x5b0
   usb_control_msg+0x234/0x3e0
   reg_reqs+0x216/0x590
   gspca_init_transfer+0x2470/0x3060
   gspca_start_streaming+0x6f/0x250
   vb2_start_streaming+0x128/0x460
   vb2_core_streamon+0x2e0/0x4f0
   __video_do_ioctl+0xadb/0xca0
   video_usercopy+0x876/0x1450
   v4l2_ioctl+0x18d/0x1e0
   __se_sys_ioctl+0xfc/0x170
   do_syscall_64+0x155/0x510

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
