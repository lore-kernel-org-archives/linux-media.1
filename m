Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013328;
	b=rTn3YRoQiCoCNHyWmr322DwA8zBwCvpuw98xNhtZMXRQUdsAY0M166oD5GnTGoTDBKB3
	 tjtapRDKKVIUiAlJZmZK0yMt5Dcwx0NfQTvfS+mQGPoDu1ylYiW1RhEI1BEUWc866nSd4
	 uuVfclS6yUI1OnBSlNXEf1x8QBf1nwKz9oSMnseF4YPNhn3YIZeTEfT920jM9TCAuYQ/+
	 1zbP6dFsEHuyyQKHJofF9dmYoPkyLuh9k8Oqa1ML0Ogxg9sXLH0yM5im+DM4/aCsegJrF
	 mjyEiBLJ4GDUj/Bz7S16PljGEO4sM8XpNffyrsZUUO3XbnsjSYL1WyLwdy9Cx1qXSUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3figShM7hi/Oji+om3WhmCJze4gMoZwMu8ibm7UmCrw=;
	b=xCVIfo9Xt4BmbHOzQXkgEg/fQywbgsqUx+OdEXTGTYldB5JCswD7jQEYJtp8/aOA8T7A
	 YgaFjGvJqA4iJTEZB3wCtf5WpCLUk/7JPQb4Yd1g+Mux5kIuoipWUmYLeSspL3U7j65b9
	 bQqxrYUvzqqdBdi6WrWaFQ/uuAWhXvRp6C7xqcK39UXEJ9t+ZkOAapNcJibg8gE4E3/EN
	 hPVAJ2+qYg4o4ro7MAhhmPoDL7gUdZ76lbxYJwvWC6jFXJHWn/r0r/1pooiIFOISdAZX+
	 j0w4ajrAEV6kg5UXvmV/mpQgkV5/b+A0BCpBxe+tIA/NlSSrk78MRXFHOfA7tuB+WZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ndGcxxGB;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0626082BD9
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 01:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C0626082BD9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ndGcxxGB
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b467581b98so9473225e9.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 17:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013325; x=1794618125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3figShM7hi/Oji+om3WhmCJze4gMoZwMu8ibm7UmCrw=;
        b=ndGcxxGBOhhlGFkL9mHCQ05FCNP3hqmU/1kAf6FCRqoLBWm5WDEAdhiW/Co3dJ/Isy
         dZNhZVtn4FEc6l4YgY6rZXMprBQZML48xwepM85h15jUfN0evE25LFAfIyu5onTC36aU
         SDabdPNFs2DMywXWVP0LSEhOAQb5ORt8WTnW3icch6zh8O1dDEr+U6/BaMPtUirbsueW
         fOdg28aPlCjob8dtfKHuOAV6OU5YZyb18XIIR42e3et9qNewNWwHLm2dIzNi7jA8fJPh
         xFwTLpxoru28hg91MlsvKxxUM/MRz3bxvCyU5rSfruXlFLVKfiZqFXWwXSIy2SDcB45H
         bwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013325; x=1794618125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3figShM7hi/Oji+om3WhmCJze4gMoZwMu8ibm7UmCrw=;
        b=Q0bW77WLXgUL7jZ+11a1kFLtxiCqdo6WfjjG8D12HW1ENTna/hSx+6E/xkUzVF4qJr
         vY1cpxm1JDPKmtUChyXzLUyO8lW0FzoZdEYEHY6kuWS4Koc4bQkkrbD0WV35U6L3mDmn
         So1xs2L1gV2pwCybIgPtAAmusP5ucRiCL/qR0Y/Rfa9IlqbtKQM7unEfU8/JcgxQNTqr
         BdBm87C0cKXJ+kl/9SmoEcqGXgRYf4NpUU3w2SyEJSHfQAlP56JOSC72sGytOsu0t+tP
         Jo91rGTl4YJrhk2yp4c2Tq6VE5nN5lQsvtbPNYPxvenG6mN1kggm/LxZhji5vobvEVC+
         SiFg==
X-Gm-Message-State: APuU4Z8oTHGlIFWWiC8gx4kYSkw0kc6zuHXXnJrp4ghPw82konYM5aAs
	d++LmrwVHr8QnMMDkgnhS2Fnfo6849JuOBC8pc0q79Y/ZChJeTsHGgmO3KDtKqmHdo47SrnsxFi
	Vyn34
