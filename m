Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2671048D879
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813140; cv=none; b=INYeGWC3ZcFDeH/APDTSUNVe+c4ep2ZLWZrHH8HIeUUjhFLE4vE3vLtHfCqUX5xUZlmduR8ETE7f4mvtz9BwCjgpfqXx11lvWwfN/QTne+P9PBIQGdCfNnYxh80zMYbCT285zZxdmCqf2waAJldBRqB265SecjgQJgW2ZjLPbWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813140; c=relaxed/simple;
	bh=jmnOUUfdHIW4UoVgCq1OlOIoITSusSw0zexra8ko+BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULRCjCjCGjDqqzWJlCU2HWwrtStfLa1YujHEf4bk43ps1glw6UmTyx26V9iCYj/mxDhAXl9okdMtqVsOiPijqP8UUxSBJHnVocHLpW+sYR/k1ykJUi3gZScD7XoEMAgfuihydJ5GPejpQeLJ8gLZKe4uyOPCnWY24Db9Vn2rH/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=MZM/09ls; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="MZM/09ls"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4207ac26so1867651f8f.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791813136; x=1792417936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fm13zV7fU/tYSB8SyrRHgmdMzw/bsTAxkTm7l9ON6TQ=;
        b=MZM/09lsT9mjPUi7/UosPBBGCd4RitSZSVanuT6qsJayyQ2yDP857ltXR+AbQc7GaC
         s+q3LuN/w0VtkAxnAyJnzx6zddWs7Dp2TMdwsIBU5msWOKR0Jiyo2MXF/oB7TUK5VbNk
         5jizdoVZ06Zl4jCWwC9dBXAApGDly8FTNRLplBSWMNkWqAAoUdwQS7xwE2Yo2xWWqPr/
         Sve08sU0RELvh30bYCvqqryDWk4VQbX+W0Sy840Ctjpc1y+DNwnwgnVGMiooT3xw7FTy
         QZ3ShY8dK87RYN+/3hpcedQMCvOmczBXm517gRm/OkSKUnl9l4NpGfIgH+wLwHb7U0h2
         Poiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813136; x=1792417936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fm13zV7fU/tYSB8SyrRHgmdMzw/bsTAxkTm7l9ON6TQ=;
        b=lu7qkG7GNszjgfqzRQ2TtIaGo71HGJnMVwj5Rz+DJeOgjd2HiAu0wiKHGbAxHar/eU
         zcKosdws0vkK/O7u3VezoXoyMDhMbZhJ7T4hhiDBAh6v2xVNY4B3gYbie8YOSbVtv+Vi
         62jWGf7ZBwR9M2DlInxJT+UZT4l+NSSs42KcZRg83mb2Qki/oBanZHDTPwLTfWBXBhgB
         03EH9rPcPhCkfPxujoBzfbIkhgxMzVxZIAz6lqWxUbCxcrca/KL2dz9E8Noj/E3KpiHW
         dbxh9I3UMqR2+ShTMciMm0P2MXaF2cUuGLHS2AhqnaHpSYlshSw4JSb6X0fzdt+94CsW
         9BmQ==
X-Gm-Message-State: AFq9FYL8HA9ctrS0hJ7ju3jWBR2CtZbZ50kxUbMhclsnP7vB0nc+osUK
	DfQo/EhydVxKLjAPQABDjwgH1rIlWIBJ04Iy9V8Ok93A/knqyrFXeSRIfAAp/40ruPs=
X-Gm-Gg: AYBFou3stDSglzpct8PQxaz8M6UeUTZeQxqoDbdb85l1M9KYXxN8i4KpSTeoDQmyoWi
	PuHmOxCobC1riT44D8EhPHSyseoxDTmT7uy9I5GqiF9ucfeGdZ3MUGmYgpaPEfpIfxvr/R5nuCJ
	rOL83uUWdX6vZjUduZc9nSDFJJyrXWm0ba1oAfBFzc7mgbfuXtDz+uDaQfRHwf6V9UKPcRLa0cR
	Qq7TLABj729Dgm+6Dey9/ns+p5dCKWc7M3CJnulNPnn5YZQDKkSoge7VR3NKjA5V6ZFGQPMEf2X
	X+Mr5gIT0jmAE4JuhUSU0PzJvpAf7mHX/tQA5vbiXSKe5yHoaeIW55vNw7Ujh1lBplc+gQjVc5G
	h+RZTnf+PGfIsZLk5//daow1eN1I9abgrLVm7u9YzorOJnNZSpovTgsnIOiTqdUvEW4kyIpXBlp
	w2itMYlgIrgVy5LY6meKbcR21Tz5bWkkG1r1h5LVOuh8RSroVlDOwc7RcnS+WpCYwF5Y4mhWelr
	PuATUWh/x2gfyjqd0SGdkjA7CoKj/tAWNXLMXmB8rKtyvlYzbeZDvaOL2YtOklYTbLOzYqKGU/2
	ZuL17Dy9xOKXCO2+EojJtA==
X-Received: by 2002:a05:6000:290b:b0:487:2805:6834 with SMTP id ffacd0b85a97d-48dbace156emr16771065f8f.42.1791813136282;
        Mon, 12 Oct 2026 06:52:16 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm21355523f8f.16.2026.10.12.06.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:52:15 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:52:02 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG regions
 to camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v2-3-06dbbe36ecd2@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
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

Add the three CSI test pattern generator register regions to the
camss node, matching the updated binding. The TPG blocks sit at
0xacf6000, 0xacf7000 and 0xacf8000 and are used to generate test
frames without a sensor attached.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d21c04b1a306..1270ea8e4fdd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3862,7 +3862,10 @@ camss: isp@acb7000 {
 			      <0x0 0x0ac71000 0x0 0xf000>,
 			      <0x0 0x0ac80000 0x0 0xf000>,
 			      <0x0 0x0accb000 0x0 0x1800>,
-			      <0x0 0x0accf000 0x0 0x1800>;
+			      <0x0 0x0accf000 0x0 0x1800>,
+			      <0x0 0x0acf6000 0x0 0x400>,
+			      <0x0 0x0acf7000 0x0 0x400>,
+			      <0x0 0x0acf8000 0x0 0x400>;
 			reg-names = "csid0",
 				    "csid1",
 				    "csid2",
@@ -3881,7 +3884,10 @@ camss: isp@acb7000 {
 				    "vfe1",
 				    "vfe2",
 				    "vfe_lite0",
-				    "vfe_lite1";
+				    "vfe_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2";
 
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,

-- 
2.43.0

