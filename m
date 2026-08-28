Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB243B52E1
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894862; cv=pass; b=g/XJhHQCcWrdns9PZAs2uizpZYoSNDmy8pRj+t6BsR15Cp+cQtonaOqXRVSmD03UIo135QXyf65MGgefhaG9aXvpP7Sp6CQ0z4B6R/yETS2zZPcde2eAFJ9p1/PM/RyrbB0pMDDMJ2O6bce4Hx+XPxSeKidf7o8WA4MEgc7d8vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894862; c=relaxed/simple;
	bh=CgFE6xzydSpndudikVjnh7MIF34ctjCUCdEOfsSfRA8=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ys2svaOrgmNmVX7FjnATSnEFvvLwwInEDd0b+dnL+zJKh1W74LYo12Ty1LU5hIHRhlhUX30rHaxhlITcv3LBcZORnasSQk/DX524GdvXr/CxywrACuAt5dWf9p7XQUINcjgJ8O7MzbfbDHKlON0qYWbsrBTlbk0iK9Yv9YnIcOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=EX2aakxp; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="EX2aakxp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so422969a91.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894860; cv=none;
        d=google.com; s=arc-20260327;
        b=YJNgLC5Tdsw/We0pjML6M/Jp9hq0+uiVsCK60x5/VMHIziSvALX36vTyQGcLttONZf
         OYpxhDGTDeGclTnt/0+eBwwpx2h0OA2EAyJ4MuSCyCuzsXXLfFfgGyMJd72kwlGTnHfU
         u9JCZnjWoYU8jaNj3/M3OolEKQfhD9ZyC2evAWdEAv3/E24eypxwnl4032XWnQnMPcIm
         XXBT+6dnHQcmbdtyBLVYqJGpP1LCuBg+QetLyZdVBDr/GqtoLE/yTU/GckvzcMbw1pIM
         JG4T7j+qGkt3H5ZC2CrZPQ359ewhYjFcHLZbl/hRaXyRzDwmKC7QLjHKAtlAjX7bisN+
         WHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Z2v491KBTHpIGOUDfEqcZ2UFbfGCKSS8IjSqDZ3SPy4=;
        fh=7V50LNv1y/p32Off5sdNok8zr3FUbN3Zs+R8lUoFb6I=;
        b=rrZok3LwKaOUfTOdrzsMx4Fr4AnpenZ8DuWPrWFlpwJvMVNDdXiDPjPv3KpeGwSRST
         nronX9HZ48CnMG7E0xeXtTsy/6bMBWvOhHdcKj2tnWek457I9CjGktIw6aFNkGAQkfmX
         +9gNM6O2kiPzDOQmYqEAW7LXkUbe03qnY5IiE2QQ5ma3gk8AfMQMSKJv+wqwaaA53x+y
         KIqnirfmbRSMdS+S0FBSWbijoCPu1+YI4SQD/XJybEI16DRAiWP8jV41tJ75+vLFOCSK
         9H1Yc9n3aQOS/abIHkOr2BUpwOxD56kT4VYN09r5mvZVDqj8GFdJtW6gym7jmQJNivXH
         IXIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894860; x=1788499660; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2v491KBTHpIGOUDfEqcZ2UFbfGCKSS8IjSqDZ3SPy4=;
        b=EX2aakxpHxlBtAMT7Q1DJXuBck2GnuvDHG2X2edwDnBRsxNy2Q8yxjlyPiZDbAFTGF
         ve83Ct5UEZEFr9zycsBYHSEof97QthHnigwq2IarpZIL2vW0YJA0mqDbWbgazF58jJsT
         vwXT6etsfg1RbAQ3l8yEn2lUiWxu+lVbmN9IMK5Y8xIzZoqM/0+P16BeLM5VbVBPyAmy
         YQDP+3eaV8m618DDGqaRp/dOIqTpbTZ3D0WicQetvsUS4whpElfI4/mI5M+tmnf4uZIn
         5Wyk5iOei9y+/C/rCEeGYzPe2fo5+tp7H24eg7HhjHSF6lE5WFnGsLEcYRIURo6TZr2k
         Tj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894860; x=1788499660;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z2v491KBTHpIGOUDfEqcZ2UFbfGCKSS8IjSqDZ3SPy4=;
        b=sqmP3ALsHVWPLGjaq6S49ptu7FMtmVo7BAHDeukq1JU9bP5VXOL+PKwqR6ZBqsrqYW
         5P7l4lvi5DIC0z+e/Wf1dx0ylFcXfc+y9UWusId0wFTKdW7wi7sACxxyn20EgebQAIDA
         khvAm++qd75KRctTp6ySEAriZHK8bSMml2WfaeHTfOjd/5hmrUSD1hGhMVmE4aCvu+XF
         AHlOH7I08EO4WqLLS8wRvebfNy+Si4kxE7tZ69Wvvdy1mmaiI+YbqJzTZ9ovUxp52eTu
         z2bHqQ5atXNUk0+ErDKA5MySxZEaMUDAgx4MeD86bW41DshDmCKF4pGepJ45XJiHA/VQ
         TJrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoH++wtw3nW2JzsXEjeqcA0OuGiq/X/Qqc5S76nho7YhC6vfP+HIfPLqqy5p7kNhH4aPPJR9ZVq0IHQMg==@vger.kernel.org
