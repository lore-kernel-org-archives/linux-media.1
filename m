Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267740;
	b=vePTOFqHblQ2YRN9cmYRLjt+MHqAC1Dn12e3lmY7Z6DvqEsbuun94LxZOgdnFlNdkucs
	 ECgyhvIDuhkN9h+G78q2eHt/8XUpdmALsNaJpkcNiVXpwAOhpfpwIYjMCtb6l7fFHfvzP
	 OkX4NX++MNHA+nlVhK+ilgwifJv6Uw2k4ArfXN6OuKen1zy9WmepiQywXvzgFPFZkWiT2
	 tWfXn6TixQok5NGV5+YaTDELOd0Go6Rp5sMtBiZYJLGrHWxl4jb9BJHUQ5rpJtkJ1LiDz
	 bZ10EOhbShKEnNKQQ/suxfZF1whd8DokIeo+g07IaHzs7r16djbM9a1jCy2XlEc4YdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QsPZ8M0r6NfeAXBkC/hz5orq1rIe4mViDl25/r3ahXk=;
	b=ymQr8WNx9bCm+AouMsrUzYeuaZaEOvMpjwk/90mEg4OnSIkf/WuoH6zVrbVW2mjoJ2Nm
	 FFtLLTW5ubwM3sFkeWgwZKeaAXpN6bpRhgwpfb9w033V6tdy1r6Hl6LB7Rvjb6kIE/15y
	 mRNkgr8TjVim509eBRPRTATvJlJ+C9Rb2enE6flWAIFWmtyzBey+dIARQHdaWZ2j7MH1H
	 toVSsqWfw7HBg+j2cd6Kt+BiHvLOxsz4d8S/D3KdwqA+X7VMgyfzacbh8fJIn5iwMUy90
	 bZYcOQRrt5E64f2TLcUkvc8pFsCY018mvmxuppEshy6xnbIIJ0smpR/zD9UcGBtb4vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="JZ7EF0/a";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD9560A6F46
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD9560A6F46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JZ7EF0/a
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so22837245e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267738; x=1793872538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QsPZ8M0r6NfeAXBkC/hz5orq1rIe4mViDl25/r3ahXk=;
        b=JZ7EF0/aupHbQSIE430X9IygySRTKpUfxu5dSFJ2SZ1r3HDglDDyvEtmUlzpodOGRj
         OhrbFeh/mF1RsSdezwXnBtFSG+Zl1ye4UZ+XbvPiUV89TFe07ebOyibtl5LGItpsIZTm
         zVdqSf8SFm1R9rPRc5lU5GecuyTlOvskh7ZqzICun0uTGAECX8i/NLPNnVQAr9TxWkP8
         pPdBR97JREz57VBsgLIZyrAIG2MQlC2ImBSx7G7xvqE4hBHDL1WO9gQK4mAZBt/6pvte
         BbCmtuw5fkpv4eksAC7bg+7h9QDiJl92VYn7/QlpKESrZYQB5x9H/h2tNyDEODq51i6J
         sSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267738; x=1793872538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsPZ8M0r6NfeAXBkC/hz5orq1rIe4mViDl25/r3ahXk=;
        b=X19hZ/Yr35clTeZD4EAorCjq1ldnX60G4S9B3qDAMnSiVqNQrZswIQlPN3v73gfe/m
         Z9QgxRr+Yb8JVfEdC+t8tffqOeLpqVVwvmKSzYqzj26+fXl/Wb6RWjZzBNNFdfyw//im
         GpDiZnGqCnoOarcop1VohRwFT8pdWYWscb9mCTME9bSUnhjdAOxSLDBIsY0zwYnPLgPT
         v120OHW7o3+6lsziIjTZHIX9iZSzvc6Jz6rOB6/WvdHoUx1KO3Lb/80GGJ+iNgBAFnOG
         k601vUGQiF91HQYDqZe+XFClBPjt7XrdhnCHJav1dgbAzdiScA2s6WxvpH4u7SY9Slz+
         Tv+A==
X-Gm-Message-State: AFq9FYJSmLu71AMvhxDf0SG7Ihp+eF91uaPvUB86+mPhyH+loTiPQ+KT
	9lozHZPN47ipZZD9bk8vtTlRZu+px2uLTEr0TgBPCLRS3nvPNNfQNTsg64tiFA9UK9U=
