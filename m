Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839754;
	b=1DOP5ZMuUVCDotKBWNChYahp5DmwdkwGQiD6Wch86CPKSsVLIuQZ5/i6IrrIXfjoVb9F
	 YWvt4/ToB0ZDqv3JFaMUWR5e/33B8p3jZtHoKcWa7cRvBRocX5u3ZTZNuv7gghwavbg3Q
	 GhYNPt+/Cj5MpTaJWMdaCXP1reEWQMMvJa+WDhWOKCuc1WJbetCPDpdjK+wDzrqD8QOw3
	 Jb3g4mid9IUlsdMxt+wzZaTPnDN9Hljh1+JEOLmN7zdVvRL3o4hph4fgHyoc1d9jL5WrY
	 b2E96A1YvgopC4TbMHlmOvn/BBr1oLUVKi+Jt2uYmjBwZ1ZM+UDUTPv64nhTrxjL69A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
	b=YO2K14R63Y4slTY791+PQHdtaFopek8gv0vREna8ah9yObiD+qXYr+AsSgKg35mDpXB4
	 7GQ75NtkaOQpqwb2MSGnVD8tvJ5U4LA/I4c4kstQtfpAjC865eaZuhEYNmcrk1ZcYkbSf
	 uZqUnloXSL/Tqf1Cqsa/WyZ9jNqaPrOA4mVLyK0BDn7RZKlgCCkCppb80ZAfDH81w6AvF
	 qAwNdLnKAMDoIfG7WKJcO18wz1sdXK23L0XaavRDKf1r8UFXGotwpYnwuXQJ0vOL+BO36
	 BaRuM4e17dmEky16GgMLgTF3SjmiSVyCGq49eb5rEWwQPL/OchGg2GzGksiVLUzj/Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I4p+bz4/";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD7D606A33A
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 00:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD7D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4p+bz4/
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so7969505e9.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793839753; x=1794444553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
        b=I4p+bz4/gtEkR+QrPBIILqzuan5ppgMtFSE8APUYLhuk8DqdE2/nTtc6Wq2E/h1DVX
         38J9DaCSUXElcHw8u+j2+m9S9ct00z5WTexOM+XLMb3Sk95f3VjVRzBWF84p66KR9ai9
         YHbRIyFzTSZrp7ehJfeOChGcZ4rOe+ZE0/TLw8E9VQVCP8n0eZc0wOH/Ryvvp3pDRwDI
         XDU5w6Rp1bpvB4HBpA8JElJl6S/FJUhJTRxztOIPWm8Q5DbSScgyNUDL/Ufdhd++5CvA
         SzwyyNZzH+V/FJ9MOx5JJq6aXTtgB0mfVmvyzxeevPW9GhDqEVioFPMPTjDZu4lKNQOZ
         v7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839753; x=1794444553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
        b=G9Uyozdgw+GSBYLX89gZcBVVYYCo8aCTV8CJLm7noWB7BfG18jVmGRe+5y3PI9f8fI
         gm7hIGLDCAK+v5rC1NE5F5s2WCBeuh7mQQnQ1H7hTjR8MAgo6cDexVqufIDY7w45nO1T
         GzukSv9gFGVzTIYUopiSqgiC2dw8b29rFdKQQ5mRmrfHSfha9Pdjkz1lRuL4QrC6hcGN
         q1BtgeMu7m5v4CuFqjDONWJLEqF9DTWKZc4CQA2fc297rM4glUQ1fFrCGNGtVJK7jFy6
         JlUePfmmNW/pavFMvx++Zv+m4Uw09GWfzztJYoQghKlDPvHZD2p9LZTnbHYk51W8LPF5
         1b1g==
