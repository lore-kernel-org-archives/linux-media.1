Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627829;
	b=2q0DWbXISRDvoB9LgAnBq73xyw/gQl3jEqCZzfiP4/VF1j5psg0MODaZQNL/jaRNJCgU
	 W7gX9dzfQ+aVFjhNALt91DfsSeIv/+lpLsr5R9skeZYktpFbD/y/y/LZeRuQt0YF1lv5c
	 +jltWyrtLXbbZfQG6CMdIrqrMTMuOjOLJSzqgY6e1uoKSYoQB+XUvdsE/PwSUwoSXnB0E
	 zM4Y+DdNj4I/kjL0Ksn/c5vuemLgHprBi6nw+XBblUzTpCn3d3u0muPSswknqB+7+oJK5
	 4UiLAJ6AZPU9Zjy8zSzc252FC3CMM7n2ggPPJtJ5d/DNkoAoANJfDQOmEYfD3v1nsPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ROsfx3+ZDDwx39J51PgNoR22b+GriiIZQEgHzyee4XU=;
	b=R0+Y6kVsmgwJdgApuhoVq8w/2KJ16RbVzmvao3wpdmZUatJAk8I2aZJ4jM+LPDPs35dR
	 Zt0Y0OSFGyusIFgTGQ+b/FHerlZd3QZRY5/BO4eLQmGPjP40mlWx+ULnp4nGjWj++Qid7
	 1/NqrXCu4H1pUwLV74XxQuc8D2UoZL8UotRw9xzh6GJwwAgqCWKLxJM8oz/Dsytkkgvdr
	 PsFLGW4PdBCTwjOKKnXzA2IAO9lIj1hZLJi68t8ifZ6vPm4heG+WOB3rh1O1fevCKAR5X
	 dO5yRf8tsBTQuBqNuFkDkZJ19dKa3WYwUiziZ+W5My3PWoNrXxW4XdZmrhT5FAvL5OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cGitjCfk;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1813A60A5BC6
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 13:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1813A60A5BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cGitjCfk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so32591295e9.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 05:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627826; x=1794232626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROsfx3+ZDDwx39J51PgNoR22b+GriiIZQEgHzyee4XU=;
        b=cGitjCfkJFxB4xJ0XXrrqj93MHqYut+N8ugiyr5tAkL3g2Zvsk7Y/NpuLMx95JDhZ6
         CwHGEy1WFJxy6rJ8yjws78cRtJEiYtSpkhgHhE4RVa7yahP+4RTVGbQVrVU9zFDtQGBM
         PQkD/yVGEdsqxW4HpQbLx5/9kTTTkPNoe2G+dAlDos3W00WRDEMTjjbaGRcmosOa26Vs
         aYxyc//x+CnkmdVOK7Lt1I6KMRe9m4QkYuR2tXE8Ze+w/AJSPQk7wqVuJuc9Qs7mrWaj
         V/MGaBsxwojS8mjMcg8r8HGyBOgMu0WIjj1ptv4h9b6v3V5b6c7bND9fTUARf5kghH83
         jkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627826; x=1794232626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROsfx3+ZDDwx39J51PgNoR22b+GriiIZQEgHzyee4XU=;
        b=hvyPXp/8guwScerQSEmBEIf20Ce/InYUqWCFbFP2Gy8HHAqICv4v78Zv4Zh1gVRF+G
         gLrBAtrlqFDJfnX1/lesFp7JtYp0Fb6JwskLKVCeGBc9gBq7zw2xdk9UcQxWB8SauyQm
         f0jShePemq55plG8A8gjMVqLNroKbgesAiXelBpjUbpffXnfIJVoSsoF4LkDlb6MlDMG
         T+UeiEDWGjrx1cqMmSXcEfe6IAz+0tVtEVBeWhrg18JoD7rf6Bu48VnEVMf9Q5BbVtYS
         esIfLWTOH4CYm/gWwWkOv2IDNV2rw+iMg1xo0wC7XnvyQnJcxOExCBF7lyPMTSwZ7pvV
         /tzg==
