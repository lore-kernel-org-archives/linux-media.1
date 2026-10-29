Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283529;
	b=RxhIdzE6B+qFfZOyC/QAiBVKC8b/iwc4euOKF3ouWejYecPiBIFAyuzpnZIxcQfuNkeD
	 5U9CKaDK8jUEkem/tfBQAH4302fUgC0KERIGeT9xAqnMGPqtYhqg2KDm1ThKJNGj1Efmk
	 YDyHAwpAVU0ckC3W+ygoRNg610i5ex1y/kFb/tSnf76ZaGdqKyWcCUDfwyo1jZj4CRTsZ
	 74PQ8rh/5AZf4wu3bcJwTTxB/wcqkTRZGfphawttABF129EKlfMz2ybt9CZjF/xQVXNxG
	 pF8TvdpdkO0izXK1kxZ4EEfEz93czXzVkxifn3mMm7lrjKZzXdz26H5P9qhTRTu7q3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
	b=RVbDvkM/oyKQxjy91HbAwEPtiZuv8UlX5KeFaLEe/bzSbV6DK5WYHtz3Om2bIdQX9/xZ
	 e2WTb7Hw82thxuq7v7spShbF7pm3UpTmbx6A2JjFXV16pE4NPYtF3L64F/vPVZlB7GF12
	 FExxrjU42ozVGTRDRJMVH7ZQrXRdyBaYlZzhARADk7Fi0tE/1wF3yocRWfqqEDOLnFSUp
	 LFtTBtmTv/4BK8EWKGibDgLaEihw+gdqjt5gnVjN07n3kqg5HphkcYrKEohyTttQ/x2kp
	 ItUS6Wg0mAU3t0CUquIf44Q1lG49f6I8Tioc1yo7e9uAwcm1T9KxsgV8ua5dt9LJQBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=VuQ6YNnT;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D3960A5BC1
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5D3960A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=VuQ6YNnT
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so487177f8f.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283527; x=1793888327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=VuQ6YNnTgDGal7pGqxbb1jp22zdKuxq84mqOZgLbuQgfcCXAq7kjDq40hUZqQDU8+j
         jY1n2Spkc/iBS0mf2p2iS6jiCK0tW1iLr7zKQwh50pWvRu8O477NaP7KnfdXYX01vw+f
         mP0HcEmNQV/zTn62hJ9kvtSzZuC4BMYhlWlEsECmoKXpKUYNgHnQPpqU4NWsdtXtLBsW
         kekOnOsfI2DCSeoG1jhAvHw72xG1XLW6GOjnUaktvxYr/aNAHsYp0UQrMQosi2n3UQtx
         G0J5XbMLH+sRu2GlOXeqOKKEdQiLIELi24u+XSqEaL7AY0xPkBaR9s0e6EAoTk/BKYF6
         QXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283527; x=1793888327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=xKLcS9C3K9v7HHGejY6Rv8xVQP01cZqjUtGM6KVULeQi8CEMMRxlPLwuxaFYoTZFHH
         BhjCAypy8qpi/YBM/xKZUI6ZfoVX5dfn32sKjIXvupAw5rItw3A3hi6waf/KO8pvUjfm
         J/E781fcPs5hprxtDNMY7FS4NuyNOjctvOLaqvoNYSngAjEwWU3qiQVHyo5NOKjwO6Cg
         e4+ItEtpBjQC3mhBvfzH0uvMaNzQBdMeZEW7hgBvUYPVM3meJfW3cHFU3PTKpsOZbrEP
         qT2tCr579emhx/uFaQnI5qd1OEBlomGwhNP4OH5oPa+oWYOIL3fWiqa7zkTHOkg0qBtf
         Nyag==
X-Forwarded-Encrypted: i=1; AKwUvBwl1F8n5es1OIQVywtt8Mm42iGETRfcgEFlea+CkIfN+nLnQt8pnKMUAl3DgzL8N/q9iXM3y3Fc025D1A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIN1WRjgyqWepvVYSXsjzxFyowa5vBqQvt79S7tD0mLSRAPrUiy
	In5x/O/ry63+G+F16iiK8PITX/42eCWBSlA2hfNxLqSxzaXhZikmeK53pI6pJeJjoXQ=
X-Gm-Gg: AYBFou1z4epw9uPNEekxaRvaoiBlZfRzZpM6ZDqigcOKSyquZnJRpDf7VW4XlmXvrP3
	/oHC0WQppPvNnxkeZ+QOnGOQ/T7mXe8GQ09r5nvdLPyl6vEgwDPpE3lg+yT+fpZx3K93RvgZ///
	+4wNzTNhp476B41Ym7eZjPx1Zqre2xbc15VqKmqFx0qCeHGFjudfEnwwVs7n64892cz7YWBwK/F
	129yO8mTcWFUj24EDXbqmxchoZ5/Jt+AWCWuGnPNq7sRWGXwTnHWcUD1TkShiI4edlJMDkryy7m
	jId4vbvhdMrH5lE1vL2TgcIxllo7s8Xk28BFYOO5OSl0N/fzE5N860laUQdzpRMymHxWsfTh0Uk
	HufBKJ7XfZEt/+BpjUDH49SRiy2zRqZ0tzCFRsXgA27xfN4wb08uyv9j31OXnDlce6mDx7gUKWw
	wNIMWjGEc9RS+nWaXOHulbITPtjzRq93MGxeQkr6m/pDICAlKkPYVovsPiIlnlWjFUyU0veQ1ku
	52t3f8RBxLWjOphP0VPwgHBCOdy688GTdoguSpuXcNO+9iLyjOMkU0hjJcQVG0BhmTuXWex1JIU
	ijYCXrVRIe8yEAKXVj01N7u87cBGM5Qow9dQMfWwEv4wD3s90EXGtWgin95UMbv1Si0MiytzRfD
	3B7ci
X-Received: by 2002:a05:600c:3144:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4aa8823df43mr66919615e9.16.1793283527182;
        Thu, 29 Oct 2026 07:18:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:46 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:30 +0000
Subject: [PATCH v7 09/18] media: sony-starvis2: Use pm_runtime_autosuspend
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
Message-Id: <20261029-media-starvis2-v7-9-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

In order to reduce the time in stopping and restarting
streaming, use pm_runtime_autosuspend so the sensor
isn't powered down.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 95da8a9e671e..27357cc293be 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -858,7 +858,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1049,7 +1049,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1072,7 +1072,7 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 
 	__v4l2_ctrl_grab(starvis2->link_freq, false);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1447,7 +1447,10 @@ static int starvis2_probe(struct i2c_client *client)
 				 NULL);
 
 	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	ret = starvis2_init_controls(starvis2);
 	if (ret)
@@ -1479,7 +1482,7 @@ static int starvis2_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
-	pm_runtime_idle(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
@@ -1494,7 +1497,8 @@ static int starvis2_probe(struct i2c_client *client)
 
 error_pm_runtime:
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 
 error_power_off:
 	starvis2_power_off(&client->dev);
@@ -1516,6 +1520,7 @@ static void starvis2_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		starvis2_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static const struct dev_pm_ops starvis2_pm_ops = {

-- 
2.34.1

