Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511649;
	b=zsnDQmMPJx0A3dLdAVNzVG6zMsyNBWcQPJYKoRQ9b/liJY6VM9+neV0By8hxogASkNm4
	 uS0O8i80gVjMbgYOp/MC15vBDLR7gIbHxMOoZb5+Th4V9WKAeWo+wcR6GrDzJ/2mSgIkT
	 9mMLfd67ABo1bYn8Ulx5OUf7pialAUsFl1GKtiAY5A81ud/V9uPnfgwdKjQ/+P3ap+mzm
	 3n5DMRR8ofSLwIxQ7CD5c2jLD4AXZ+sVGjzCy7oaleCcqXj6g6n73SxAEeHuCJBXmTmeg
	 2KWX3PXXsoSnZqdd5oyOiqhU7ozLRlxm5gMk8TqIn8rdE7ptK6rt0qFVBWZ0DEban4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WK76SX0nrcCBNXP9LIGbyNxGyxl1rLl1GLyCozITqPY=;
	b=E+AEAvnlNBfa6VhSglmoR9d/sfsiNful4v+F7YlAeJcx1/Akzk4Zedrd/mbU+gVqDUOp
	 z4Pxejbb96UbUkOw912HsX73g9fqUiO3j1nnQ5XJ1ipGgTifWtarsFbOjPsTRHx85dgDm
	 mn/9mmmlHyatvqA6QBm8x/mpCc5vkaxxzwtOuYmlcqzdh90rtCfv//uRbDCZJH75nDDIJ
	 w76l8L3gn4I9HskfntpsVTQyfl9W5udVNmutSlRXQAgW+yUOyfarut4tdzxCoS9tNYnjJ
	 ukqZU9I+LJuGhj4PJ9iTo6nB0lBb8J4GlMT9C6TjBsepnX149dYYQhXHhyNscsMlRUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WG5ACeJA;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F23606A31C
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 19:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F23606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WG5ACeJA
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so99986c88.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 11:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794511648; x=1795116448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WK76SX0nrcCBNXP9LIGbyNxGyxl1rLl1GLyCozITqPY=;
        b=WG5ACeJAfsAqI/SNo4EQzMNroNtqgr9YtZsBgMQPriWcH3f0MVw5r34UoB/ls3CUCi
         0AINdQ6584CpYLZwc6rxWtc2SykkFLUSRQ8b19368uBwvvXS3rvFLB6wIQXXm0MOuc75
         RyXvi3kaJ2XdVHBEH3p8FNm6KFDkv60AA6ftw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511648; x=1795116448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WK76SX0nrcCBNXP9LIGbyNxGyxl1rLl1GLyCozITqPY=;
        b=e4csPJTHbIvcBVQSVCiUwTSYcPLzNuQIVdHFhayNfK0NFMrSOLBfCAk/5G8gphnjC6
         LXWTdJgLniPLosnPWQiSXwG1F/ri871A0z3aehX4fu3WFqRLzTVoS8ezs58hxIe3pRvd
         CR28J8v3LeTi4z+TLeXwukXV7Wf2mENJwl0r4Ax8RDW638QFJ9rvxYsGwc8L6Ldx2q2b
         TSLszcqiCNa/6EU678OKY8Rqvhhf82LGvK8/HSSq5EM4pvxiKKZgTjgYZb9BFjGMMyXl
         E3JBX3mbolziYceokpWfuDPwhTPnen80SQnVzd4fq0w/WvdVBUzFrgQ5JiRr5qtvwas4
         bZMw==
X-Gm-Message-State: APuU4Z/ZoTkQeA7U9Z/O77grk1r+up2Lnlzj3MUbSS3cEh3Bm0+bBTLB
	DX2hn93ksEgImSsfR3EJakUchxVfhGBKMZfourONVPIu805ZXnpzLoHgqf9s2qFfCA==
