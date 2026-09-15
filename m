Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F363A63F2
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462758; cv=none; b=beWmjqNNeSaV2kiecZr8GGRG564+x/3zGL96ACW8oy3JzIF9Yi+FhMCoMomKRXteIw6LEVFU/lVF5C6atW2VlTrNI9GO0e2zrdekFPU8sOtx3xMYwrCxbcm9GTPNVZlzWEWrf4/84iVGm516N9O3KzyXTIj6mDs6bOD0leysjWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462758; c=relaxed/simple;
	bh=FrrQYfQU6QCxSdGgk1GuNPTZhnZYH8mKblJ8ecLuRKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=myBF+MJplatFMK8n8vosSWfYfM0T1Aur+bPZDf+w6ShYhYg2FboPBTc6X9VJEn6knN1Rco5Njp5JPcZYOyN9lxmoSwZcEW9D6QpUZQqZfK0/j/Hpzl89tzpp/UVHtiah+zGskGqIr1jtXvSx4UmEoe3UAUuJa0hr23wASpGkJq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHjx9ywo; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHjx9ywo"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso24213b3a.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462755; x=1790067555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyCtAYEv+ADh35UDXMw6FJCrnV+v3eYd/3d5UtPzs0E=;
        b=aHjx9ywoIym09bSNKhNCMEXyFmk8wZJU1ZRn/zIUgPywhI5/zr8fPF2YNoKaERprmj
         POclqW/HrHDUZiMvlRO1nBEPJ1M3H9Q0zAuK8m0dRb86/xtQlLtm2yir7Ab5W0y+ypJo
         YRO/bJe7AqOSLZ1P63cja1VBSTyyD2T9ZRcU6HV2Ub/OZsw1ldvBamYI3FUiQxxkJNCV
         nRb/ibytpH86ByBWXuQD1YKnNjz4Oqhk7wo8zhmw05T+qqNqh0pMf9EuvYLj7dA3tX3y
         yhLlIzjEhZ1w20jOua/rzE4PF7typS37uknaLshuskD1mtPxErIPQUEHJlDbNDIUGrxm
         sExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462755; x=1790067555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyCtAYEv+ADh35UDXMw6FJCrnV+v3eYd/3d5UtPzs0E=;
        b=VfYJKtKe4r290G4xOzkMk3jh/whVJDc5r9UJeuk77cbbru+pYjvPDsgFY0JyldRkZ1
         tjYOqlaLmwk3XSI8I5u5tfq2BT0FiMAdPYu0OLUrMWGTVTeBO+E0HWF5ylBG3U06y5Up
         mePabtUZoeG5pKF0ZD3zDrQUjMw2w8p8GmOLd+17vQCU10nyaCZT/0kBudxv5o1AW10h
         +ME98/GVUoFp4DlmvDStUFi2dMY1RKjazE5Kr5e00isRAomfmj82ALhXv9sFOQAnEl/T
         OrVDTGHsk8B6oJAi1yQmukEpxl+55ZvOqjI7ks9hAGA66KvrNT398wMGVd+1PZllfL/i
         hk/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzoqgYaUUrRuF0dL5alBnjMtMKtkhaJIqfwcpYxTFyh4rzreMrAZ+jsAUSrer++yOJX+VgerFW61fsvvw==@vger.kernel.org
X-Gm-Message-State: AFuF++kIufx5S6dNv6D8dK/YhAEypl7i1hjio4mhvMx2S0Sm7DQRXO6v
	laPdbAHwANV/rLy9nDlN0LA6OHa0/O7qiUR7/asQe5ok93Ke80UDRucO
X-Gm-Gg: AYBFou0hCO5A/GAJYfahg7PTX9CDPAKEtZBNHtvagEnSPXGrqTOOtjyxeMckxpLZ8/s
	eeADQTDAnEDRDvh58Y6KaYmo6cmRwTNQbxtqtSubPzEJyxnYw26oBBTx3ED7LmW+//GYykc/wvD
	h+bC0PT0HoXu+lRHts+h7Mesp1ssKkcX3b1NvXh12/GwYRi8ZfJqJ62unUolKXLqSWLcbZmBI04
	Poh4lQ9DIzteVvYaaWcDYpQm4uEahiUO0Dij+OhCqvqq8znARfaCpxfO5/k46HW1pvxd32FCQLz
	un3Pukfo+sdgteFdBUNF4B50eC33x1aj5DD1lxHn4BAw0zhtzwZjNUHo6hHR4Z1MN2JlRoOdos7
	IoiNFeZoxX8cvQu3aBrnPFS9gtXgzB5geNN0DV8PaxPbi5Y3W56ZL1zuVTibk+IHcXGYSViof5j
	7C2URWoP6dxbKhnEjB5AR+KP8s6FV0R6t/ddjhaOlkqonw0B7qu7uE28qCHnKYvoD6VQ==
X-Received: by 2002:a05:6a00:815:b0:845:dfef:75b8 with SMTP id d2e1a72fcca58-8717efc758cmr103066b3a.15.1789462755534;
        Tue, 15 Sep 2026 01:59:15 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6596d88sm6473725a12.26.2026.09.15.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:59:15 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: ov2740: fix power cleanup on remove
Date: Tue, 15 Sep 2026 16:59:02 +0800
Message-ID: <20260915085903.2337086-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov2740_remove() disables runtime PM without powering off the sensor if
it is still runtime active or updating the runtime PM state to
suspended.

pm_runtime_disable() prevents further runtime PM callbacks and waits for
pending operations, but it does not force the runtime suspend callback
to run. If the sensor is active when the driver is removed, the reset
and powerdown GPIOs can remain deasserted and the clock and regulators
can remain enabled.

After disabling runtime PM, call ov2740_suspend() if the device is not
already runtime suspended, and then mark the runtime PM state as
suspended. Checking the runtime status avoids disabling the hardware
resources a second time when runtime PM has already suspended the
sensor.

This issue was found by manual code inspection.

Fixes: 1a140854bc8c ("media: ov2740: Add support for reset GPIO")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..a5346adf2281 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1198,6 +1198,8 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 	return ret;
 }
 
+static int ov2740_suspend(struct device *dev);
+
 static void ov2740_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
@@ -1207,6 +1209,9 @@ static void ov2740_remove(struct i2c_client *client)
 	v4l2_subdev_cleanup(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov2740_suspend(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 }
 
 static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
-- 
2.43.0

