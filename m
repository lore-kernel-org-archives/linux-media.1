Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752944;
	b=Wt/ju89+MrkE53zpURrXF0t2qzLX0XIszoWcRnKUAWBWOdXrc9+L7fJM+nngCFWJaQxx
	 g9M5kMEogHUTPctyW/hw0k6lVAh4nDbKKU1QHOeQEqE8yJ15rdNvCK/PdESSNiEkUWEPm
	 l2e3eiAtmZH4Lhk0AsovG0xwaim3i8CfFXW9TkNoWBx0elE+H2G+m7BnQSln3wHG62dHh
	 wzGi/QtLN4Fk8uN7CUoztCYubP3+xfUN5/GjDOYGl+huKahlYAWbyZ5Tkg2kzJ2eA+pqn
	 oizGkc7VZtjVUqAadp9l01wC5E1ZNGeSKWJlZ3IxzKFcR/2zInCiqxQHPKUNZ3UbClg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AUB64VNIzJTRYwgLY9UIrrai4m1rHZRHhbzJpiOg2E0=;
	b=FahhjJUCCnci3ypS+oQXahA8bpkuZzWyD5H1g9q/bV9i8tHw0rsMLaI3jmZbZ8aEEv64
	 /lZN3Ns4YDIj8vaIHDQ7FUBUtAGg9ZK6XLwRqDiIPUBehUzbUCSLXREybFxRyMvpATkRm
	 3XwnJuuzVF7GogtDR6KGmmcjejGBrg4ffy6vGDBzTPexaLm/kbVea6UEloi9XKWkeMtWI
	 gBmicXJH9B2X+lgL9OqbSGGKk778UCqstkBQzkf48obxIHQmhbHYREijVlGmIe9OA+gRD
	 dDQjFbV4PjnI1To5rFdhS+3Fshhz8pmzpG7/Uq8PL/wC7KHzVUGmyp5QrFkvRlMR8kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dWTGluol;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01147606A335
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 04:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01147606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dWTGluol
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so75529665e9.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 20:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795752941; x=1796357741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUB64VNIzJTRYwgLY9UIrrai4m1rHZRHhbzJpiOg2E0=;
        b=dWTGluolpsrWyrUM1RyAS+8Q0ti13VGXx5T0Rq06jHsKRGi4oIWZhDS4zYo8/mI3/A
         FhgZ34FytsVTzaCyvckCkLTEK5SziaMZXeXgCFJlk0UusOjwt95G34HjlPaamIi3lZjL
         x/ZQSNydQDvrVvl/YEmsa6P+Q4ozvLI8qeeRWhhNL8Ldabonux6DKjrh8/MGzCGozBgv
         fjDFvsS4Rq/x2fT2CdWp6W1BqLquF9aJrMFcFnbUNI7BAop9GVeddMn326Rss2pOQ19h
         5X8Df+tSzG1efvXUU6pyrl4pJzfPnCuempTiM0Gca6Dq7LRBlnLAspVvfVE5az2+5aB+
         USGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752941; x=1796357741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUB64VNIzJTRYwgLY9UIrrai4m1rHZRHhbzJpiOg2E0=;
        b=W0+LKLIkJorzpeZ7zDb/JzqbgjNoiz5pEepIBnSbBlBOO0p5mAUHDdoOu6+h/7LBgG
         vjYY1t6v2XGVIyD369BTXXImgf5RhExFuYALVvl2YcopA1PZU6qiRFB5Y+GHVQXg6psZ
         mcfiTpcNperQ87Hg20ZWSfDekMhvv5HV5e8tFeP5JgU0/NM9+uoORuCKuRzU1YcevClG
         LmA//bMT/6mnIa8aAn9zETxrveGjlXfdbayAh8lIUy7Pm3/6qgKYYZuvj4D8K5yd4x6Z
         tWmibYZqzAZmflKW6Hk8mORjYAlgv7Sqekw8Z19hzbFLxoQA64RLuO8HSWo+IrBXwZ0i
         KA+w==
