Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266084;
	b=heACZTaYx5agtBW0LfUKiWbk8/+eUbdv3wfJ8toM5NDLZs1LU/7MB8hd9q/xUABp5F95
	 Di+C3GzkHMJ49Cf8tD9u+UfLaImlg/V8HXxNrLEphc3nbCqxUgj0XakxSWVMs4nxc6h2J
	 YHmWMYxM+bi/hIwlGurcl4VInwDTd7/7dti50ecLjAke5zdtJPCyIMoS5FI+SMIC5jYVL
	 XSFR4meh1o0hHLW9Kft/TKzoObhpGo4DDeyN4F/vtvCv9r4OX9m7mc3lPee8NqIvTuBuQ
	 OZGPnBjxR8DGXdO6EUOqea/pMeM1uX/hJMjboDQsfPiDIaECJXurw3d0pQh4Myrgz1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=9/jxKfPImA2lBxKNaUdoM0QYCxHpfos6259KgT8iOj4=;
	b=RRsv9DpjKGDmXAv5dZohVmT+UzQtkbQx7QuW/204rMd7A2PC4CXpAvP8XlHOWKBfJRg1
	 582BvcVmE5uBMtmJywwna33JilI4ZSaJTey5HsTckVyrRhvyITYYb7XpfZSWr9wNttrGp
	 SnBp1jXHwjIi03SPgkISIte6iHqkF5gZSNcMkk4OW/LCjsYuV+w+XAPNwUD61jimZxFiW
	 8BwVLTX+Avf3cV3mqMAc/HFbAJGHK80ii/jndH6zV0SAmveTCdk9iKdLzjngpw05Id2Xi
	 HPF3DnEOKZySoKJNIMBB9BW2fb8gVIqiqPo3JTID4msJJSXnFSUpucKEeCT/5FMeXhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KeePWcm+;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1599B606A325
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1599B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KeePWcm+
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso15478255e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266082; x=1793870882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/jxKfPImA2lBxKNaUdoM0QYCxHpfos6259KgT8iOj4=;
        b=KeePWcm+Wc9Cr2dsdQ+BuaOUTZiIN78ho+d101xqGdl8e0TbAVujoEUnb1W58Bz24T
         nH+yJxJa1wFD2C1Kftt/0jM9FxMHe+jSsqqOuISSwZbMpqzxq1er9qeXhLOYQ+74xz37
         mgom2jjfsZOOMvU8xkKmHbi9guvOkzoFkU9bpecyUJ9fRPlBGCkuOErVuEOCAYVp3pbj
         9mzjTOsHNgk1ZqrFbVlSsZdufFLeZDGUiZfd8SStCb9aI4QEZSP3quglDJnEfot0W+zv
         jmC67M2cZNzC9p6mrcHDlDblyGTMrj80wqPstKxYiyxtRddEgd0HI/ZZw/7Ide5N+JLd
         G3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266082; x=1793870882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/jxKfPImA2lBxKNaUdoM0QYCxHpfos6259KgT8iOj4=;
        b=L37eNV1+ehqIf8vM34cv8mys39XUBnDzXPKY27gnWOO7KYtJNuEf0reYg0GtnJ/1nD
         0TMO/6GTlsaS9XKx4oH2VWFe9pksKc7KE39VopE57nR05AZI9gSbAawVfk4boRhhMSCj
         xwfd14HPqeEmdYAdy9F/PFi7+SYcatSiI7yYi3r60NCJVh5qGlHR0d9gZuMeqv6lQoxk
         dFfa1hG7ZKjuxdTt7gadtjE7PD7sNyXTk1awT9Dv/E9YUipUz95TrKJFEXLvH8O2gJ6e
         Mt6kAHSOFMIExNtFkWWiF54Zg9HKwjQOhdViofrXKBhKnaC7c/6D4wfOHbMqUGTOrFj8
         N5tQ==
X-Gm-Message-State: AFq9FYKW0tMn99g8DU0us1Tf9P2MLDy9iiCsZYJi86jH+p2r7GuxnQO7
	M+R+yLjehE15tf97ChTqmfusqmtJAHXDl7pBkbwBhuaI11nqNQfre5iZ