X-Gm-Gg: AYBFou1Q0fXFpHiEPlHNh9Kex6B/IA79GvFu/IIJZsahqIkl9aTQH3cVUZ7gFU5MZ+z
	aB3TqElPfNXN/KGH+lNZdmKJicCy6iCiT6isOGNMg15tAD/FS4PNLpz7W/pWeVCts1WrfqxxnsG
	nwjMPK1G7SJZYZvDAHcHJW9Bwjq7qtVeuBGETEr0s1lcXW5gFsT17bDmuD/dy7LKCjLvZopud/w
	P+rloBvNwmCd0r0yTaDIb4JQFkTlY2Blp9fXixGD24lqvCyTJQ/AsPAXnory8NoGuSPVjXS4Q/N
	gILLWxTDKpEvEwvB/j5759UbZL4PYUrhgNb4/pvQBe/Jg/hyyc5A/KSGROFa4KySe32aPx5b4GG
	lFUHt7bW2cNsfc0C2NSclmkC+OKTPa3BgiU6U8CpolPndkojtfdVElosijj3PGC0vAI29EczISZ
	NxV89VN6wgDZaTiYyVEXNL2knk7gzj2CwlZ1KI7mLJbXzUyCl9UQm6dy3zPWTayTqtP6qiiQz47
	MZWWCCIs0lsECBpalWmUyB/VN50LAjn8eMqCkWfXNQMHBEOvFHpKekGt6aVX73ZA9VU3scnQyUr
	qo28dKuwkM3PO9Tz0wxEyy2Pz11bgatgjghkmG/n
X-Received: by 2002:a05:600c:4454:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4a96720213bmr112641605e9.28.1793267738005;
        Thu, 29 Oct 2026 02:55:38 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:37 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:20 +0000
Subject: [PATCH 11/14] media: qcom: camss: Switch on frame_sync_en logic
 for sm8650
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-v4l2-frame-sync-v1-11-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018; i=bod@kernel.org;
 h=from:subject:message-id; bh=mTvCg0B/NWs/IAZBEB5VKXi7uclQSPEKpzKeZaiX4S8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgN6GBAhE4W0DNKgVsXU9Bv6hV/nfttNNlOE
 UzIQ7zJJ3+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDQAKCRAicTuzoY3I
 OkhmD/9blNR/awZP4NPqP8ueMOMyekFHGCAVRwWmBpgYoLsfuXcEbFSuPcayTsUQWRXCBGn+OBI
 mW3s2vWCkzL3LBK+PfPfgNBH+ihiJx5JCHvfPBAxdyLMfLGNk3BiinDq3lcUhsHgvDx6hmikAay
 pjpAvT4qPWU9K2lJWwF2MF9RgbeYc4j8iorP6PdJDCfVpJalWTIjL5AKZd5U0bUzBo8Pkis4Tz2
 qB5V/RIVA5DZJVEbNMbpPAuwA+h1tZc9zmou1hO76KqrQQAdP2b7dyZAaxfqPKcjCJQD+iqt3jR
 JYkJUDY63mAiUQHZcSd591yg46ceWn8805TYbUYYSYMakndEFhk3BbPZqdz+/twuCGc9qzKzyC1
 2YsvdyydbTOWUdFLXm/8RHaanfFElSBVP65SHt303I814ev0eq+Qx7hzUEduq8bs/l/5+WtsGL0
 BtJVm6oPdPlurF9Vvr9ntzjf9U6ZNnGr8bsMmSSFazS1PxVwgKBbJpL+hMCf6iWCP2GfBXskrCP
 ZSfBmP2qU2YROLwN6PNpyc0hx8Y2o1ShmEIT7BZsTave7epiiawpq9duxtqb4Rf9PmaqihLtkvI
 GRxXcm6MMGim9f8a65mPklAQcj/96l8LU+Ba7VP6EW6+xriXxNT1/rPMCidaL9GGDR24OELqQ4D
 HeJs7MW1Iqs8f8Q==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8650-hdk
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06e1bf82f4836..cd5a297a26970 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3433,6 +3433,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3447,6 +3448,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3461,6 +3463,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3476,6 +3479,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3492,6 +3496,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,

-- 
2.56.0

