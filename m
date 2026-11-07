Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013325;
	b=sAG12oqwap694YZ79JzPNlgReckHiuBFMQ/7QP5PtJlnYL0E78gCrIc3bP3W5DdvQk/B
	 DmHdQDS59dHmAI5RdtdVPOn9jvfoTUsKvbV3eslth69hs1EgOzJgTbBOSVzmbyhd24Uds
	 6372Pqa8v8X3OkyQwLDdISaKPyWaP0l3JiLhWs5OmLKQEdu64Q3PpDMFyDueUfkaWSJbU
	 ExUW7MD4cj+FWzKZjeF7sCq12M/SnZJLJN+HPGiCJMrA67SvOjqMwH4wn8NkrQJW2phby
	 ltBh1Mc9M/IzDrcbUwWL7yl7aKXEc3I3sFET5dC1O+WGGf5jALGfjSu78vG2NT05eYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qaVq3quFN+pTsPAYT9jyCzQNPKZCWGy3YSWvEEALJNM=;
	b=CrAgPncGhHo7OulShUNi7d1+0LvKxrGuScHU+9TzXQhsJenUBX41M02nzdq3QU2mobBo
	 vIYnCyIdOjtzZtP+bFdSPyOgFmPAMMZYuTTwdagH1ivBkIiwbS/FpDKehabzTS9aIiiSp
	 wXRcYanvn3vxIklHKug6Vt1Bj5FQMGxWRNnbxZrNMnBBUdGNo9i9OiaSOAJpW/Ev2pC4V
	 0Er+I2PTqfiuT1YEthd2X8vxRnuUu3lFaLUjgPXA/T4YJKRgHOqM7TrhnU0ugsQeROUqa
	 XzU2lb/kMGgq2QOkqAL5xSC/RbP50aTrOu3NrC6ileSgRdEj1iRieZUqrbsp5zOzngw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="bWr5L/+Y";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D32606D81F
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 01:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D32606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bWr5L/+Y
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so10990135e9.2
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 17:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013324; x=1794618124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaVq3quFN+pTsPAYT9jyCzQNPKZCWGy3YSWvEEALJNM=;
        b=bWr5L/+Ypq60sTA8tgrRbxghAa8AL1pLbfZGBUU933a5lttjxGx7N+5is8mCArj6xU
         DaO7p4I2n5IwIpAHqo3rZm668UeiqCjrt9aHFLfNCSGdg0Nw8lc/Tz+BLX9L0TmmXaMM
         sDHl7cJYaYh2QzXYno3C4edEMOf7hTviUDb2KjIezTbg5jXtbvArtUPm20wzi+OX8c75
         6ID4IWkJYg9N4l4T+skRosrM42wbLrODN/CRvSCIBWBGtOPdiRoIz0iB0mgxEOo1udcw
         82XQ/X5czwFosKPC3L9+1ol48arcOWIHtNfWnI1fTHHAz4IjR7ky642IOhYeaSd4wcg6
         7dVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013324; x=1794618124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qaVq3quFN+pTsPAYT9jyCzQNPKZCWGy3YSWvEEALJNM=;
        b=UQVAjBtjUyShwD6X+no2Zma58BLV/toeo+VbdBfVHIaMcT31X995v8kQEwvBwO7xgS
         /57M51KNhX7Qf7I21qFcQxl6PdGu0Nezn2cTwNKsYwdbeY7EksbJfxtrSADyMvlZXxx6
         cKBEmbygys2/xUpjlCnb2DaCjMgk8AYAUoOZz5/sobpM8SF2xo6uidrFFwXPloxiH/YD
         zw3RRmWdvW4a67ACvdKJLoI5AlDZJEQa5EDUeUr+KhZxF3Lw9T0iLgS0jghfYIVkBLcB
         pudlpmW5vdKzL5+QEbm5o4efsEyWAsvP68msaAi4u/zQPyHz0SYUz3nfVvE77h1t4LCU
         UhNA==
X-Gm-Message-State: APuU4Z9WfpI5Cwg+/+YblJuW8vQEzUcPb2ERW+cqRQ+KdIpsBeBDtZCr
	9rXXGDu2OsW6tCylEGZpiGWBrbedHDX21gx13kfpBQRLDMrftt9muSbf9e8mBKXIzBw8ktkXM6e
	nqx7f
