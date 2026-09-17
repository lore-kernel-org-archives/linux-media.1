Received: from mail-ej2-f24.google.com (mail-ej2-f24.google.com [74.125.228.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACC552122E
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651241; cv=none; b=RSZhKmUV2TUapkumRUEChEpLYTG0sXmbdv9OmWDjY9j/p2uV4+BUqeyzE32zgZCBdtK8heIs8nfmSmFkYp+Mhd17CR3tA46ZdyXjcwksMTWmnjjv1Nu/M/7Jh5T90uX/mo56jidwvUCOIqOz8fVGD9EfpMZPBLLnovQw3d4fpPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651241; c=relaxed/simple;
	bh=lZbSOiq6PpWvGtztIT8irq1yq+3657nUu17HzUf8NSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdLTAe67fONCHYCfwBlxF1CLE5VGi0CVu1ncDaXtyXRhme3wIEd7qUzJBZBJYw74NVWAiMafSSNbqKNkVFCn15JZ+mkJeWh0xVeyWtJdoymfpfsWK84ffvoihcPvc/tyWV7tAn5eJx4xGzC6GzUzDnUDnZCAXOegXvPPMgMA+b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BYQZjLwE; arc=none smtp.client-ip=74.125.228.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYQZjLwE"
Received: by mail-ej2-f24.google.com with SMTP id a640c23a62f3a-c29d33431c8so114139166b.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651237; x=1790256037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFACwW3FzP5DW2PPT2LJDEH+gbA8r2g7VY7yrdZmoeQ=;
        b=BYQZjLwExNXX76pnNKh7XEC9IXSXTqEm69hAmLKVaOtbltR7Qv2mtdMZh/AqOpFp9I
         y+/XWS1DYl56pttwEPAm6lxxWQZEA12Mik6+jgPQCjuAPo/vTOOAHPqpzqViHOhbDD8C
         fnX98RbJ1nMPZlD0Tt4pH/+zAomvIrDvfHgR+nWwtAjI+2volskUBBaE9Ir1BHgQqkBU
         LzGsFu5lmwOVgqtoV/nm6sBjFjpLz19n22e5YxwLa0fIndlYKXcXpTRCXrA07M0ulwdg
         ANxezCEBFDYJsnSeUhhEh+1qR3bE6+W4HQlsWiWsiFNSwT/H+UXZahaiU4rvB+Em5gKp
         ZOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651237; x=1790256037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFACwW3FzP5DW2PPT2LJDEH+gbA8r2g7VY7yrdZmoeQ=;
        b=gnse8fWQyeQV/mkULb/hPYVhiwuXgmbOiPhd0sU3aQsiSbUVtv63Cltvgq12YqAhLP
         ekymbGwhrNsaLbni3hNcZhlSAMmNGoMvKx17qIyQHpjb1BOhl9UW6kWJkxOjo415ZHql
         FNQqsck7xoxuvjyBhvnXRFLdxB81j/wXo9KsIGyO8AtC8G9VCLcWPVjC1WOkL9CuMh2W
         fxhXWstTeEFlXCF8ljBbjfOas7Y1WbErviBmPxLAUnT+nefyLNR8JWDm1Zghha0uYYp0
         KZlFDHgx6WCoXMgqTAqytJXBkTyTZDZJaALSiTm5cEywQNr2qpWCcG06nScdft8j4yC6
         etVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwg9raD8XO+y9troVLG8WXRFuHeXU8Kp2hU0EuAa0vf+JL2vof26fo+XjB3Z5GOu+I6utgmvdWJ/zYYng==@vger.kernel.org
X-Gm-Message-State: AFuF++kx0SGXEHtjd3fCW0ereWiLJAJjbp6YfhhzFasZP5NdPdqKwq0I
	RKQ79C0BYHnJ2cPapqNXyh38MzVZt4CwlTxI03gJpcoSz0c1ND2s99+Gb5w9HWleXMo=
X-Gm-Gg: AYBFou2Tzt1jj0Q/q4SNB4gbHn0RSBMlu/glTNBh8NfSesspaLmO1VdplfLHeC8W7qQ
	e1UsGThmj/dVKLph5mlpvMc64WjbNT6cV+13EYjoFw3lsaFnYuv4WEsgUgDoSi4LDMxs5QCsctn
	sEKrAaaiucWnmCEbMkztya21HoiSELlm2N67OPa94AOQVzRGGyXjiiMIhbch/BKf5I6yTllCStf
	1wvuE+/HBsEg+Y1RMOB/aF29h6+QVhp0Evz8RV3yTcOZPvE/NhQhtel3ZcvE7Jvxqbc8IC/hif9
	ekniI6GQbD74oI/gFq6ylQuamWLWR2SmztmxiO/mYOKSjJ+OC1LnZYO+Fyru03TRDvSVXdmH3Pm
	naq/W1YEvCRJBsNcn64GTClqNPsh6qsi7YrEIUYJPkBJd/+P5rlQ7VYu5/CTRDBiYxli2r7Vv7j
	ymkVLiD+a9nNlZmIKgZTITCLuPZtaasxhT77hx16aquHl+o4mhI2NQlcZAHNCWNYIzDF68bPCFY
	4r0Fqa3Ig==
X-Received: by 2002:a17:907:9724:b0:c29:41d1:a0c9 with SMTP id a640c23a62f3a-c29e53470d8mr483725166b.44.1789651237600;
        Thu, 17 Sep 2026 06:20:37 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:37 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:26 +0100
Subject: [PATCH v7 01/12] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-1-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+keqijn37SlNYPk/SJ0Ua7jYu14UW02jkM4B
 R/Yh6htdg+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpHgAKCRAicTuzoY3I
 OifQD/4ngbGzsIdbxtwf9bv5vb3czNBbM5a0INNa142RWq+XEpqLeoMezQJuxytdPcRQ+6vLmo6
 Ac7krVZQaPW4BrzCq1/AI+ursv9HIY/cOyxno7X4S9tYppax0hFGvusQgX0cAvPvpG3zh/nCOPO
 2QAYxBiD6/+8ZhnB25EjUfj/+5aL/CSsZCwSZtCdZUkWaAt/plMPq4H4cQxcLPB+mV5fg5Uwze7
 xx1A9AqhKs3nt6IK89kS5l0J9e3KtBhOf0bOGwWlFh4F88Lo8uUkR78IybImxstOxGKrWQ3ikYI
 pqXsrvoUQOgYXtSr3X6YdR3i0qb9iXYlzdPAXMNsEt/RV1dNFsZ61mKHZBrC061DDPyYvCv4p68
 4Tsjx2xMgAYWcm6WVwf/uUCFQC+r4HghM1qtCJCjbTgOdKNC07uRVPGpN0FzPEDhHaYBuSYYamw
 5LX0aE6ARfZ72takLdVNzFXluQ987C6iLY/EpkC2L5HsUhsr8RDEmUDSXL+Y8NLBj2t4G5VOKwz
 tpf5cxdj7n6n+X7Hp3FUT8A+AKcJIverm9Rg6viJVSMTO67+5A355tCZhpRYtzGW1HC70LWGkMB
 vMnwa8MIK6SKEINYbCRhql4L8H5D6lIFK74Wv+hpHsSXLJINpQJYaxpWj1drQOAHAkmvBde0ff8
 Q2aoc/HbZSSgysg==
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

