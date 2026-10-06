Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30EF4F85AB
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 23:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328814; cv=none; b=Fd+00UHgTknU/wJpJfuMQtfA4qiMF1bvMBZYqJls8prA7mVLxx+jG7nON/bI2qNbJ/rF4rf8IDvqRnR7K7PvRDhZHy0VdS2zaanGVAkLFAjJrfpTV2wtCbQEowpt6Yp5BuUGxXmrd9KKZHoSGVeXoa7DuMwqJgt4n0f2Pofs7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328814; c=relaxed/simple;
	bh=+r6PH4HB+WQWJr62dZukEIypy3+RL/XccpRzbSn9Log=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwWtQOxJWlcGerh64OQngFyDMOron642dJ4dfznRFh0qex4MSpRobU1oGmwKNNxujq4D1jwP3uvzSbVKcTSLz8H9lD8ED/ACruk1BAeRbYhzm9AJrr1YMWLRYEJyswCSwpfHAQejsDIsH4bDFbXVFGNCYh/qLjgmOxtDywixkLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nU6vSTfz; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nU6vSTfz"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-31490970b97so2052286eec.0
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 16:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791328795; x=1791933595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAcYfvRf3dP6Vfas4zYsUbJKP9wdfOC0aJvUADv+txA=;
        b=nU6vSTfzUBeQmsLTx0KlZ/8QFQdCaRqwt2umTY6pj2MbAbpe+HKVV9ISz762r/Lnwn
         Ltq1ECfFyoB4wg7MAthtZ1x1rUxt8xRADnsQ6ZIwIj47RO3w5r3ykBLGRGxQgr2gzJIC
         HcNp410VUf0Itvsx88OuefYmqk6wliEWdWcU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791328795; x=1791933595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vAcYfvRf3dP6Vfas4zYsUbJKP9wdfOC0aJvUADv+txA=;
        b=noB5ed3RdoUxRCrYWjW/yB61+S8kJn5fsNPM+1UcNkriQze2+THHih76SgJATuNNjA
         xwd29QtD1Ms/gWbfyF6D0Tx0wxKpuTg0J2d0Bjm1LAHP3SmK85pazM3Z0/TaRkquMPm2
         2xNIX4NFjdBUyW6zX5Dhn4ZR12EuGsWMc5i1vm0/bsfITC3Vf35LU3SVubrJVszpnyy3
         7dUvXav8QX4nytL1lEkcDBwi7Ov7nUVj9NTWecRDQzAEauhvlkrCh7ILqyIAkq/WXiL0
         hD4u0eKCIHA4bfM1bgfTRviJy2OxI5dqYBywVu8JZWI9jxpWOloEtgXcS7J+3VOtwTe7
         YiqQ==
X-Forwarded-Encrypted: i=1; AKwUvByTX+TPMU0lS+FhNv4GMfi8pxQ6NJZCO9W1wH2QJZLNCfqf/OrkKjL/GFryjstgqT2t1aTvYjGI2eJVGw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIG4Jmq10fJHIx4K4xtuHpF+xiv+uRQzHHkzrDi5MKeggDKbsw2
	zqcLLRGtuhrnifRwvnMdUmk+wkRJhj7tkn23kRBqRRmVToLQjyyCe0lHMQda1xawJA==
X-Gm-Gg: AYBFou3cq51j7lrFOzUtSGOYXpTwqU9yT2pj2UwBH028fv86sWmxikZ3AczE35SB1eS
	69HsnZUaEcl2c3CMxhf11nhljZa66O2mLglB2bfphK1OvGohJMRP51Ryi2NocyLn2MzG30aqrHq
	2AXk16SbXgVnaitZqpH9Z6NSZeIIywgFm8avRwm6XfX+wLY4+NhpTw0Zv1tc2fI6wTPO9ygNWF5
	DBbv2/GcTPlotDC83onkoqaFGTSztwdWb6Tco2pzeR1e44qVHr6nSKCDjZbIhTrw/3USwCvRk5M
	alKzYAZsz216iJ3aC2XwhoChKTeBdf5k9S+yxfNdWUwu2OQNXmtkWYSJnD0mbWK6nh1tifS7+yx
	m06RGVJnH8OuC17wRVR4FoNmz9Zs3qeTmvwsbhAYMG9APwjYl/bB3Fq0P5f8y5c1b3qW12rzAFr
	XtFYPW+WSTxftWDHnbk/TimqhbuOLYT4FMCUqJevNEps8r0ATt6mrqsWUx9yaSmq48dXBM8SbdZ
	VJoJKOzq+AXuKEYNIW4JChxSGRNHnSEtaBzjm0=
X-Received: by 2002:a05:693c:65d7:b0:351:202c:c7a5 with SMTP id 5a478bee46e88-3515d7183femr385288eec.0.1791328794653;
        Tue, 06 Oct 2026 16:19:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:63eb:e7f9:1d47:7d47])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3515a8b7c5dsm1985276eec.0.2026.10.06.16.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:19:54 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 04/13] media: venus: Discard pm_runtime_put_autosuspend() return values
Date: Tue,  6 Oct 2026 16:13:32 -0700
Message-ID: <20261006161337.4.I574fc3def9965f603755a968ae88309aafdfa285@changeid>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261006231900.3230373-1-briannorris@chromium.org>
References: <20261006231900.3230373-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
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
This patch is independent of the rest of the series, except for the end
(changing the return type). I expect it can be applied by individual
maintainers, and we pick up the end once the dust is settled.

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
2.56.0.360.g66cac248cb-goog