X-Gm-Gg: AYBFou1DYUILr+vtOnJskMWxgMH0pWzAu+y/tS1TjjX43JfBtVL2WSSBTps9gi36t4+
	OtRy7EyTzrQPJzunzDEmXAcMR5BOcguxVUTRRTobMlfE/i9rgHNBnTa3VI2CWnFNyOI2q0UxtCC
	iTvMx1lxg0dpZLlWL7daYwITf9cNun+Kzab7wzYgb8GFfjZEo6dwzLvjcgEQyC94ml5HUlFRrmL
	IA2OGO8DA1BOhzxhb2qz3bikTRtLeFY/xm9dy/fu/jQVxoNnRf7uZU4vVDGU9AeU6lRu0DHXSJU
	xrW3wDaI1rOg7/KTBmtwKIBrUAoT9t5/QLa7VwJWN1EOpZzeS2sDjTLbPXNBkAhSWpaQF0Ur2kX
	UNrrPMmbOsGctBlwaGZuXLmvMxCjbKN7pzXKPd7OKH5zPlapL9yeX5CDKG4W+00hxOxh4zIzkUI
	XXTADhMIwQmK5/zT3Z/xU4ShkNwJIHP1d7tR6kYRn1tvpAm5Uh7bKqNcXRemrTlWjdR7k1/+mTC
	XfTI7AnZpFlrVedGJhomXCF59RfYYwmiWF/jHVHDxOn75zKDOrY9yhEQxYPfdmOZoyNqJH8su2+
	tHdaS5/vVMysEvJ3gpsvBLfpRTJeFp7P6yax4qFMntAiRKAXPcelAHvVZaC77xTAb+A5rUlCpbU
	Yz3Dv2jsxk337gWs=
X-Received: by 2002:a05:7022:3704:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1b5030d404cmr428948c88.16.1794511647718;
        Thu, 12 Nov 2026 11:27:27 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:5446:563c:ac92:43a8])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b5031bc518sm886774c88.15.2026.11.12.11.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:27:27 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH] media: venus: Discard pm_runtime_put_autosuspend() return values
Date: Thu, 12 Nov 2026 11:26:50 -0800
Message-ID: <20261112112650.1.I574fc3def9965f603755a968ae88309aafdfa285@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
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

Propagating the pm_runtime_put_autosuspend() return value to callers is
not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

Accordingly, update the Venus vdec and venc drivers to simply discard
the return value of pm_runtime_put_autosuspend().

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch was originally sent as part of a larger series here:
https://lore.kernel.org/all/20261006161337.4.I574fc3def9965f603755a968ae88309aafdfa285@changeid/

I expect it should be merged by subsystem maintainers, and we can make
the return type change later.

 drivers/media/platform/qcom/venus/vdec.c | 10 ++++------
 drivers/media/platform/qcom/venus/venc.c | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6a43ea191da1..35c1b6ec1f9f 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -644,12 +644,12 @@ static int vdec_pm_put(struct venus_inst *inst, bool autosuspend)
 {
 	struct venus_core *core = inst->core;
 	struct device *dev = core->dev_dec;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&core->pm_lock);
 
 	if (autosuspend)
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	else
 		ret = pm_runtime_put_sync(dev);
 
@@ -671,7 +671,7 @@ static int vdec_pm_get_put(struct venus_inst *inst)
 		if (ret < 0)
 			goto error;
 
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	}
 
 error:
@@ -1200,9 +1200,7 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		if (ret)
 			goto put_power;
 
-		ret = vdec_pm_put(inst, true);
-		if (ret)
-			goto error;
+		vdec_pm_put(inst, true);
 
 		ret = vdec_start_output(inst);
 	}
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 79acf7c1ec9a..3c7c24dd7159 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -617,12 +617,12 @@ static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
 {
 	struct venus_core *core = inst->core;
 	struct device *dev = core->dev_enc;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&core->pm_lock);
 
 	if (autosuspend)
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	else
 		ret = pm_runtime_put_sync(dev);
 
@@ -644,7 +644,7 @@ static int venc_pm_get_put(struct venus_inst *inst)
 		if (ret < 0)
 			goto error;
 
-		ret = pm_runtime_put_autosuspend(dev);
+		pm_runtime_put_autosuspend(dev);
 	}
 
 error:
@@ -1275,9 +1275,7 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto put_power;
 
-	ret = venc_pm_put(inst, true);
-	if (ret)
-		goto error;
+	venc_pm_put(inst, true);
 
 	ret = venc_set_properties(inst);
 	if (ret)
-- 
2.56.0.611.g1030f0b940-goog

