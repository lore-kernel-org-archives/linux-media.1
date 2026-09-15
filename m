Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5FF49EC58
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473409; cv=none; b=YSTsuUZHw9MrTt4+S+sSC0QiZBx1FrWaAL3rJu/J3y0Lg6aUgeO6dF1BeAnz5jpCAYFiDL/wqgfO10jcD0eKwPx2wFq5iO6u31IXBLmxBKwxLT2b5LsfwC+XK77Qf3n2IqJxbksWFeH9J8yDHatjqLlQzPcoTWXi2lg26Q1LjJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473409; c=relaxed/simple;
	bh=76t/6TvrHo/ckJ30OYPKat5fWAU1rA0fOHpl6d6Cs/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtleEXKnViRMLzCvjCD2ugKq5S9E6H1G2w0wilMSGbw5xDyQqHgVpcXELmjz06u8T/uG9NtUUMIV4PjNQL5fea1HwKDz1wXxNHkVrsGESkY0AEKBiXqrNfoWMHM4ILkthZYEk1zUC+EGg76t1xnDGQMJYCMVum+LZfXP0FeTaW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbNUilRB; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbNUilRB"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so1508015e9.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473406; x=1790078206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IL/M9C+9tQ0Kk34dqluvw+MHZP0Z0vOWF8jr2i8QPWY=;
        b=qbNUilRBfx2vJPP8G20CKAJ7eBDm63tFaKm3cDhBIt0RfCZL2vRSH2nsF6E8Cia2D0
         kO7KbJOdhpGIZEcgAI1RoxzlABD7aV3/UeI6Uek4jgm00TpRJUPiliYzyeOQpgZinRaT
         4u4d6QpBsSc3SdrEuKGUBfdeg7lyBrOqoONXxog/EwNmb7Yb8I2awK4pHFGvUmqrqEYs
         S2dIyd3UAcxAjILTsLnY6vXiyQKnNUBXPcR8fyn0bKDONkv8py4toI1sKuXT6eBxCkkX
         GvszUpx8RSUqpuOBN/tQWgpVbTH81QMsH8BTr8Ym1rWZzT/nIQjt49XcNebQOnAFuAC8
         t0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473406; x=1790078206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IL/M9C+9tQ0Kk34dqluvw+MHZP0Z0vOWF8jr2i8QPWY=;
        b=htmFD+BlV7cLIihbkL9Jy2wNhf7I5QwYQyl2Rg1kI8croWdYnDFEDmzIIoVkNh+38b
         7X6kHKOE18YDxp2YT2Igl5t36fj8du88usxERpNHyovBA+g9Cn2SLpYFAPPVYMX7TWmp
         VSoZgcTDRIYmIYWwQcl5AtYyYz1rtFVtkBCHXbYNvO+yJ4iigeZ/tIPR2UkcSioxM+HF
         dODxW7/Rr4n0MCItrHkr1isfY6hdoSZ5x3wIZomipHo/8rg1sHJB+M821BTThm4JD3oT
         HlLrjA9QC+QQHpgaw1ionEJKIlsCEy7LySlNShI2xhO9lnBpBwLrgOrVklw5Y/v7VVRN
         Vt+w==
X-Gm-Message-State: AFuF++kR49VkcWaVRxFNWNjyWB5MNSCS2w/Kk0czwERj5aTttQokdkPW
	g2pE3t4a2YVLkkJqBMpdCTqQqaMaEeBuE+bCiMJY/tF25PCICIevsptE
X-Gm-Gg: AYBFou1m9AiolQWwUVqP/43NxE8M5dgFnxrf7wfLktAVBVvP/RKy4i09QQkRkEouyFz
	lh8RSD3t2EUB3vZg9dbpmF7tIlflL9zDlJBoUUDM/HxBzaDjBIY2ZIIj24d1Q2uotjo6GxnWrz0
	YDUe7QM7s2c+Fro38FBpu13qGdINT+cp/OrJzPPR1eUi7TCQc2z/pSRd2/kQVLcfVGEa1IDyv66
	v6gJOqZNlRLoPapEDoTad+EIEAH5v7CCzAKAuCz3m8DbpY2zihoVLPHf5MmOVkiAI2Gpw/thWPq
	/FKhhAO0wsVFrHQD3HEz0wY7YiAWaDiejlbe6OBF/eqBSyyNSb5QMpAITbYK08otwoqOgml6Nzn
	11O8Bv3iiAnRHpuFQNReORF/hcJ3vH+7nSTA84l6Te7nH7HcWkxXpoH8CNRNa761IzYdriW0Oe1
	r5SZd077XU9njnxGArxk+D0xJRnh2ubQDeakhttYMSlFcrdr68Nk2AkOPhKmyhZlSSigXMKvv4U
	cj4eihiDJfQ7DCRbpMCj+N6/Dst+pdL55YJW3YEWxO3C8pUVhMkRw5xfpTXmE4xFbo=
X-Received: by 2002:a05:600c:4e51:b0:49e:7cff:f8ca with SMTP id 5b1f17b1804b1-49e822a63ffmr11750555e9.29.1789473405919;
        Tue, 15 Sep 2026 04:56:45 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef88754sm63175565e9.13.2026.09.15.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:56:45 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 13:56:40 +0200
Subject: [PATCH v2 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3576 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-csi-2-rcv-dts-v2-1-bdaf8141616a@gmail.com>
References: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
In-Reply-To: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789473404; l=1108;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=76t/6TvrHo/ckJ30OYPKat5fWAU1rA0fOHpl6d6Cs/A=;
 b=U/+xcpmDD44TQLOMhpTWGOwHvugHp+qVjCLKGJpJc12iRo2mVKucsEvPRwhvI7BINPCfkaRtm
 ERXc22c4d6aC02BGFdZ1GwYSFiZhhii8gTNoE53pdNPf+ra6wSiiQVc
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The RK3576 MIPI CSI-2 receivers are compatible to the ones found in the
RK3568: the register map is identical. Add the RK3576 variant to the list
of compatible variants falling back to the RK3568 one.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 8bfad0fca3b7..1898f3787a98 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -23,6 +23,7 @@ properties:
           - rockchip,rk3568-mipi-csi2
       - items:
           - enum:
+              - rockchip,rk3576-mipi-csi2
               - rockchip,rk3588-mipi-csi2
           - const: rockchip,rk3568-mipi-csi2
 

-- 
2.43.0

