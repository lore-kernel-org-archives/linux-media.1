Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0D6368D52
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810206; cv=none; b=Bnxie45c/kMeRp+85n34H0fWUtPA4tKj4f7qAv3pbftQsx/IVVzookxk7vRDK6jKvg3ru6/dFJ40mu6SPKVTBE6GD6Psp9AV/DmB+QxBCVwwsHoED677k+ILANjI1zpaBEwxsk/Q3IH/b/Z5OLy9TwS85yadaZrTRDWvTZZJREU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810206; c=relaxed/simple;
	bh=81EjrDsuc5jeR02Yg18zw0dlV7+6SEPswLXQ0dSABZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MysjSYqNRcDW5nBc/QAwH9AFvYsmx2zkCypcesSeO9EQO3mSs871pn/F0aMoDj2wJafjFbWiLV850hnmePm08ppZvLT5PWSgkD9DYkCiaklDgDnfxmgSZ+G4xdLuMHfWOc/k8Jawjd4kkJ3OsFipMpe9zjVFSTOI5L4BgUTemCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=VJKWhq/d; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="VJKWhq/d"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1285746f8f.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810203; x=1792415003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDN4rkDRcDd7KJm9/0ncoICuBmRQ5PhNK4vBzfJMTiU=;
        b=VJKWhq/dPlPAYhObQPgYLrOSF5wkt6j6sdx4WBolJJbFIhmPQ5hCmwNd9BqEcZ+h+I
         5Uo92QLMrWy9XCcg6NlnueIThKOYkwXdxavoYmH+VK47pAtrxfZSDQFKUf8qlZ61GEn2
         LNynWiHzTMiCvrxO72PwEQ2XpllgUViuHfzMh1YY9jATZUxMroIJpnB8joy1khcKBiqj
         ProqseWSlmhg/kWq6452scCnxVasI3IWKpI8wqX1PSpdK6br/XShHsVgSwHo9qLUkced
         WZGPT9ZfAlhWgnktipgSCE3uVrEQQdioyH6+IYuicln2GjeyPja4Qdf8WIDDqPeC5t/m
         ZRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810203; x=1792415003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDN4rkDRcDd7KJm9/0ncoICuBmRQ5PhNK4vBzfJMTiU=;
        b=BzPM/1N9QtWLxcPm3rocVBZ7ytqOgR+xQA6WVV13CDB0pr1VkFZsm3eLarmITt7Ont
         7JdAHDJgGpbUsDBx+3YWxs+ThHcWgv2gNe4TabBq4OGA7jfSb/G4vC834px9MPKDNzxq
         Dj8R1gUnBovGTmhvq3h6RHGfjyXzaeGcqWQ5V1lgx2v2jFYD5cKJimqFk/nJ+9Oo/pj4
         3fUb/vxSx0++BW6Ep8SiEojae2hxwhxpwHyOQbf2/5llaDyBpqJhkLms31WGcxgLlWUg
         bkJzkK4rm4f+tyJphGp0V8dIzQyTT3q29QmnnYUc+HiR17PQlXrIOrSBr8VpqqOn35Ta
         1Wqg==
X-Gm-Message-State: AFq9FYK0PsXoalK/ac+FtJvRyOSALNquiKlnGu8pCMUOceHmpvMjO9Py
	7lMoSW54UyqqXA/nhCS1pP8fcnvGIlltqt3lv7wUnmnq00qSkxAsM0IJggsXxA3l7fA=
X-Gm-Gg: AYBFou3Z/Kon0AP2vJFWtO7rKgTvYCQX+ECiKyZjNwZC9wLXYAamm8vDQpFdPzSAu/U
	hXFLmioHXvy7uOj5uS/udCqUM8LdAMU1qbrgFakDgYM9X1L5j17XOIKeJHOck041pp0fu4D7Sxy
	FMCaG4YHcMerv2ssSffAnYK/tzhVlX73oCuOJ4ofTGUQqBZyYtOjtL1B4xgYt38UtoHK4Nq1RhG
	IvCBPKG0pJj4VWghSIjHpfP6UqEUHeXx7JsYd3JbSn1HBRE38mhhzTdiltCzxV7mxZNIPtJUn8C
	KG7OvZQtluSGseTXU1eDqXzOtXm+/GTX1xjtt5TSJYoIAKoDz5tFT1DZUx0pTgLSbBca2cnarPd
	4d4fWMxDrr1OdsWqudy1tF+IyyjwS4czQ+bKk3bZaNqbyAskW29tCJAT0V0tqruTwxRG0CAFnsa
	6dzirhVDmTAEhSipzPwyB6ZYLmK9enRusXNIuGS5ttWlB/qaYkLmRBoiXoBAMH7AjT0nXugBS/d
	3QDEguTkSymvqss0gYn4rgWwFLzpI2CNDy/IEoRFn7WxEZrfBCOYimZ4RvtMSVD1hV8SW6N/Eb/
	HjmxIw2crFEBb74mkJjX+Nfb5sHNinJM
X-Received: by 2002:a05:6000:2212:b0:48c:5cf9:88d6 with SMTP id ffacd0b85a97d-48dba7bea17mr17686645f8f.2.1791810203273;
        Mon, 12 Oct 2026 06:03:23 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:21 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:03:03 +0100
Subject: [PATCH 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI TPG
 regions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v1-1-620ab6f151dd@imd-tec.com>
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

SM8550 has three CSI test pattern generators next to the CSIPHYs.
Allow their register regions as optional trailing entries.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
index 4b9ab1352e91..05101dc97711 100644
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

-- 
2.43.0

