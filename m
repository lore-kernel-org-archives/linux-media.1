Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7E495024
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461892; cv=none; b=C2a3wIf5O4cjPf6O7rFYh3FsA/998vmoYh4kcR7lapcuoArAz9h6nb+0NnYgY2fytap8sjPMTPGXlEO9IeBiPJlRJ7s6P+X1XeKa1159W8ApEvhNxUwJp3mwMznujy5QCEQDvsBin5Eo9PHxFIOG66WA/kew1XcfkZWsmkVVVPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461892; c=relaxed/simple;
	bh=sIWXsFOViFSc+IDafr5CEvfwl5IYge2eVO88nxfFni0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lzeoBJTTHL50pE9semkFUhJJ89Aauvjc/IpqwpH9X8NDh5udqP0s+aKfRYLpw9EE1O3soebXaeOJ+HkfH9XRQRv8dI7mAbeK0X+hJiC88PxMga1e0Fiy6E7hsCfgk4Jzhc/Kd7FMPyQYi53AvtF12fMjWwC/+fAXpHUqnQq1p/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI8qnZnu; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI8qnZnu"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso17476a12.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461888; x=1790066688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZpYund0BctTk6ZH3SpbNGSO6zmMyboEAdN+GkOuIBA=;
        b=jI8qnZnu7uDOdAVW2I8qt620CwL1qYLkLRpFYssH/rWpXNRd0J3r5TMKdv+11vPr0J
         L67H/ULryeVp3mjXhiCycncaZ1R2FFURGZm6ss7salhjCCobfTJovosHdGZWK/uMTwZB
         31+R0BP9vX9CFJx/y6K+LNzpNxpDi9aCuCFrtsrlPGNJhVvBlrhSZkuUUkE26G5zTsqZ
         i8VXrnxtO3GarP75GwZtW/PgOvatJWxChudVV8Rah4Pd7WmFHN5Ahej1w+zFIUKKBCSG
         h2nzLLIA+sxd2wfm2P8kRQrpmRxNZ1EBAdALsl789N8e3O095KUcVmYhafm39XEMQgpK
         Am/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461888; x=1790066688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZpYund0BctTk6ZH3SpbNGSO6zmMyboEAdN+GkOuIBA=;
        b=mNxK3x8wkevQYmBHyZgML5pwatBj6WgnWnAFF2b5ZLAXYmKFaE5AJWeEUuGAmcBec0
         ZH3az1rkvvF5lZ0CRbjXrWd5nccipRxXwJ8ee32Z52iOHaSHFkZM7GDL9LfxiM0JogoG
         OYXjAHAeeXP/f0fLdNZbIPAJOAlYk8sSo0Da9GWtJsU5D3agX9FHLASbwHcgG7s37Ri+
         /wcP8vBj+t1zqA1YqEftM8kzHs/DNna0yNe6x12AGxZf+WdOsDAbzH5vmWYVaYxfyQ2l
         trmVfEIicB1GGygBuH+l++84GZf1svgZsrBQDsqLeu2ZnlW1uiYiugGyAM3TCRvaGcGa
         XKLg==
X-Forwarded-Encrypted: i=1; AKwUvBxtDAxAn1LITi3Uzul0Q/Tlri5h64P+Zl3Orrm/Va3rzVhhlp5y+YiqtJKfJ2wQgC/vExTgBaZMwo6asA==@vger.kernel.org
X-Gm-Message-State: AFuF++k4ugAP9UociWju0qyn/dNbSGwWhb05SIhs/uhwpYtYeJb0kcBC
	iORVkgmqLJta6iljZgLip5HAPGQEdGf/m+fmKP4u4xKQS2pKaxfIFV8hSOfwH8nW
X-Gm-Gg: AYBFou3wLwGVwCXu3nOFRPoRVDamxTqXXoKZY8X7HVxMM/Uc+dTG9G/ixGifD6CodLX
	zygZiO5Q/kSVO3Yb/LVDfqb1JhiZSHZMQxYvvW4Q8vgGcYPLYrp2hRh5m2WGzgzjO40aPc9DrBr
	wUcWSlyqSFbMGVLCYxh8NqAjBZy2oy8mjj/UpVkXJhum3skqNn7Zb4fk2MyM4Mvgs0VF0YktZHU
	338OMxYKLkrSgzweeEPqGbectsI3EbxnjiFcbhPUz80v6InGyixwK2T/7XMeuE16Z3hpTGck6Hk
	opuu64HknXBby9BHaYfyVA/OzaNmGjRWsqNxyt/NNNoGDtn3TwJmsh4xeG0K5DqVnJl/MeujV2Q
	8ZpFjTl/t++hy1RQBpQblDbcUIHHI/qWrBuRcdJiq/sqnOg34YWKzGZZRrhpsaG975edqX77mk9
	CP8NS5Mwmo/N+SESpQdSCWx3CFOIZdVfgkI6gb+n4dJcICyDG/zjG8HIY=
X-Received: by 2002:a05:6a20:7f8a:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3dd52823778mr469275637.15.1789461887506;
        Tue, 15 Sep 2026 01:44:47 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6528fb9sm6186338a12.10.2026.09.15.01.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:45 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: ov13b10: fix power cleanup on remove
Date: Tue, 15 Sep 2026 16:44:36 +0800
Message-ID: <20260915084436.2329278-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov13b10_remove() disables runtime PM and marks the device suspended, but
does not power off the sensor if it is still runtime active.

pm_runtime_disable() prevents further runtime PM callbacks, but does not
force the runtime suspend callback to run. If the sensor is active when
the driver is removed, pm_runtime_set_suspended() only updates the
runtime PM state while the imaging clock and regulators can remain
enabled and the reset line can remain deasserted.

After disabling runtime PM, check whether the device is already
suspended and call ov13b10_power_off() if it is still active. Avoid
calling the power-off helper for an already suspended device to prevent
unbalanced clock and regulator disable operations.

This issue was found by manual code inspection.

Fixes: 6e28afd152280 ("media: ov13b10: add PM control support based on power resources")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/ov13b10.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index b0d34141a13a..6d57da39c371 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1688,6 +1688,8 @@ static void ov13b10_remove(struct i2c_client *client)
 	ov13b10_free_controls(ov13b);
 
 	pm_runtime_disable(ov13b->dev);
+	if (!pm_runtime_status_suspended(ov13b->dev))
+		ov13b10_power_off(ov13b->dev);
 	pm_runtime_set_suspended(ov13b->dev);
 }
 
-- 
2.43.0

