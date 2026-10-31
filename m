Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445749;
	b=TtepTqAHIaOgMYvrHUqAx8YT/sFXEG+fwBgJs/LzPrlvMte0fouEf0sVkwjOIZF3t9iD
	 neCuCOxOufoHLjDXDdeFm8/FdkuADJEZ3jF/eeIib8X2Ojpz/bJ2FPJef+E5fJ/OoyLUo
	 B0E0t2IB6gHbue82M774qazcVEWpNlzWZhpC3D2bWQWlLepceFbv5x3jE+ubqAsG0MqV0
	 Idr88qIQnQjSpMi488WZaNddxYx1jj0JaxfoiclpeCF3L66H3nfb5MK6dGctSw0DaCvXs
	 BQ8aig0Qq2SVJJ9U2vC54QwYjtlabD1DTdgRtTek4N861ZQzKbt7g2blTCAPZxU6Kxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WLBh5BTo8i0xLs394OGDtDxi2667Fm5jki33+xLbOY0=;
	b=wwr13Tgi9FfjxSjUpZcYaCwc9cPmqSX/1iUftl14gfAPk5x/siHU8ke3smh8y/lmkeYV
	 g0kWVJb7hToqaUuA7L+W/+TJFG712slDo3Dypudj+cknXpM6nReICYJtTA5z4/dk4PXFC
	 8+rod7Xu2+aF0ldXu82JFWCLTzWOSBTMD956JTWDH3pxDoVStdRFK9qqQZhtOeub/y+Us
	 14vDGRoNuz5F4l8tIT5Egmi2PtzkIaZJfbNcLQVeVy6zdvwPOHXckDCDLBM+KEOSnLqcD
	 TWi9NMriBhSIRGYOjHUlud8Hcdy3NW4enTxyaEuEBBUeHPRC2XOtZ7bK6k6xs0y/YNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Q89w/7x0";
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1662E606A329
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 11:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1662E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q89w/7x0
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so1924391fa.0
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445747; x=1794050547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLBh5BTo8i0xLs394OGDtDxi2667Fm5jki33+xLbOY0=;
        b=Q89w/7x0HRK2iT442mfAC0Z/blCfysHmO3lk80m/FjOgkZKEmLtVzj32YWikPqRi4U
         qutZF3q5D/mioJ+i5+kpgidXSzYCX9N+Rs8ZJFLCO4ha7GztoVnDD24V58VAfSdNeicv
         SfjVD36PkV0w7XlWvtZOjTCmaieBbBrOGzLq6Z/pO3IPAKij9Vz7xRLV1mGAi+uX2zMT
         vm0pPHf+yZAFjP9Y2TQFDgOKcj0d7eVx3h86k5+OnW6Rcc/GZLOSbruUJXAenQ76+R/P
         nAW0LGVBxP7mpY3I5VysYCyAXBQ6ysEpwyjDMOR/asLyzfE2LbcQFrwEEk5+TrIU1nUE
         q5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445747; x=1794050547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLBh5BTo8i0xLs394OGDtDxi2667Fm5jki33+xLbOY0=;
        b=pnfUbcS8WvFov3T/2/nyLMlwwVK8fkjFAg4J5hItrDvHxtj8xOorHA9WPcoyJjWMn4
         6RFGGB9dcwQaJ34Prdxpm3R/71YH9Uoo7mu5o15BHRX1ff9r2rdCtobk/8ctqSS1wXhT
         gure8VN2Bo0OIAHaVs9rg4wmKpNBl8aSe8zRZ5KX6ZtnR+AlfsDdEqatqeIybJc6Q519
         0hif38T3z2+wxSxDMesxVXrQYAk92/qezoMVK4IpeQ5plObDopBVEFYF8seMyCs9GLgW
         AGAXb8KGKSlhGfwi9FH/WYwiP1w+HUikmUZ9h1WRczahuuOd/uZFzlF5Qw3eXY3o+RrD
         BnFA==
