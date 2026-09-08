Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F81D2F5A36
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 04:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788840502; cv=none; b=vGVAGulX9THspzegrKDeRT1snzAQ+Y2srkcjZhtzdg5Yk9kixu1T1auw8jhi0DFSd6kvfi5BiMsMuKij+QMAdvRy4fzwi35/Oq7HXbf8V1ZemeCXtlN+3B6ZOiByr+AxmW7hkYjwuEmOAEh/gUqCpHW7io67BSKA1ID9kONgSo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788840502; c=relaxed/simple;
	bh=nuNxXV9IiXZmNVfBWYtPD7tRbYcEpSpQ5MUnS2wUNDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=adAF8GAzmBJQ+ZASOca7AB490T/yah00bi4kpyaqw6WEDaHZvT0hjNiEDS/SnpMQutMKuz03X5sckx0eOWKe5PsMQinGXnk0gp7hJ8ydSNftFL4R8WYTkfiq3P8fmKHgA0E0Fr2XZDsFEdi1BDGCgnoWyO3wbv1dbxBS/cNexK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwRR6IWu; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwRR6IWu"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90f9f8553e0so51236526d6.1
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 21:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788840500; x=1789445300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxUbMbA1DbE2G64rQIDQk+y7x2nUAdqEFheE61ifZbo=;
        b=WwRR6IWu7yLmHDFoRCU0zQByOtv36iHLPKIfpRyG5mYhuOpF/JS7Ck2MfdW5w7fEcF
         LIS+TnOvbUfe1g1/EefZUlQc3m2ocKDVhxkeqmmmDlxeq+23nbq/XyDM/sWNnqgPZLlx
         x5PAa+AELvlBvccPjpwE2B1kLUdvkZg7pTm3gfib2Tk5YNQGvvwsSHe+GT0HmzJpcR+w
         Z7EXDxuJbSBrApfn3UEVvbzhbDbbjURMIQohOc9MSMxyuJgAVeGW6IQirFcUp9HTtJzD
         V4/zP8rggnzqvfHxWvPn5verfSHjC5n6Lkzf7yBXhfe2+cmEduHSQb+Y2j7la0fMu67j
         /f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788840500; x=1789445300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxUbMbA1DbE2G64rQIDQk+y7x2nUAdqEFheE61ifZbo=;
        b=UH41RBBGllsXcuOIYzMPZByoUi6rcLEO5Yfy77qTmRzvyIRNpRgnPkYYf7s+AQLtyH
         /w1UUzCUWEu0SH8HL5bzxrVdJNVkP6IKrvH3isbNXwEz1P/2kPZoM7yUAKu7XZBd3Wrz
         zRZnTY4gtIJorPyJwRj1TjaxMVWJVrewVzJE821fS7okdD60N9cr/hCbQNlYOfF4O0Do
         Lt/6uJ9khGKt/GybLuPbx+zm0ZxSPa6AoWHEbJDiHO1xx6U938dhjxqaRczKCv7zPoEw
         rGWn/+gS4FIFpmJDrsI5EP9foVUnm4nUSdR2sVwFDUzAm7T7oIW5cG0PKBLjgJOpwvjO
         bOUA==
X-Gm-Message-State: AFuF++kGf0wGoKwhlnCUxpvDTEpp3lhc0rLeFK6sgUDbBi+iQWlCOdPj
	6Jcb6Lr6lonNQ8Mw4dI8XJKK7Fh/gUJIR6IVWaM0P9qSJo6lgWEaTeoA
