Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A3A28D8D0
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 01:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128601; cv=none; b=d/qQ+JTdcrx0vc74+vhYYEXPZ76IEn14Bkgx72HfZtD/+C+39ETvb+BdpjAWfWhdk5paGazlERKFl90MvcuTg8lZyF0e7QdwqhXHnghdX06m0m2Bv/SfS61V3V84Yf46/uFPzepvI3RZta54G7pp3aLU3Y+Qi+hv4d2uOweZI88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128601; c=relaxed/simple;
	bh=AcFeSQtM7aew7J9oFB0qOVKBF7m+83aU+dFMfY9BnCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kef76u4a4/piLKajsuaD67xMuQUIVf6N1VdFRpmdWCZfs0MAGOBZNh56ObPMDvNqp0ZWxSHiFYfCOyJjATEFDZUWaPcemiMJfxBWE2EYQZHsNxVqbjJyYMpRGk44nBHoNKXaycYe+ZWqlzhte+Bm0LMrG0529PUEnGFknkFzloQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cW3e4yxg; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cW3e4yxg"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4c9d14b8so1417085ad.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128599; x=1790733399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4D3VR+86sNKFIEnE4BQe5eU0PEwvj6J5mCOLZRzuwE=;
        b=cW3e4yxgZ0h/AseQyYOPy2X22j8JCCBzVfJfMHIibx9nKn+FlQerrEX5UvB7Jmh+W8
         8AB+X2apAa1XeotfWO1ZOUnzWiSOUQAsQT8IZRP4FwsKiJ/WunsUQAcCqfEenBlayyHZ
         7sFRGoDhaaADUQt4XT7tANagX/fkGpKbm1wretfQ24d/RUsRG8Lww9rP4nxWdDWgKCVO
         hWkgOfHERyPzs7ly8a+qjUQ12YH3UkW0Tcs9KDFPuIT3ho3iV/XIjtTsweQuf2Ws3aey
         Xz5QDlyLHF7dAvqs5j0Yyt6WPQESpEJvPAidCAmsp4vzIxKi+gdwz3dLmGK9VJSmOnPh
         nmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128599; x=1790733399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4D3VR+86sNKFIEnE4BQe5eU0PEwvj6J5mCOLZRzuwE=;
        b=uYdZo/rB8cKKZglOW7jsDt4o4oAe8azhjrmMMKGcS8R+j84GuLMphox/K/dYf1NHly
         JHY9CRF71Px/GZuPhWgvlm6ljboO96ez7snyJUjdt05hDUCJQDhjA+ylmSr29GXPkCMa
         0609SNtuGEQkXV/03n6cW1Ml9a7uSjchoB8fIzmPZISweSL4VePp1rs42QyhjhkjqaVu
         QP6eE+Z0pzRzIriLR84TkqiGt3wxjeF6jlcaU+ShbSXIyUDdQg0JwuurnKNW50D4r48r
         9BHzYFBHq1DeY2QRo4tSpSsVvrQztLA2pJ3WEGEcdpA5o9JJgSJt8LYPjaGKGQxfFxRh
         u1ew==
X-Gm-Message-State: AFuF++mlznjpsau3OUuHAGx1wjezGTPLPB+OZrVAtGuvqzF9z3VkjMg6
	N4HDJ4dq2W0yf/MApd7zPRBjLmwdt377SzXJ1dujSMkcLpAMOMqKtIhH
X-Gm-Gg: AYBFou38BhX8duhk8C4+pMFnlGa8vqOWP6hsNJx6huVZ/HzDCIjyF+Ch2XAisxx9vkm
	2alMgk8iYwyxavMMCaLdr1lci6dK7Uczq3dgK+pqhgfVjTsjw7WDTDq/E8ECe4h5lED9kg0UObP
	KyNKiEhv2VKzwTDb2PAfko7evLTzCDNYdz+8id56SKy0W3mLEcqrjvAQy299FQl5e2oxSsC2sb2
	geqU+OLCJz0b8W1nSAMV/0N2VDm3JjZDdCnWKe1rVSKMXqJcIEfvGgHyMyUV9grCo8ZeFqn3UsM
	IHzsi8PXVdCWYIvCA9bhM6X4q/Nnvr/rfydeSG3pS2BOz+J4xlKaIEyO5eqn/6C+APP198n4LT8
	JpS36iOf/BxvBrka4igIscKrAM5HTuU/SZg3M/koUV1olHU8TfBymc5BIxyqA+X4NSb9wEqtI8A
	0SrZWorZLpBYGC4BWcQSDk8GeCnkxDqCGepelTqR/qiLIA6NGhqWHZ1sJFHrUN9JNCeMOagn4jA
	dtgHmOxzez1IP8Qy0kzf8TVWl/uM1FOgHtPqwN2+61WrK9ONPbvfA==
X-Received: by 2002:a17:902:cf06:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2df69877962mr7599925ad.3.1790128599066;
        Tue, 22 Sep 2026 18:56:39 -0700 (PDT)
Received: from localhost.localdomain ([163.125.129.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5dc32csm2780825ad.53.2026.09.22.18.56.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 18:56:38 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5648: Fix a data race on state->streaming
Date: Wed, 23 Sep 2026 09:56:31 +0800
Message-ID: <20260923015631.44973-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov5648_s_stream() updates state->streaming after it has released
sensor->mutex, while ov5648_resume() reads that field with sensor->mutex
held.  A concurrent resume can therefore observe a stale streaming state and
leave the sensor in standby while the software believes that it is streaming,
or the other way around.

Keep the update inside the sensor->mutex protected section that already
programs the standby mode.

Fixes: e43ccb0a045f ("media: i2c: Add support for the OV5648 image sensor")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/media/i2c/ov5648.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2145,12 +2145,12 @@ static int ov5648_s_stream(struct v4l2_subdev *subdev,
 
 	mutex_lock(&sensor->mutex);
 	ret = ov5648_sw_standby(sensor, !enable);
+	if (!ret)
+		state->streaming = !!enable;
 	mutex_unlock(&sensor->mutex);
 
 	if (ret)
 		return ret;
-
-	state->streaming = !!enable;
 
 	if (!enable)
 		pm_runtime_put(sensor->dev);
-- 
2.43.0

