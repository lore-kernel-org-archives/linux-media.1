Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684D1279DAF
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882356; cv=none; b=Ie9KuTEOXdjM/NMvLh2J+KdQhq5rljJXUwPeYA7lr4oZ2/AbFPVINaHfu0DJA0rteE+RN5EbK4OwUBgNwIHcoEyO1bi0IG1IcVzAErUwlc8XaGwYH2qhUw2Zi8EKvwtx0jlLsuWVeff8yk7zhe2uZ+/jw11/7hwBzAlgSKXeaaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882356; c=relaxed/simple;
	bh=qKyXG3mixqm7Nl5f9tqJfObbZyDI5RFzYxjKCymf2pY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WN7yP79ZSrJqVj+lU2G5D5jFiubPsck9mfMPpQ9zhSR60N8zfa/G1zSPr+zIFxJuyXLCZ+PEFPsRK6WQ9e5yuBbnB1sPF5sC9HKdewMAqUfnZ1DSpPBhTvhvy5ltZHt8hR0/MP8HPoS2K2SggjUdz4VwgcZ36bKRwJ3ygdSsXGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLdCwVJR; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLdCwVJR"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so162806b3a.3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 01:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784882355; x=1785487155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hADhJaSCU56XXPUH/PMfzbMY5xT4wb+ZMha4vQ5WCxk=;
        b=PLdCwVJRep2QHArhq0xgoQ4PoF9Ae3wUvyD1ps7u070jMtDwThHmC0Z8/Fpwmuoc1C
         gI0kKcsS+0LSW/QrpR7xEB29pHJtCC3CU04Gd34q/VRuKVnVwkEiZr8EhcRr65Peupuk
         f9/ZNOp+EQyW5KWNdUFcqvowq1uqMZxKdehrERT82/oVb0YOsHts1yx+Mt2hKQCC9nPk
         59n+re1QAl7+dGscnWBJkveq5FCnXzFfx1bgdsVwJmI8aqVQRycZdHHvQzXmVZriGx0c
         SmgBViSfyBSOeuIiglWdOAmNACOXAqeEK5ngOAfCUl9flC7rhpIg7ltvtN4wLXKVt3qo
         oeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882355; x=1785487155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hADhJaSCU56XXPUH/PMfzbMY5xT4wb+ZMha4vQ5WCxk=;
        b=cAt9fgo8naR8X70Bw/wgiFBzSYHRt1FixesiHLatniXREjIYN4o4tfp57WIj14XHll
         PWZYSl7D1hDdl2PjRzbMIdUC9PD0lRN0IgfEbGse5vftyEtyJw+weZs5haFbwnl3Rrt/
         Z2LpYi20JlJx01ifS+8iz6Psa6h6TQODT8OHF0gAZ7YEC08KNHm+OFzq072zRNANCEjI
         PkHG23RSrucdGGug0hkqx0ofTEXoKlR43K/22xL81Q/V6iWQBgXzmZMN63h4LJoTmz8E
         g5RB/FLKbMXwNQfmO+Ne1H3y3yqWleftc0IBcVFnlNrCT7SrfduSORSybtGW7eR0bJeQ
         M8nw==
X-Forwarded-Encrypted: i=1; AHgh+RoFU9KJcXxs5D8fPktzSESXcd5/Un3DN4iDNrz4yNActeILr01e7cyywif3aOLZnL3mgGK54Npp7T2KMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHAXR2X6UI9Gqsfm2THvyX6Hf/3hLtcQuZ/Dq89SNV/LS+OXco
	cc4WvMjz1Ero2bh26KXSAVxfDorYeXc/zdGMHY/ewk8sdKWbJxkw6RE=
X-Gm-Gg: AR+sD128Mj7dS7Y3XcMBocvEyzpN6bwqlQi6RyBoD1aSb90LNfUmFAzlQ7n9STjuoSP
	Vu76L6Ch6UelgKkEJsrbRhWdIyVFY6OQdWq+OGDZx9NNZrKa1seFJF9tM+nJT6R8ol3lhoTCUZy
	Di8+Y/bdNLD4XXoueR1czPPHcV0GLnmaR9zSJO/VVL1yyoJzhM1cSBJdWyGklORLEulRZNZeQN4
	3bu63zuMngur/+If1vp7U/cUzxDrZ507a00AGaq4mYiTiG74rCbGyA7QCXvdXo7p5Rk13qVco62
	MWS2OL61fn+yZgQEJRWdwmhO9dSAy+TAmsKgn2bBeu7IrJjPGMxrOR9gYI9BXMrNSVJ1WT6ME9d
	szcZKf02TmcZI+pjEyhpYZqOctdH5lJYwWCseYcZ7ze/2ASn7ugQcTAv/pguwYs4zXsn5UIJOzR
	2RYyZPSMcUVhN0ug+VrXhLyO52Dg0=
X-Received: by 2002:a05:6a20:db95:b0:3bd:3591:2457 with SMTP id adf61e73a8af0-3c44af99f68mr7417261637.4.1784882354530;
        Fri, 24 Jul 2026 01:39:14 -0700 (PDT)
Received: from t-rex ([2401:4900:7b31:234e:4988:bf77:ef99:7f27])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1b6a45sm28130956eec.28.2026.07.24.01.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:39:13 -0700 (PDT)
From: kr494167@gmail.com
To: hpa@redhat.com,
	mchehab@kernel.org
Cc: johannes.goede@oss.qualcomm.com,
	sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH] media: i2c: t4ka3: power down sensor on resume failure and use devm_mutex_init
Date: Fri, 24 Jul 2026 14:09:01 +0530
Message-ID: <20260724083901.50942-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra Singh Chouhan <kr494167@gmail.com>

t4ka3_probe() calls t4ka3_pm_resume() to power on the sensor during
initialization. If t4ka3_pm_resume() failed (e.g. due to GPIO configuration
or hardware errors), t4ka3_probe() returned directly without calling
t4ka3_pm_suspend(), leaving powerdown/reset GPIOs in a partially
initialized powered-on state.

Fix this by invoking t4ka3_pm_suspend() if t4ka3_pm_resume() fails during
probe. In addition, replace mutex_init() with devm_mutex_init() for managed
resource lifecycle handling.

Fixes: fd5531969215 ("media: Add t4ka3 camera sensor driver")
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
 drivers/media/i2c/t4ka3.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
index a5a68e3fbec2..0c38bb8dc718 100644
--- a/drivers/media/i2c/t4ka3.c
+++ b/drivers/media/i2c/t4ka3.c
@@ -968,7 +968,9 @@ static int t4ka3_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	mutex_init(&sensor->lock);
+	ret = devm_mutex_init(&client->dev, &sensor->lock);
+	if (ret)
+		return ret;
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &t4ka3_ops);
 	sensor->sd.internal_ops = &t4ka3_internal_ops;
@@ -991,8 +993,10 @@ static int t4ka3_probe(struct i2c_client *client)
 		return PTR_ERR(sensor->regmap);
 
 	ret = t4ka3_pm_resume(sensor->dev);
-	if (ret)
+	if (ret) {
+		t4ka3_pm_suspend(sensor->dev);
 		return ret;
+	}
 
 	pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
-- 
2.55.0