X-Gm-Gg: AYBFou0d37pdav/Sx+6b29e5VjFIl01yM9ZJOLeW8KkbTmcb6yudTpNaPyYtFE/ybA3
	6hrj+7jgdw4I1szD4SK+zfKUZA6j16q4cXDDU4pLkl/R4XQmUNjqeaHI+vZ6hXswzn6fVpD76wS
	9lso7YwSmgw7DbYxp5LlhlJ/day3zoRe0efKwk2Io/3uNChPjaRTHWrmGvZIRF96W2aa3Z0qeuu
	O3b1JqsS9vvlngQV8t8mbT5LxikwIlSyCLBaglVpPvqcmI9B5NQI/dsQXDR/KxoX+rT3lkGvXCU
	mbi/o0pqotktBDo4E8ZD6wNLyYd0QZHb5RChTeqExeyPpUHmgX8HYbLsoTXXUN1boYh3ltTqKc1
	OeEEGnTTFUHeRRpb8k/ENKW/IZrDYvEsg+yYRSrXDAlCab4xbmsLihUOvvFlWITSqIbLaM67HwG
	g2ysjVbR1pML4InwejDf/vS5HfzAW/9hw0oqOWUZsHtpjeSZuC7+rO3Un7TBeqsLmuTW5sHqQkB
	Zklk4qjPjmz8ZbkKuRidu64fSKOa4lyvzF38d3BO+VSPpF9+3nQhKJQZTGRZQrw4i2gXJwMoV4r
	PsvKNcMipux0OuohI6pfYcSb4g9dtmgmLQFioPUPtDyxBT2VS6W7fkG+jSFmznrYZig4sKGBYlX
	ziFpcn++zU4pQU+JmCB+GZWfwsLbKNk0=
X-Received: by 2002:ae9:ee06:0:b0:936:e938:b07a with SMTP id af79cd13be357-9398032898bmr2266288085a.8.1788840499956;
        Mon, 07 Sep 2026 21:08:19 -0700 (PDT)
Received: from MacBook-Pro.wireless-1x.unc.edu ([152.23.158.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb566a8sm1055026785a.25.2026.09.07.21.08.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 21:08:19 -0700 (PDT)
From: Juan Perdomo <jcperdomo100@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com
Subject: [PATCH] media: cx231xx: preserve I2C transfer length
Date: Tue,  8 Sep 2026 00:07:34 -0400
Message-ID: <20260908040734.1175-1-jcperdomo100@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core stores message lengths in u16, but cx231xx truncates them to
u8 when populating cx231xx_i2c_xfer_data. A 0x700-byte read therefore
becomes a zero-length request. USB treats zero-length control transfers as
OUT regardless of bRequestType, so the IN control pipe trips the
usb_submit_urb() direction warning.

Use u16 for buf_size, matching both i2c_msg.len and
VENDOR_REQUEST_IN.wLength. Oversized transfers then reach the existing
URB_MAX_CTRL_SIZE check and return -EINVAL.

Fixes: e0d3bafd0258 ("V4L/DVB (10954): Add cx231xx USB driver")
Reported-by: syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ddccc0c0dbc0a38ffccb
Tested-by: syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com
Signed-off-by: Juan Perdomo <jcperdomo100@gmail.com>
---
Testing:
- Syzbot reproduced the original USB direction warning on unpatched
  df290809 (Linux 7.3-rc2).
  https://syzkaller.appspot.com/x/report.txt?x=1107e749580000
- Built the complete cx231xx linked object on ARM64 with GCC 11.4.0,
  CONFIG_VIDEO_CX231XX=m and W=1.
- Syzbot tested the patch on df290809 (Linux 7.3-rc2) with Clang 22.1.8;
  the supplied reproducer did not trigger an issue.
  https://syzkaller.appspot.com/x/log.txt?x=1123f105580000

No physical-device testing was performed.

 drivers/media/usb/cx231xx/cx231xx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index 19f5036a7..f85d054fb 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -463,7 +463,7 @@ struct cx231xx_i2c_xfer_data {
 	u8 direction;		/* 1 - IN, 0 - OUT */
 	u8 saddr_len;		/* sub address len */
 	u16 saddr_dat;		/* sub addr data */
-	u8 buf_size;		/* buffer size */
+	u16 buf_size;		/* buffer size */
 	u8 *p_buffer;		/* pointer to the buffer */
 };
 

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.50.1 (Apple Git-155)
