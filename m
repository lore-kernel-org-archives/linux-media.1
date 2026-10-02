Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BAC4D37A4
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956748; cv=none; b=L4UhAVS8J5ZA0hFFHaBxx8X+5+PAe738GgU8+prNqb3tLbkSHALjCBnC+PlJtpJOynrIyBr2Zp2HhPR37l1SlCc/dABiOxfG5/f0xfZwzYWadDRIdtgIR5CaRY9jyLzM0UyQfyazfHwO5X+A/0k7xA1QpWQM10zMlc2IUCKl+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956748; c=relaxed/simple;
	bh=00/ModJCoaWSCuF1QBJ0vnDMVXETFJD5K8dpM51LPgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=em8LaZyovABt6blDA/hvO0nufJf3KjnsWYxLWh5z3YV/UHGhzVcIRNYr45v5TyyEeIMgD6oitGd8d+vGA2w/QKeUyN9Wd0Nm+naeqgAdDH2sv6JKrtDMpoj+yPKKedlJN14J0w0CynmIXyaAKFQFtFYiqwWrvL4d6rvHndIQq78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NOEkVvAW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NOEkVvAW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so286585e9.3
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790956745; x=1791561545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fegLklcc6FBswOs+RH0Jh6b3zJbLGOM40c/PndAmjlE=;
        b=NOEkVvAWTYk2Oyw0uHccL+ly4ZuZY3qjJ5DUH5gMpaUV89o53op6ctVXZmUwltTpv/
         bQ4G4m7R3GZCWfW0p2gFRx6QKBUnILz0YTVAR9euaA+R3n1VlZaqc5NDtVsw7foSatQD
         HFzszqy6DygP/ljT8ZBuYFcKtez9gCi4y3iTY8QFVNjSUMRbdmf+RvP+ukEZnHDh7Wrt
         sxVLIED0rhkohXPg5DawJmca7bwVmY92SNoxIUtYmgKDnH2P0LmPNt+f8m6JhibpnawY
         +Wivj2Sqs6c0hN4eyFYiiTerafkcnofbr1xdAHhCwSM0eOy1XLvNEpMm8ZA8sc5FIdab
         tHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956745; x=1791561545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fegLklcc6FBswOs+RH0Jh6b3zJbLGOM40c/PndAmjlE=;
        b=JYcmt5Q/JsIspL6eogs/nVkYuen7APGQ1WUEVMIPMRNvjVfxG8H/6/BTGFfh6kH1Ce
         EDQAmV1XZs8554UzGm9W1HLt6CHbe+wZgGn9fFyT4eRrq/+nShhbAlrpF7L21eKufMIN
         znv0KUXErlUF1kxRn6DwCcWysabwWNGGWpMys2M3gu7zpL6wDPNR2rW02q17r4yQG/T9
         5/0RfNXNH6xgQPQkZ6ljeX7zfYASS4tbzCHEYTa4+5n8TVmLGN7DgEI3Td7sHx+kxNmQ
         K4S8cmXfigUoPoo1xVOQXAdyZNL9/vnZpjOX96A62PlDA2gZHLlmSmPRnoICVgPL1Wop
         YBrg==
X-Gm-Message-State: AFuF++nmwtIz5Fmr53IGY5eBeJ7+3ns/H7f+9HaQ+HGDfA22UUQ3cOPp
	NuJXv7Ou2UKx1JGD1+quxkhVMkLBZlOtsLUCqO0il8xPqQs8BnjtM7q4g4ZBF8CShpM=
X-Gm-Gg: AYBFou0lV3jMcZVPf+fa9vhza1GdzYN3joyc31P52DRM6r8dkkB5XMy7m9ZO5tWjsUN
	IZ3IqAW8Vc6tAZKSzf6BGfaAz5B+smPWyeN03df/QIrU/1fAi57f+7pz970nGK60g07UCkxqYb4
	UO9hWiVypULdVg6oALxXAD+R2Duc729j4NoIR4c/QunflBt6QoSNqKctMe8V49GKZUeepdnIrW4
	L3Qei1GTkvYX7PTpVnIl2a6r3YUS1IiVRVZX8K0qAw6LH7jqr2JHMNKnyBMuLwT0YvaQTnE9aVh
	y5kTD3SuqnTiW/MKKnaqQZgoYf+4jGv/f0jF+FwIa1HjtZ3gUM0A4MRlz8rnvgI13MxdLYiy8lo
	d+yMb4HO1BAOKdxCStUGbkkc/Jv7ee5Tp+lnfYPjCyQQOyUGPQkKGO8ZQHzJQ7jau3RFSNDnf76
	N92guz0GWAJagS2iz7OtfCOVY2ttSCFmsuKi3EyfPnlTYTBDXZKildfb/1emQHrZc=
X-Received: by 2002:a05:600c:3e05:b0:4a0:dca:b78 with SMTP id 5b1f17b1804b1-4a027578502mr59415255e9.27.1790956744676;
        Fri, 02 Oct 2026 08:59:04 -0700 (PDT)
