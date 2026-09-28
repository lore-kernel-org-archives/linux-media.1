Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C64D178E
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603510; cv=none; b=VHG5RqyC3LrFsK7W4Uap7LZIU0mWdSNftr8XbEUW5iLZIJYUiX49eN+NXgcuu7RqgzHTQzlcNUThtJGjwFRMTP0Bay5KJH+PWaN/ZylLhythc0CcSLKvV75VYTzijyyYxjSrc/CnKYa37/6q824TQVap7zDDOxueKQ1CQyH/JWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603510; c=relaxed/simple;
	bh=gcCH/ImF2avN/BEXcJAAzwFIO1x1X7GsiP5n3c/8JK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=isocmlueRg4Nui+cfzLdN9zKEoQnEdEEQLduytojlyhAeJdgNy1jSuruiiqO73KH+pWGYrWH3a5Y5z3EC14sKHF0AR/OYwR9G3uDjlYKF55aAtSEUtK1vXauqWXyrzn7w7hX3ZF9xPydhja75K7Q0ClEE0mh58a8kzZ7mETvrL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMzswL8C; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMzswL8C"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so3657762eec.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790603508; x=1791208308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ONrDgBKVsUbMcgTyeE/kjmsO78+gt+LAoKwNAqLrInw=;
        b=PMzswL8CmE1K5WlKHVI0h858Tf2HQUgFZxStQ3H1AfPI9fmcEsBM5Il1C0p7kfGING
         6kcFhqCye0lveFgCHm0C9MVzy/LOBTNHRq4Gux8tgWB/rZJhmJpLCTyoVOVNmQjS4ics
         0gIKyMQeoT1byXRIw+DIeMbxK+tqb0hidhKvjkVUnilmtwk+IA3GuYeN1jklgbL8ZBVU
         CiC1nZQ0oMVVoSN4jrKgC1A5lKb4PS4l3GlpROr8LcGjQp7y0x/3AkUSq7kIfenZb9OU
         7iDPkztvHgpNC5F/zfR4wBIJfbHfE4Pdeio16KH5vataxyAlFWEss1mOov3YeRC3+Ry/
         XgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603508; x=1791208308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONrDgBKVsUbMcgTyeE/kjmsO78+gt+LAoKwNAqLrInw=;
        b=JxzP0igNPgXh0fYgm85J3BOs8pswEIqLV+QFtg4tuuThPqDJ+vRXA77z6RjcY3ya5o
         Tg5bDHuUuRcsrGuiPUIO37m3BFazJU7Ok7f6OEDA7H5UiPozEjEk6xLp1pP4UNzEF3gb
         2FhMEhGtVqagixpqDcfUG8/sz01sG/EOJs8CZPdKtO73VUPwWl2md84T7YAz2/kjScge
         4d5sgIQItrfJX/JudH06d/072iU2IMgLrIh+7jzw4bDmv5kYYmV1inlajvelHJ+FgWfL
         yWaSKIjtdfV4hHSysCHEV+wjjcX8jLC+8w/dxoXDgLNDP6ANF1brHMGzwMcCy7U7CKCp
         OInA==
X-Forwarded-Encrypted: i=1; AKwUvBwZtV9l8CdjEej+Ran3jFd1CxGpm8xv+DaWqA85kX9FayLEEE48sr2ZHGAJFP/rD85s2EdimGuum7BdXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLfuIFI1a4ZooSMb69m3fCd2KdPhCR/eTJrtxUjQ/vXRBuRSqDn
	grthKAilLUEa1rsF7JkaooQq5IVBjvybTTBTB1y9Y1ndw5ldJr1l+IH5
X-Gm-Gg: AYBFou20vHWn+fIkDJNANG4hl0TQQP1V0BGYINUEcBDpECJFhpe6f3Y5uEoc31uuHX6
	1OznTfX17wTao6Uw9L1W5gzqQ8/RpsXaDaA4t6+aQWrMztEUVlv5FHzfsv+cK6KXMNFjcJwAQCZ
	EveDYJKnpCZUJjE1VDYl2y4FY/u+xRpo9rjNrteR3iHSChVvd3Z8Hro9dcWIHvooDZuUJkWSjwe
	L/jj5ga8fU7ZdF8C6msP8o+r38+4/upPk4RUN6/zjeHwtDZ046idAv2neJD4BjsXPl+d5HA9bAo
	ACxvgBEeLwEqPQIVbUbkZr62GA8hQ1tif2o/dtKMZ921hWhd52Sn7EpM3e0x9NEd6Bbu7Nf/M0j
	FlZB7oGIgSNUOm9m3vlZy+VmRtdyvZT05/8HXPc3mkr597XbvSHvCKMnd23bc+AvvdvzO/klQk4
	sSFmuxsSmoGAEJPhV8r2YwYtyIxQUEYAMumF+z0Yw14C+leIfP7nb0fOLqORPuJmnxKnVDxXJ1z
	GLwNMX1YmSjZdUo
X-Received: by 2002:a05:7301:b89:b0:343:ba1b:9b55 with SMTP id 5a478bee46e88-343ba1c13acmr7303784eec.40.1790603507758;
        Mon, 28 Sep 2026 06:51:47 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3475546c982sm6634166eec.5.2026.09.28.06.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:51:47 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: hi556: fix power leak on remove while runtime-active
Date: Mon, 28 Sep 2026 20:51:40 +0700
Message-Id: <20260928135140.2354361-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi556_remove() calls pm_runtime_disable() but never hi556_suspend().
pm_runtime_disable() only blocks future auto suspend/resume, it
doesn't force a final one -- if unbound while hi556_set_stream() is
holding an outstanding PM reference (removed while still streaming),
the device stays genuinely active with regulators/clock enabled
forever after.

probe()'s own error path already shows the right pairing (calls
hi556_suspend() when powered on). Do the same in remove(), guarded by
pm_runtime_status_suspended() so the common already-suspended case
isn't suspended twice -- same guard sibling imx412.c's remove() uses.

Moved remove() after suspend()/resume()'s definitions since it now
calls them directly.

Fixes: e62138403a84 ("media: hi556: Add support for Hi-556 sensor")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/hi556.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index de573cee4451..45d1366c6d5a 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1264,18 +1264,6 @@ static int hi556_check_hwcfg(struct device *dev)
 	return ret;
 }
 
-static void hi556_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct hi556 *hi556 = to_hi556(sd);
-
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(hi556->dev);
-	mutex_destroy(&hi556->mutex);
-}
-
 static int hi556_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1316,6 +1304,20 @@ static int hi556_resume(struct device *dev)
 	return 0;
 }
 
+static void hi556_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct hi556 *hi556 = to_hi556(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(hi556->dev);
+	if (!pm_runtime_status_suspended(hi556->dev))
+		hi556_suspend(hi556->dev);
+	mutex_destroy(&hi556->mutex);
+}
+
 static int hi556_probe(struct i2c_client *client)
 {
 	struct hi556 *hi556;
-- 
2.25.1