X-Gm-Gg: AYBFou3ULiNb6CYh9GPMb8OUf3nkGnUR8Me6OylaDSBnWkqDMI6Ij6tx8D/oWBu6i7r
	LukjfJqUTYq3WgzRTA0whTg818Gb70qF6iFz2/TnCXvMzBQpdutLixVkQMiqISdDGGCF9yeCOkr
	Ic153/Ixf7hqiGknqSr/cyu2ydozx43mkRK6GPu7no/FK1KHiMWi03NPNejvcuT09u9UYzZXXJF
	86WF2uihvnRIR3OF6uzhDtmcbN6dib2Ql13c2hpefCWcCvxYMg1Jo1ys1miVR20KjX19pYadA/v
	jldtUbzJdIb3vk0aufqlbK2RgdrL4q5NzwhvX1RCYLpShvRqgv64ISq7LxjtaySZH5+YNgECsDI
	O0wg87qTfJdNMeSS5GAGRm5rZJ40FH/GVK6euVMITfXVvxK1uu7T95D0F0J4g4EKcvvB5shql8K
	icosu4mq0nQeAIGnAsUxXT+RSMzQ2KdEHcN/yaYGFvJLeABxNdU44VPCKvLwg1mBYd+d4gpKM19
	2rNS+PRf7QyfCGCk6tz6pc3ecDv1FVyUJgN1fQ55nPt0s/jU1QgvqdseTQvG6kAHDmQNZjeASxO
	00dv0Lw+o8q5H8BT34IEWw==
X-Received: by 2002:a05:600c:1910:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4b6de4a6b88mr70556675e9.14.1794013325617;
        Fri, 06 Nov 2026 17:02:05 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:05 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:53 +0000
Subject: [PATCH v3 10/11] media: qcom: camss: Switch on frame_sync_en for
 csid-gen2
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
Message-Id: <20261107-v4l2-frame-sync-v3-10-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9303; i=bod@kernel.org;
 h=from:subject:message-id; bh=zl+TqYBk2MET3nCY0+7kD7BZhy1LomrgQRjvoSYza2E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7niAnlGfFLOz/a6YuCiFKSJ0JYjkhWOxU2Ihd
 HNppAf1PvGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54gAAKCRAicTuzoY3I
 OtXzD/0egaci/n3HFmEjs3LLZyXiamYEkFOO30ci6p9sVaFORRBbU2JQy3sXfZwV0ixPKe8wXBk
 66aMtC0IvQNIo1DJiWMhXBw2Kj/wQGKtG2YtE58/XzrCWfrhyP+t1d5rqju7fePL+H0nryxPD7X
 t4zY6jTu8wXbxDg8cCVA6BCk+9aTnrirNA3rtESjsgCoMWQRbY48t9dpPmdkvxFICFPkJG2GVGL
 VP+v6GGjpaXYk35s7FQBoeZtIKpThyichfNeAOCA6TjoJuMnpcXQNiyorlAwM5u8rSH6vHZ1Rh1
 HL/Kbwnbb8D6fe1l7GhW7y/9mC3d48MKV+bGJw8xd+1pZ738XltczemKDiROa+JxZlJY0GcnS5H
 hPdsvcgDS+QV8MtDDQcGfK7fjk4PG+SAmaVwtHLgbL7KNmGvbGyHCv96HkOqzv/Co7bInI3+nvy
 WSYw/H5bUWlV9VpFLcGnOzUoRYHEIPVHA7ZfRIFfN8zsqIfhuvs6Ns5xO6IHNPh20PtAZTH1y1J
 lGGs7RqiXIZjxaQtzBT1g4uhzHCy0nfv7eKVDvMHeZWbolcOMkisQVcmUrajmsAxjEk+GWTf51g
 M8n6LgnDvkf7pJ/6LB/pZ/OzS2m5FAhwCXv+fQIDGG7XgXtPVmOiICwWqD35LMYynUP9oA8fuWf
 StE5Q01cSNT8BXg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb5
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7911b30494ac9..bfff28e789b04 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1132,6 +1132,7 @@ static const struct camss_subdev_resources csid_res_670[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1151,6 +1152,7 @@ static const struct camss_subdev_resources csid_res_670[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1170,6 +1172,7 @@ static const struct camss_subdev_resources csid_res_670[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1361,6 +1364,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1389,6 +1393,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1417,6 +1422,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1573,6 +1579,7 @@ static const struct camss_subdev_resources csid_res_sm6150[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1588,6 +1595,7 @@ static const struct camss_subdev_resources csid_res_sm6150[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1603,6 +1611,7 @@ static const struct camss_subdev_resources csid_res_sm6150[] = {
 		.reg = { "csid_lite" },
 		.interrupt = { "csid_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1775,6 +1784,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1790,6 +1800,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1805,6 +1816,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1820,6 +1832,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid_lite" },
 		.interrupt = { "csid_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2058,6 +2071,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2075,6 +2089,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2092,6 +2107,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2109,6 +2125,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid3" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2349,6 +2366,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2368,6 +2386,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2387,6 +2406,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2406,6 +2426,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2425,6 +2446,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2645,6 +2667,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2664,6 +2687,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2683,6 +2707,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2702,6 +2727,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2720,6 +2746,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid0_lite" },
 		.interrupt = { "csid0_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2739,6 +2766,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid1_lite" },
 		.interrupt = { "csid1_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2758,6 +2786,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid2_lite" },
 		.interrupt = { "csid2_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2777,6 +2806,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid3_lite" },
 		.interrupt = { "csid3_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,

-- 
2.56.0