Received: from [127.0.0.1] ([109.76.210.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770fe4csm97162395e9.7.2026.10.02.08.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:59:04 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Date: Fri, 02 Oct 2026 16:58:59 +0100
Subject: [PATCH 1/2] media: qcom: camss: vfe: Rename gen3 back to vfe780
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-vfe690-780-split-v1-1-40e15aa8716c@kernel.org>
References: <20261002-vfe690-780-split-v1-0-40e15aa8716c@kernel.org>
In-Reply-To: <20261002-vfe690-780-split-v1-0-40e15aa8716c@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7709; i=bod@kernel.org;
 h=from:subject:message-id; bh=00/ModJCoaWSCuF1QBJ0vnDMVXETFJD5K8dpM51LPgw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqv9TEAEU3L3sWA0wvioraUXqAIOkGScFZosyjT
 IGTMmUMZqOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCar/UxAAKCRAicTuzoY3I
 OgcAD/9VbGBboeMVzO+kTmyWq63PHzXfYEY0eATT6arTWBBCJXjzPcRyAHPT5O9iwtv5fq4DxDq
 hsax45xoK6fgo5d12fJuanym3R6kzKuOWg24WzoBYbCqLML5Z3oAoWts3W6wxQUuBTrrScYmAaE
 nXl1xnzXZ7ocA5MmQ7/iEYvjmBuo16cwM7ogHYcok4tLfeefp2zKpaNIbB6nJTX15AgccPv9wsg
 1dXksffTusRJdBK4tFWW36yMWeGVLejh4duFjew1v7AGTxfyHnNxny71eifl/RfmXj/cR+vKEXO
 0nhTaDvaPOO68mjssLnaBUWls+d8T4rL3+qf4HJq05mnwv5xAnvKfwHjQxGB5/vMkBg9TfbmXCv
 IgiLAlo4V03qDZc1RvV7THZenkGSyjhnCITMlgicEoxUOVEGy3twRaslXEuTPEW5YzNNMenlEu3
 pevxizhkGbyI9yq5226pzzMvYuZNhfx8V5auVOUWoOYZzH288uRs5mAUBJfOtXP2ggenRLTYj6L
 3PrteV2Hn0wjsIXxUlOxwP6JalOEu6EATzRyEvvuE1fiZ/sDMs60HuYtj0gf7e4bSZAWUl8EmIh
 WYBEufBAjv+2gq7FHlhKAFxHr/uy87aTm5zZ3zH+3ADWKp6q9RJ9KgVdwXD62KK/wMLfzPsHbph
 cgzaHoyYtpQVtJA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Conjoining 690 and 780/880 class VFEs doesn't make sense when you consider
he write-master indexes are different. Clearly these are not the same
generation of silicon and the code to support them that way is cumbersome.

As a first step to fixing that, rename vfe gen3 back to 780.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/Makefile         |  2 +-
 .../camss/{camss-vfe-gen3.c => camss-vfe-780.c}    |  2 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  2 +-
 drivers/media/platform/qcom/camss/camss.c          | 34 +++++++++++-----------
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 27898b3cc7d3c..e82bc8141c241 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -25,8 +25,8 @@ qcom-camss-objs += \
 		camss-vfe-340.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
+		camss-vfe-780.o \
 		camss-vfe-gen1.o \
-		camss-vfe-gen3.o \
 		camss-vfe-vbif.o \
 		camss-video.o
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
similarity index 99%
rename from drivers/media/platform/qcom/camss/camss-vfe-gen3.c
rename to drivers/media/platform/qcom/camss/camss-vfe-780.c
index 22579617def78..6c04e3c64b841 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -174,7 +174,7 @@ static int vfe_halt(struct vfe_device *vfe)
 	return 0;
 }
 
-const struct vfe_hw_ops vfe_ops_gen3 = {
+const struct vfe_hw_ops vfe_ops_780 = {
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a378..68cd05331ffe7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -248,7 +248,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_340;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
-extern const struct vfe_hw_ops vfe_ops_gen3;
+extern const struct vfe_hw_ops vfe_ops_780;
 
 int vfe_get(struct vfe_device *vfe);
 void vfe_put(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a9..156e17a3ebc6b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3208,7 +3208,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife0",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3232,7 +3232,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife1",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3256,7 +3256,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife2",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3277,7 +3277,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3298,7 +3298,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3523,7 +3523,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife0",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		},
@@ -3550,7 +3550,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife1",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		},
@@ -3577,7 +3577,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife2",
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		},
@@ -3602,7 +3602,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		},
@@ -3627,7 +3627,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		},
@@ -3925,7 +3925,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = false,
 			.has_pd = false,
 			.pd_name = NULL,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3953,7 +3953,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 			.is_lite = false,
 			.has_pd = false,
 			.pd_name = NULL,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -3979,7 +3979,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4005,7 +4005,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4031,7 +4031,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4057,7 +4057,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}
@@ -4083,7 +4083,7 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 		.vfe = {
 			.line_num = 4,
 			.is_lite = true,
-			.hw_ops = &vfe_ops_gen3,
+			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
 		}

-- 
2.54.0

