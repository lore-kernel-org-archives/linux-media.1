Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2464148E0C6
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810210; cv=none; b=MZkWwOMsahMjmpqFJ1V5o8he6I2G/An4VLDqpQd2oNNMwFje5h/HyjN16PorBsWRQkep9mJrrrnjAUx8FrhBf2PI7IAAzIWDC6VHX8P+F5zEoJFbEhqRrUO/06gEqaIyKmzuwMRUkna4Rj+MkarPvCWpEsCRRS9Ju4aeVW4iI2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810210; c=relaxed/simple;
	bh=zkC632+RCs8j2vy5IgxwE37PTmSh0rh7tfcdd7o+YNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lG6UNThoaoCbRNsvWt9692DLTP/R+oH8VWt3GEJCdwdSgywzcrnjdaqvDWqroyOwIIPkJHLaMSOQWq1FViXsGnvO6MoujSz+VhMHW2BPxrXRlZ5LBVE1YlHAjd66e/PVflDpCPyveICaQOQyeTo2+qGs1gk140na20X7wBXj4sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Pd8C7xtS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Pd8C7xtS"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c411d6615so1245368f8f.3
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810207; x=1792415007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJqiAzF2WxkI4SgNTbtZ91E6hshmIIcV6+9m6nd3PZo=;
        b=Pd8C7xtSBv34TuWtGz7NX9AAt7dzjaREJI+07Aj90Qy7n9N+s7gic40+BULQSeyh7K
         +V1sr4dOpah+zWN7H3z+3Tk77cHHmyGRQGQSuFHvHIfWU3GYO909ESaMeUIqopivxP+p
         fIL4gSTpeHMmOjEQBq/6dY7NqMwLA3vl2N75y7VN7TJmRb5m0DZw50yqHwT9HONSHGVx
         Ht4QVR5R2MDmj2rhgIOFsalRTufGFl52p8pSueVIETj5XeFRs9eRuCbSfGexAaOYKiOd
         sAhj0OTrs6baFzF+PHx77p2N+jNxXPIWhR1HXnQLrnh6yQQ0uo575YjENLvQfIV+ajqv
         02WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810207; x=1792415007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJqiAzF2WxkI4SgNTbtZ91E6hshmIIcV6+9m6nd3PZo=;
        b=lKMVklgdiEmOCMdcqlO+EAUq78dr7lwC7NTvDXRHMoIZO7X9Xpn6XtI0mBPWcTtpWt
         bsZ6FFg6ohMKwXS4VaKlNSZzppr3iLqrKTS73PPlP7JPB+MqBTOjnTRgi/+BZt9PN/xZ
         1MUuYp6G4V+iZyh4VhfQzrMFlXLfyliVaRabSJMk4d6ZjaTTPWM2pfJ+u9F+gX6GdIMI
         J9m+LZ/B7ZNwBe3m6vLAJP+c08pHhaElRsa0oSGc5Lyh6vWzGI/5U/hLjf97xoOoGGnv
         SzMMUt+0HBzeGZg4BA5Bph3/oSZyWYd10dxoXziq1IppPbc88Vn3pRZMxDVEZFUO0KI2
         yAhA==
X-Gm-Message-State: AFq9FYLIZ9anaSZV/Xu/EJU399zApOKEkHHQwPZcL1CF7KxCb+mLmy5n
	vLbeLf/MpvibKGWqnLFbI+4j25Vjoiy9z+1YSBB3OKs7j3u1uL5bktgPvmLP4TXCKaE=
X-Gm-Gg: AYBFou0yqDdv7ifA7zdZp7CWkEIAbNn1nZV9XcbCINqkjZNP7LQwjpMCEedZFniBI0p
	v4Ciiw+aS/vF79D1dechmBUkZxLQXOzzTUqXdEKxYR146rdsySeUWzpFFJZVPIWHLj5rKxohrj6
	cD9UT9iHGobUt8yZgBX70roXuCzZMRT/m8xCCI/8HOY6LdjZ+azaItjfBCIdYuxKzeNw+GLSr97
	TSMIYYEiXlr1ldlIuGRQFIyJH0rZjM4J7sQQJ7V7GeHcxOiB0pUPIFUjlMPpsWzWUGk+70QdRq/
	JW93gIBU+17C332Lwt5LHDvIqndyJBNNlyrqEUhkPmkq8YlUogjf/4JGkk70tdL1G1cmAXN4SAa
	VSoHl08vrHMk034ffOKvzkAyLxVsZ6/+Q4l3q9hG8UC8gv+uefBi8uTD+Pudt9rTN2zGMPsqkj0
	z+K/1wW+dBzYN3qmzxQKU6O0c9n9USxOuDYLjmiMvTndT7gxa+1ChQvGV2pPX6cO4cjX9OlW03M
	7ssi9ZW6dYIjTXJj1bYjXbpUbcXt3SO1vu6Zws04U1sm3llIUWRUnj6TXpDCUm7chMS4V63q15e
	kqRoynnniJqzo2PFhSz+FPOk7kHw583n
X-Received: by 2002:a05:6000:2002:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-48dbaaea8c0mr15810644f8f.23.1791810206335;
        Mon, 12 Oct 2026 06:03:26 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:25 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:03:05 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG regions to
 camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v1-3-620ab6f151dd@imd-tec.com>
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

