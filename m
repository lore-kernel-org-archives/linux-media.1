Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A213C3FE36A
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732656; cv=none; b=MB/Tvwr2yCbGYcawDEwxjbWFeLAfJdAQ6/t86hGp8AVmI9FgwVLnFTN6VWnKf7gNVZQaWE35iM4rx23lcAN9kbA+DV+qlqC6aVkMxy2AvFwVKFr/zEQC1zsnPB/n6WRgL36sybKcjTwPnSj278Xvv+AjDT2mocS/Nc+32zsZ/I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732656; c=relaxed/simple;
	bh=MA9wyNKAIFSI8cZ6RwlfxRs7RNyreh11fwj2AUJTswg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cbu52E6G3LWnui9VqpeWbnIpR8oYc5obGXTJZBHR1YMG5z82Jis5F/MHEESPZm9VwgleFZpSttdj2N9BBowryDqrPAtwrBW3ujS1mhdcnnA16FRm35/0It240Qq06+wN1I3ob+bJwNnszW+ikE853z/F3XH0UczudABGlP7OhTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CnWmCATg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CnWmCATg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb91c003eso802215e87.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732653; x=1783337453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bl6/Bp62Zltv0A1R5yKMqM8tfS2a1IrH1+EEEyO9+LU=;
        b=CnWmCATgLDBLZReaV3eW1UOak50cQyFow2a5wQn/4ZulGR05f1Di3xd9MPeYXzSV/A
         HqzmFpNgFjgiHeyFw8dvka/HoMlIQoGoqSfBBVy63dl9/0mqt/DzW7nkbp86MgXJ2zsL
         EsXlDX7szYmeWJ9qXP/9UT5j3qYJZpGeHI/TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732653; x=1783337453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bl6/Bp62Zltv0A1R5yKMqM8tfS2a1IrH1+EEEyO9+LU=;
        b=hr9K7202jtqbcPJ+K1CmoZ6l3t9/5FtOYTgwfl2mjD2w2Qkjv9r3Qdr7lsDYvL2XFQ
         xmsMaXiD1Tuaf1HoR76UwMn9lVBS4b/TyvGu7RCoQdHK4jvDF9bE1nxX+R1T1EF+0yt8
         3l48WRFOdL1MCWGEKW7uXKBn9bsHEVbeNomIuxPWwgwv354e8M7yAlXMzzQYhZqut8yV
         Rgti6N06AE2Yt4DSZPO4yQ0CbtYNe/AgH+5uc1PlZNpYCpDclglS/dpBY6HzhxS2Th4v
         GHo/kK6KvrDqZyvr+a1Wmpl88o2dr+usKoi1oTgUy/ElekLJfdO02aGHdbSV1JnsmmOp
         a07A==
X-Gm-Message-State: AOJu0YxGsOBN70Ct4gR40BMjEg9rqIgy5oN/7ruFcsbMnv1iMR4siOTO
	+aLq/p9XXI9foLijmthUJ2tKNwRGmCSTXiwfy9dZ6To/kp93Q0GJ+mfybvmRilHfog==
X-Gm-Gg: AfdE7cnCzsymlryZEvgS4xydf9s2keCLTvooJcNgTcL6jq2kcq/a3qOU9hJHgkeOHJK
	uRF0wbKYmf3cWUPZ4R9Fbm7cTEYZO1DxN1xNCHVwpMiHKycM34Ut71wb/ZMfVEpxGH2k3CfWQZD
	ijtB/Gjxfe/2eN1Q0jVPm3ZSd1+v4Wc9mzjtgbzihYn31wI7F9e8s3a6Uq+1m1o8+/dLHXdF01z
	pqxEwh5ZtmAPHAzlek0DGwIzH38sY1L8JN98hFItVgfdh8QvBa8EKoFUrkQdXBiBxQQ3prEcvDC
	EsFvIrNSWGoVWs6xlc3vMqQUxm9eZHlDV7dMy/y5wam2FMv9Pa3fElBXPsLU6d72hpQXRtqyfO3
	UebnvjXRqmyKicGcWzigOQPIJw62Pzf+LlM6Myp29UGJ1X3YReUOAO8xSuUdfSysYadDf+s+VDZ
	Z2NIfk8XhkMXNOGxJj2caLUyDT/HT5L4v8+4tFqhbKXrWgSs9ZFKwramfMDd+ZjN6z5PuK
X-Received: by 2002:a05:6512:6188:b0:5ae:a9eb:eff4 with SMTP id 2adb3069b0e04-5aea9ebf0c9mr2134236e87.61.1782732653051;
        Mon, 29 Jun 2026 04:30:53 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:44 +0000
Subject: [PATCH 3/9] media: vimc: Fix prototype of
 vimc_sensor_update_frame_timing
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-3-5884c80ee3b6@chromium.org>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
In-Reply-To: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
 Nirujogi Pratap <pratap.nirujogi@amd.com>, 
 Sultan Alsawaf <sultan@kerneltoast.com>, 
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bin Du <Bin.Du@amd.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

The function does not return any value, make it into a void function.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vimc/vimc-sensor.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 5deebcc78a33..d125a79fec8c 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -92,8 +92,8 @@ static void vimc_sensor_tpg_s_format(struct vimc_sensor_device *vsensor,
 	tpg_s_xfer_func(&vsensor->tpg, format->xfer_func);
 }
 
-static int vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
-					   u32 width, u32 height)
+static void vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
+					    u32 width, u32 height)
 {
 	struct vimc_sensor_device *vsensor =
 		container_of(sd, struct vimc_sensor_device, sd);
@@ -108,8 +108,6 @@ static int vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
 	vsensor->hw.fps_jiffies = nsecs_to_jiffies(frame_interval_ns);
 	if (vsensor->hw.fps_jiffies == 0)
 		vsensor->hw.fps_jiffies = 1;
-
-	return 0;
 }
 
 static void vimc_sensor_adjust_fmt(struct v4l2_mbus_framefmt *fmt)

-- 
2.55.0.rc0.799.gd6f94ed593-goog

