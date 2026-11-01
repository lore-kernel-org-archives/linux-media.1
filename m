Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562615;
	b=1vspmtojFVaFceC+XPu/Umzg2yWX7mR1981LwEavGu0sK75TUgOI4ieKSRtA3pSvO0d6
	 Lc5ZZQiBKubULaWitGTweSnYE0axtTuNXG1HpyYB5b4aE5Z54gyQnSqB3BDOsrSDxiWVM
	 QDpRbblakBali+ouWcnz8W0nh9REPoxO7QNs0FnNG84lLLHV1VVX7OGn/PPJ3uvm9N8OB
	 HV+INsaJohUotHlIMElj1bQqSaO8dgF5PnprYCoSXdtYS1V83SHTkD3aoMbrZ1d6GPfI3
	 9Et0e7lmyWZKOmCD8vovSQabq9xARLnnLl6k/pdkzKFZtqaFa+BOXTM9A/DxRwRMxqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
	b=IJoHPMjiqATa7wvD+SJ/KGf+Lk9R5tP59KWGnl4oS0BirphkhbAFNS56cuB6eo7/H3vM
	 Kayq9N355r3FcsCEWdzUqrxmG8nM7t+GI74GVfV6mNHRb7SM5cHwMSW0hUm1POpFFHYSf
	 9UmJKpdee79hrrmKXneo3Q8wtEjH9O3XrX6GYykJtK3HXa0/xpibsFajGW4fmXd+88WlS
	 Gvuveya6PtIicoPwzczZG1JL1K8rrkohE8JqTMD5pvoK3Wh4JxhTq9mTOIpVyacAk+FHX
	 aUwuJ/Otrlfda6a5t6GMq2sjgw22xIalECEGCaSV/KnXfvJXNjYPhQVW5sSDmPmAsXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yE1O5shx;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B49606A33A
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 19:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B49606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yE1O5shx
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so18341735e9.2
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 11:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793562614; x=1794167414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
        b=yE1O5shx7Y/VVSTKvIdgClnWdBdbLObRZ5Z/pmxyDuboLVxK9pUHztxUvwUGRwHCGU
         HZwb50k/0U67/F1ByyDfNGW4BxM1AUwH0jEGFHcViCJetjJLf7jz5Vx1+8NR8A+c5zZK
         2xlqNKcmzLTRwwvmQb/L9aDIIbJaCw6A1ntDVpSX9Oolqb8V8ne+i0yJ06DoHPVkFUlt
         c0E0u57HQ+EFHuf3EXpGax6Ahi5xdMYM15urZ9x5uK+wF5qI1Pif3Pa11v0ZuLH460kk
         24nxyqjjyL+fkkjD+FsKZuweWxiUiA7ItzFgLSVWYzbKUHDTmXP+RodJtfvhRPHnJt/O
         v/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562614; x=1794167414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
        b=y1abrzldXaApJbL7GwW/WGhaIpsFj20+i3GH7wWTt0i/B0PqC6+F6KwA2dCvxIcW29
         uepvj8aLPaW09x0Dw/+QabuO0XwjJoMas3VKEAMa21tr786OdanKLtSvzaOTL0WjY+48
         T4UR8HKVcaWnfQc8WiUXwFRv0fFi0YIf9cCuEC0jp9nzqXxHKuyx570WuL9T817N/luM
         7fcNlFA9oNs7sZIdcYSzav6g0fvJLnWdbqs228Ell9xubQXlrnM8iCTkCEMUJ3S7IdiM
         cuEo0bdKCO0ToIAp0LjVA5dsI8Qx42BxKpV4UZGuJayT8AxarXUmxeemjhvpslcftHtm
         NQEg==
X-Forwarded-Encrypted: i=1; AKwUvByccOA5OXcQ395jBLqVLXCATlIru0oJBb4U3m0rvttko9z1nLOndcEu3GivHY910SPYDwh83OyqFO6U1w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjWSTVeAoPS5aPY+ZU6PwkPrEMoLzvkHI9F/EIZqTNZCXPvdMn
	Uzw5ruJvViEUqRX1QhIJp3yJ+2oGJtG+P/AcsBkHuqe+jFuaBRx6Cbmo
X-Gm-Gg: AYBFou1sjVk7/p0ykElBsz8DxtJ4OJUkPbVOEgIcd7vzhCYgCxBRiou0BVNUw/4xIkx
	M1xWncx2VaIIX0+9s/cJYfUgZijXtakegEf6DYPOEjPObdXpAgZWI2Qa2R++P7oap5TCbw6xWz9
	nkMPugbb4lZlKd2jk/bCjXiimQGoP/nbffWO6lTdx22h/kZPv15IBrTfKL0UsPoOKAafulEjx3t
	78NBtPgfGnrsZt1yFuMTTJf7NwjG/Ld/KE1Gjs5Igbu3TmZk1Hi+2+L2+uPcqhAzc4urc6T6Fg/
	KZ7iqlRUQphWCLXx1YRUnZAeVkBpCyDC7eu8NaucxajF3n5G1/TeshB6hggKHJtlPC/kIjbLEMN
	IZE7ac5+U+sc036yPNxBytpNEt0Zofk1B6Ipn3F3cNSiMZWB82YlJ+q+WrBT+QmEMH/s+6Bcdl6
	lLmZSuGe6aVo92CK3rLl1n+1FVC3v9GPfxohJQQXtGOBvMvmLFF9H4u9BnNDFUCOlyUaaEDdOlh
	kh7ankjHtji4QvQDQLeM9AEp/GCTmhyOkqKF7Hhm0EyH36o2pgc9N6pyC57CM/sWQrBbbZTy5JJ
	vx9jiCFCr64SBtqhyn3oXgvOcgel6EEFypsfgy/xOzxGGMO2P7lTniVDNSL47Pw=
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr187976345e9.27.1793562613875;
        Sun, 01 Nov 2026 11:50:13 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm281548865e9.2.2026.11.01.11.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:50:13 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: vd55g1: Support control events
Date: Sun,  1 Nov 2026 19:50:05 +0000
Message-ID: <20261101195006.220657-3-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101195006.220657-1-fernandorimoli11@gmail.com>
References: <20261101195006.220657-1-fernandorimoli11@gmail.com>
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

The sensor subdev exposes controls but does not implement the control
event operations, so VIDIOC_SUBSCRIBE_EVENT fails and v4l2-compliance
reports:

  fail: v4l2-test-controls.cpp(1108): subscribe event for control 'User Controls' failed
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Add the standard control event subdev operations and set
V4L2_SUBDEV_FL_HAS_EVENTS.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 69ffb3a..162c2d5 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1447,7 +1447,13 @@ static const struct v4l2_subdev_video_ops vd55g1_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
+static const struct v4l2_subdev_core_ops vd55g1_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
 static const struct v4l2_subdev_ops vd55g1_subdev_ops = {
+	.core = &vd55g1_core_ops,
 	.video = &vd55g1_video_ops,
 	.pad = &vd55g1_pad_ops,
 };
@@ -1918,7 +1924,8 @@ static int vd55g1_subdev_init(struct vd55g1 *sensor)
 	int ret;
 
 	/* Init sub device */
-	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	sensor->sd.internal_ops = &vd55g1_internal_ops;
 
 	/* Init source pad */
-- 
2.43.0

