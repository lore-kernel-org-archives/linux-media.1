Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562614;
	b=46eI1A+OPrGgETj6q7ejMBVCpvZlw9kO7edMN1fANHYtsQ87kjkfIfgbkjDNfDmXyeHZ
	 r/OYpxL+G935O3Kb426q1M4Sf8vLX9LKYFEsrG4WgDjW0+bVeuqT8EsHQIGbIDNpoyCWy
	 0IwvGIMyEhISaCEEZWwqJsX5QU8cahi545T1yipJt980wCPwE8zvVKt2VZkAhDN/Y3N4e
	 3S4si2Zx5LDS9518zjsz8G4kaB3MGi9b0T0/N75wV5BsmEz67+9Hg3txEsdY1xXUTQ2i9
	 XUYVv5Jkp+Zisj9bUZpeB9pZfciBkH38l81iVV4U9moCQIbP70YUE4cRD1yTJb1ySvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
	b=2uZwXNCO861rrH7Nlw+RjjUy5vPN0ZcL7OXbIi70vY77HKYzn0cw+UV3n1Far9Utjh/q
	 E6PAm4k4yAx+heiOtsVSBdNkwtjaI15MwHcP0CKJo64/4i+Cstd955MlTcRCiVXNBGiYg
	 zHQt52hQMDQbos6eGRMN1Zk+JCU6o1Lel3OwGvGItCHuqmglGXafOx+j4gWsv2NxeFV3A
	 wfuuJgIAUGMdVdSJE5qGfzonGpYV8bGX4yYuBYRm+cvz2aZpVxdxOUyWjAaJpBZY3G0gH
	 PZj6Tulwhj1G2niukmn2IbYhHbOINHfoqaWbqBndqnzbiAQvUkBp4eqoYeUjl6zNJQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r46vPhLa;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8FA606A325
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 19:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D8FA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r46vPhLa
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so19304215e9.3
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 11:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793562613; x=1794167413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
        b=r46vPhLaKFRAzvElI1eGj9YTUgrcQMJtOkZamSOKP4rFR5KYvPIEGdjel+PcKCD3o/
         gNLU0U9Ir8s6i2yTXZmtpUveibvfj7Ci02VDoOy7VIOzO8Q4IWOqgN+YoHvv07SPmegP
         Jg5KWLqwjBWFTn+obAjxNlanlETqOsxnhtXHXtHGyX3/9DOiF1e3jB544qnnxOBq64Qx
         TQZ2MgPWPqPWn85jV9pUWvZfhN0Ok208INnx2xIGBPcWjxLd+3XHsmh3qAQ0wrlrX6OB
         zqSgtcE+UPlvc+qO6Z3bukeN2M8C+vUyn9BM1vdY/BNMWbrRetUmBRo6BA3EefOmszbP
         0eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562613; x=1794167413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
        b=OICQIcR/tbNmyZ4JMcjQtzLyATqssfEqNi03Dp3cN8uL3e8NY0tj0z0SEBSZM621+H
         +yQxZyvNQBIbOUBzM+vksRDHf8C2daZY4CEp9XaWEcGFx6ILm660uAletdVWXTpp+nUi
         k6IxRXX8qCg3FSX021BSuu9my6cYz8upg5PuG7oLthiZH6mCIlZHpUsN2GqqlnHVvc/9
         XMOiFmEeZYix23NHSkUKjwpwgPEsql96tTP5tcW2urm1NP2d0shuGlM1COszp5RAfte7
         I5JFa9J8g5XxPuBtVJM49OhqTT5KOYE8RCGN71vau35tXJczY2UOSbURYXjcf/75MJ8Q
         116g==
X-Forwarded-Encrypted: i=1; AKwUvBwv7bpY/L+eDyC1K6vVYhOUOsUzizFWoUny+6Lh2rSpFudozwu5h+35qPHqw/9o0F6RsgB2xCym+qBtgQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPxM30JEPmBaNphBf628VWjqlRTmmhcCXHfDaCp947zT/t+LR1
	WkUsdQkJOTY0dsNZWicohZYSKq5XwHWj/dfzxTvFY9PJkm56W3UXarKS
X-Gm-Gg: AYBFou2WQuZLoL9Fl8d/n1PB6iTAi3A8RJ9pJNa7it1g/gyZxB+ptGIHaSFZs7FW5cz
	I9v3WmNjIdcD40m/CI7jIopmQmszS7e499ssfqhJeQwE5pThbSJi5TIalfPjQIJaGQz/8cA1Dlo
	AsGU+NIRPN7jEZKve+DdJzCUGtpowkyN94KTwYeS3C31LiH2w/9P5vqYHjYlztMMIoxQFRfxmv1
	yyx4VhfNag2p3TTfFPHut4UX20hyTI5u1acjdDrxg3lkGOQnmIKclVFQu0b10QzI1hzGUJgGt6o
	pe4TBDgxSxnXLPQmAsNiGQQnd+RrterwoGExClSF8HHNV1aofsyymqr3O+hAO2ni9DXxCXuC8AS
	tpjInJtRhDqBEeNnRf/Vxa2o53Bm386RudyMh7KHq4TouPQMzyIv0qdsY71xvwj6fomi4WFCLuL
	SuPHO3iOtz4atGgB9oVkxZkO5164i7B2HLr8P6ES+6yse5BFQRmDm6P6ET/RZs1T6n0t4bLzq4I
	hcP2kg9q/M1mHReQYQ7BbwUjrq1IwKW+XPN/fyFSxS7b0OMT/PmVDYUclnqRNGyZ2025wGsn6Cx
	SLDFJCtCw/p+C+7bX/P5eGQ3VVJ2mylGCacu8mVocNoakmMscbSM6Un0zgU894E=
X-Received: by 2002:a05:600c:c0d4:b0:4b1:2026:6b31 with SMTP id 5b1f17b1804b1-4b12026723bmr12334145e9.28.1793562612539;
        Sun, 01 Nov 2026 11:50:12 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm281548865e9.2.2026.11.01.11.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:50:11 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: i2c: vd55g1: Mark the AE lock and bias controls inactive in manual mode
Date: Sun,  1 Nov 2026 19:50:04 +0000
Message-ID: <20261101195006.220657-2-fernandorimoli11@gmail.com>
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

