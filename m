Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33412EEE88
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456216; cv=none; b=nw0IPJi0xd91dSOpyAK+bgkt/i/CqXK7BZK8eZK9OWHSpTIRKexc5mhdf7yyiWcI0s2TVORc0wsJuoksNtDvkSMlCeMv1N+HNY/7xr0MZIIDQEezIQdQIprPcGLB5U6BaHNkttZvw5QKcgUbk5YW3Bzhv5r5++WiES0P5qsDG7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456216; c=relaxed/simple;
	bh=9JI68SRCRoyQz/f7w6vRQinxQ01p0+QlDdaGDWZEg2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJhd+Ce/06MNPL7SrRiMkmpeDLjBU0QxGZgibr2ukyR8epTHSyFMCNLl/b21WnRcJobIlp17uuI9dtx05zceEuakM7JxcpdiR0ZHbinB4tcD1i/WrwyVARmP/DMG7u7gJivfFDcA1lpSzbeMnvX3D7Z6hHGqDqhWj5OFdwchd3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qx2aXI+q; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qx2aXI+q"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so19865015ad.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456215; x=1782061015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fV7l28be5P+qBSslSEq0VtNafl/nMiAJlS2Suv7NaqI=;
        b=qx2aXI+qDYNl4qMmFzfSBR8pylQdSIzulJ6868aD61Q+PdeXh69t+qXYdf6ynMs0sE
         fPW0MOALlYTMHlu/2dWElP74nXqEEbTQ+tjRhiopnjDH5Zon0xjyAvDCGGhPsCFXYZfx
         c3/0ViX10KtGss5ey/7VMX6k6C+ZVaplN9T/4QFCr+IOZn6Ow0XTGMJNe/f2XnKkUb4l
         zwPSyBkCuXU54rzX7hXc+4l/NaHbslHED6Mo2SOpVtMfeOvp0xPfUWEDw4UDZnskpwza
         UOX+rvfPxJoBuiqQDRZFJq7AJKqmZDEn8yVti/CAZslyV/rkLjMfoBgDRr1MukScPQeJ
         okfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456215; x=1782061015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fV7l28be5P+qBSslSEq0VtNafl/nMiAJlS2Suv7NaqI=;
        b=aWaZ9ogkjsCMncVAO681F4+5NTaEdnOb1zh8NXXw0DjnXWQzOVV/fIwnXrUL5qj2Mi
         PuRx+/uaRPYZ5BEW33IZbbeCcn1V+1vZLAg/TGQVI8oU4NJM4fOOKoFTXNaAaTcM850c
         U/YAJ1e9Zoo/rce3goAkK5k3ffomuiipRlw9oxHwammETvrSR+1A4bQSKpXftobuli5H
         RbTJJXduIbIpInjZlpuQbOWMQYECDKvHhkFOUCxqQnw8Vxum1QMhAYO5hhDh8EnI7feM
         PSBnFzaUF70bzlb+YJpehY2kvXnYwqk+b/RyrbzIWN3Nwwo8Nn8jd0HoQTLr8YraMjuO
         VBKg==
X-Gm-Message-State: AOJu0Yz4QKQ5e/16wR3uRyIv1mEA0B4vjjt1jXKQvynZbaLBVQnKITCj
	humBlQ5K3nKQ3eLN8k5Iy0ZyivhxVeD2eywC7GNpNuZNhFXZc2gECMw8eP1mFOzS
X-Gm-Gg: Acq92OEozuKLZCLDfHGwNQlu2f/lrAb2sSxvxgIwNXBa8+NmfUvBViIm6CqhaQHEqwl
	UNv7vWTJlD3SKX8mxKUketAOkQsDMD48S2gexrfYVt0j7/h1HCAzdE7u9MtXLBJ2sEy629Eqavs
	KaYwY/lHcRSPHK0RgppTodBvGHz8s9U01qzxXHyLcCvRRoJVKZF6RicWmz130CfpTgCB8ATjCVR
	Q0xTZ2Pnb7bI5NaTI6u8X9XyQJxxoABhs2JrrRzfMuCpCRRtTtAqEfGLMaQ51GNAvq3ZxexqGul
	v64nvaa+QFyo7Mlbt7bO5GWF7JB5n7W0g1h50ziaeCM5US5st2lXzO9gSS2FiUTQ0iFaniPMBir
	3WmVXK5NtItSNNaSk8/y3RLLEd3RzFCvf8bUTsoHkP3y9eohGHxUTmUHKU+wiyHsgyo3KR8F7ja
	2Al+RSq3NvKm1ZivJvKIZDu4r4Zr8lCEpCDNnZnmDSR+OOsyx2ZTJS
X-Received: by 2002:a17:903:291:b0:2c1:5a24:b4ed with SMTP id d9443c01a7336-2c4137dd98bmr117506995ad.37.1781456215105;
        Sun, 14 Jun 2026 09:56:55 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.56.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:56:54 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/22] media: i2c: mt9v011: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:41 +0530
Message-ID: <20260614165630.3896-5-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The media_entity_pads_init() function initializes the media entity, but
the driver forgets to call media_entity_cleanup() in the error paths
and remove function. Add the missing calls to fix the API violation and
prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/mt9v011.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 055b7915260a..b7ef8bff727d 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -520,6 +520,7 @@ static int mt9v011_probe(struct i2c_client *c)
 	    (version != MT9V011_REV_B_VERSION)) {
 		v4l2_info(sd, "*** unknown micron chip detected (0x%04x).\n",
 			  version);
+		media_entity_cleanup(&sd->entity);
 		return -EINVAL;
 	}
 
@@ -542,6 +543,7 @@ static int mt9v011_probe(struct i2c_client *c)
 
 		v4l2_err(sd, "control initialization error %d\n", ret);
 		v4l2_ctrl_handler_free(&core->ctrls);
+		media_entity_cleanup(&sd->entity);
 		return ret;
 	}
 	core->sd.ctrl_handler = &core->ctrls;
@@ -577,6 +579,7 @@ static void mt9v011_remove(struct i2c_client *c)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&core->ctrls);
+	media_entity_cleanup(&sd->entity);
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.50.1 (Apple Git-155)

