Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B11420479
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704467; cv=none; b=gesNCKGYnspZ6t/xvvTvXHmpZboeVEwUYBFs8UKiKW4/sfO7qAcZl6weurnRvLGVX0RAWmFvZiZjRpwbDOE/pACOJy7ueJf10Q1C7EBkwUmigXWv1v8lNlmB0nRpU/bBo/WWB3HiNl19JVlWYb/W2eFnVVOfv77MN0nkKrkZX0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704467; c=relaxed/simple;
	bh=YIHQ8bdlgjCWtdVge+nC3WQMRQ7b+PI2QP9xU/aHDok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLL08LlcBDLqzqvDvNwVQ1rYGEsmMQeX6blpu6bDyRc+o3CkvkymcPxCA9VcCMmgiEJmnP9maAY23XFRfS2aJvYjX/ux4BeHC8Dv/dFX26Tv8C5C1HIIy41hro9H6J8r4R+X5ey2NTCduZwjpoQ3O7IeDRVOk5Isne/rJ7nRRKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C0gb06Rd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0gb06Rd"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48436251906so2951900f8f.0
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704457; x=1789309257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofKngm+I/M34aU+twd5ZTUQtVapU3M8PXngwPLd065A=;
        b=C0gb06RdZhU0/WoACZyAiPQtIyLHZObpSO4sRSANAOB3G8wPlXIoKqZJDTfGWgeLb4
         cc2sgmM2cLztlE6nElNjXGz115wkf7wZrGCyu/TTo5ABSjHJargc5Nf7IVgSCmYeEt+q
         E1/5oYwGZlXqnzsXRRTpw5iEjl+RKqjEDcj0GRWz69/R6BvhLiDSiXJAt/Pcmh4hwqgq
         FHlVYtVV8zGo7N24Q8EZWJhmJJNSLIR5KMGPgzBLVki0320X08MFW0e+ISJMsu+0Js31
         W/WHJa4An48VM2g+snIUl8jMAvEZ1P92Ucxmurr3lccEAGnnGCQ6p/rqF+tlQ5OQyngm
         lBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704457; x=1789309257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofKngm+I/M34aU+twd5ZTUQtVapU3M8PXngwPLd065A=;
        b=ac/FqkvVsRo31f8PuqsGTeGZOJT3IdE6y/uwT9pmbuDGiAwM9+Iw+4fA/kfixgECSJ
         S2jrqL8EFSfsXY3lwX641lkbBePFSNPkMLeC7nQV/VP+I+d2YmgSlrZo+6N+h8ix2UNg
         X7DTB8E77ChR4W27j8/QNb09qQnNYK9iKfiieQ3v4rmoHndXJ+bND8MASmGdgEE2poEc
         YCmVFfnzzE39gRR4hZ08RKuaMSHJA155Hx/bF0a91gy1tFv/LE04l5wYnwqdHhC4koGQ
         MxIKeMuPNWbs5uKKBnadLKpRXakDIta5tl+olkbiUnXswh1T0vpntCn2EzUVdTpLnnbZ
         P90g==
X-Forwarded-Encrypted: i=1; AKwUvBzbiF9T+2N9ofqoZR2ZVCmS3dwJF7UUyJ00wWPCnNNZyhiT3M3oB7JHFLqH3YXzaksZlPecV+g5y0+aIw==@vger.kernel.org
X-Gm-Message-State: AFuF++nF3c2MGXBeN+cXezcrBhj9QIe8OqSG/BjqXDrZXb6MwC9BOch8
	xxz3V8R8IKIqZRAqdpMhFO3ABBQWsisC2CU4q+PykzCsqk0EhW3CHt5WkD3HQJdZOts=
X-Gm-Gg: AYBFou0hI+hDtB/3HjddZCAxtf6TVLv8MYRpa+/tHV1xfsIB32xuEmF2qweVMyRvtw+
	JnNlLSHIrReu5/RzLaWwjisvwc/jdI1mYEAQwOc5cz/Cm8itHRCZCGDT+hLEVjjONaS+eV8D5h9
	n4SpmHYkz1/tTzfEinq8OTo5Kx9knO7NWKfZrXQ73rgMWyB/H5sX1oZqhIUOIL607vFr6bwe4sY
	d5Y06L6ZvLL6OLaYyS4fQpOqpa5+lKw9EbxXF2l8Ygs88luW2MOvycY1mkAW1r+DCHjJ1G1i2ri
	bM7omMXAQKrDW+KwQ3c2wgln3zykgP0bhnqRFxWTx6F0BgPy+a03A0x37lu6LER61uf3LkKHeTG
	Vhfq0izysqA5KbIBw2awokM3MwzMlShfzo9lH7UGpqb5r41B0zDDFjS8TdADUc2HMNcFTVlUbux
	pD+RBcY2/8JleH8WXZTJHEjV1H6zm/6hceZapFDbbabaHbcGpkW+Wwo7sj+7FW/SwGPuiVFQRH
X-Received: by 2002:a05:6000:4b11:b0:485:8313:9f47 with SMTP id ffacd0b85a97d-48587055d09mr38014108f8f.10.1788704457227;
        Sun, 06 Sep 2026 07:20:57 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:20:56 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:47 +0100
Subject: [PATCH v6 02/13] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-2-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=YIHQ8bdlgjCWtdVge+nC3WQMRQ7b+PI2QP9xU/aHDok=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbAfxjrBoWUGTROeziaeSPkFbevesbQ2sXpW
 FJ0+JYOQ5+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wAAKCRAicTuzoY3I
 OhuBD/9nXeDi17lPcTvah/9ZsrQ3ZkP3QU54Q26BHxKThpQl67qQCcQzLqvKTbqPHx0ZZNurqym
 mrC58Xp3zt4T2kcQPsU8nGv1wDkZS/ruXc+tdeyEflFOwF1T6xsAkkUQupTB4cXDJmQUjOBHlgT
 DJ39P/fWhHqks0WZ4IQanVYYClTHCoL82TlQwupYdl/Ntjr0Pz82qcumxsKQ0UxMPzgBPaFPJ94
 nrFPq6rodN0gL/0XXfXBHiy2MWOHIy5Gw8apD2AyhlA0jgycQl7Ijsms4h5HIJq51soD097byR7
 dj2py/LtQTf/0H93qj4iOF0VDYa265q/phR1AdQS4pENHu/uL181/S9slkFbY6TGHdf1VghrSBi
 lO5D/6dLaUWwUj3qWwl/VUmgQohzZmdMcfPmkt2e29oEoJw22XD211dG10tMQAai3LYLy1UKj5l
 rwKtjubjefXrT1Py2Z2nIeARFL9MRTGBxsNyea082ig64Z17UnpBIwUHH3aXGpLx3FCtDIIROG7
 +jJbW8vKiixo8GbwlImGovu2tIpglUF0AuSjGlQzD8uduh2V0XNj2PA+ui0iz/aGlm0hl39FEWC
 rjgGSKxbasmJ4IokxtBJ6e9AxNaRhkhnfFqGY6pdz3iFWsai/yCLybTzx4HMZ8FH7brqpKRwyx7
 5UDYq3jK+xrINvg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The vdd-csiphy supplies power the CSIPHY blocks. CSIPHYs may be
described as standalone phy nodes carrying their own supplies, in which
case the CAMSS node has none. Make the supplies optional; existing DTS
remain valid.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 126400772d028..57a838fe2d229 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -186,8 +186,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false

-- 
2.55.0

