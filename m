Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15419509EFB
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057794; cv=none; b=l9HB1u/2QMbRsjib4LPzpbK7P41+DSy9DsaOPOh1BAS9fBw7d7ehd64TRH2cJfpiIjU2TxEQufGId+7JrCvUXRMriUSjXLx+uKMvtBdxkeimL9xU54ovtZxsd5DVasrXkDwxxNw+TSlyOzcBrHkRQ39AXS4IJtrg1E+4QSJtesA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057794; c=relaxed/simple;
	bh=Y5mDqQIodgDg69CwquzDO95nLQX1pocUdt6jGCRougk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dvyak4XEWMc7bNUyWIV5XVqzsT5n8fPId/EAFPGAPwn8iwteHqU19h6DKfVRh1DwbX4y1qvyH/ugjEfv4V+cbzy76Ugc0PnJ0GQ9+TsKsz5zIClw1m35DNGzJOOMX+tBPHM7Aza6Dus3EheKZirrQd89Yg8lY0JOQPF1M89JcUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=KSFv9BXW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="KSFv9BXW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a061a13884so42379055e9.3
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1792057791; x=1792662591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tngli+sbclxXmwFOjyHw6Lpl/UDG64/d2I1Pa40mIM=;
        b=KSFv9BXWovBKAYr1N+MCRkZ9LSjI2bW0NIqEIeo7BLLzybgi+U2/tRw5jWYlvOc24a
         EKmAafpQ1YB71dvhBXHrwMFr0G2sw8lwTnUkLMhmcct7tM2WeJnFIsWMEn8EIh3mISCm
         pJLhZ5QCi64mDnpstJly+hkmKn32sENY31ruydTfhjzLZNkf4ic7cxd+wT8FLuUr0Lt7
         ZNxz2yIS9blwbmooerWwLRoXnGeOAiuD8HSfxx69A8FxE2Wt3gBBFfL9yRM6dGahCF7h
         cgS+MrC8maea8JOBGeG6poXTUNcePXNt28nFZ4V1Wuk7KBRMGiChdFquN+bpssg+rBrg
         4w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057791; x=1792662591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6tngli+sbclxXmwFOjyHw6Lpl/UDG64/d2I1Pa40mIM=;
        b=r5JknfYsN/c64yNnuKcHu0Vj8l9YasC1YTXczR3TmUkPzkc6C5En4gwCWS4xcPp/+F
         gU+Rh1ESNTEHo/RTqs5B4Rg/LmsD35C5YgH7yFauTijVU4VIs8LsEhlqypejXSO+eUvx
         8+ePnz2OmuXBQDxvyhTo9OTujmQZ46FQl6RqB3hAgKssHdQaNOE3+5SsqRyKIJEx6QXs
         4+EPJ0PuC04deYgHDFjpn2tTx2hCCHnBff3DHoTOpPv/6BK7YYFIpL9MjzBQDdrLZ9MZ
         bga1mw5gD4D7Ob9/au66coMvEuqbtCcrVGQR3yTlJ5LC40dDOipjQBLB9Vy696FuT6x1
         C0/w==
X-Gm-Message-State: AFq9FYJqTTaPDV4V4hHA8RLMf/LDvXgjA0PdBwLZf1qB8WPEw+P4W6pg
	w0Wwn7YQfDVnD+4Eh2xlm3W0FWyzGmoN5o8XNkXu5rCRp0C+KeqiIq0ZkrMTZVSMKrU=
X-Gm-Gg: AYBFou24MMUuQWvLqWV30YWzaHdJgGnDi7iggmYIlgEwYy+pkPhTNCMZWMDTjyn++v7
	vPyiSat+jAOFAypQNqYN8kWaEOTnW/vY4VQ9fo4AD1NBKq9v73xRUmuw2wU245kuatUzUNvyVpi
	TIeo9PZ2lDtdLVBsIRy4DJMOljk3vKig1Cot+uZctpdIXyDsoOtTFTLR/9U1yRCVi8++d8pQaG1
	lmZgJoWYT+fPJ6Q9trqbVfYdX3XSbP6qKHmrrZfKWoWCDhiZY/yxXcyyq6GLaR451WuvO/ppkel
	lZ4ctf1XrZ7sV5EdOTab9w9NJZ6VCNH2gsi7QYG+yV1NqvNSMtIFqQinuGG+Qew4KRMgOuSESbA
	FRlAzXsTVzqkHyKZmxwOzda5yMrC1AImef2489QFWxQeUI00F8Z1NhIDlYZh4CyQfn9moHcgJ+r
	4/By8v/kmjWp5XnkMBnEc9qzc5MpzqEZxlyIBXPzWgChKxXNdeGhtYOptIHZHU7cHV8GW7cayRJ
	O6+nIG/5mi/kIOZOMOTcxuVVmfklTZwP2QYZ++elzsphc3J1ovJOBVnKF1QjRlTUHWKfWRiOPow
	2CMcT/iZVqKhGzL+bW+//q98bWAiqnh45K49UA==
X-Received: by 2002:a05:600c:6384:b0:4a1:7741:ec43 with SMTP id 5b1f17b1804b1-4a18e4b8966mr345613225e9.26.1792057791376;
        Thu, 15 Oct 2026 02:49:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:737a:1f7b:d586:a293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm16926246f8f.54.2026.10.15.02.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:49:51 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 15 Oct 2026 10:49:30 +0100
Subject: [PATCH v3 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI
 TPG regions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8550-camss-tpg-v3-1-00fe06a3c557@imd-tec.com>
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

SM8550 has three CSI test pattern generators next to the CSIPHYs.
Allow their register regions as optional trailing entries.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 .../devicetree/bindings/media/qcom,sm8550-camss.yaml    | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
index 4b9ab1352e91..683a19a1f288 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
@@ -17,7 +17,8 @@ properties:
     const: qcom,sm8550-camss
 
   reg:
-    maxItems: 19
+    minItems: 19
+    maxItems: 22
 
   reg-names:
     items:
@@ -40,6 +41,10 @@ properties:
       - const: vfe2
       - const: vfe_lite0
       - const: vfe_lite1
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+    minItems: 19
 
   clocks:
     maxItems: 36
@@ -424,7 +429,10 @@ examples:
                   <0 0x0ac71000 0 0xf000>,
                   <0 0x0ac80000 0 0xf000>,
                   <0 0x0accb000 0 0x1800>,
-                  <0 0x0accf000 0 0x1800>;
+                  <0 0x0accf000 0 0x1800>,
+                  <0 0x0acf6000 0 0x400>,
+                  <0 0x0acf7000 0 0x400>,
+                  <0 0x0acf8000 0 0x400>;
             reg-names = "csid0",
                         "csid1",
                         "csid2",
@@ -443,7 +451,10 @@ examples:
                         "vfe1",
                         "vfe2",
                         "vfe_lite0",
-                        "vfe_lite1";
+                        "vfe_lite1",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2";
 
             clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
                      <&camcc CAM_CC_CPAS_AHB_CLK>,

-- 
2.43.0

