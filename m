Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448390;
	b=eRlhBa6DkBfj96h3WETc3SO0OkXqaXOeOtGHG2KGaARZYXWFGss3eYzwosXQahKHSBuE
	 W8aGRrCp5bQwvDUoMmfJlnGQGOfToaTj1IDBTbkMTjkEvNh29gQkox29eAYgp9RSMvXIk
	 IU/dvp+zdzZMgoZ2D12bxBCg7Fucb+Pf9M8zYSIsl0xDJYMjIUZz9WYFY0UpslMNU5O0g
	 vH56MbdglFr6JCRNprA9gY3AWmh83KEi2n8IDKg+MjeqmTufNVOgVaPKBA38V0aESq1sR
	 DsiGjGoI6Cmejh6VmcXTGC66YoR4DoZaqEq9I4BN2O13Fu2pa6BJZoiuiWaJUKakHvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4q37xjETul02efHg9agH08x5RvqSBItQGeKLb7Kc9eE=;
	b=gG2Zd3NYVjJIXQrFxz9vSO0Nk+r/enRN1ZaoxBaXNSQlC9eFEbaZEGcvzyueNlR2IBxb
	 2bxOckWMW4Op097EL97SvB7rDyWxqrAY6WjWkk0k3IeG79W9Pny1wbZ1NNAUbXI64Fcvv
	 ZSZfLV6klMFN6OhemGH7eeIlQ5+g7s2OFFQeuOJgQy/VbTVg3ruqkrozXJs8qkm0F/ADp
	 0XAYJR3VS4WcuIuMCHLOPcbFKR+khkRN35lZBSoHshAHdB5Ug0EOlzgRDVDOqMGCtJBst
	 1/RbYk9XKkSaWgjxDfOeFtM4FOgIKJEJPcaIx5+8Wo9IREbkzRMXPNGNazykw2GVXtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJ1oG13w;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1551F606A6A4
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1551F606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJ1oG13w
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b546061d58so7608015c88.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448389; x=1796053189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4q37xjETul02efHg9agH08x5RvqSBItQGeKLb7Kc9eE=;
        b=tJ1oG13wDf97si/lC54QovfpoYFyVvC4wRuI2/hakZDue577prlDbiYbJJBSjRmxlU
         WSn918t7xP4SqJYePG4QXp8Jgiv932lfpSHLhznAFdklUVcwW6ZkLCjdGrTlGFt+5zaq
         U+4brvT9EEvJAK+8NRPqKXciWxLS+7ZK5O3ApoYOXhmBaQML/tj+8I3I81oiXSYJuObw
         FH8Bl9gYzglO2T+6BVaWM8B9xupN7SnQHlLFnXVSHTHA09Tx6+TuniO1T4b04NvO39o8
         sUxJyeVVbyh65wKimwG9wrXm3VzmXo8M83qKGB4oO7VU5X0cRRhEfmjsm7/NC5aKyLou
         PwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448389; x=1796053189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4q37xjETul02efHg9agH08x5RvqSBItQGeKLb7Kc9eE=;
        b=KC4YMToIKW660PZKIkLwM81oaIKnxdVfEI25A+XT8DLQQJTWAgklEjuL2ADdWqu+SO
         0is+CNwIWbHjYf9QN/gyvYoFmLe/FxJoyv+6kl8BbwnOpFQZqokBqyZIyghh3rQjrvrx
         FMM62gu0nEYUaUAPKyvXkDdADBhtn3hXWpuXggfkgEYdVeLCpyvHJoSSAAnrS29QRqaq
         7OcOrDjBdcthFhyMLqBZH9ssxOn3rB65I76SJe19ikMZ/DtX1eEu/V2Vz2djd7/A5bEi
         jd5+ENzyzZW2DPgoli0T1IGmnqiOk4lAqijs9qM4eiQZ9hkJlIE8mfKc3i44k8ackCRP
         pN2g==
X-Gm-Message-State: APuU4Z/hn9TxHy7+zHiq8BZt+5mH5gmCHWhkYoi8JY2WjmtKodrp6ayH
	SzZfBrWKDW2vl/5upVFa2oIDjDU1eVdy23n3ldm7gd0O7/Y2Uu55I7Xa
X-Gm-Gg: AZFdTZdYdGZaZ69X/z07c1FAg/mIlyqnktd/PhrbJjBEebPOy20R3ODZonWjRHAaeA4
	LQVl81hunYrUAJHo6HvQgQxYaq8s9l6UvyKB1Mo7b5smPPTTxeb9JgHH0cKmSI7aiZCR1B18pcY
	nIkVLi2Y7apZQItAbqU5JEGlY0xkrs1MLArqEdPM0i3obgStb9ElZGv9NphxxHu9kVXFd3lAQ36
	cZ2t5eFmWvUoEtinvQDdK0aSMWhamX0vbLkLWAfB9A9eOXzzYYAvjvv0Fq4bTd4TjyXf4/cHlCT
	Jb6PBw/+7u0BNuCf9RGzK+2sVpcHRHFjX/63fkcstMEOJwLhVmCCVsZJjfLEjx/e2NDH3PgZXf4
	QX0xa+C1NWDXO2m635cq5l1M3/1HQehtBLn0z9L5BI2jqV9C5kuI8X7xSmawm8NCLoNEEchbYtR
	1Lzcp7AX/qU/Vn5JIFnDAsZ3aZXqKz5/tlrOzI7Ippfk4r48Rk4W6y49YH4+Q5w83dklXYdAM2t
	804oHPsHZskH8VLllvWa4pexBpbhP+ewt4KLOSQo3WaAPcSP2/HcFH8Mpvi+Bvk+nii6xkMhwAC
	6n7IEU4aLRhQIc6VFKl5hMJx260zzfc3Kd8HFb/MCV6TEiIrPYLslN5FebVtL8dHMsK0
X-Received: by 2002:a05:7022:7f12:b0:1b5:4dff:8b67 with SMTP id a92af1059eb24-1b5568eeba1mr12061043c88.29.1795448389170;
        Mon, 23 Nov 2026 07:39:49 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:48 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/16] media: i2c: ak7375: power off the lens driver on remove
Date: Mon, 23 Nov 2026 22:39:17 +0700
Message-Id: <20261123153927.2547169-7-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ak7375_open() takes a runtime PM reference with
pm_runtime_resume_and_get() and ak7375_close() drops it. ak7375_remove()
only calls pm_runtime_disable() and pm_runtime_set_suspended(), which
neither run the runtime suspend callback nor release the supplies, so a
device that is still runtime active when the driver is unbound, for
example because the subdev node is still open, can keep its regulators
enabled.

After disabling runtime PM, call ak7375_vcm_suspend() if the device is
not already runtime suspended. Do this before ak7375_subdev_cleanup(),
because the suspend callback reads the focus control that the cleanup
frees.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 90ee26fb2f50 ("media: ak7375: Add ak7375 lens voice coil driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ak7375.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
index 2827fdb29298..a81cc1df81e7 100644
--- a/drivers/media/i2c/ak7375.c
+++ b/drivers/media/i2c/ak7375.c
@@ -329,9 +329,11 @@ static void ak7375_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ak7375_device *ak7375_dev = sd_to_ak7375_vcm(sd);
 
-	ak7375_subdev_cleanup(ak7375_dev);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ak7375_vcm_suspend(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	ak7375_subdev_cleanup(ak7375_dev);
 }
 
 static const struct dev_pm_ops ak7375_pm_ops = {
-- 
2.25.1