X-Forwarded-Encrypted: i=1; AKwUvBwWO9PeLwb5364pSWLAfFzJhv555m+FJCglFwEMgtV9ZGEgS8PGjPcbc8iCwuT9XcW/gkovOUl4dFgxxg==@vger.kernel.org
X-Gm-Message-State: AFq9FYITMoeiSXr4hW79+KJXxKzVHFHGxdZQ97EgyolPf72eIK5KBJRY
	JR30WuWcTIisnFF7K466jQjzNPaugc2dvnQxdHvC+srcTCbQe3Zqp+QjGiczNum5rH8=
X-Gm-Gg: AYBFou1l32ZUYnpAdm4LHJMUq9LRp5czeRTRSTe7fW5V6sa1DoJZwTIphFBMu6gN4jc
	ZlBPkdE2OEy8k9xmWM7LBx5JcW7b/M5bCDSYdI6AyyRXjDv86HlV+/5m1YMqGALTmxQVFiuFp/d
	Me8YJYNIT5xqird7mj2+Wfj+FMFHRcYV40uvsXyiVmy82sKGMT6uGJcD8yuoM2TDuAUHbBrHkWV
	Sy0EbUiiOuC1TLmXiAwgH6U/oaC9OQAU8xhCcpmVLV9V/W/rl9gYVE0u4Hg9s/r210TUSmxgGAD
	YreS3RF1QatWrCQ26NjP3uQLFbey6YG1OEM8SPf0xA7XVxNZtoDV+Mi/NW7wrohuiOtdQlQkTjc
	f8Gt/xT2hOXnHd83SSDZhA3Lznzm/PBO7coVq8LEoDutyy9JKdvocrHQlfqJVopgq+3LbUZgsYD
	C43LXf8w3OU0RnwVrprb+KAsu07VmjNT7BzapUXiF0FqJPHrmzSLVofXrZKEkYpvmZJxckJwIS1
	KZjPgbsYWbdCrjkpyOcBkUUjqFlRp6OCXJDyqqMJfB4sJHW6wkZtzfQJdj1sYwP9gK8upWMik4S
	AxkUsX1yeqBua2U3UCw6yulCSGWc7AUmTzH03nUkgJW0JKySSvWP5zfPRfsL/XGdR3VSyQ==
X-Received: by 2002:a05:6512:3051:b0:5bf:b9ef:d033 with SMTP id 2adb3069b0e04-5bfd9590eedmr2006098e87.5.1793445747319;
        Sat, 31 Oct 2026 04:22:27 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:26 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/6] media: qcom: camss: Add SM8650 TPG support
Date: Sat, 31 Oct 2026 13:22:02 +0200
Message-ID: <20261031112203.545319-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks
of hardware version 2.2.0, add their resources.

CAMSS TPG on SM8650 needs the non-real time CAMNOC AXI clock to be enabled,
otherwise VFE receives the frame start event, but no data is written.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 53 +++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index cf4687a20dba..9eeb7e4a7315 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3423,6 +3423,57 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_sm8650[] = {
+	/* TPG0 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+			{ 0 },
+		},
+		.reg = { "tpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG1 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+			{ 0 },
+		},
+		.reg = { "tpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+	/* TPG2 */
+	{
+		.regulators = {},
+		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
+		.clock_rate = {
+			{ 0 },
+			{ 400000000 },
+			{ 0 },
+		},
+		.reg = { "tpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_sm8650[] = {
 	/* CSID0 */
 	{
@@ -5786,12 +5837,14 @@ static const struct camss_resources sm8650_resources = {
 	.version = CAMSS_8650,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_sm8650,
+	.tpg_res = tpg_res_sm8650,
 	.csid_res = csid_res_sm8650,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_sm8650,
 	.icc_res = icc_res_sm8650,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
+	.tpg_num = ARRAY_SIZE(tpg_res_sm8650),
 	.csid_num = ARRAY_SIZE(csid_res_sm8650),
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
-- 
2.53.0

