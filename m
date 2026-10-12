Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26C3C108D
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810208; cv=none; b=BAeJoUbtOLOeoKj02A5dAF3ALa4QCAVVczLigRpQBe72jHOoC7k42jUp8yE9fS+l3rWUrT2qVSTe9qn2Yagrj8S2LxnFBlgFgI/209Cbp/Z+lTZAnISp6yN2faFnLgQoeSRBlBpX4f2rl7QVgHDwgbNn5XMgH5cl8VldCc0+k78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810208; c=relaxed/simple;
	bh=4eFSyiDmd2ZxmoNE8OwStpaw8zUdwL2aJ3YunvWRUck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qnJedlNaMXomHuIPw5QESGFhUbWZCnsbU4tcV4tUvUZr++BAR7RUl+3Gfn7j0Oz5xIIvyotmyybv1N9hcRUMaw++oTt55g/mPz2BMy8WD6DPLD02i+fQI0Xx9dASNGUwoNk9fkZcXkMmz+Co5U+a9maWsIrvXMTaQHjpuYFC0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=g/R9S3Fc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="g/R9S3Fc"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48af27fe287so1602330f8f.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810205; x=1792415005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYh7XnX19z/zJw6PTcI1ox8qC0mffPmG1CPnxaVd2wk=;
        b=g/R9S3FcgcAQjXXAT+UJignK64wo5XbbnC8Dm5URVo6HqXmwnvOqsYrNtQP8bLKrIk
         TXwF0j3nr6Qq8tJjkquntZPKMxZ4AoxzbbuY/LZ8bF/7o+opn7zzHKcnbH8eVQ0+H36n
         TtRFeYYYnmImZY1RagCJfjVI03IJ8dlf/QuGQHVB+lFNEiH6eTIBgWC19Hu6yVe4wsXH
         mhCXiU2V3R+3qfOJoG7VPv3GuNC/oBzQoJEt0ivBbd3guxU0CKURzu7zY27mRUTLFIag
         jvu+Iamm2fg5BNeHBq/iCSu90FU9q3cVXCd9PJ6+Bd25vypOWzMj7ImwXbnR+AmRQ0wX
         zMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810205; x=1792415005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYh7XnX19z/zJw6PTcI1ox8qC0mffPmG1CPnxaVd2wk=;
        b=FRkckOwNMU0u0NcfRi94kPpec+qZNgp3Uey4uESxwejewoNXoz8gXx/3XRyLhsjrmA
         DvwqLAjyf5VwXtHBBsgfcQyidaw04qXQTWdi4L3J4r3eOb8+XRAjIKOo8rdrOd+egxS/
         KD5vmedoz7cvY3JoA1qy/FS9Qt7KKqSbMTIccHm8t643zbHKCBxSKtbx3yEpTbOSIOmt
         os0iiGDwIn0PgA7fuuVrBMPI8VtzhKoYFOWTFxaeMprkQzVyULotoJT/lXQdJd2dwMIg
         QWVzSMdoShJkfbEQMbGphHq7Vt3CNOqPEfju0vuNI8NYztLUnhtD1QqDBdmrAu4+CSRE
         B+Mg==
X-Gm-Message-State: AFq9FYKi30uTeeouXGl9rWrIuamploAGZu0tTvaVsYRsaUNurt7GjdtP
	vB6QMbvxnWyi20s+y3fU2jsnSkGsUeNfTZF5XIjhnug9eFoosTwu9iaRyAJ+bYu/o3A=
X-Gm-Gg: AYBFou0XnLAgU5G8rmVTBzN07LLgfEGjuC3OvuFjOJOMKDq1oO2u8UQnMf/1DFsce81
	e9UKSNlS7Psr+/UJ+53Gs1ML0FUePGwE8ijGhZvLSbo1YySakSNQikpMrgeKnMqvxOzoFzTf2YW
	TjBPuj3+6kB6ciKTqzOrbs0QkhvxFbod63/USZx+Cu+fivupv78Cqo5C9cnFsu4s0oXdB3kQlU7
	ghMDaCo+rYBbYSK2HGr2dnskuGBa/J3KYt1S/1tHeTDYsy9amZw/39h+VpBsL14T4epVpKLwjWd
	W338OYmshxEZbDD03nOPrZ6Oj2sEujmncKaKhz0wh6R3kzZZgcJOijeQxMhzIyc9RVCgSOB21gq
	OYuiQ1ijIVzhlbmYWINyV3Opx2ZxS/QWZ5nbl4VkS9quFdau1cXWiuy6rcJaZhHosYTta2PlZfw
	iFKtIZERrriIkflOoREFe5USbOIVnrOkmFUxUDfXwQM/gehCDriPFg961PdQmeQpRWRdHQ6JWZV
	UazMeJ039QgOzoLMmQudDsBtJn/pOLzJByWlVu5nILrHNhxXHTeeFpCAdPR9NnP04WxET4HXNZi
	3eDulDN4mh0v8NBok16dhQ==
X-Received: by 2002:a05:6000:4908:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48ddb2ca05bmr3010994f8f.28.1791810204783;
        Mon, 12 Oct 2026 06:03:24 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:23 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:03:04 +0100
Subject: [PATCH 2/3] media: qcom: camss: Add the SM8550 CSI TPGs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v1-2-620ab6f151dd@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The SM8550 TPGs are hardware version 2.1.0, the same as x1e80100,
so describe them with the gen1 TPG ops.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/media/platform/qcom/camss/camss.c | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5128dae79103..70f327484503 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3553,6 +3553,54 @@ static const struct camss_subdev_resources csid_res_8550[] = {
 	}
 };
 
+static const struct camss_subdev_resources tpg_res_8550[] = {
+	/* TPG0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources vfe_res_8550[] = {
 	/* VFE0 */
 	{
@@ -7245,12 +7293,14 @@ static const struct camss_resources sm8550_resources = {
 	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
+	.tpg_res = tpg_res_8550,
 	.vfe_res = vfe_res_8550,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.icc_res = icc_res_sm8550,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
 	.csid_num = ARRAY_SIZE(csid_res_8550),
+	.tpg_num = ARRAY_SIZE(tpg_res_8550),
 	.vfe_num = ARRAY_SIZE(vfe_res_8550),
 };
 

-- 
2.43.0