X-Gm-Message-State: AFq9FYIyrzTIPqWfGuvR4pjrU2H/o8lAZlsR3A9HNNiHGRmKcn7zoBpv
	HCCY9Mg9g6m5DUcTN2w1UVWWz81yNYhP44CdLniFj7T3ZSfjDyHrCNRxCpKd3nNwnns=
X-Gm-Gg: AYBFou0vm+LuhxJvxjd2kDCk98GykHYxTNiIGab9ClAjrzFY6vbQBa10HToWEntorsA
	JcpaDFkTa8sGu4TIu+LjlUco/7J6i9vYTJVh6DwQ8YpkVRO8j0RXkWfQXHLaYipc8IRV3zgmESL
	C6rSL30Lie0GymYcHQUGcXrgbC5xHMeKhcd8f8OZgFIYA3+hZ8gdIrjhpfRaSnhbPfZ588qumRK
	mbg/vw/k18fzEUDSIbD1V9NdmaQhILm58juJajpkYt8drYfh7e27KAFfEtmdSufEsx5fVePkChz
	cVFeYpCsW+xDYPmtRRF2/DJme+y8gvjPmxQP6YVezobwxmNDHkml2ONm7K2UgfAFOnz8w/aZxnW
	RSqFQ3ywQbJvj70yyEotLZtIGe86JXgknYLzwg3S2OgaghokU+5+yvfqS3HAkEMKtuOrJQXbT0e
	XvddxnjtFVePf5oWxn7VS9FWWnFEYXWtoiUf1E0jh/Ou0pXPcmAirDO/WPryCiOzxatqpw1Mxfn
	IN/PFCnTkm+S4gv9PU3iY1Y+ckV6Q4nFq0l5nCvjMtnhbrpztlxaRs5dxld5bsJi3nqcfRqUyis
	sVSdoA90qu8M1IhMZg==
X-Received: by 2002:a05:600c:19d2:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4ac1932a12fmr227049755e9.31.1793627826426;
        Mon, 02 Nov 2026 05:57:06 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:06 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:54 +0000
Subject: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
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
Message-Id: <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=bod@kernel.org;
 h=from:subject:message-id; bh=tAChYgZgM3my+l5gwP88HIDeH7bAjggbAE84sPt/iX4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JancMv2K6Uz2df9YGlgm6DWLWHqfCvOo+n//
 FmeU6Pj2IaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpwAKCRAicTuzoY3I
 Oo+/D/4/jw1RoL70Pq/OAeKR1oRhzBDdm4bjc10lWunQIzvYA6XzdKJCUSoWAshkYxgD4GMeQvh
 3xvzOAfwQJbeziWixFPvRbaxGvcoWICUz2o0/SrJ6uu5VDGY4I4XiQgJDAAh37ktVEeKdKwpCH5
 ydqW3vBaJr4Hiw7p0ejmpSP76PQrSDbgoyQJfoIisuXbJJ9SfqJuQfFoc2O3NdGOXj88VJHoAa2
 ihjDVtSOi/TntCxMkSb8jV4qzQulRJANUBMfZBaKbR3hGXhFcOVThfUKdixlPQFwoEIbJEYFhMr
 URblhPDzWYhb1VErPQpuQa0Jf7aT/Fco08VxuyNbhjars/xYnE0m5ZKRFa4u7xIpzBbMJvfW1X7
 L+h7pMpEIdPP4tl7cWnzQaYKAIczyFEjDg3giDO2XAgWVdj+c5PRNeXHN4yeZZw10QAEdkiMcPd
 wuk6SxoK3RwToGHWzKGFotAG37N9GBxpVh+vD2Q5i8MkHCKC2C0JQn6NDLUxXBfC/5izHqtINWS
 33G2qY8NkTV+XNWkW9WAMbcT4hjL0PuTmtynKMAL4s8bpMLa6/aq4yCA2KMwlXGSkcD6JAXBxPd
 j/4wIJYPcC4wdzF6OXmdJ+nqfDOciNpqaPUTIOwnL/ziJG5FpUBkWlb3wd+zUICWYH4aUE0LqSY
 dCMaxAJ3VbK2Ytw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e CRD
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b7821019241d7..7911b30494ac9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4255,6 +4255,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4275,6 +4276,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4295,6 +4297,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4316,6 +4319,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite0" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4338,6 +4342,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite1" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

