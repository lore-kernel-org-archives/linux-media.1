Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3935148551F
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940960; cv=none; b=JOXqb9rMFg3oyA0QovqfZ4B6pQcWE1FOHbN6GANeUyZ70VUrlCoTSmaZk0Oo3q/rAcUkpqDvmreUegdcwS3rTnCZw/jKurahkAmMfAcuIbeE6HOL1bzXihLhkE4fmCJak1EGL7WfNiraqkvFR039ZO2epLl+voEuslBCsh1b5c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940960; c=relaxed/simple;
	bh=G/ASDG0i2X5q+TgHKlyYc/nq90Xa8cr8Xn8YDZT44v8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YEAY1ffnZrISkPvAk+CMzNJOYtoBqOPL+ax+ihESYcIjBWnOIdcPZOW36ISzp93YD5H5RY/iHc2h0UUPZyg5RSmGUDWFwygOrsezkQ0oiuuw01jE865EvBhpHNhEcKZhWulSWgsclmLw2IR3rYKvAcsRl7bznxSK8f/8VTlxito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xj7Ik1bY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xj7Ik1bY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d0d2d37ceso19479205e9.0
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 01:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940957; x=1789545757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLmsPg5ZGyo8iG6ZqNuUKwoiaFmV+CHE+/FRO+5M3oQ=;
        b=Xj7Ik1bYlx+KLavDpkr1zb2vVnIZnDObdog6paWYZtOKgfSANharY/n21+1zkp3hP4
         8yNb/EjFW+d7yI/Ay4P90lRhF7I6UXXb2l64exSJ9mT05lYcuQVOR8gyCSwvNtINfXEh
         mB4WxsQvOdTrePPtP/Dz9xVlTU1mikTLvzLncrZwgbmZ/QFiRVkHexbeF1kyy1vljUUo
         Bsj/2BBoertjVKuyrdA2HZxIwEBg3U82lgt09fGvCwo/FXjDsugCV9Z+CAOoixH68IG1
         psHLpw0GfbIG/dY8SkTCBrK6m9KJ3A52prxvQHGE+G8PXy4huZJPnnH9sin096fcdar2
         /lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940957; x=1789545757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLmsPg5ZGyo8iG6ZqNuUKwoiaFmV+CHE+/FRO+5M3oQ=;
        b=P2oHjV1AWAcyp1kBpqC5vNNLXhZwtPXv/yL2o3JOYxGxufrVDAj0ImFN19vsRQyQdx
         ct/WI+FREjk/tpHGBveeKC38HLAoG1vM5jJYSM/noufMIFG5MoizyfV1Tq0zwLgZ1ldl
         7bnVmogm72UtfHkY9ntZZV5pIAwZqFJVJYMhgW02rzzwfGTqgTMU/60lMESZei2sJFua
         +xFTglVo1j5JpFFL78YRVxWu63Algj78KZMTy4A6YE5fZIIldNvudJyXg+83WsaijRdw
         pQfwR/pDvDIKFk/Z2MCuTrVgdbw2QZxM9QwWVlUJ88EqDBCoueryb1hCtKYgMc/MKsFo
         mwQA==
X-Gm-Message-State: AFuF++mrPvS7Z4uBwlRxgJNswiq1aN/jPfMY7W0SbivEnQxZNfXzDX85
	30jHucim+3jF/dp7RY23UVoQ2I07NylBC/onyyU1+y8mv/JTh2jnYVTm
X-Gm-Gg: AYBFou0i7F3o/m2ioCt4bv8IOfpgpu/mknRdr6XeleQu9nb2bmp4sE70UQ/7ENNYrAf
	JksSbg8IEewRVepQgoDLokSHchm45h5CXlIMUu7c4Q1lrf7B92DgahScbAD+ICJzuC2/qULs2FO
	1BqFh1VmxK24HiILsU3NP/nlyGesQ/NW8Ra0EOXy2HhVGZ1wm74WWXahmOMiv2WgygcHsIksQR0
	89IsjLIEnw/g72gIK1EBPS8WllvUmRgiaejKQoyPCWliVf3PRnqlBEuEEEfu7NOkBGmugcFruMo
	ouVH4IiuRZm+9616iRV+NyL4t6RVJm7X5i3hGa4EyDX2G0IHpU5uIp0Y2JEyz0dskmO+ljFRw7r
	3Qi0XaGHltQO4H4hEp8O0fIY4mGSNj/XSHgQyxunwam4jlyufZeRflolUhv+6WykWUZP8h2kKow
	yf9sU12Vv/nVCdnZJeAzJGxi8XpGXKGeeAy+6IrqVcoBrkNlpBLSrgwyjiz8MMvN6TtcI4oA2y1
	XxE4Q1qHgu9DOXIBtXkpn+wtwtfB4E=
X-Received: by 2002:a05:600c:1986:b0:49c:fa21:e744 with SMTP id 5b1f17b1804b1-49cfa21e906mr280628395e9.26.1788940956976;
        Wed, 09 Sep 2026 01:02:36 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.lan ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm412817125e9.3.2026.09.09.01.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:02:36 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	mani@kernel.org,
	michael.riesch@collabora.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] media: i2c: Add missing v4l2_subdev_cleanup() calls
Date: Wed,  9 Sep 2026 11:02:22 +0300
Message-ID: <cover.1788940469.git.chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_subdev_init_finalize() allocates the subdev active state and only
v4l2_subdev_cleanup() frees it. These five drivers never call it, so they
leak the state on every unbind.

Separate patches because the Fixes tags span 2022 to 2023 and go to
different stable trees. The st-mipid02 one dates from the active state
conversion, not from the original driver.

Aleksandr Chubuchnyi (5):
  media: i2c: imx296: Add missing v4l2_subdev_cleanup() call
  media: i2c: imx415: Add missing v4l2_subdev_cleanup() call
  media: i2c: mt9m114: Add missing v4l2_subdev_cleanup() calls
  media: i2c: ov8858: Add missing v4l2_subdev_cleanup() call
  media: i2c: st-mipid02: Add missing v4l2_subdev_cleanup() call

 drivers/media/i2c/imx296.c     | 1 +
 drivers/media/i2c/imx415.c     | 1 +
 drivers/media/i2c/mt9m114.c    | 2 ++
 drivers/media/i2c/ov8858.c     | 2 ++
 drivers/media/i2c/st-mipid02.c | 2 ++
 5 files changed, 8 insertions(+)

-- 
2.43.0

