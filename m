Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD1E503BF3
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057796; cv=none; b=KJ9dqDcdFwYs//K9NnGvJkQfpw3NG214lds+uy71k2WIX8RbSQPhygFxfxnG+QPNjA1dtIuyxhHLAt9rWD2/EuCgN722DOg2JIFt6KBHD4J/2q3VSxgTv9KKfDg7J8MYIUEkstZftbAlYsxil6c8HIojsCU/w+ct9avooZhDAyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057796; c=relaxed/simple;
	bh=XvgF8W41tbW2lHMVahBlNpldH+YcMd6GhMO1LMhmmQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTi3lsDETTzStDzOoDqCRv78NqMtoJjzqMtOrCNJ/pVpf175oSn5bl0fA6xr8cKy2aXxauK/vqXF2vyBZ8TYrlv6VWrcb+4vOBxgOtRL6LfsxakOEQDWsbt3rB2UeO1Yga+eJQNv+0mqjsD60cQz+xhX0hsF4ierALgI2uZ3Ggc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=TE2pV2Er; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="TE2pV2Er"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso845246f8f.1
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1792057792; x=1792662592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=TE2pV2ErbWyO2WMD2Fcbc4E8S81CjYWK4KuVi9T8eLJt1KMokHRXRQY0pwghrIW5y4
         IN2/opPASdAgkfDSit3BhHCy0xBVPqcd+FZlnfdYB3XADBRJUwG7kCL5vsto/e1+MA+K
         65e8H5YrbiCJztujWY7C9gaGRWiH3NOjAH8MN8US2H/vNIFWUuV/c+Yg7ruFzUj0buiJ
         IJ5oFyrYCSUSjflpNHANQSBLoOCDELeCwlkKFeZj2tCKyb/KNyLbWMSlJzK0QXKPzo11
         VrRJpxIgYNr1WOP2Bbfe1s7r53dF9DNsE71sSQg+3OKV8gwtdKTzo7RoReH+rjnCF0Jt
         3LRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057792; x=1792662592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJMs8A9Ik9OWOlzlXjQ55DgLEVWbkbVkWzr7Q1/LXyI=;
        b=rUCj+spntUbJI1IXe9D27iOCrkG6Ud8wW2OHFo86Bq3KlOPF3YakMGxyGLmKhiMuKM
         ftZrKuQ1fxFiEgtIJBmVqFIVd/q2b/BCRSdfZ77j6XR1TUoH1dEvkyO/I8x39RY+pXXH
         PE/hzSPvmTefUyrGLbdjV9qrjokBYKj9UpYKj7SH1w0wycKtP5u0+YqxzQWAz6v1abME
         VOySqhEDDOnnK0lVErfPwQotXnykA/3gb9CgMYZPA7USrf1bEj6cjgPaJ25Vha/sSFoI
         NEKastgSkdEUiBf5Zu0cD4RGiYi+QbZHOtOuo3ByloOjjKIm3GO4dT42E9DaUQpykYmA
         YsOw==
X-Gm-Message-State: AFq9FYJ7wz8EUVczyayGOWfTeitFDjLGKLre3b9g5HiUBDNIsS8byDkp
	kE7xNibWci2MsuPdju6qO+5w/Sj0NYuM8iXS7EOo92ShiLkDKhbKz6fywOU8MmWIuuU=
X-Gm-Gg: AYBFou0e8R6a2prdaIyzvmsO57qTbmnPBmtkx4B7ViOxncmpQCsdzbtdpC2mCLngz3W
	N4P25tGMen26tgaiF8Pa8UKcQIcRhZpuUl/mQVUkBorExGYsqQvC9SCUGdy2h32v9susiWRAO2Q
	x3XRwxYBQdhFx5h4yzJPz0xjlXuayYvzNrYTjtPcvJlodEXCFLrWIwXIXLVdEF9OI4ICoK+mWDg
	qrbWvsz6La58HnnOdtIR51Q3jiN8zZ5XrYTWkFEs+QEggIe6ZGBDNLog3P/mqwo8eZsEtJ8LWxb
	7TNactM3v+eb42GnmJ4f60koQGUISk3ExBQWN97wDMGaOvzzk2HuL+eZmFrAyYquvx9DTbTAbHH
	V0grkJOhz9pxikNdrCybaKKT+8BhAdXmDsbTqLG3fNyTj0wGm+xYD3NLVtTqItQ2dNYf+97HJw1
	ogzZ9fsvneZcIEWPB/E7P4qqrinufYvhm+uOqSZIUxhTNx7lk8WncDiA0mSzFivmYVbFQsQmaU1
	xGokP7SJQYc4yJtUvjHa8m3+SxYfgb690zw3kR7WjK4RqRduQNnW2SJKxzIQZe4k9j2TPCjm4Jm
	+X9M9zUsHkfJ9n3AbNeF31USHJs=
X-Received: by 2002:a05:6000:1a8b:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-48dba9bdc75mr37096945f8f.14.1792057792694;
        Thu, 15 Oct 2026 02:49:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:737a:1f7b:d586:a293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm16926246f8f.54.2026.10.15.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:49:52 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 15 Oct 2026 10:49:31 +0100
Subject: [PATCH v3 2/3] media: qcom: camss: Add the SM8550 CSI TPGs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8550-camss-tpg-v3-2-00fe06a3c557@imd-tec.com>
References: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
In-Reply-To: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