X-Gm-Message-State: AFuF++m+/ki1Z6Gl0enuRIvNfOQu3nPgjnUiK5cwsCevu0RfP5Cmw5In
	aEwXxBZRpVEN7uJsLoW42jDWqVHFLUxWMjQHmrkttlrNn/nxJw3MVCTJ/pzPYrH2l54WT/4wWaX
	1Mkq2l6etuJsvnabN3udI353srR488B3KFEtroK9T
X-Gm-Gg: AR+sD137j0QzGcSPWRy0MtRoJlg9IpbLqFze5SGaGch1uPUrYui+suotpHfY2HPFK16
	xeJyW/Cb+qV6ajYy6RPS4Gucse+9A8TG0FcVQjGdVDEFdxrv0yGY8j6NPKkiDtlXRIJEyVaTiys
	0o3E8ph/k4ZiJAxtoKKWa9JooszBvaso38tnND9+UfBpMhC8ynyUTa/qoUxfYqbdWp7U7aLo/kz
	wwymE+bWvBHyoGUOc7iYIYl48UCsDqp6RYA7md2JA/O9NtjVdsORwE7e2L4gyEHnqrzK5RMZB7+
	Tp9PZRc7nCW7j+DxCYJgDSkuunczsKFtT2AAob+LXbN7btlCk6l2XUQDDu3kmBXxKfV+ASXtf/d
	L3ggQkoWi5eKYSFiD22YGYX/SH8mdFpud
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id
 98e67ed59e1d1-396d0e5bbc0mr9523032a91.2.1787894859450; Thu, 27 Aug 2026
 22:27:39 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:27:38 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:27:38 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:27:38 -0700
X-Gm-Features: AcwNN1V1XtOMwtbbFljXfNFuTDGO2fgdE04DxiefRUwgFn8oHxIWjYAxDBzqN48
Message-ID: <CA+0ovCgZF_+ThNPAmYv6K8eYi-qNpBDJN+ob_gtp0zWfkBWB4Q@mail.gmail.com>
Subject: [BUG] pvrusb2: GPF and use-after-free tearing down a partially-built
 v4l2 device
To: Mike Isely <isely@pobox.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, pvrusb2@isely.net, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/143-media-pvrusb2-gpf-partial-v4l2-teardown/

  pvrusb2: Destroying pvr_v4l2_fh id=ffff88812f7f5000
  Oops: general protection fault, probably for non-canonical address
0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  Call Trace:
   pvr2_v4l2_destroy_no_lock
drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:846 [inline]
   pvr2_v4l2_release+0x3c3/0x550 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:918
   v4l2_release+0x24e/0x370 drivers/media/v4l2-core/v4l2-dev.c:471
   __fput+0x435/0xa40 fs/file_table.c:510
   task_work_run+0x1d5/0x250 kernel/task_work.c:233
   do_exit+0x6ee/0x2360 kernel/exit.c:976
   do_group_exit+0x20c/0x2c0 kernel/exit.c:1119
   get_signal+0x12b2/0x1410 kernel/signal.c:3037

  RIP: 0010:pvr2_v4l2_dev_destroy+0xb5/0x320
drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:805
  BUG: KASAN: slab-use-after-free in pvr2_v4l2_open+0x1b8/0x720
  BUG: KASAN: slab-use-after-free in pvr2_v4l2_release+0x289/0x550

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
