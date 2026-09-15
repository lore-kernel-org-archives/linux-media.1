Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1F83E49CD
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461349; cv=none; b=ZPM1hUlRZEJ8ebKY9t6WaIxgrNLHxeOJegiHJbTrF9IVl8hCFGVM3uKzz5BaJdEUhtMiL/qkRMU2U+TGHJdwnxOUgcj7WFcELYue8alQbFxZvWG+asgYtADc7bJRAh5xmGLAfyz5OIKQs757a9W3yf9IUOMeyuuILblR01s6W2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461349; c=relaxed/simple;
	bh=OM/p48Qc0aO3PcwqIVzqa8+f4RK6lv3rfeLufct8Tg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g0hC1jOTyC8pXo8/u7tU5zhBrCckgTroxqrqsvz9huFF8k4LqNhVhX7FZdDIr0KE61CVtJyL3A/Wm0bbua6t55AvKkkHtyvmnzP0K/fzycVu0z4nZ4swHEk8zaFjOswNnMXpwEwMLXfkSy/+6A1iRhE9JgEqVIL59uSHcI00UJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8Chn+4Q; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8Chn+4Q"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f066d8so8757225ad.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461347; x=1790066147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/IPwSIiNpzASsj4SkKRZI8zUj5CTEryEYHaO7CYib70=;
        b=a8Chn+4QvGWgj6dT8mI1PV87sr/HTz1CtptMT4n/abBqbfXwsCWlk+wYwgGLL+3fTR
         EKHlHDVAARQDMAUMTQu/t9S2x7FpTfmpIP7S90aWozUR1ZwM05fWzyxrOhq3Eg9RiTCG
         TYXxN1L4hP9XFUJ96FSMgo+3pSDvrZcsru/wCAOKK1sNrdS/noYJtYl9Dt8iTan4ANwo
         yB8KiHtAHm2TcVC5B9DE1HtoAKrPHF54kR9V4so+zx0cwGyq6UpiMrca9A9sUUiCwqKy
         6IHDF3OUsnZcbGMpaDKgSUR78aXuRWtb+tZuPZJa5sWJJQEBugkUMXb0vWi9VP4A1knh
         Vw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461347; x=1790066147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IPwSIiNpzASsj4SkKRZI8zUj5CTEryEYHaO7CYib70=;
        b=eJOYOX4J7IAi5mg3IQctUqjc+BboXFaEJRaxF9keL33yywv5jNlT+6Rvqc/QXP4vaR
         SxNkqSDsByL86g2Cns4nmFdS7sFXWI7N1Z61sU80jExo7Z3c9bXb5tX5UatCJiv6VVOh
         yLqoGPUfhG2ceUGPWR9ffJtHn6+H5muQYdBX/psdCGi9A8mpfQPj3v39R/emwTWbHEhl
         7IQL1nE8biNT/z6AEXiw0Ycr1O7TJpfeyx2abwHNfkDIoQrYMnHfddLRsLxAAW3hoOmI
         pqNqrZzlOOxYvsp4f597ANSZ4qb1xsohqSHPiytL++Py5fkZAJK19vzYbmZplEsJN5lY
         Mq/w==
X-Forwarded-Encrypted: i=1; AKwUvByHVQOhG02qEAIRHcp5kPzS/gMPn9LWeAhWpWS5Wc2YMBI8tWoFoDgy+ByQ0T3VxeH3fpM351lESBxy0Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nokUoFBd9go+towJkgPIl+/TjtcwXcG/DZtohha72ATHa0ALqm
	QqK42XeoaI864ekZXeqKoF5yYzcdvRTDNz/BBSV1pMM1X9HlgU9hHE1B
X-Gm-Gg: AYBFou1bG5+iNKrYsULcyFDcUMsD/ElhMm10kHiJUeBEb2WKp879tAD6C7r+MOllHIE
	GwG/cfmo+LCJRL49NvHb6q7+TcJNTEXVDi0XVjFCUIDdjj4n5mjc/M8CO2M2rn02wHPMTUrySVT
	DBajzu43qBrSAzo+wBqX4XBDLX9KH1jECgfGefDJMYtQrjJEHbYzaJIGiU8gGvzwXX/hDSVc9i4
	k811MvDQcuTAEiyNJCbRxZUUL92UyH32TcUdJ4LhUQLvkLZTSHqn8NqLntclsZw6ANQ8/YLcD00
	j+8XNmtME99Z2m3oHuIudQuXoSEpP/0uqxJW2Rq7dY0lpucApdpklhkwazhc6sMypYgAOdL3srG
	vfpFC3sVoQo+9r2+Pnaa9xQhY6muqyelP2GzOBZyp2t3MHplqqwwtALzuLRe7m6vzBWdkN5085d
	x0ylHih+I60igTDMf0Cuobtz1l2SKYynwVM3gjnrpG6QRrzxsDTPIZIAWrvABYiOiPDdD4
X-Received: by 2002:a17:902:f681:b0:2dd:68a7:d853 with SMTP id d9443c01a7336-2dd764ec710mr35774085ad.9.1789461347173;
        Tue, 15 Sep 2026 01:35:47 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ccadb4fsm62294745ad.2.2026.09.15.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:35:46 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: og01a1b: power off sensor on remove
Date: Tue, 15 Sep 2026 16:35:34 +0800
Message-ID: <20260915083534.2290587-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

og01a1b_probe() powers the sensor on explicitly before identifying and
initializing it. After a successful probe, runtime PM is enabled and
pm_runtime_idle() is used to allow the runtime suspend callback to
power the sensor off.

The probe error path explicitly calls og01a1b_power_off(), but the
normal remove path only disables runtime PM. pm_runtime_disable() does
not guarantee that an active device is runtime suspended, so the
sensor can remain powered when the driver is removed. This also leaves
the xvclk enable performed by og01a1b_power_on() unbalanced.

After disabling runtime PM, check whether the device is already
suspended. If it is still active, power the sensor off explicitly and
update the runtime PM state accordingly. Avoid powering it off again
when runtime suspend has already done so.

This issue was found by manual code inspection.

Fixes: a95ffde28783 ("media: i2c: og01a1b: Add support of xvclk supply clock in power management")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/og01a1b.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 1675f0460969..1cece90c59ee 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -956,6 +956,11 @@ static void og01a1b_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(og01a1b->dev);
+
+	if (!pm_runtime_status_suspended(og01a1b->dev)) {
+		og01a1b_power_off(og01a1b->dev);
+		pm_runtime_set_suspended(og01a1b->dev);
+	}
 }
 
 static int og01a1b_probe(struct i2c_client *client)
-- 
2.43.0

