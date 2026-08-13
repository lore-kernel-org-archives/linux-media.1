Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD1433F8B4
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 03:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786590881; cv=none; b=nZMl5UaaFhL9368Zb4TY4evvbTVamhx/i+g+8kbkkf/9iDUCwh+bC7CAWnKC2FYqI/AOpM4oDiBzKOL9mdKgpURd6ZBx/cKEeR5x8XUEDu5mciYAJe/HPWJQvzoSzfrWRZRsyAU5HzaFabJois3iPjQI1vzEq8v+sRflgxusheM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786590881; c=relaxed/simple;
	bh=+yR0GXJqvxpnWE7rNwD7MXMlRLXMjpOcoHvHrDYrkQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UbIMcyenxaErh545lKOWWJWJJHbZBSyebWhyc3C4wFAsgHaDppJnR8S++5VLwI+tNzD7duSxzJq9/Ay081IEohTsFYHE6QiQe1iT1NiKV60Cec0psyUne8frqszHlWacRR/pp+xW4DK5W5q26izo+bgUJmGHnRkq188OiQTCVGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6nJ/Wpe; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6nJ/Wpe"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e99ef0902so73965185a.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786590879; x=1787195679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uy5Tf0mwgrBlKO3FuSF2JspqHb4xpS1/b6uDnqWQvxA=;
        b=B6nJ/WpeGrM+uCq6lvdYKqSxQrqos3UeHPArDE07b5JzrzR7M7OnrfO4wYjnui8UWz
         H3xBumnQFIbAreCQrEjPhtB5nNEQFLWl+V6YcCZjH14u7vZ4/RY4v8KjgtxreXN96YJU
         ++abJGU898h2DSWHTe54+ZGe+XTic0xk0u00UhaMY8ch8SrD0Zji9Hj0CmWwBGSbpJy6
         T9458n7rZr+FIKopN+jRHkevcfvBND3IobNWtUk141LQSKoOqI+y4ERilnVyGHAtk6BI
         Gwt/V73EO3m1GrxcdbDfvjbnbTMeHvA3b72q1H8JxKasaxsBaMWZlOwKT6ENz1ppAjBc
         oyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786590879; x=1787195679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uy5Tf0mwgrBlKO3FuSF2JspqHb4xpS1/b6uDnqWQvxA=;
        b=F//5XsVj0qmDqrTij8VCNwRMAlmT47eQRKo2srQa08HhYKk2DNLLBBHFV2odYV3/ck
         d0Nqa583S6TeuWgNhNnM9S1655J9Dn6mg/rw/tEwjfF304yg77dXy/i0Vl+XugdxLHNG
         AtUL/kMCvedkmgfmGqPbfuaDJSkVhBhUsniH4xP/lU4wkdX9RrRkXX2IBBkQpsHNsNgv
         XZDHZG2vc+RDhWEDEa/905sB5TQB60QxhAZcxb+TY0Ksimdd2FJxpuGxpZr/7sfGPmFM
         1CvqygZboCw240cpo2U/MgRFJDQXg83flzKUUhK9aklPtuf65aPKa5lwby2B/XbGna8s
         ahug==
X-Gm-Message-State: AOJu0YwhgmTeaZMYXZsz19GumerFC2ll8pEQ+LqSTp30C6HMlyuTcPwD
	ApSDtEZmZIEZR3bhXKACbjJbker/1lQH+w6GyUhjNZeJpXyCtf8I1etcd9K2E9uY
X-Gm-Gg: AR+sD13+X2llbVf3PUrEDe6dN66JucF+tO5H5ih1pFkchno3LziAPP1PrfJ2VgzWE32
	C49MlsRB5UeTg2456sdl59C5l1143KAoVzl45UXbT+C3P5m4UdjZ2yTfBye+9l5UkFOELpm9pnq
	cIMEx6iydsBUPb7c/b1oW8+6YSOVH7RquyOYbIBtsk3YGPW1VJTvpMtAM3LPav7VOroiJYf8Q7v
	geUI3iisxarIcA3/5VN0ccnXdq4BquwLtPmmoPENEuiD6eQXZg724akMHObnT7nJr5vqaoffRl+
	lRE/4BO3T719KA0MIlUKCbrrltioxshbiPP1Q7jj0HInjn73qju292cc/j0nOtW5P4/3kHiiXLs
	6bTlia6XDkBodlRTohpbot6zLXrj+xs+v/l2H2SHhoah+DKwHrl02ZYRaDKghMFULFAvRSscEQL
	576ptaAuQQCP0hIXNuOiifE1qRAfSmsMS9kFePl5+k2ZSISATB//7/tNyJT9cF8NZsmEzOncXjo
	jk1aWqujm1cuwk4FA==
X-Received: by 2002:a05:620a:a48e:b0:92e:f41d:4730 with SMTP id af79cd13be357-936bf8e8a3dmr214213785a.5.1786590878945;
        Wed, 12 Aug 2026 20:14:38 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936c1b12283sm52741285a.23.2026.08.12.20.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 20:14:38 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Subject: [PATCH v2] media: gspca: use vb2_video_unregister_device() on disconnect
Date: Wed, 12 Aug 2026 23:12:35 -0400
Message-ID: <20260813031235.2468144-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gspca uses vb2_fop_release(), but gspca_disconnect() only unregisters
the video device. If the queue owner closes the device after USB
disconnect, vb2_fop_release() releases the queue and invokes
gspca_stop_streaming() at that point.

gspca_stream_off() calls subdriver stop callbacks and
usb_set_interface() through gspca_dev->dev. By the time the late close
runs, the USB core can have freed the usb_device, resulting in a
use-after-free. This was observed as a KASAN use-after-free in sd_stopN().

Use vb2_video_unregister_device() so the queue is released and streaming
is stopped synchronously during disconnect, while the usb_device is still
valid. Since the helper takes the queue lock, which is usb_lock, call it
after dropping that lock.

Fixes: f729ef5796d8 ("media: videobuf2-v4l2.c: add vb2_video_unregister_device helper function")
Cc: stable@vger.kernel.org # 5.10.x
Suggested-by: Hans Verkuil <hverkuil@kernel.org>
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
Changes in v2:
- Use vb2_video_unregister_device() to stop streaming during disconnect,
  as suggested by Hans.
- Drop the usb_get_dev()/usb_put_dev() lifetime workaround.
- Call the helper after releasing usb_lock since it takes the queue lock
  internally.

v1: https://lore.kernel.org/r/20260718025434.2259756-1-shuangpeng.kernel@gmail.com/

 drivers/media/usb/gspca/gspca.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 594d73e50b9f..4185c9047241 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1636,9 +1636,8 @@ void gspca_disconnect(struct usb_interface *intf)
 #endif
 
 	v4l2_device_disconnect(&gspca_dev->v4l2_dev);
-	video_unregister_device(&gspca_dev->vdev);
-
 	mutex_unlock(&gspca_dev->usb_lock);
+	vb2_video_unregister_device(&gspca_dev->vdev);
 
 	/* (this will call gspca_release() immediately or on last close) */
 	v4l2_device_put(&gspca_dev->v4l2_dev);
-- 
2.43.0
