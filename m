Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792942864;
	b=MRkL6qrxhseYSTM/x0dUgnJR2XBTuXxUyVVDpidwH1jFKlpWaLeHw91Ou7Y/HhC1vJAf
	 uaIFAILNlgWqv7BcwMfuF3H3bAR+/2QC8SDEWv7pwAx52pt2QM0zWJHtjFk43hLdDfMrQ
	 YA45cW3uBya2NGVISNxqhGDkxJ3JwMMADsFRm4Lject5TMIChS1WNYa1UJ/pazJP4SNvJ
	 LOlgBBSVcTX9bKIoA/W3pHPbow1a076Fwl9dwohq5D6l5uJOOBLR/mvglJGcKtlipBIKs
	 LaKcfXevfiQSgSFJV88HGyfco0ROqobr0TPBf/TOjfa7qVcJedfqXi+Ei3rJ12IfdqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792942864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2P9JdGvVOuabXAYBNZP9kGprHfBEphnCnz0cLxFDPGU=;
	b=ZkTD96oJJcCWiWPBVc/sutKZvV258onT1elaOA/aTziLlfO8S2IKhe3QR705kM3UmcV2
	 CcKAuoIEiMjT0+NncS8wsVQBuZcZKs2le4mjlz0YU2MXJPRBySY1HEwyVENOuzdfmysKA
	 JLkGkwwHG9t5dMp3bJhv5R7an7FQ98W/1rsL84EFvb2K0vKOMEcS0lxTOK4rNA4+UJLsf
	 DnBw38rAVNwAACIqZDVvjCcftNzl8Z+OFu3K1untEqPuoWuj32GDblNV5snRz3mLfZnEW
	 XcXPZ3xxGY4DMgMyqHHq+LJpKWUYbyjhb41gvGIt94o/2xJ1Fmkg0Gg9dazRDnSic/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="p4r3B/ko";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A0606A329
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 15:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836A0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p4r3B/ko
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2330993f8f.3
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792942863; x=1793547663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2P9JdGvVOuabXAYBNZP9kGprHfBEphnCnz0cLxFDPGU=;
        b=p4r3B/koZ/QpksCxFTSuqqPDQloue2b2pNN7nAJ0snbFLNvTAMdupQ4ARCBrbz5peL
         cFzsIaLFcmkvl4M7ALRN4FUEDF/7dOHGihQWCLBkDrDw1PkKmUYJGrPFBzjGUB2Ip2eq
         TWtQPK79BFXHvOK9aoup13Ie+lako5uGw+rA4OxU68PypfS2eiFEPWmEW/deaoHCd4WU
         dY5DKtgyg2fM1OqDxLUszXqdm39Ubxegv1iLSzMho2DWnayHCs+HtBoFMq2QBV1Ik0JP
         vsYQEqL+gfU4BhqZda0n3JRjlHtRreK1bKnn9GYNm/pwBf6s4cLSUyoMUoVaMOJdAJ0P
         3SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792942863; x=1793547663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2P9JdGvVOuabXAYBNZP9kGprHfBEphnCnz0cLxFDPGU=;
        b=KXuQ9aFBE2kD2WbQChXIQDrRmKgaWm0LApkXEeHJvhtLaQP/2Ct9GqrlV1d8lcznGR
         fK9t3yWXGURAYgl7xfaYF6+UNUBn94ljzJ8r8TErFsH0NKKiwHYOcCIO3qdTAXlpKY2C
         hBbfuWn1z2pLjLzDfFO1JOV6tFPtRk4oNgxUxx12auZQgrnmQrMPhPmN8lqhNnUCHR7R
         i0j2WJfGsLVdj3D80JxMh1z1GIrwpQBV3dKW9k9XBcxyvS/9gAIb200qwKlwHTJxr506
         QDm2c47ktXR8PQGXoFgPaNnsRDep9zc9bwynmsaZ2eEBQTpWfTK5wwLpN7QCj32Jxgx8
         975A==
