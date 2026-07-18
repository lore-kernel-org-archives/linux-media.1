Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20658282F39
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 02:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784343314; cv=none; b=SnlLWiomoVjD4yzCuApE5L0/F+CKo6rgXO0YawGBtIve52eiRRHh8CmlXrFaMYSG88SCtdAWVmbp7LJw+pFCq1lIRYhJ9aj0xuhSqkF257arLH5Ru9deDxdcZ1pFprJsA/9lYkw3p1B1ioS/6dIMFxafONSPQCCKU9bPOZn8Lzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784343314; c=relaxed/simple;
	bh=Ul0DFw3Ej73eiCwcTexNy8jh0poOMPwPODq7wz9FOLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rOb9UjZH+rlWhqurTfZRoKmSA6zJ3CR1mLkvXM/rZTUoDTF2UthXB5gHhqCqsD28ZLhNw76xuduKObybOGn+L1EWipfk+Na93IrbXl+/V+ixDdooWa+DmMZks4Q/O2s3uzwiHJHmiTTf8kIA1Muf8LwMpFKKrOUsnju+2XfWde0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvgJ5Vio; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvgJ5Vio"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8eeb4508f29so86592886d6.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 19:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784343312; x=1784948112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=47ZO/fVoFhUn5pOP6KZbb4HeOIXd+WNQBMG6RHvVVbs=;
        b=RvgJ5ViotQLfRJiSoeDnezx0MSxNBQrQhs1y/0aA3Lc4gB4efOA9SsmL9lNInY91Bo
         BHii1kkunIXszvkFdLmUMdwBqx8feuJNjK7EPwG21Y497bYfH5gKiGgIaZqE9zkr2eoc
         3tpU3Oy+CW6yygTJ9+id/LdfSWvC+pde91Y2xFmvw8WBLhgF2pRfSJTuf6ek4i0p7k44
         kr5Zv60T5M5OQfbPQEOnDENEryu68zeNh5cn/Tc3Dyxj0wDyDkjisBlII63/jLj5I0h1
         Wywvz+L1guefGKMynuFzgj12D4oK1teUgCGDuDM9Ew6AkRl14UX9hDAKKzDfo3XEzUCD
         079g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784343312; x=1784948112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47ZO/fVoFhUn5pOP6KZbb4HeOIXd+WNQBMG6RHvVVbs=;
        b=lHHy9jJiTnWaBe7+QkAsPRhRausRVbvBCLLfNYfaiqm1ac6juCvMtNTwn15sh2FLoy
         qMu7+BoJDqXp0nbG+GtAb6Lep0y+XDd5oFiEj/qpYQPJL/NCVOEfuczpiQppFP4O2Fn0
         tCkQXXlD/qmhWoJhac5Idx0aRzRQKLvkOUUwPYGahiAM5jwdI8t/w66x/dw+bdLoN2bb
         guRpevqyzYsld+4DjeCIPX/V+h9172KhWBGnpWh9Tfq/37EY02VLxJDKP5SPIg+W3eSl
         PpWltJRZH9yByfjDy4JgGMxwkP32ChiBAw2EUAnHWqVM60cBdKO53YFdkwf4UerW+57K
         mi1w==
X-Gm-Message-State: AOJu0YxHNiLiUsfwKjRgHJeBDO0NiyWLEAlygW4XRyk6X9+oWtPDbwlg
	BQDRK2zSlxnQ3+0KItDsVqIrWnuBm1EeZ5iaZXkCizd5dHbsFbBhqZxd
X-Gm-Gg: AfdE7cmR0WkcMIP8G5VHLrXqQY+zx4RInhix+uzYa7WlOPqvu3f3zvo7oaWTlnPtO2l
	9isI/vyg10lGQ5uISTyTi180R56h3FjwwLR9AxkyDUhnpM/Q8c0o/aQmu+fODwxnKcy76MKAlhu
	c/P5eQmjKglinYXXJeA4BcjgvakePoSyHEdY3PNecqDQQP5KIUXqNEJXzulQoi7PDhBus2JW9YX
	+DxLFf2Aldb930HPnvaCVpnOer3JGAHGVnKQ/3rHs9XroQnbpHcsoElPfLEOvwK66/iVARXq7LK
	exKimARhYqOlM/nNnSRImDRG9FVQ5n0+J8t2n4IKCHxu8lLiQ9WRlMs0bFUAm0oZMdW4WlXzi5R
	iNBEY6TAUSFbUtT9+SrUta6afSmzAWEh2sBskJqQBc70Ix0D1r0/bWkttS5VU4VUfkk0k62Fa9J
	HMwCCr77tUHKKVpYhKvej2F3WmC7sv42U=
X-Received: by 2002:a05:6214:331b:b0:907:8374:6abb with SMTP id 6a1803df08f44-90783746d93mr18429716d6.59.1784343311874;
        Fri, 17 Jul 2026 19:55:11 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778728a50sm31883066d6.47.2026.07.17.19.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 19:55:11 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Subject: [PATCH] media: gspca: hold a usb_device reference while registered
Date: Fri, 17 Jul 2026 22:54:34 -0400
Message-ID: <20260718025434.2259756-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gspca keeps a pointer to the probed struct usb_device in
gspca_dev->dev, but it does not hold a reference to it. The
V4L2/video-device reference can keep the outer gspca_dev alive after USB
disconnect, and the streaming queue can then be canceled from the last
file release path.

That late release path still calls into gspca_stream_off(), which may
call sub-driver stop callbacks or usb_set_interface() and dereference
gspca_dev->dev after the USB core has freed the device.

Take a reference to the usb_device when storing it in gspca_dev and drop
it from the final gspca_release() path. Balance the reference in the
probe error path as well.

Fixes: 63eb9546dcb5 ("V4L/DVB (8152): Initial release of gspca with only one driver.")
Cc: stable@vger.kernel.org
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/media/usb/gspca/gspca.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 594d73e50b9f..59eb4cec1aed 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1178,6 +1178,7 @@ static void gspca_release(struct v4l2_device *v4l2_device)
 	v4l2_ctrl_handler_free(gspca_dev->vdev.ctrl_handler);
 	v4l2_device_unregister(&gspca_dev->v4l2_dev);
 	kfree(gspca_dev->usb_buf);
+	usb_put_dev(gspca_dev->dev);
 	kfree(gspca_dev);
 }
 
@@ -1462,7 +1463,7 @@ int gspca_dev_probe2(struct usb_interface *intf,
 		ret = -ENOMEM;
 		goto out;
 	}
-	gspca_dev->dev = dev;
+	gspca_dev->dev = usb_get_dev(dev);
 	gspca_dev->iface = intf->cur_altsetting->desc.bInterfaceNumber;
 	gspca_dev->xfer_ep = -1;
 
@@ -1574,6 +1575,7 @@ int gspca_dev_probe2(struct usb_interface *intf,
 	if (sd_desc->probe_error)
 		sd_desc->probe_error(gspca_dev);
 	kfree(gspca_dev->usb_buf);
+	usb_put_dev(gspca_dev->dev);
 	kfree(gspca_dev);
 	return ret;
 }
-- 
2.43.0

