Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A843FC5A5
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816617; cv=none; b=Ih+QSCy2xvvuoY7BkQadGMS3toiKNjAtqTSw6RCXWZxBebd9jLilch/GHhIJmx3DyAd4TsyBbMaE8P1dAiKsXBaECxme/ZZVb2700gvFT7NbYVI1b4i8WvVaCLN5TBtXhMq+nhJpMmMzFo+5SAq/NuGDB4NFgIJD8xNhBFZbmRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816617; c=relaxed/simple;
	bh=OuqfgCwsVZqtxRZILt6LmicxYaX2tEBKVx6gVJzjkFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=orZkLJwcfpM3M+H+TAhmpSyYfod5rMaGY/zHI3pjGnKgj6XXhwO8uZSKKup1NmMkrlJPX9A79llSx3SIQ2FVj/Diu3ADeK29ZfQrdZ8plIRSY2DhIzquDoZ3DcY7st/we182G9YCY2yuTHWvHnmt2ENpyoLHibnjiM03lJzZe8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bca6Frhn; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bca6Frhn"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-80cebd41372so25592707b3.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782816610; x=1783421410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ct2meXVViNeWBwdWcZDdykdqK/c8ULx2kOKz+SeQ1uI=;
        b=Bca6FrhnSz+/MmrvMpK0yp7Su1x0DoUnThr3Y1Wgzs6rYLzzc+VTe5PeQ9nc8SHMPm
         kxPMf2ehLZ5LASvmdgkkoO3mlXGeEwVHNwOH9+Bm0FNu7/L/KapXgOzh0zmlg3s7WkZA
         ZCz0xioAUt/2qepzqP1NO0VjzGJ+WgcVkhoWVNqoto+4YCKa4bRDt9PrWHxHMxPABDHw
         Z6g7SB+yBYB+oZhL/e2Ikw9ud5YLMHs98uYwGZP6h50ARRGB1AkdJN0HhgTwLY0sC09o
         RABEUW4TWsp3xhqu7jlyNiqk5LlCEFVmxBXrTuoqCht7oNfmylFrLNOm1ZZ3liwHmU6I
         5hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816610; x=1783421410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ct2meXVViNeWBwdWcZDdykdqK/c8ULx2kOKz+SeQ1uI=;
        b=GUXUCtV2EfvOAIGsisPCaTdu+p7hHdIsyOXf+zSjvXmafhCvfTMPXiy3TY0oE1xfZo
         y/dxfsEHbZQorNIzy9aQpGyCG5TfvcGLm1ZmQXEC4nG2k+byI+k/YHk1qwesAEQjDUSc
         3cuq/YYbGppifMkt+MSh4DGgwnXcefrEL31CG1bfuEknqXcvAoYFx8f+tvfT+cewYPqQ
         6NJMZW/9Hh8oMY4RYlaqHmLLODtTpq0FpaX8aziy/7uzk/i6Kwm1iNIXtKWYgcWl/Xgt
         Wog638Z8JuPwtxxQ6XUNqnhaDsyro66VV70sylPHUb5PbSeZgFFeYMBV0/4h//+HBq0K
         4gcg==
X-Gm-Message-State: AOJu0YzP3/X1TuTlfKBRvVtLd4iAddgS24quVW7GFm4eyqaRGjCFXRiB
	h+b/PuANdfBFMpt+onUQOqzRieK6n3SY0faDtTJluFWD6VaM+1eJE3oZ8qpoH83GL5o=
X-Gm-Gg: AfdE7cnDSSWVe9r9lSak+Wfqs7L+jgm2o34w9egs+sJKvzRWDu4K//5MDJCl72Fo8fa
	tj7Ms8bQ6P2Cmm7xzxzC6+kYcXyUSIvlVW3f7HYEJBEwEPWk+sDUjNReBZW0mCSWIGUe28KxFDV
	4EF0tTki7LFxOPiGJv4fVKE7MkdOkJUusgixrl96oC8Ev3Cry094hRsKKvJy8EUIlULs56jq7fQ
	yjRmmnhSBWNdavkIUvxhvyZjpLI1AopGYjmqYCCLEVnrvMZLpOk0bfaxwOWbpmwFEUGNlnmE+DV
	Gg+KnWhv6k1E49V0cD7NKnD19i+oYAgPadFubKOYaz3vtuR3B7SjCG0xfixKhDvTy+8smA7waTu
	Sh4Z/bts59KpbVVoltFi0cIvJUEtUUx1CvL4wzfW2ariE/30usOEQPSgka8csv7ZRkQGJOb7HZK
	mXgFR2jY0ACpKQlBXrwFf9lurg1Q==
X-Received: by 2002:a05:690c:9c09:b0:80e:46c0:68b with SMTP id 00721157ae682-810da603af6mr33566917b3.56.1782816609799;
        Tue, 30 Jun 2026 03:50:09 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-810e7d64dd9sm9192777b3.20.2026.06.30.03.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:50:09 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] media: dvb-usb: opera1: reject failed control transfers
Date: Tue, 30 Jun 2026 12:49:56 +0200
Message-ID: <20260630104956.53897-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

opera1_xilinx_rw() copies its temporary buffer to callers even when
the USB control transfer fails or returns short.  Read callers can
then consume uninitialized heap data, including the firmware-loader
status byte.

Return immediately on transfer errors and translate short transfers
to -EIO before exposing the buffer.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/media/usb/dvb-usb/opera1.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/opera1.c b/drivers/media/usb/dvb-usb/opera1.c
index 3c79cc6848b4..e5172dcf782e 100644
--- a/drivers/media/usb/dvb-usb/opera1.c
+++ b/drivers/media/usb/dvb-usb/opera1.c
@@ -61,6 +61,12 @@ static int opera1_xilinx_rw(struct usb_device *dev, u8 request, u16 value,
 	ret = usb_control_msg(dev, pipe, request,
 			request_type | USB_TYPE_VENDOR, value, 0x0,
 			buf, len, 2000);
+	if (ret < 0)
+		goto out;
+	if (ret != len) {
+		ret = -EIO;
+		goto out;
+	}
 
 	if (request == OPERA_TUNER_REQ) {
 		tmp = buf[0];
@@ -460,8 +466,20 @@ static int opera1_xilinx_load_firmware(struct usb_device *dev,
 		return ret;
 	} else {
 		p = kmalloc(fw->size, GFP_KERNEL);
-		opera1_xilinx_rw(dev, 0xbc, 0x00, &testval, 1, OPERA_READ_MSG);
-		if (p != NULL && testval != 0x67) {
+		if (!p) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		ret = opera1_xilinx_rw(dev, 0xbc, 0x00, &testval, 1,
+				       OPERA_READ_MSG);
+		if (ret != 1) {
+			if (ret >= 0)
+				ret = -EIO;
+			goto out;
+		}
+
+		if (testval != 0x67) {
 
 			u8 reset = 0, fpga_command = 0;
 			memcpy(p, fw->data, fw->size);
@@ -492,6 +510,7 @@ static int opera1_xilinx_load_firmware(struct usb_device *dev,
 			}
 		}
 	}
+out:
 	kfree(p);
 	release_firmware(fw);
 	return ret;
-- 
2.54.0