X-Forwarded-Encrypted: i=1; AKwUvBxiswnzQJ5RfzN/8s4Y8+C0d01UlnIbW0jF7TD8/AyET778xdGlG1PIM+nSuQ/zWkQhWJ5aMZ36NauoYQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIY9CHD/R/f16AQc4ORf7YA8JUELSCmSapUIjt0jvdIbFMA3/tX
	atnTvnbV28i8M22iw9GrUWMWILRUuQ1RGLdza8hryA6fFEvwO836BS4/
X-Gm-Gg: AYBFou2WxQIqBizwhJubyBVkXDQH36500UjASFWTeippPCTW91TTqry2Tcs2AdRs87I
	agbovRzbi4ly1ZeVraNlqZOwMXFmXyNeXhsXODTM4FDixeMRhQjCb2e3iwv6Mww7pSsiiUXExQ/
	W/XJfqGrtZm4yPQbGaWes2MsbGNgNOUrO8LuirmOi9/RmYFEZXogMmP1lBQcj8Fmm0YlACtdeDy
	Q18088dbc54TMo7tpBDU2RLZEwCghZQ3xXVacmRh85faB1bQiZqSwNIv2CFzorAkzdS3vM7P4LN
	U0JmW4Od5ZtrNiNloa7E8U/jt0QnzJQNcJJECtSMo1H7bp0Q2PVajfYyNdkyJ/4908UuPQS+ZV1
	ZJxSff8X3Jfq5lF2w3cfsLYe7O4liY+7Nh4OKTsnlN+pL993Tmhw8uvvXXu1F/eGDMM5eOFO0Io
	mkEkmrnPAYRNjTx49VHhYwZOieg8McZSmAyTDIQBuDR1B5B/9yNWS2hcowHwCAyPxzKNpyLCkxR
	XCO1xnqTjjZV12XJfR8oEzyeQAumbM8k4Cb0e//hLTI2sGiSkiAqZt79R/3j5Rs6Be7jUtejjFw
	AC83GLlhMznAgQ==
X-Received: by 2002:a05:6000:2404:b0:48e:314:f9f2 with SMTP id ffacd0b85a97d-48e3eb2bdcdmr7358163f8f.8.1792942862861;
        Sun, 25 Oct 2026 08:41:02 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm10487861f8f.16.2026.10.25.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:41:01 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: vd55g1: Mark the AE lock and bias controls inactive in manual mode
Date: Sun, 25 Oct 2026 15:40:25 +0000
Message-ID: <20261025154031.27083-2-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025154031.27083-1-fernandorimoli11@gmail.com>
References: <20261025154031.27083-1-fernandorimoli11@gmail.com>
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

In manual exposure mode the auto exposure lock and bias controls have
no effect, and the driver marks them grabbed. The grabbed flag means a
control is temporarily locked, for instance while streaming, so
v4l2-compliance fails on it while the sensor is idle:

  fail: v4l2-test-controls.cpp(134): GRABBED flag set
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
  test VIDIOC_QUERYCTRL: FAIL

A control that does not apply to the current configuration is what the
inactive flag is for. Use v4l2_ctrl_activate() instead.

Setting the controls in manual mode now stores the value rather than
returning -EBUSY. That has no effect on the sensor:
vd55g1_lock_exposure() writes only in auto mode, and the bias sets the
auto exposure target, which the sensor uses only once auto exposure
resumes.

Fixes: e56616d7b23c ("media: i2c: Add driver for ST VD55G1 camera sensor")
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index e3939bb..69ffb3a 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1503,8 +1503,8 @@ static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE_AUTO:
 		is_auto = (ctrl->val == V4L2_EXPOSURE_AUTO);
-		__v4l2_ctrl_grab(sensor->ae_lock_ctrl, !is_auto);
-		__v4l2_ctrl_grab(sensor->ae_bias_ctrl, !is_auto);
+		v4l2_ctrl_activate(sensor->ae_lock_ctrl, is_auto);
+		v4l2_ctrl_activate(sensor->ae_bias_ctrl, is_auto);
 		break;
 	case V4L2_CID_HDR_SENSOR_MODE:
 		/* Discriminate if the userspace changed the control value */
-- 
2.43.0