X-Gm-Gg: AYBFou3Q/neSORjcagNdObPxht5zN7dgLHBdtM384hfbb8ugX/wyIiJoWDcGQtXe2JM
	mIgliw63yz0kxWAC2n2uiJwI9CWHKh1Z6cQ/YiTwrGrn9iCG+D7myFGkOztSHLrKHRJPvatl+2b
	PDsKJuAaoGBDxK6HDyy58i/5B/uV5AQVSADeOlbHx3QoW1pdJi/9mhXKUB6o0E9hvKHlLTOj2o7
	djo5E+5Hga5/agOYSLK49GMyxeIbLrUAxM+AavD33nyv76cRS35814rxxc73wMGgt8TPCElgHTR
	5hIjGo1grjmpCST1+JGt9Fj9W06Ao3muphHzb9946zoKmGscoG3bOsa29nBNRbrnroFwJI8OV8A
	XmJwsD9XqL76xU8bPFRol+cp44NGVwQmTm2wmRY6mVx+nH3y42hhpmJjomE+bb8cGQGp3SAhHrn
	19bdpIs4ccE/JLoWe/5CVR9CMSx8VIyww4cEBzVpZrWp3pVcq91RvlIxujg5VDH9mo5yxmp4X8q
	WbSIr+arbJlnwBrhYm69N2EKnQLIeap65UFzHdOKnbHL2GD7JP+sVclQN2VROA+NsLRPmdQU/sb
	f7VqCcrGQWqYO+cmAfxxfcF5Nbyy6RTT97C8QdJbEw3Wscivpjyqt4U9RcOva7j+XV2Qq0gwgJK
	wsCGOOwp1PryRgI72kF8zKA8G1iATIUe+Ep4u3DtIQFX4/2NyAnqD2TDuPf2nc4TlbKQM
X-Received: by 2002:a05:600c:1909:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a9675dc5cfmr104513485e9.28.1793266082206;
        Thu, 29 Oct 2026 02:28:02 -0700 (PDT)
Received: from PC-Marco.local ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm50821065e9.11.2026.10.29.02.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:28:01 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
Date: Thu, 29 Oct 2026 10:27:52 +0100
Subject: [PATCH v2 1/3] media: i2c: ov5693: Program the mode registers on
 stream start
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>
References: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
In-Reply-To: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266079; l=1906;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=wDDDCzJbYkoM/2Di8Lb+8DgpOV7JdtQpC+jcKZxFM+s=;
 b=+d0eC5QC3OMVEwSidcggY3ddHIqTWFxa//aGW862oYz9O5WY7787bbb6G+O8C3w1oc66AqzCl
 /Ovn/eHZyQOD/k273XdjUIJas2/IZXDVyVzOFdL2xkshj88I4rOJcKT
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

ov5693_mode_configure() is only called from the runtime PM resume path,
through ov5693_sensor_init(). If the sensor stays powered between two
streams with different modes, the settings for the second mode are never
written to the hardware.

Move the call from ov5693_sensor_init() to ov5693_s_stream(), before the
controls are applied, so that the mode is written on every stream start.

Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
Link: https://github.com/linux-surface/kernel/pull/181
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 56599f9ca..d09095c3e 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -663,11 +663,6 @@ static int ov5693_sensor_init(struct ov5693_device *ov5693)
 		return dev_err_probe(ov5693->dev, ret,
 				     "global settings error\n");
 
-	ret = ov5693_mode_configure(ov5693);
-	if (ret)
-		return dev_err_probe(ov5693->dev, ret,
-				     "mode configure error\n");
-
 	ret = ov5693_enable_streaming(ov5693, false);
 	if (ret)
 		dev_err(ov5693->dev, "stop streaming error\n");
@@ -1000,6 +995,19 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 			return ret;
 
 		mutex_lock(&ov5693->lock);
+
+		/*
+		 * Program the mode on every stream start, so that a format
+		 * change also reaches a sensor that stayed powered since the
+		 * previous stream, and before the controls so that the mode
+		 * registers don't clobber them.
+		 */
+		ret = ov5693_mode_configure(ov5693);
+		if (ret) {
+			mutex_unlock(&ov5693->lock);
+			goto err_power_down;
+		}
+
 		ret = __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
 		if (ret) {
 			mutex_unlock(&ov5693->lock);

-- 
2.56.0

