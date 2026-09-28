Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CC74D98F9
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604762; cv=none; b=AH6bKF3JUOyxivnGMJdHEhjPwh3hfVViLT4azStrWoyvEK95f6W3Vswe95bqHPR8h5jMNmCLE1xp0EdrrdeXMOvhFehYmqEtnV9G1uPNJ97SgwRzk1109qBLnDz/cT68lZN/VQrjj70YlVIuGcpw2TKCO7UKS8ypS6ce4iZLiA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604762; c=relaxed/simple;
	bh=CxesPCuSDQamye9WPEsNzsnSxvsW/xWJqTvLKJmLwac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dtyHr7KJnxKe/hANPcN6+SskLcLmXM36Eqiy11H9uB2O+I3S1yBiepzMmUmGAN/viH/NKGr+y6GlxbSoZmWk/YbtKk0ht6C5OFG23pu+3zGNdwmCPPJQImLFjuNZ2QoBoetzhoLrZLIwXhfH0mqENZwXlUv4W9wQRPSYhz3QXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JScYGdgz; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JScYGdgz"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1618913a12.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790604760; x=1791209560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DGOS4RqauVn5EUCCngXsG+3nUUycunolpYedH1PmDe8=;
        b=JScYGdgzSYez36rmDELDXTtpEh410AZvsA99UkORw7uAqAXsmIe1IKhsdlzxKm8MQS
         rfkhRFKptnMcnHKN718kftiv3u6hg3kkQGW9jCNj22aocxH6HQ4W6K3jet/M5b3dIApD
         X5DQiwiFE50rCvsXp2u87cX2wxAKJ78nU0Don3w4XWvnMk37Ly+lz/eiJqPkcQyD4eUq
         Gn7vkR2AkOSYooSQoSAENQ3iPScQB252UPXN5yCAUt8+7T5mDoXblQ2bFsW2ARyL5DRI
         3wnWTgrqefePbK+GNMzMOqE+6Fy2skeJRFv0sk6itzzJKFAbMMxH7Wu/KO4QqEdMRQvl
         zqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604760; x=1791209560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGOS4RqauVn5EUCCngXsG+3nUUycunolpYedH1PmDe8=;
        b=AzEhDpAEJnlnnxAMUS5mbEgdP5SFGcvYN1SeQIInITYj/dArK5SRKAk2PTf39EScPk
         IlcTE0Nnba3X80viQrgx2tXzf7M8FmbwoWIOIHc6LFP3JbY7vJNj0vxjFcXxpnwB8oeC
         yPDfPMINkBmnoN2x7qUh3Odde658w5MBdlIVBjwoR2w60afNcMwta2h+SSkijCfdT0/L
         3c82SBx90zrbjaH0oGKJhrNGjXWCsCMLhVB2sC99qRmC9iaRntIfxqGevY/W6SeNfU4e
         C3kC6RFw4O+l4L08wvjXqruy/yv7LJpeGiIiXhSRqyFDSsK5DbNpBqu/pRVjQhDgly9z
         7D+A==
X-Forwarded-Encrypted: i=1; AKwUvBwKJAPV6hjDnr5p7h3jR6bUTMi2woYirkiQUcftfjF4vohu27erejh51GVtL40EW09P8hTv1lL4IfEUaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLcSxvmdAeVtCG/Nzh+Wdf1JObmSU2kf1YsVuPy87BniXdr76AR
	6w4o4VPJOGsLw17A+bROjoJ7/0JZh2wNN7PHvUPRmVygcp9Fm0ie3ruT
X-Gm-Gg: AYBFou1Sh0b6lPUQcK6VohVJ9mMOyxd0wJICHtxHE7l7XHPkyki/Lv1ZUwfVRy5B8Dl
	B/DzB1YievZ/vbaofzi7FOuFdwSeWt/PygeZpKpF69dDSsfFXnq3CrJWmigmGMHXOX3vKZJpfHR
	rVwlqVvXFhJxzwKVeZxxYgGbShDRFIuv9ViWSOn6hpoj/lZmXhyrypdldBBftczl5iCXaqjq036
	N+Wg87bA8c8rCvncn70r2ZCx0Yxve7yyFze2P4XegnbKht0I/6fLdORrAJsGHQOHqIYkCbhN73f
	i+J3oPYgD8zbwhLcTNKNwJyraV9op26UWMyU2OIueph8b4fSGGRmMucs7PjwEIgq4sq28N+cPfk
	KinkM0EMqI2BZJwpyB0ERLQaQLAjs+wbokH5/B0EXYzG/LQ6BQjWG7i+yrVhpDlBuTUt1dd9V4w
	mrYP6720+CHJuBKmGEF+8s1BGcmh5bkCto6+JfRO74BYgJUTThZJ/LKvJ+MmCnFm1pYG6CFfaot
	/QZQwvXMjAdI4hpcPPZHOWewwg=
X-Received: by 2002:a17:903:3b8d:b0:2df:95b5:efd with SMTP id d9443c01a7336-2df95b51557mr51627095ad.7.1790604759846;
        Mon, 28 Sep 2026 07:12:39 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfafe765cdsm23881025ad.33.2026.09.28.07.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:12:39 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	Ramiro Oliveira <Ramiro.Oliveira@synopsys.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5647: fix power leak on remove while runtime-active
Date: Mon, 28 Sep 2026 21:12:32 +0700
Message-Id: <20260928141232.2443546-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov5647_remove() calls pm_runtime_disable() and nothing else -- it
never calls ov5647_power_off(), which actually powers the sensor down
(disables the imaging clock, asserts the powerdown gpio, disables the
bulk regulators). pm_runtime_disable() only blocks future auto
suspend/resume, it doesn't force a final one.

If unbound while the device is genuinely runtime-active (streaming,
or an open subdev fd holding a PM reference), the clock, gpio and
regulators stay in their active state with no code path left to ever
release them.

Call ov5647_power_off() in that case, guarded by
pm_runtime_status_suspended() so the common already-suspended case
isn't suspended twice -- same guard sibling imx412.c's remove() uses.

Fixes: 3c2472a3c548 ("[media] media: i2c: Add support for OV5647 sensor")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov5647.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 3facf92b3841..52124327959a 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1271,6 +1271,8 @@ static void ov5647_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 	v4l2_device_unregister_subdev(sd);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov5647_power_off(&client->dev);
 }
 
 static const struct dev_pm_ops ov5647_pm_ops = {
-- 
2.25.1