X-Gm-Message-State: APuU4Z/dDbdKq1+I76fX/CjFXWRZO+VLzV0m7XYglijtTy/fPD0wgK+8
	i6RAfalHzjUf6MjQAWbSe9naM2DMT0til/dMAgV/MxV7ROK3Y1xSAarz9LMZNThhr8o=
X-Gm-Gg: AZFdTZemVNO3BmZPrJJYWnEsP5WM/dTPpqM4zyWgoku0gE9HM0SelW5VMtJHxNy3VYH
	tbFZpFVhmIE9O+R2NmrSBeab9zK0bRyESf0kmpvIBRr/gA8zGXbIY3CMoBrjie8B/7IU5OVpzkT
	tyrWHRar0ilnbfFMDvBIcpqfBbPTZl1MCAXDq6ePunrF9dvqQ75vIphIUvDUhDgBJwRPBR7e5N/
	O/51ar5BDsboY6rYibW38qfaK5xVi1A3TnKsH2/dzt1uvXegJPYDpUTe9jbxK60/mKlinpeGKCY
	DFCaJum+b+FXC2h/4bkzM3lYNpx7Mwm0AXgzPUaQZQMBV6iX58spzDvCBXi6SrMqG17wgw0GD94
	36aR2L4iNz9hIOaR5MfovoURMhQ3soVDKKmlhdbfeL0NFqh35pWYArKUdCV1N+iwDxVP+EeGtba
	cjGcZvS2iW0cQZ5g+cIOQ3guyaYEwjp5qx4XIm8Unhbhi7hcDhTU67ZSe30lqHfqqBhoYW/8FCD
	pjPjdtxnkGSUptol3AMp+SvMQll77iBK5NaVS1Bk2Iy466DbzXcDb0RKWvp7uLSE/KCfL5LN+Z/
	6bmExZutejYaosNPpIs=
X-Received: by 2002:a05:600c:1993:b0:4bb:8711:fcb9 with SMTP id 5b1f17b1804b1-4bb88941bcemr431987795e9.33.1795752941232;
        Thu, 26 Nov 2026 20:15:41 -0800 (PST)
Received: from [127.0.0.1] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm686987465e9.2.2026.11.26.20.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:40 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Fri, 27 Nov 2026 04:15:30 +0000
Subject: [PATCH v2 1/3] media: qcom: camss: csid: Add and enumerate an id
 field for CSID entries
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
Message-Id: <20261127-camss-routing-fixes-v2-1-b7152f0af49a@kernel.org>
References: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
In-Reply-To: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=21284; i=bod@kernel.org;
 h=from:subject:message-id; bh=jpVhL6zN8Na9+/htzgoQenAggoEiZBAGXzHDQyJYPLs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCQPoF/t/XS88nDvzs6EH+lsMzHmeN+bYcZ99K
 7zeCO7XEMuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawkD6AAKCRAicTuzoY3I
 Os38EACrkP/UGRwMvrxF0zVzvkiGuVcrYCZPPSUYJv3nkov10f1kM7ZAmfMi8BAiXA/Go3NmNQe
 m2CyOXgBYmkup+ViJyTZsGCdilpGia9EYhTeVTHdBC62C0R9H5f1XJPHyRkV6Tgorw2h9hvwaoH
 m/PuHn5dLh4pgy6EGUsGLTaj4mtOVy/SJFlbIubEmyYWEEs3z7z00QoE99t8ZUAZppVZlTi5CTE
 WdLFXygqXx0WR+/YT2PZBrhCZPlaK3KDINoLTL6yP1Fcb3dWkRCa8XQdclcLRRL26rpN/5HR7Dg
 vWNFeHouACPbtcgKuEsZo7sZLrWHF7NYAW8wFbKe44HnPbNSeVJH3hIyShm/FOd0nOln4rjiOvF
 HITXuJDpgjETdsWaO7XDzh2E5MGiFldl2dPDKIFMB/IyF7EqJQnGsw0GtEsxEeQ/VL+NsfIQOfq
 ZjhIXto2XZBrJaZTEIWpMKxbnhMHcLFMlkenSeIvJRzJDtw3VuBwC6wc0M+H4e3sfhsX5VEQSaL
 B7pFuAeTvsAmLe2Z42ZU7gSQSjhv3kYVSeIjzPtQu3Tui9WKR29c4/XJe6FRf7PY8ziT8T6Mwea
 zIhW7VJhDZoEIsjqqBvFGEKTLnIw2q/f5JiIM81d6g6pIThAPaxXmC5JocxKqSzC72DCnsVxXJ0
 d6wKnZXdU3saJLA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

