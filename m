Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627829;
	b=ppRrd0NA44b94jnIt33km5KTPcrXnWBfoIXfhrAjBPlm5QYL/7tCxBZyqDL3kaUIIDCp
	 hph1mdPtjBq+kCJIOGyMEXSA3F7ZrbzXuef0ddOMgP4p8i2CPrq+80nJxxH9RkBHNC1F6
	 hJcFvPeA6RYhWvW72djqpAK5sDYX/PTWvjzW8RKGUh3JfbbGZqWN1eg95tx5MVscnJvOf
	 X9k8TB2YSqj/T8+xbsFscAZ9M94EBkeYNZniHJK4yMThlnT8S612KZAWXvaJgo1woBUKD
	 lfgsEUvuT1WzQQDRc9Qk0+SNheL3WEQzm1c1SgAB7jWGb49HzUaTz10X2khYJou8cBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/G+GoCszj8uMGdIOWBMWwoyuQ6G5HkG8rRZwTC2uNlE=;
	b=PGjogJnlXOwiU3MMS2S/Qci30El/FvmRZFTHkxgB1oSf3itsAyaVZ0eT83gKOrky+Fel
	 mDAhPJnzYqRp0E7lPpI8rAfxa6Iqn6tSrRkpNPl1IDs/ZPgeJj+H6EgIueAoWGmTCpGHs
	 fqxm0aqgEFPAjh0tlJ7ag3J8w6309l+Yy/YMYpp4tfiC4ygEo+zxsZyJdKO/i0dKtcPGe
	 dx9KvyiRGdJm5p2tkz2qqoM/4TvVhE3iyfESNpNH1ZmbL9hLakCFovqv5b0Vgeqh7+T9T
	 MVsfWVu6ssB9tbz+vIAV+HwI84ZBELiMo+teSszsgpKPAP45gNuTvw5CI8lYeXMmIzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ERVvzQCu;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26FE60A5BCE
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 13:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F26FE60A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ERVvzQCu
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2457582f8f.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 05:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627827; x=1794232627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/G+GoCszj8uMGdIOWBMWwoyuQ6G5HkG8rRZwTC2uNlE=;
        b=ERVvzQCujfWCjYJN9oYZKaimgac+b/IzEOZnWk5PWe8LT/M3Zj8G/TB5fBJbB0hg3J
         6GBygHtOkJCd7zq1FGVNAOfShOPcweyQm/QNiDSRVXDsAbruG251NUfmpPOudJqndX7l
         JaIgdJz8CJXqKeOvMvuoBLZAvf15aP3Pw2CAXfVTKSvIxheUlkmuLoDHFc+pfaCP3pbI
         Dp44C0MKPPNq3VtqcM2bkdaDqCv5f0P7oQSlqMcdxQIzVzpRYZwyo51I4XSTf7IUiZEM
         PJo+08xy53lH3cp93x9MZzGdSYp0Z78heb59inAqdEKV4tdNSv3dECPCugLN+VqTgiOz
         hpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627827; x=1794232627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/G+GoCszj8uMGdIOWBMWwoyuQ6G5HkG8rRZwTC2uNlE=;
        b=Zjf/1k5sDAy19ijzkAlCL72bEBxNPfTzf/uYyJuxXuSmagzdI3jXOnaICY2Wxdh1mI
         sfXQhi0OXJViIDXMdvl3Llz2AURjY6sSI4Cmw+ACLRtw2eVGujN5Gjkn237QBJg/52nM
         udCer85CMjaLuN8g/a4QE11ksegBKhiSkAQnZfdX/Ul0PuHPG0ePRFKTG6HO3q2sfWfA
         wubOYUrAXW80XDtgma4REZVRgFcq1YhaUeM4TjPOG+7pmDtUnq2MXsnFzez36UbGOF9x
         hzIRpDGsYidxlG2G6n22n2E1g8f25ejwapzg62f0u22dtQRPWh3wBVfaCV39AwBdRypl
         yYcg==