X-Gm-Gg: AYBFou2ubBLnYi9QRXXpCb69BUh89fI8Xjf25Wl4IiMqchfDyR6TmO+IAQrw5CoyqbG
	FS0URSR1ygkc6r01LrO1MfLFeleMEGPBR7qbC7a39USZ3F60r4a+fi/w6HqBhBD1NxEe9vR7WoE
	37Z7+sfA5G3iXWruXaL9iEKshXscYMrz/pi0Ga46+g/KKIe0Q+9B/agKL/RLONghyewEIOl1LiV
	x9BRwjaDrcPtANDa1FFX0Z3awZaE5EEeBvNV5UbpOzcKvORIWeFtYv/+Ee/+baHsTrVmPdUuaSq
	gT83hHZ4kSNWAy/BzhFXPC1oquINKwEtRrO3bMqhglYrOtUpVYCrkeD9vSTL8qO6IDT7Nkrz0Su
	yrFR4RyRh499Md7dq1vetV35IQAwCG4nxRBCm7JCbVYwZf23IkBt8KLxrgFW0e6dwSAtZajdvls
	WuLs2H9sdWHlLxJKqQ2/FKpY2MHk148RlPiJOGma3r97uqNTDz+T/kCd3TtyoWCLIYbejDZqAlI
	UuzEhQBqUuZtayUodZTIf2o906jnMxvKbSdnUI53HSCjeCak0eI+sea8V1pwEg6nZzEOL4mJO7+
	11iDiQQX79s99+jJh0/ovA==
X-Received: by 2002:a05:600c:c172:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4b6de0ce784mr75713875e9.17.1794013323786;
        Fri, 06 Nov 2026 17:02:03 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:03 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:51 +0000
Subject: [PATCH v3 08/11] media: qcom: camss: Switch on frame_sync_en logic
 for csid-gen3.
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
Message-Id: <20261107-v4l2-frame-sync-v3-8-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5512; i=bod@kernel.org;
 h=from:subject:message-id; bh=nnIVbItJxuQZ0Qr5moeZMp2czLIaOCrSffwrHAO9/Ds=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh/UhDLGaiSfcNaMWhUm5QNiXuNVARgwu06S
 wCqzNyRAWaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fwAKCRAicTuzoY3I
 OrsYEACYj4djjxQxBYoKfNdgyGCIjmqob0IP4oHzTzi8oKtDO2h+l1SEDVUoAA3WFWu4yLuV+cn
 76Yn2xEjRa6J/gZpB3DSsDUbw6pzdiHFv2pTiZiJ0sOX33QziLjKuTEq24wl2Jz0CFIN222iATf
 8QT1W8ygouJbHGszU4XiWHzhVpPZLBbGiF4W248bzegoWi3UOCQT7yY+vEnBVE3p6UDzlYe/M0a
 XNk0Lzk6QfGkk5/pkZNq6y3OzpBtcKzNK24ecXXFfoUudw75+h0S7Z49mbEudZ9Nouapt9+Oni/
 oHNide0UDrpa04AKKUse42myqWTNnsqEXz7MHDM18T4HVH0YufqPMLSXm3urSWb5b5s8VlovzmZ
 VLQ7rHYvXiIlpeZcFrLmATSBfTHvkMd8I9QOHieFZR2ox19ux0cXk1v6cKwMWMbJ4xURLy2GeIM
 B72UQCDb6I8qXpwZJ924WeBh1XBurPGu0HWvQuYr2mBC5tHJuUGsZHFPud3Z0Wn1qXHsXHcbHl9
 aAZ8oDk7chqqHG2r8Fr8ywQKyDG9NGHxnBz7l7b8sbdTH7FFnrj0C6ykLGVlyLDd3Uyy7bkeL+q
 CD5bxpYnl+3JqrXFP/62LnQUAQrUHAsIe7GYc0XVrMyXMl7BG+rkYLrNSPz7nZTdXqPFLM13sCt
 1DqbLnPy7HM6c6w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8650-hdk
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 52bb19f5fbf3b..b7821019241d7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3120,6 +3120,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3135,6 +3136,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3150,6 +3152,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3165,6 +3168,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3180,6 +3184,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3433,6 +3438,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3447,6 +3453,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3461,6 +3468,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
 			.formats = &csid_formats_gen2,
@@ -3476,6 +3484,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3492,6 +3501,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3790,6 +3800,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3807,6 +3818,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3825,6 +3837,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3842,6 +3855,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3859,6 +3873,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite2" },
 		.interrupt = { "csid_lite2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3876,6 +3891,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite3" },
 		.interrupt = { "csid_lite3" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3893,6 +3909,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite4" },
 		.interrupt = { "csid_lite4" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
 			.parent_dev_ops = &vfe_parent_dev_ops,

-- 
2.56.0

