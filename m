Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792942871;
	b=iDGm/Dv4U54w/8KGHmVR92shadmGwRmN+DxMckbjksBnjhZX5ayT2iXVUE6O/avsCsR5
	 tF1THYxCfivDRIZU4NvWYxZEZACPtYJuGU6NJjv8DUCo3s1tkyi5A4Yl574A0ttp6s4Ll
	 kc4bUuNK34haESwNQhLZPWqoAurVlI8GRXOWi2ZwrZUOdotakH4cwd81BBu/ZgHO9NU7N
	 IVf+pvm8WQhdf6LnY0gjMO7TQJu0BbDgV5WjZb/GN+VA2nRCcCB51QvSX5rGtQXgrTVAn
	 /mHQaQdGqwwACPjLs3UkX3r1ZdmeHFFdi0XttnB9zaUhFfSZQH9IoGRF21GUzL85yvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792942871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
	b=Gii5pa3aeO8vq4pLXeKo8Onj7lWbTshbREUPMkpZINCnBRCdXdMmawHrwho25QUK3CvA
	 SWagUzYZHvERAZ6+XvsQl4a5h5Q5/12H/asI5uxdkYjOxK/ytBEAgEzV3hlzLjsy4Hqgo
	 0xJnIBb7FJEbKLl/sgKEjkWSWQ5r2bTWHHEkyBZjbolfNeJhFKWWypw5SgdoNN6L6fO0d
	 hUze7RBOIKjRTdT74TxoUdxhpJGzlrD0VTMNLSBlmeMNhUiD1v6K+2WFAfcPO/rBpldrb
	 hAfr8m+OS3uY6frzSAYs/82BFecZnMQbe3wDMoyf4ekzEaMpeLWpsBFXH/1DuJDAIiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CGnLGRg2;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D24606A32E
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 15:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D24606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CGnLGRg2
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df54150dfso1180312f8f.0
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792942865; x=1793547665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
        b=CGnLGRg2bLY5q4ihmT8WlU5l2fnMdm/ff0UqEnEiJiLO7cjuES/912YQNX8vl8nHzU
         1dEOmV1fPTLLoWZYPzCySR2/vq/7TzAFAOykXHSwTYBsEB82CGkLYNdeNQY5LZo1aQlr
         zp23/YRWTHIQnkNy2c42rQUcGi44gtq6zyYQQqlUQFFG/OpVwT74CN/4rCa18D7z3AcQ
         SJZdhKVZkywbbhOD/3W0thkIlRmBc9EU1U1l/mdC51fNvCRQQcy2or2CGUxJTJe5ToUB
         Y1glv61h+TGpTyC4a5l9pYYIx9omfRU44ayj09ghx0SY873yG0t04anziunNLX+wg600
         mVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792942865; x=1793547665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNhZAWFJxg03dxJBO1MbF9eR9aWYSPoEwZ+ATuYEVfI=;
        b=hvbUUWxNG/KR1TT5mq5EeF9SFW1QIR9oL6bOpRNuO5b8t6pCQQWoOeYLgJWv7c1oIJ
         RAuePCA2PeXFr1JjDlksM+ygpxGXX6fws1uWfM07FCVMXjVngdqRShW1P/6D8mhjuKEg
         aT1LtCtEoGNgOB7kaQPxs1JZWQ9LlxbHtBKkifbkN91FEfRmEZDbpZP1/qPQCYi4T0Uc
         A/bu/I80W1Rslol4Rt4iVlZelnYtM2PLq6A+k4Wg7aHgxt7yzz6lzyCeEdhxIUQUlITw
         R9i+ickMJDXDo+7AJR7vGvPLORSvF++3G7L0muCpOOGwrL6sheUJ9LzdaUqqW7BOaM9f
         IHIw==
X-Forwarded-Encrypted: i=1; AKwUvBz7knyiCRgMew+vLPwHt2dUefsLy7feXf0RcVHgoMtVTNzEmnqAwJsXxuEFvy5kT5z/+tegd6uItjbK3A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLyyON4lTwFyqkueZo1asoAchq4C0vo2U5VkMRzsSDcynnvi36k
	/ofNuZcX+g1bzB5bekR+EE9SN31PF81wEqf3OR83f9g6Os7jOfPscKOE
X-Gm-Gg: AYBFou3xTteyxtgRlL26X3tSObIm+DNsqmckO7eMlqK9N2qSdDvNDtd1sYbtXVBDMt/
	Urau766jzt4zHpsUdIKxYGUuC7gIOwkN+uK+oeQBhHr8yQxrG1y5GW3qtQy/4BOIYc6ecxQ+EaG
	Ltkofd7MXJtNanmcLkT0z0g0+cA+Ql2m/jgaMjJasqZ2MDncY5BewR3TBJu7QHhIgg3rlp/FB5z
	wlJWR0D3Byf+BaS4tCVEsRvSKMVgQ75BPMKfhGjeLPTrlJV06kieJmnL0b7iNhSJykpGj2xamvE
	Tq5wnKWLiIA8iV/AFvZoYQfAM1KLhDemL8qarGXx7GRo/e6nKfWeUs7cQX4UzqvwbdPMdtxfAF9
	V1dqiP15yvv2w6imJo0+aSl25JokJHum7l1hE5U5qTNOldPlEaQd23FaXJMi/NjjF8cGtjfkpQA
	/F/EFFrM/cleWklGgbASrv43J8FY5m6xddCzXFCiW+CjHePs+4Yj7aRXw7ygHEi0P/H3ffa7gKs
	hjlKlRjfk81LbgmB7K3jKmzqrefN1zlf95detNKY2iUPHC+BsideEdkUidkds1ikSA1cASBTRDy
	4RfWdpJPh6rERMq4yoGmmDTEROz54/k1Juc=
X-Received: by 2002:a05:6000:200e:b0:48e:4831:ae20 with SMTP id ffacd0b85a97d-48e4831aeedmr4908781f8f.37.1792942864592;
        Sun, 25 Oct 2026 08:41:04 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm10487861f8f.16.2026.10.25.08.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:41:03 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: vd55g1: Support control events
Date: Sun, 25 Oct 2026 15:40:26 +0000
Message-ID: <20261025154031.27083-3-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025154031.27083-1-fernandorimoli11@gmail.com>
References: <20261025154031.27083-1-fernandorimoli11@gmail.com>
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