X-Forwarded-Encrypted: i=1; AKwUvBwYQDyiRIp2EDZlmv6kB2+5ZKtfAyg4znLUcuAToEsTEWtRO30zWxOBTP+yXIo8MOWZhCNeHAFtOji4nA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZqHdEQE5fWXOHgZY59iOu2Srs6TVhTXLPFKz7ai0NVpgF+TFz
	JKsjlXsH/p1mJiEAu90ojd4qHrXyItrM3Zh+rIW6RZnEpgrINhdBpTyUrLBs6w==
X-Gm-Gg: AYBFou0Rhct6QH4GZXdF4HvSS81SNRIXKoo8XY4CHHaCYKF6jXwqAQKOOgVROlVH2OM
	VZ/zBPmPBexVwnauFCW6zhrvsQlcAe8VVIlj/j+Yi2Wj19zJD94Gv1kA+8hH3ffry0DvnFDp0bL
	ExoGlFvT3mefhxtw7O2QQk72W41D/H6nQzhFMVWm+q88ucjbkTuCCkrQuTTWCaUoL3/ve4cJB3z
	aOiQUlWH4f16nw0+iY2RVTeReVRfmQmLT4Ou3v8noEhbN2EG0PSuaL2IPy7TVkSTH2V9KrO+Xf3
	KvUF9XCBNBaoEXAZGvRC+KxBpN/UCwSr/RHljUrDDIoqDUiLPvmge0Kc4cytl+oaH+OifhwxHuE
	5zSJnPNp/rF/2KS0Xi6eG29G6UZsylXKFL4+EnSrUlbyg0kijo8iDp/EB94KiFZbt4ncGQ3sq/y
	zH7/1RWiG4Jplj06ajdE4nV5HUi4k4BBp45L+oE9dOl4vqPevxe3C4Dr7CSafFNgB9szf52cA5W
	T5bV/WtEHFrdPxg1BAmDCOSn1K7SSzv4ltcogqMh7afI3FN8iUM2ADmfk+54o7jl8TJDsGir1uo
	Jl6TpzC/mDu+OQahRvge0XA30y/3C0PiNuI96Qt86xk/djQjevY33s9S1zBOhVw=
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr400176825e9.10.1793839752477;
        Wed, 04 Nov 2026 16:49:12 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba0f3sm21341515e9.9.2026.11.04.16.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:49:11 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] media: i2c: vd55g1: Mark the AE lock and bias controls inactive in manual mode
Date: Thu,  5 Nov 2026 00:49:04 +0000
Message-ID: <20261105004907.150545-2-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105004907.150545-1-fernandorimoli11@gmail.com>
References: <20261105004907.150545-1-fernandorimoli11@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In manual exposure mode the auto exposure lock and bias controls have
no effect, and the driver marks them grabbed. The grabbed flag means a
control is temporarily locked, for instance while streaming, so
v4l2-compliance fails on it while the sensor is idle:

  fail: v4l2-test-controls.cpp(134): GRABBED flag set
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
  test VIDIOC_QUERYCTRL: FAIL

A control that does not apply to the current configuration is what the
inactive flag is for. Use v4l2_ctrl_activate() instead.

Setting the controls in manual mode now stores the value rather than
returning -EBUSY. That has no effect on the sensor:
vd55g1_lock_exposure() writes only in auto mode, and the bias sets the
auto exposure target, which the sensor uses only once auto exposure
resumes.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index e3939bb..69ffb3a 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1503,8 +1503,8 @@ static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE_AUTO:
 		is_auto = (ctrl->val == V4L2_EXPOSURE_AUTO);
-		__v4l2_ctrl_grab(sensor->ae_lock_ctrl, !is_auto);
-		__v4l2_ctrl_grab(sensor->ae_bias_ctrl, !is_auto);
+		v4l2_ctrl_activate(sensor->ae_lock_ctrl, is_auto);
+		v4l2_ctrl_activate(sensor->ae_bias_ctrl, is_auto);
 		break;
 	case V4L2_CID_HDR_SENSOR_MODE:
 		/* Discriminate if the userspace changed the control value */
-- 
2.43.0

