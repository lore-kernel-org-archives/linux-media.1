Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777004052B5
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108475; cv=none; b=Blco5AlEt09dKEe+HncfY8azhS0QykA/T5TxCuE7xKGLX8HzdpzsYIWYKLIiuUusGf2mVpCgc6qosSY9s6BXyILHB00Yuf2CKYf4/Pk/yWeTSjxOD/VWzwUYdJ9O1f2xRb7XTFxCUqQTP5vtDGXTP1HFBoVEIxSV6y0dZKvOXtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108475; c=relaxed/simple;
	bh=kKxpjMyiHK9lV9OtcBaphCHIS0puTCLcWrgvqpO3mqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KcaNt9fWGpU1jtCh9ArzA4L1L+7TafvvCotnHcZRHzTULMLjMgvlXEpM+m0PiUsgfROssjnyqRmsHkZX7qYe3UQRXhpxB+rdS1jprSZIUk8AzuzUFIYVZqDT4H+q9BlEgWpzBo6xm/9QD2AfJdPmGjlhxLKCA6ZujIjGOsJ1VCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aB5kz36u; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aB5kz36u"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c5358fc28so229271f8f.0
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 03:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108472; x=1791713272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lwakMGT3g+t2lkoiIlXbmB0IFTfs1dS2fNYFlIz4+A=;
        b=aB5kz36ucnLKAP1jt5BMCSeb09oAFnlQHYHQYcy4/GrIt5NCY73BJlWaQy5ydaVG6O
         kfcBbHtykA4abkAGWNMPGbHUyo0y+3zgX29/ztxjEKd8hQW+2N+3uDsiXf7xDYMXZl2c
         UEiaNGRhMwKcEfhVUiPNg+sjqxGQF4b1m2/N0sOBC780ChEFzvnutjWJhckOyHqEBnmK
         XP0lEAT9aVTJYmo2m7OthIO+/gB0Kjn5TVdfQNWqx0GDJdLOpZ7oSMe1K+b1cloTJR+2
         Qxys7g1Zxw97W6MXVXZelKv4fACPCPM2VycoEDpSMEcb/nMJFDMWAtxujBNZEFCnvWo1
         ndoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108472; x=1791713272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lwakMGT3g+t2lkoiIlXbmB0IFTfs1dS2fNYFlIz4+A=;
        b=K/HEdc3WNDWzbSn9B5a6Sv82fNWA54zHDL6PcmhpyTyCvwdwakxxr/oIrK+2rRxfKw
         FstcgkyMXjBzUZiQTukT47XpipzFsnxLENC2Cm8Aptyym/HEtkFMLPitjNgCxaz9A5qi
         Ko9PECLNzbTvFlwaU0mCI6YBf4//lrHH9qweQLcxJ3ntF4RJ+uxIaoz9uSikI8a8L1xr
         ZA5YYAmNDeo13JcrG3aliIGCrQRqxrl/KVveOExwWMOnSt0/xLRlAIevntDendukXNIY
         oAQFu0yaF0pTpzBwDCpIOB2Ed2Qb1FvGrvwhX0BxNsH5JcOWb69W4MVU3//RLtCi6hO1
         XxOw==
X-Gm-Message-State: AFq9FYIoy06N2cUUJ7SglCldegAltUIZjyj8R03Zmyo4yF175LOY2zt2
	08Oz21mp0Sf1WXtAwEfQpsSYbl7J2OIOETkYD//tO5F1SDyyniOl3nx4krP9TxoG
X-Gm-Gg: AYBFou0ix47y6fFAfWn5MoHy8J8SbUfXKnodAhTTNZvuTgt0zHYP28dkfZpOUKBmtI5
	z0217142vgAB1gCNxTSxRjbrFY0kmxsHPReS3BU0Fqnb0mDD2rUu6ju3kZcwMCRuYPI4UYKKx7R
	1n0D3WwT3Px4sJPVQq3mxdOYBFqonY/mV9SlrkgGJzEvnt/uvOsy7iPA5I1JPMsnuOqVnKqwMKt
	uIryZw2h2rL2cbKxPhaabuAFT/AX9dBNvFdRgSKlNkp6+gnOciNVaaaTFfh+FSUWlalwv7xYl9r
	cnEeMdjhX2AKnkkrr05zDPcn1CcZmCbKgH8XgiMJR9PXZcGS2aRDW/4MCaIuOvlx/8PxGI6srV1
	IiMGLfYIBzbxUg/pTArrJFGtd6bmGNpkCfQ2hJ9LnpXt1sdikQD0v25IzoiVognJwSoxBZEGAvB
	HT1Sm7EClTw2zmvnkED4rf7uRR54MK1ZRQKG1ppEiE9dJma45IKCL/vvSdcTWHTVHso1OAjoo4i
	8RHuh4J5aFcAC2e1RSEvQMJwUbap8aY7FztsjOySpEtWVdX5WZnvM+UoNuVLso0EdTCtEZ2/weP
	tX4C/eofp2g+j1vekDP2JeR3BqRCmsUAV8jVYjyfK2y7IAKQzbeIKKAbpJq3v6RGJpAolwbwui+
	1K/yjw45VjtvC+ZM3EqbMjWOEXVzyEks=
X-Received: by 2002:a05:6000:2610:b0:48a:f511:e418 with SMTP id ffacd0b85a97d-48c48010c2dmr6844621f8f.38.1791108471535;
        Sun, 04 Oct 2026 03:07:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-b17d-de75-1ac4-0a1a.ipv6.o2.cz. [2a00:1028:c000:ddf:b17d:de75:1ac4:a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm18136032f8f.26.2026.10.04.03.07.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:07:51 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 2/6] media: az6007: propagate USB errors from I2C transfers
Date: Sun,  4 Oct 2026 12:07:37 +0200
Message-ID: <20261004100741.71711-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
References: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__az6007_read(), __az6007_write() and az6007_i2c_xfer() currently map
usb_control_msg() failures to -EIO. After disconnect, USB reports
-ENODEV, but drxk cannot distinguish a gone device from a transfer
error.

Propagate the error reported by usb_control_msg() instead. Keep short
transfers mapped to -EIO as before.

This lets drxk stop retrying and accessing the device after disconnect.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 4ce1afe01c3b..5449ceda87e8 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -109,7 +109,7 @@ static int __az6007_read(struct usb_device *udev, u8 req, u16 value,
 			      value, index, b, blen, 5000);
 	if (ret < 0) {
 		pr_warn("usb read operation failed. (%d)\n", ret);
-		return -EIO;
+		return ret;
 	}
 
 	if (az6007_xfer_debug) {
@@ -163,7 +163,7 @@ static int __az6007_write(struct usb_device *udev, u8 req, u16 value,
 			      value, index, b, blen, 5000);
 	if (ret != blen) {
 		pr_err("usb write operation failed. (%d)\n", ret);
-		return -EIO;
+		return ret < 0 ? ret : -EIO;
 	}
 
 	return 0;
@@ -782,8 +782,9 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (ret >= len) {
 				for (j = 0; j < len; j++)
 					msgs[i + 1].buf[j] = st->data[j + 5];
-			} else
+			} else if (ret >= 0) {
 				ret = -EIO;
+			}
 			i++;
 		} else if (!(msgs[i].flags & I2C_M_RD)) {
 			/* write bytes */
-- 
2.54.0 (Apple Git-157)