X-Gm-Message-State: AFq9FYKlKwYxdWtEcMifQ3oFAJ2FddM1HbDs74E0c2eMZf3G4WdbcQG8
	+ONucBhHfqNR9KROYh34dm6S2dhD8oyjD+2ayC1dV966aRGLHZ62YpM5Yed/vjv1FwA=
X-Gm-Gg: AYBFou3gBfG4IyNF/J5SJ+A7OFc2YQDc8nhqFH2yjCis3Ywx68fgDy99ZXtvwjFg1qU
	1oaK11uSlKssyIKfX3bprRH2F7F7gAJc1sf1D8vlD0aHjhQYtU97Ezf2QTvqPvgBi08hU0MTbfF
	m4/+nJkoDWURmJ1+r9l+pu98V71QvUtWaRaNjpnoWt7DWRHebkGCl/G0ezItCEX88ZMTmNT0lL2
	WFKYspMX1BFugvcJW3VinPpfqjWSpzlwdnf5rwq0XFfSvLFtXrJQoilR0/RZnGo3IVK8xWzCOYi
	WeswhNreH8e7nQTsQoacLfjjmfua4dK+vDL91ruLq6v5ATd2uuNolEYtXOBwYOd1hizjPCeEHjZ
	n3mZhDXaxNHCUEkYgGwRxrMr5i/vBVqe94Mg0pUkNdWLFJimCsFWHiD99HNCXxiqrDkf0DT6cvy
	zG590VKx9uiChc4GgJeENR3gUQc20p5xO27g2HHXa67EpARoAO1rs/+jOlPD5pI46gltzJkiEN6
	Ptz6cM3XdHfgqaVqs12f82of9r9sqYusMPP8s/gSzcI1/ajp0rrNz355t1vqFmc2b2fSt1hkHfM
	gbXNFZIjJWkjiXUyfA==
X-Received: by 2002:a05:600c:c48e:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ac16bc4829mr238745425e9.10.1793627827311;
        Mon, 02 Nov 2026 05:57:07 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:06 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:55 +0000
Subject: [PATCH v2 9/9] media: qcom: camss: Switch on frame_sync_en for
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
Message-Id: <20261102-v4l2-frame-sync-v2-9-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9253; i=bod@kernel.org;
 h=from:subject:message-id; bh=95tDSJ0WVTpznjgi65qW2It4WcwY5sqHJM/UhObBuA4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JanjOXo7wPWoBVwARpvmig8hyXcQmRwDsUrp
 AGom/wng62JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpwAKCRAicTuzoY3I
 OsqUD/9N741GnuBLpdtxDFC1YqjL8I26xncRsE6hQRvCKzjGxc1N3q09pfMWpk6a1lWSR5/kz1n
 PmZzct+XJdaeC9VgBk4SKrdbdZJ4+nvMnhtVdrFZGDWn6uTH0oMBavhBF05MZmnJ4deTHWuTASx
 L4gpEVMuTBLwBB4Ahfyt8tmIgXYTAx9mDOQsAKvMsvsIabTGNrbD3tFcaWJDGNHSZ5j9lBeVQ0j
 KY6eYxEVlC0ii0qMZqFPn07mChY/slk1bcnZV0wgYQZmplY8uGKrwKmh0hrIoqIsl39JNzoJYlQ
 fEIE5e+oTHfEmkIV8bXfALiLLJ0su2o5uyK5khQxK0qid7QcqQPTtie3Zk76g5Vvwrz68igUxqL
 awG8yUcjhVfVWWkvppYj8SyHtosSiF/V5X4iSYw3GaHqOnjTpg6HtiLJuf4OTN2Gnu0VjOj5bnN
 JZKgEdgAdkp+AYsRhIMq22euR3WfEeY8A0xuBMqaaUHpKpnKt/md2GCOhDVUvbYZnVV1sPf7mM6
 4V/U2fgMd+vv2xeqop9ZTrIFp73/aE7adziN/0t865nef09YC277AVur9/uPwA371RVN+H2ezpJ
 rdRBKjlSdFtXNfNmuHV5UG2T4iL5BJg4pZVG5T9WqX5uSZs4MiNQBmO3ikBl+7XqLJ09ToEkHhf
 wGzkq8UGa7zeZyg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb5
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

