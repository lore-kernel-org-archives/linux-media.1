Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F7541F36F
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231355; cv=none; b=GWPxmZPj0WdCuQcm5qgVAjZ6co2CdnPGMTyrud8auo/TLpeb8R5SIK54Xl1ibKv5HvbcAd1sIYzjGL4PL2v4JOtqBSSxBJCx3ySMWiagf2SmskagJtERl4+LCuw/EmwD003XG4BTPcb7YmW5iOG0KUONKsAYzbv38m/8l9ea1Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231355; c=relaxed/simple;
	bh=e5G/1gpd6w5RUemT1hHxSrPtt8y2TvG6ssB05XjEsgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rwkUlIwU/CEjbbuc7dy3uPQTlRtvdLsK/9dUJzW4G7JX/hcY7Fcd4qUEZlK3/1LSs4NjSwYxnbZNuzOmW7wmS0mTXh6S3o3lfZoDwf2I7ozg3A/QiYhgjWU0rjqSEZK0X+8M/8tkiAg5xf4fx2W7yojxg2cm3ORRFlhoGKuRMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xVOlw11E; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xVOlw11E"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso33104335e9.3
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231350; x=1785836150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJniRco96ZhJUJ+Yk+f3eF2otMHPdpjSj7bXg2cOCuQ=;
        b=xVOlw11ErliUSnKVuVx2OVIln8wXamevyk/z7V27P50oah1oGjo6vpMum96u4HF3dt
         KlUMShMMZnCMZEdeLP50Aov7HYsGFOz6upt3e9sqe4oZakp1iObTQrGCiNIuhL689Jgm
         oMzh37jcxeDiz5dkIKT5MglG+iLAZ+65ESKKumDTsw/IIMGiDIKBmNXalYA3c+jUpzzW
         /VGhiLBvxVDvxCwK+Z6GXEW1WrP35oWzqvMK74hOfSwG7R5rRdNVxr6nZVQQJoIC9ZIw
         OGMFps2We000+Vj3uah2xShfTRJvv5IoimfEVI2RwXn8h/OGQfAy7Svc/64e3l44Dmz9
         9obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231350; x=1785836150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJniRco96ZhJUJ+Yk+f3eF2otMHPdpjSj7bXg2cOCuQ=;
        b=AY7uob9FRfsffTOWtrrOeJHQSaGvT+jCiJYBBeQdP/64yKpie+Prn0gSKMIQI9hiYk
         FjT4krA0dEkT/wC/J/1WRvVb833UMpwR4f+5e/eOaovI1KFVztPWpNKd7vNG+Zrcvb3Y
         b/hqR0bnpgIDD+FlDaSX/fSDCKQvDNrVleCeYM5gAZpoDP2Qr/vKNk1dINhQQNTnTDj1
         rtHqTjf/kom1esEXeuHh1M7c9T98Kxae4HOPdmapLiB8M6JRKokJkOPYGpljAmR8VpEt
         3lR7H0WpmwemAAHwweII4DbBGZv2ib9EAxHq1bQ+jDpPKHUepfK0+myyDjXN49AEB1Bq
         BWnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpz+hmJSRIEtvDlmU4DMjXAFTJANj11/4Ps+n16aklbfwC5YQI2Kl4V8hv/rnU66gebJIZ1vUQPi6MzHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxRD0oI7FPr3839Xe01NzKHHaL+kmP7+r1QvvFI7PpDTCexbPf
	t9bjv63SZoib61HoJAX+mhGqbyUU/8bzZBCwT6ByUGvWr8PtyxM9wFirJNSRTRte2/w=
X-Gm-Gg: AR+sD12lTV4y3VqZpe5LSzOeOge2pZumrN5QsktjGRyMj7CYL7VekBP7dVB2aHZ+t+S
	dr204vGPNnQu24xr4rPScBsrMXTKQPECwDgaiAnx93a9aidbpLH4Cpqm7TbI2Vm/CpulFguU8mx
	p/ur3b6Euak0F/7eOtG50krDgpJPnrNfNXZZkad3nAhKCXwbjMo4jAYJ1iHrkATHvKQOfJOPH5R
	f7/pRuRNAZ+SNcv49M/7tPUj0LL6OQdoqMGaNit8D17dkRTavvSrk8HvALEJenWMgsI0grlCKRZ
	qSngQx+jLGw0EDrjYi415HeyOVQJXRr/IR9SxfJTUDRVOuJEh+574861sxmtxt52wjfI2+8Xzm2
	WX4nw47F7H0U94qW0lu4dREEMhe9p5yhnjbcDWngxHomEMioZ+tuqTs2ZdNuo+3AGUrEtQf/VB5
	UfxV8EJ8UjVMKq
X-Received: by 2002:a05:600c:5494:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-496c60bede5mr17438645e9.0.1785231350341;
        Tue, 28 Jul 2026 02:35:50 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm68190825e9.15.2026.07.28.02.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:35:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 28 Jul 2026 10:35:36 +0100
Subject: [PATCH v13 5/5] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-5-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=e5G/1gpd6w5RUemT1hHxSrPtt8y2TvG6ssB05XjEsgM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqaHft0cPUUgit905GNCZrjqlTZe3rJ37IFM1ZU
 h/qDA6xynmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCamh37QAKCRAicTuzoY3I
 Ost9D/9u3lYofi4F2s61/n/+5ucihnSYHuKfssGjxGNKFnR9qBCXN3za6mfLa6MHXNOd5ZQYl5i
 lh0dZXBbZFsaqajrCxaVd9d43+Q2xl4pOndOdFPIi4PJb9VBUNh1F+l/Y9SzaN4wTF5S00yFvBy
 7t2HwD4Me0e7LsjbzObuQTH+jCgoBpFdSaVshQaacDyGM60vQRLjALYuhX82kjprBKtWxciay3e
 k10p9rpTyX10Y2ar4NP8ROMwgb2WL1ARBsssY4qApZ4Dm9YacTZ7rqDZRE58SZDXYiJi+awGdnI
 mOPTSkyimLYcV9VxEQsaSlOYXx1pL03cD874zDNEfUDFQcpO/Wm8fVWbssd6t05hNtSJ3gNSrE8
 RC5q8Lwp4YFCcYwiRZ9JDoJwmXd1PQcdpb3RXx//xPRUoOp26jcmZkBapcSoxdHwjp/D/vosKdG
 8S7ybhQKBkZe9iNEAhKAT+6qUv1OkLwyTqR8nPvJraAjS6zboq/3saaUF3uwxUdWHdqZKY8syVd
 EoN0x4Hf3JJQ3yppVLD/O3VvFwDv6mkYb/+8br6X0VsP3ee176ovIi3sLBcuu4RprdSt65MoJ+G
 VSxaVjCDF95SwwZcNWkkaJ9IJJd1ZROe5336kXh7Gxh0lvay6y9dEFYOfMcWZHSZOfKDQ2UIyrs
 Gp3dhA7FPSIhK2A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Moving the csiphy to peer nodes means making the current supplies optional.
Optional since we still need to support the old way but, at the same time
separate nodes means having rails per phy which is a key benefit of having
separate nodes.

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
2.54.0

