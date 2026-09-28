Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC24D7D2B
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604302; cv=none; b=KBImXfJD2k/NhJtUAV6HHXTsJUta08z0Mv1xTiU+8R9Q0/TZTLVWwoEHgiYDL3i5lt1FqJoqH6icVuR8X8sSDPuaUgOsenovidptZOx3UPbpHrE+QzH3oX6A7vyeX4g6+n2pNmUFDGu5U8Z72MjWtCCNNq2Vn79LO5xZpouQxQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604302; c=relaxed/simple;
	bh=e7sZyGlmDt4oF5STQeiaE91HwY1PMEfx+7YPGsgDjQw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g7jf5mSPqOX6DpfhoHE7HknmyZ07zmIHpJCCHi5YxHsu8uObfOqzVJQNodmt0Pm5Z7O1MxQJQ0GaLa+QWKkTsgYwqA7nXQHxJ6qH7bLuf/tV4Qw41VuSKImW8jYV8vz+lceTD4HuN2gXqomFroYuDKNmLjmMvagR0uXuW8deACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiGorfGa; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiGorfGa"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-8807e5b8fa9so1770322b3a.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790604297; x=1791209097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t52BXxF23LF5E87Y4H/VQEPcHdWpBGQRCV4phQgDzGs=;
        b=AiGorfGaw9QPrHyCEcUq8Rk3eMCbZ69NfyamC4NWykeKHhBc3pDD4D54eLHNTraH0I
         4caXslqeesgxDhci/DX1wkzY0s57gWAi25v/WJp65ENNR/zKFaX7Dh3+24f885IFsr9J
         s69M39M36/jhnKvIeR5OBrZt/oTBeGlqebNHqR/iIQ9qh//1QPhSgkpKkL2VOrrO8Ydo
         6TgWk53NoJznZob7P2F+AlPj1oKBY886pPmmZGX4MwbLvEWBi5+GVMophH/NT+8jMmyz
         pb8w1p9JEm+eIpivyftp+4LHVYQnSX6hkYmKpxviCrIy03Kl24wy9bBnZGw7um4I+u+5
         JibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604297; x=1791209097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t52BXxF23LF5E87Y4H/VQEPcHdWpBGQRCV4phQgDzGs=;
        b=s+ppz8ufgGqeOYB5MZxuEE+iPxgER2+qQDF5Z7n+Tz4dvDJqml0X9SM9pMPlzuFgjH
         SdljyU3iwF+U9t4AyQfQ3KCvFkS4dQ3LIsPTcDjlM5Cuh/XmBWqk2WmlTKtHtnLWsO1g
         0paYqdOB/qwjNlQTXBJkKUgMtqyUu8hY3+QNGPwDCaVfqa+cNlpzZP4lzR+YACHOYmtZ
         eWe4l/yV9zMjlRF+BimuUcbu74WMGU+LkWP2ga4BCv6HrrCYqWlSlTmmJWYNB2SZwaOT
         5GpgPjwwMs9SrhVvNYm9/b8SlJinQMCqVGxnMoqE7RD55rRZAlK6sKDCLLx/0ddcmQJS
         7SOg==
X-Forwarded-Encrypted: i=1; AKwUvByL8gLfk8924dk+/+UvITojNOAzzv73XY0l8PDbR+7ZP9Bw2KkGTHzDS5GrgbmKM48HLKh3znC0hONBcQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nUpE+WYVpJb8H27tADk9TLLXDDQfEIS3syTzMU/YncE/Gm1Q9W
	b6cf1Ds+P07/3qseVC92f8JhrlBUQ7xBc6ma9igVQFLjqucpvdqLHmIp
X-Gm-Gg: AYBFou38g92RmqqqQlCXoRIzo8IuEdsk6xPGrMDNks6iZWcQK+pPz2rZF2ZGT37i24z
	1G2O4Vd6QDRL5GjIRak+r7d/Ci21f6DQD7XKGWWTXSrLTE5568QbDxQmGfLhpePhWZ6Vi09cyUv
	BSKGgpWlvhnD8PGWQHm9jzseb2rsYduzlFCNCdDgJ6YAkPVAnIoSosiIomKhDIONovSPduSh2u+
	kghVbMKnypPSfyfzxnAYkzIOpU4/01f8FF8wOUhcLZT0FT9haPHyWG+1DG49oUqILrnjODTZDU3
	4ZYz/j5Bgk1TQ0ucOdZmqpPbcHBPKWEvdi142G8e46dYGIEkq8fbck7WSQCYkPF308YLNa0A4qo
	HOtvLiyhOSFJg3qMBsTY9t09icMT5B2O4kmFAwPyGqUQGbCOMTj5wiYTsSh5N6xUESx0rOiqNDM
	KCczgVY9arjlNxPNzpG1q2KbA6PG8tTTgVWO+zuQJjy9B6RGoXEEwQOfSmJGOoQv46ycN8Uxv26
	lzzaKORU/XNj1Yg
X-Received: by 2002:a05:6a00:4107:b0:881:c561:a088 with SMTP id d2e1a72fcca58-881c561afdbmr4799959b3a.4.1790604296856;
        Mon, 28 Sep 2026 07:04:56 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm4129901b3a.2.2026.09.28.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:04:56 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov2740: fix power leak on remove while runtime-active
Date: Mon, 28 Sep 2026 21:04:48 +0700
Message-Id: <20260928140448.2404694-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov2740_remove() calls pm_runtime_disable() and nothing else -- it
never calls ov2740_suspend(), which actually powers the sensor down
(asserts reset/powerdown gpios, disables the clock, disables the bulk
regulators). pm_runtime_disable() only blocks future auto suspend/
resume, it doesn't force a final one.

If unbound while the device is genuinely runtime-active (streaming,
or an open subdev fd holding a PM reference), the regulators, clock
and gpios stay in their active state with no code path left to ever
release them.

Call ov2740_suspend() in that case, guarded by
pm_runtime_status_suspended() so the common already-suspended case
isn't suspended twice -- same guard sibling imx412.c's remove() uses.

Moved remove() after suspend()/resume()'s definitions since it now
calls them directly.

Fixes: 866edc895171 ("media: i2c: Add ov2740 image sensor driver")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov2740.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index fb590dfadda1..fc3710cf3c0e 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1198,17 +1198,6 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 	return ret;
 }
 
-static void ov2740_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_subdev_cleanup(sd);
-	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
-}
-
 static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 			     size_t count)
 {
@@ -1323,6 +1312,19 @@ static int ov2740_resume(struct device *dev)
 	return 0;
 }
 
+static void ov2740_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_subdev_cleanup(sd);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov2740_suspend(&client->dev);
+}
+
 static int ov2740_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-- 
2.25.1

