Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5334C3AFAE0
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463113; cv=none; b=XOB6aOp3QNS0ChGTg0WtyPPwyCeaClBk86olMP8R0tKlkEzWViCdR9ykpGKhQgAgrqsdyP3/Gv3ft8R4E6rqNNS378uNVxCxGGIX9luoraaCyB4f0rrm2QfgB/vNOfRaONGNK60wZfvdIz8Wn672M3tGZHX8JKEr8og6ef1Frm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463113; c=relaxed/simple;
	bh=NEHGUz9YYNPdsfRd5nud5yegJaqx7Zkjlu4HqFW8TRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uc+9DOHuLKW2tAStsGICKWTxRp7wX+DTWj6d3vTJcPWgjQWTK8qjr9mUOyxEoPxji+oiAFfMpqa7V+3H45BcRTEh7d9ekcchoK87DARsHc04+M7ECwKA9S5e+mdm7GAq7LEEDt0gXtfbXHIVqhcmGNQdFDwWtCv1TE73xVXcgUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTFAMK+o; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTFAMK+o"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca069c8so25738715ad.3
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 02:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789463108; x=1790067908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTZ8gBM+3gnYnTYBNkjTwF/jY8mB3m3p32yQI1BVbeA=;
        b=kTFAMK+ox6p7RV2PXK5RFdOTdr8FSNsTNPgnroi6MMWVo+n+efkz3MqwJJMkHFBieA
         C/LzL3ZMH2Dc+7C80r4HWaKoYdKBB/pW9u6sMSdLsSvaI4aHOT1tklphjQeZVTRdjp7A
         mfX/3Rym/jQcNcDoH9GmTejg47c3YARdujcckOflE/quCNhw+gyThQJvox4CmBMuiRcH
         aicomc0rIMhSe4Ix+Oq+vtg58mwoISVrMFIhJH/E1fC9pOxDWuvctxUKy2j+JokjTEWh
         Tq9fbKRYhExxzTdQh0l0i6cVjuZgm9OL+EXDYKV50eSzjkbXbQMYYc3+6mtZ2F7wNhXj
         arFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463108; x=1790067908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTZ8gBM+3gnYnTYBNkjTwF/jY8mB3m3p32yQI1BVbeA=;
        b=G1lh34b2KfSxwSreq9eega4yNmk3pnz3/WxoHVakaqLAn5knOfcTeF1085F1j6xmpL
         +5mwsoxRpydrrFXMrCecZdz3CEArP/et+ok37keobafKiODwxgYKn9b18GIoPtJaJ4FC
         6Cq1DIHxbwwknrgnK4ajGZb0VyIXzK4rTSYJQ6iGMedQbVZaXD0pdZx87mMI7ZOJfqwI
         NBtng7nAijcGUUKkjmZE9n7WTapU3NZOlvJ6rY2+gZsV6mlBbScseTLhhNQkx7y61ujo
         ODWIbADq+JYEQhf/IR1Oy6lr1qKUEwmO7tW73uCS2Zbi2xPw+gYfi8XswsTG1UfycwPg
         vJ8Q==
X-Forwarded-Encrypted: i=1; AKwUvByr1svgmEhMgaw/Z/UQ24yPDpVJ2gxBNQOx/tF2TlFc2HDM9TAT1AwxQHXuUvTjw5t4LQg37V3OHaJXgA==@vger.kernel.org
X-Gm-Message-State: AFuF++mdkVj5ExSjtkpbiz64vy2A/IXVIAsI4mg+Wr8Rm2YBGY/UNOSS
	gz4ad5Y0zp/nW+gx5I/+d7boTnWrMevBTZeF65Vvx6h2juvJv+uxeOwZ
X-Gm-Gg: AYBFou0i3KM4jxrIxEPuOOor0Ps3AvDKiFUbaOHvCajoYgcqTPqdU78A/GGhUu9Hu/D
	wQ3pfY1QfL7wWrtDM5NmHGVTTkc9nr9eB+Qsw3OdGjO0xcAjlFS579F+YC4ei/fjnKqouR8HF8H
	tx0mDHlWL1mroh1nXuCrQlJkZJ6bo32mogaalwkjGiHXWruS3tD/llOSevYpGZqLT0ugULUzjY4
	VWR0Tt+Im5W0REZ5S0lyULJi9rg+9T3TUJiG6/nXCl754HRHY5BaP8v/aqFv8ZsAmFs6TNfdck5
	UhNjHkoYvsh/gsTRF55G0aWkEVqDwXilveKPrukFobp5WicFYVYg8NTnWAOlsu95gWdA5wKTAZa
	JBKH59oigpJeuFriwSw3kmdtNbyYkZ8xqLepUiC4YJ3QKSCGRs/4AZnoY0QN61x20nc1GzZcJZS
	vMfiL23ahDzWMLNiFFI68S1fMdVD0geFSAIVADFRBe7tsfw0ptBF/2zg==
X-Received: by 2002:a17:903:244d:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2dd6c5eecb7mr126491905ad.7.1789463107311;
        Tue, 15 Sep 2026 02:05:07 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff6780sm62702075ad.76.2026.09.15.02.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:05:06 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: ov5647: fix power cleanup on remove
Date: Tue, 15 Sep 2026 17:04:57 +0800
Message-ID: <20260915090457.2342778-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov5647_remove() disables runtime PM without powering off the sensor if
it is still runtime active or updating the runtime PM state to
suspended.

pm_runtime_disable() prevents further runtime PM callbacks and waits for
pending operations, but it does not force the runtime suspend callback
to run. If the sensor is active when the driver is removed, the external
clock and regulators can remain enabled and the power-down GPIO can
remain deasserted.

After disabling runtime PM, call ov5647_power_off() if the device is not
already runtime suspended, and then mark the runtime PM state as
suspended. Checking the runtime status avoids disabling the hardware
resources a second time when runtime PM has already powered off the
sensor.

This issue was found by manual code inspection.

Fixes: 089b7c70f0d8 ("media: ov5647: Use pm_runtime infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/ov5647.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 3facf92b3841..d42d009772ac 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1271,6 +1271,9 @@ static void ov5647_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 	v4l2_device_unregister_subdev(sd);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov5647_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 }
 
 static const struct dev_pm_ops ov5647_pm_ops = {
-- 
2.43.0