We have a need to differentiate between CSI index and CSI hardware ID.
Rather than have csid->id and res->csid->hw_id with the two values meaning
different things - provide a .id field that struct resoruces enumerates.

Do this for every SoC we currently have.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.h |  1 +
 drivers/media/platform/qcom/camss/camss.c      | 75 ++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index ccafdbf3a9fe0..6e329789826ca 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -153,6 +153,7 @@ struct csid_subdev_resources {
 	const struct csid_hw_ops *hw_ops;
 	const struct parent_dev_ops *parent_dev_ops;
 	const struct csid_formats *formats;
+	u8 id;
 };
 
 struct csid_device {
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c5fdc79c32d39..3b569a6e88150 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -47,6 +47,7 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_1080,
 			.formats = &csid_formats_gen2
@@ -60,6 +61,7 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_1080,
 			.formats = &csid_formats_gen2
@@ -73,6 +75,7 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_1080,
 			.formats = &csid_formats_gen2
@@ -86,6 +89,7 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.id = 3,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_1080,
@@ -100,6 +104,7 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.id = 4,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_1080,
@@ -298,6 +303,7 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.hw_ops = &csid_ops_4_1,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_1
@@ -322,6 +328,7 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.hw_ops = &csid_ops_4_1,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_1
@@ -424,6 +431,7 @@ static const struct camss_subdev_resources csid_res_8x39[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.hw_ops = &csid_ops_4_1,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_1
@@ -446,6 +454,7 @@ static const struct camss_subdev_resources csid_res_8x39[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.hw_ops = &csid_ops_4_1,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_1
@@ -468,6 +477,7 @@ static const struct camss_subdev_resources csid_res_8x39[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.hw_ops = &csid_ops_4_1,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_1
@@ -534,6 +544,7 @@ static const struct camss_subdev_resources csid_res_8x53[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.hw_ops = &csid_ops_4_7,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
@@ -559,6 +570,7 @@ static const struct camss_subdev_resources csid_res_8x53[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.hw_ops = &csid_ops_4_7,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
@@ -584,6 +596,7 @@ static const struct camss_subdev_resources csid_res_8x53[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.hw_ops = &csid_ops_4_7,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
@@ -746,6 +759,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.hw_ops = &csid_ops_4_7,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
@@ -770,6 +784,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.hw_ops = &csid_ops_4_7,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
@@ -794,6 +809,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.hw_ops = &csid_ops_4_7,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
@@ -818,6 +834,7 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
 		.csid = {
+			.id = 3,
 			.hw_ops = &csid_ops_4_7,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
@@ -938,6 +955,7 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_340,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -955,6 +973,7 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_340,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1099,6 +1118,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.hw_ops = &csid_ops_4_7,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
@@ -1127,6 +1147,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.hw_ops = &csid_ops_4_7,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
@@ -1155,6 +1176,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.hw_ops = &csid_ops_4_7,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
@@ -1183,6 +1205,7 @@ static const struct camss_subdev_resources csid_res_660[] = {
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
 		.csid = {
+			.id = 3,
 			.hw_ops = &csid_ops_4_7,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_4_7
@@ -1339,6 +1362,7 @@ static const struct camss_subdev_resources csid_res_670[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1359,6 +1383,7 @@ static const struct camss_subdev_resources csid_res_670[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1379,6 +1404,7 @@ static const struct camss_subdev_resources csid_res_670[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
@@ -1571,6 +1597,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1600,6 +1627,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1629,6 +1657,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
@@ -1786,6 +1815,7 @@ static const struct camss_subdev_resources csid_res_sm6150[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
@@ -1802,6 +1832,7 @@ static const struct camss_subdev_resources csid_res_sm6150[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
@@ -1818,6 +1849,7 @@ static const struct camss_subdev_resources csid_res_sm6150[] = {
 		.reg = { "csid_lite" },
 		.interrupt = { "csid_lite" },
 		.csid = {
+			.id = 2,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
@@ -1991,6 +2023,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2007,6 +2040,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2023,6 +2057,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2039,6 +2074,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid_lite" },
 		.interrupt = { "csid_lite" },
 		.csid = {
+			.id = 3,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
@@ -2278,6 +2314,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2296,6 +2333,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2313,6 +2351,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.is_lite = true,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
@@ -2331,6 +2370,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
 		.csid = {
+			.id = 3,
 			.is_lite = true,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
@@ -2569,6 +2609,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
@@ -2589,6 +2630,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
@@ -2609,6 +2651,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
@@ -2629,6 +2672,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.id = 3,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
@@ -2649,6 +2693,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.id = 4,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
@@ -2870,6 +2915,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2890,6 +2936,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2910,6 +2957,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2930,6 +2978,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
 		.csid = {
+			.id = 3,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2949,6 +2998,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid0_lite" },
 		.interrupt = { "csid0_lite" },
 		.csid = {
+			.id = 4,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
@@ -2969,6 +3019,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid1_lite" },
 		.interrupt = { "csid1_lite" },
 		.csid = {
+			.id = 5,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
@@ -2989,6 +3040,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid2_lite" },
 		.interrupt = { "csid2_lite" },
 		.csid = {
+			.id = 6,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
@@ -3009,6 +3061,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid3_lite" },
 		.interrupt = { "csid3_lite" },
 		.csid = {
+			.id = 7,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
@@ -3353,6 +3406,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3369,6 +3423,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3385,6 +3440,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.frame_sync_en = true,
 			.is_lite = false,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3401,6 +3457,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.id = 3,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3417,6 +3474,7 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.id = 4,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3770,6 +3828,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3785,6 +3844,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3800,6 +3860,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.frame_sync_en = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.hw_ops = &csid_ops_gen3,
@@ -3816,6 +3877,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.id = 3,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -3833,6 +3895,7 @@ static const struct camss_subdev_resources csid_res_sm8650[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.id = 4,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -4132,6 +4195,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen3,
@@ -4150,6 +4214,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen3,
@@ -4169,6 +4234,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.id = 2,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
@@ -4187,6 +4253,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.id = 3,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
@@ -4205,6 +4272,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite2" },
 		.interrupt = { "csid_lite2" },
 		.csid = {
+			.id = 4,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
@@ -4223,6 +4291,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite3" },
 		.interrupt = { "csid_lite3" },
 		.csid = {
+			.id = 5,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
@@ -4241,6 +4310,7 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 		.reg = { "csid_lite4" },
 		.interrupt = { "csid_lite4" },
 		.csid = {
+			.id = 6,
 			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen3,
@@ -4587,6 +4657,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.id = 0,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -4608,6 +4679,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.id = 1,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -4629,6 +4701,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.id = 2,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -4650,6 +4723,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.id = 3,
 			.is_lite = true,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
@@ -4673,6 +4747,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.id = 4,
 			.is_lite = true,
 			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,

-- 
2.56.1

