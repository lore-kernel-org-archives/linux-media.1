Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC5C525A98
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066421; cv=none; b=jmPhULSswCSzgZq0xR8cO3m3FKNdKmnEde7STIuoGjTZQhcbxITJA87jcKLn0TAPPzghHY7A/1Zwnvm8ldlOQ5g9p9JRexiZJwXTV0afep86kG7o3KvzoX94h4WuaiMlbiya+8qM5e6q3DN1xyh1WyMPEfhJWtmP4jRcIGC1g9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066421; c=relaxed/simple;
	bh=7ddEEDYiWcRGK/WOOFx/dsbsKYz9W7gultIVoWDHN8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e4t4gagrnawZvXkzicnEl/ZzdMXTv1Hpcht/EYWrL1g/jATBxBYkd6bktjkOExl3rDF82RxVBQZDhj7LHzr1mFZmoyU/Eak0nhdGXF/gRZ+8Kz8XFAgWIUO5OAn5IU3wzcIFk0dKMdmXXucdfV+2GqjE2lACaE1TcDsoRnpKf2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7b5jlVL; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7b5jlVL"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso3020442a12.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 01:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066419; x=1790671219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7Fu3Ae5XFkGmOXs4h7NOUGECaveVKHxHBmx2pZiZGA=;
        b=S7b5jlVLzBu9WYNvC2D1P5pR9P/PxA7kHhvtH8tQSIGdN91mXnimQhGG4bpFDnLlMt
         J7uq7sRwGYGvocTijBN4hmrP0AookObkCYffirveEu8/1pzxlaTOkt6HTOi/h8hyfp2S
         3LiGXGCU+vNBYHdhI+7cRg9qOSN4MAXR0oHPY8PJmUOx2DjWjDsjGtqmO552Xn/TDOMb
         X6vFH9HD7ajeWdBPlznHFSag0FqueokTdPto7vOuIwHMZ5oounjlOmYrit8a6Rw/E6w0
         rreeZ51P57EACr88qUebw77qEpiTlyGoSjagn2vjsF3d7jAJvloZDw7jeMKdZiKjWb4P
         kk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066419; x=1790671219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7Fu3Ae5XFkGmOXs4h7NOUGECaveVKHxHBmx2pZiZGA=;
        b=XCPkjAw2PTMr3lGN8cCZ0Khj+g4q144je59nCljXEZWGXs7nMgtNCjwdS/v/3j8axM
         m3SWN2Q188WKqPOIpHtM4rnkDuzNLYlCU9CpO2NQLT9k3aNaoVd00GIrlUsDyQdLE1pQ
         fkqBu7sO8xd81OdOV3EB8t0iQGmPsH6o4R3xd0L+RwVebrqjAUPgLIYaqNK3vVQuPpRR
         Sh54M8Cy9qNYmeCff1qQwsnE4w4/ZhMq+JJoISeOKKZoMBiYk4M61L9K32FXrwixqjvY
         v59SH3dKrIW6WZRmxrA30DtlXOVRWtnLElLp53W6d99SGeSmDHMKBcZBDLo6Ojduhq9I
         glFw==
X-Forwarded-Encrypted: i=1; AKwUvBzhLQ3Fl46N2B8bfD4ETj1fnAf3wXY1mPUz0pqZzLM8wz0/RS2QSESaKGMxFFqee7lm9gAMITSl2jKMwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m42DlQ0QdmynVYQ6VwFtsqTgGsEKfG4VdZaQ6bp/irvzuh4Yfv
	Q95nt3bnUxhn/52Azz/+p3dX0ybctHotsY0vS2S1d5b1tNvAcrHgxxsj
X-Gm-Gg: AYBFou3tuNKdLvmmsMIksV+iqddVMlOp3f6bk8WHuj9lsqAqNeHivBIkI1/rQfmbbiJ
	8Kv4oZ2Yp5dp7uMRiJKLFp/0lDt+aBcSWy4BY4qDkyDPFacKn0s+cJ32ekn/jceWdk9mApO3k8I
	amKq6tjVTJtUYLXWXOhLb0GYzXS0OTIoWwBgUHGohy0brboCDGvPU0tqzM5Si+OufOiai5v0imD
	Rl832N+AsgMJj5FSIlA1kn1c0KjhJ0QBd2xdheFtiMGalBqQ4I8WvPQRGhuil8dVLiPjkKom4wv
	l5gD8yaVQ6MgidKl1V87dYVQdEssN3tGTkTn5lAq3o227DDibLC5bNKPy0Smk5KBAWNZc+hxjon
	9UIz2eAzerYsCg3ljnY5Vl1PHVNmsn+AMGjcVzwmWM+NgA1up5F4Dw0/KY5ZKwEAmIxIU4QGDNW
	6Ji+LfDI2QtS1TsfKNxA2tm8gN2m40nOp+T8hko7aPQrqbzVx0IGcQU40=
X-Received: by 2002:a17:90b:55cd:b0:39e:4c80:44bd with SMTP id 98e67ed59e1d1-3a0731eca18mr446217a91.32.1790066419395;
        Tue, 22 Sep 2026 01:40:19 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f294e4acsm3380134c88.1.2026.09.22.01.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:40:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: i2c: ov5647: fix power cleanup on remove
Date: Tue, 22 Sep 2026 16:40:09 +0800
Message-ID: <20260922084009.506362-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov5647_remove() disables runtime PM without powering off the sensor if
it is still runtime active. pm_runtime_disable() does not invoke the
runtime suspend callback, so the sensor can remain powered on.

If the device is not already runtime suspended, call ov5647_power_off()
and mark the runtime PM state as suspended.

This issue was found by manual code inspection.

Fixes: 089b7c70f0d8 ("media: ov5647: Use pm_runtime infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2 :
  - Move pm_runtime_set_suspended() into the conditional so it is only
    called when the sensor is explicitly powered off.

 drivers/media/i2c/ov5647.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 3facf92b3841..3b3e5653a0c6 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1271,6 +1271,10 @@ static void ov5647_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 	v4l2_device_unregister_subdev(sd);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		ov5647_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 }
 
 static const struct dev_pm_ops ov5647_pm_ops = {
-- 
2.43.0

