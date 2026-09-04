Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DF548CD47
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519410; cv=none; b=dl6aO45G28LSt4Bzy9HV24PmuTfSEPBGije7c+w2lkp2aq7CiayP2VRomRIZEe2nM+GQLhiUluP7HGTj3VpNVBNe9kog6045zcoX5g2CY3xCeijGtpVlZX5RX4Fi5C8xunVDCAevf2TURzjqJwWjOMO5MTf/AvXR6Suo3qdlF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519410; c=relaxed/simple;
	bh=lZbSOiq6PpWvGtztIT8irq1yq+3657nUu17HzUf8NSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=miVasBHFaXYvcm3gnXiMVtw6jDio3tbrJxdm+T80zxZbaqbcFVUDKzAog+W2Ahoh7OkT/gXPbw+bePBrv0HIqVrkJVdm6aGkZKwYqk5G5Hhvb7yb2OO3CCEzC/snNIDoc21KEQSwHKHd3acYXBBbVw5KsxUe5AaPfPw0htdQ9ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M9wjuMhw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9wjuMhw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso13585135e9.2
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519406; x=1789124206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFACwW3FzP5DW2PPT2LJDEH+gbA8r2g7VY7yrdZmoeQ=;
        b=M9wjuMhwdg+cx/Chidp63p9aWPxGOLBzIGZo2Q6ZcAVjUwzC0cxSgRWDc2fy6h0e7N
         D6SRtw1Hi5MvPJspdH4GhSqgRHoqI+NufSRLUQbn3wOo+cNepmgmUtmAqheXYR46Bl+m
         dE6HBQBuNPAE43wUuozjgOthA/kBEBNDy7BjWwdXx4GZQ1HfuZ8KrtfIrvrJ3Y1KqpIX
         FeDjeuJdFHvhi7T7a5eKw/NgARp6jpiSz3vyfaPwUTOIP7Uc3oaznRqJFFZ7L/x8XFl7
         PlHFrg1aAe2WTZWnSirRq5aSe1lr8Zp3Lk1xTavBwLFdpa80j0mE/7EJos+k87dxyAlX
         robw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519406; x=1789124206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFACwW3FzP5DW2PPT2LJDEH+gbA8r2g7VY7yrdZmoeQ=;
        b=JqzM86e3w9n+m8E5bGtFf7mCK4tgMzmz+UIZjjglPzY1dkaC2d6KlLFHG/ipsXNrs2
         cu+Iajuwlz50fhdGmIXqCR4M7gTsdD2wjm64DDs29Pd64xvvP3IPvwUKVf/rFp0rSXyJ
         zemPvs1n8WfLAOwFtA8EkIzByXC6nm6KWFp0QmfJLw1qFxWlnGC5aDxAlQd5ABc/vnio
         +7fTyvfoPrmV6GK17NeNjWWioUKwfcSRYCWwrDG1zO0pJEDi/49PpTD+woNFOsV6kmDY
         m73A5PlNqG64tigLGJTDlaOhqO9v991sYKw3VCpNypG6rUM/1kvd3jCq9x4/1RJMJClR
         9zMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkjbh+bIHeCJlS9ATi8RTlFChq2NqZYCMCDoFFkZepnR4O8gXrGZJjAzI7qPWWxgNseyJmUGquBb3reQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l8kFCFLJZw6kvm/T9Zd9ooOw+d/HjrznCXnY7PlSQkjOL3YcgE
	yMNqvIRlco5rIsrHCTbyZmNsorI8qjlpKkno8iFHewwPMG6Af7vyPC6lR8vWQiEcagE=
X-Gm-Gg: AYBFou3EXzk65+l9W3usFn/IpMvaFFe7FRg+qlx4L7lJh4nrWGW3NxPYm3RhdmPLTyM
	UUbnoTgPEcitcI99uGQTs+nZIOEGe94W01pE1+UkqEhcHSD78n+RSlPbCxL+R7tqH54TQUGoeLe
	9uVxdGV520qGQWmlcEPxBY1Wrl7WUc/wYEaLVVEe88QWH7srPwwZRMWlTLFDBnzdeTWM5OxLK7Y
	Oh+gGx63bsteHYtvzbCY4rO/Xoh/tIcu+hyZXewm3qeDnaEG5XVc/KBlNFIbcbNAqAQ6yKg6y8s
	51pFsqId5I3V5RULhJHUiRfj+c2xZu7hPgU45D7fB4NLmxOrB3rL9SD5kmQoC1ZRi07lIcCAiRa
	NnEQkhN9w+voz3SB3MokSqW0yBUMBqSzCmlyNR6oQROpjMjFdvPzwfZt4rERRITcvMjiLKgW7uV
	zXGDqWAOoDEuuOzsCff9+VkquITOt6MTM5az0l1rTWTMwyhHQSK425rp5CP2huaM3KFsNpqaQS
X-Received: by 2002:a05:600c:8b71:b0:49c:fa21:1c7f with SMTP id 5b1f17b1804b1-49cfa211d26mr26580915e9.20.1788519405186;
        Fri, 04 Sep 2026 03:56:45 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:44 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:33 +0100
Subject: [PATCH v5 01/13] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-1-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=lZbSOiq6PpWvGtztIT8irq1yq+3657nUu17HzUf8NSs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPl3ncDEEuPZUSGfq8A0JCZ1ERBMJbnceQtW
 QTlLHFJYySJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5QAKCRAicTuzoY3I
 Ou+rD/482IP4k0nPJEUoN1ts8JBRMYV81jKA+sBd9AdAFvAKoq/CbF4kI9yfW7JiRNTMOWYBZud
 YU6CzHFaLVlvHmmy7UsHcfA/hB9X8ytI2chW1d+4SPyUFIVRbqI3GTV3Upy0jo5othQwPGtYBNu
 M9Tg592TuQ0C9HSuBObMpswLF8S034G8p/LiARAbksmY5tOkT0FUOkz8hbSbncijMvyWSE9I6Ht
 kPOG+Qm51nm7+U2S6c21/Ru8fmbqVjHK5k+PuQsd3/lRrHhVq21UArFQI7oMaLJTPy2kuPMpeaC
 TSoz+LbXJ6R6OGWocuxGD2eD++p+MfWU8/MvilT3KW79UsD8vuFdcoV7tRmhqcQU7kUvcLmamnN
 KhNg2E78vec+k01Q+QQzWs++xvu35HPf1EAind0y8Rptq7TnWWiCC3OJB3G/95s3RlfZ+4MFX0k
 5QuQcsOAvUvXUvlYJcj4lod5KRjmH5AC5XMsQQen4i+CvC1xc7VgWh67YFQhOFlYL1t7H+a+4mR
 QMlzw3ajp7RIJZvTOHz0Pk1Qqcz3FGbC5j6ZXwweExfxTTIM+HTnZRsko3c4R8Npde97x0gX7+n
 7q+SAMy/zdLV/9g60v7ZelDdGGxEyqCXOb0AlAzEcqv+SZ9LMHd8wxs19sYkphZv3B9t5DaxVxL
 d2OueBTLuTXRDVA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..126400772d028 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,7 +104,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -332,13 +347,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.55.0

