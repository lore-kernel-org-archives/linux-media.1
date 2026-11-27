Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795749531;
	b=W/JwVn9c0n8c1EZaRbl447HwD4L3FXJ5ea/Y4P8i6Hb5ZImcr0q5f5STLw/VO5BKxB2k
	 IaDAN9z6Moy9MY9QT6xdY4bAYK6pxQ93799b7ToKE53+SwOCC2MffxhOIw9uvjdaNGyE2
	 nL139ymvAQkq9ZjVdpoFC0uB1rCuUbxxxQ3gS8QYEO+2iyEN+LYeauUPTsqA7cnhBR82n
	 9KAWGgzQ1uMpqSb8UnbNBpADkhKnCDwlrau3jnsWTuRP+MiutnkJE0f2sIFZ9VdGWa902
	 LfhypPk8jnKQ2blR84LspC+U9eUZLuHsrAcBz965o9FD3cJEdwjMIhq0/LKeo9yTj0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749531;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=;
	b=YO0L1rBs+C4+QiFG9l+i9HaSqC2ovG2DkCL7Xk0dmEq5Wf/kP7Kbfkv0zvnG4BZzNm3G
	 tb4T4wFfUy+WQ6trBIDts28YkwjPa6sL95KA3CBjpRdUJgffoC/IW7cy/OzM4tWhe1o0S
	 SWm6Pj+zgSCiK5DnpHAVbJnlOt55rmojiKKidnL6wn9shNPMLEi/BiucUlmmK3vBczRWr
	 nEGR6nliAYW2vpa2W2Ohm2lVNf25VmQKl0ROJm3tkQah4pKCjo7Xpvnd8Ert+Hkx8WfXq
	 lEqhFUthKXcDaQntWIeaXuNEklfwmlhzsHANf7ZEC/9v4kB4a6uGOFLC14rEQtj3kRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2h6z05l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6B5606A32A;
	Fri, 27 Nov 2026 03:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W2h6z05l
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795749530;
	b=hMIm+hcEwRl4RWFkBKEbgiXDxPiDRhoGltlhRGfEbZf9EWazo/eXgCN8ErmZZuds6+j0
	 bbAwlzEtcrYYPHyphL/U85aM6kFdBOnB5BUUSljF5g5zOXfYPXX8RpJtijmz6vfeX7uWj
	 zr1X5MdivdS3Yt284McmE9qCxh3H45q82oGinZZMQkONvwRpyPDcN5Q2TIfjxOxt06eGy
	 FqTia/sfPlCvDPpDdHRD0LFUqWbjOnE8gOQhjZwlp369LR6BJjK8aHvhBZhvkiXbfNcf1
	 UiqGlRX0T9yd54WV800TNJ3Ieh4UMfEgMPKR0NsjtDyhBgFB26F0si/U6vEOuyl54IA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795749530;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=;
	b=wXWckrsGdOWUJbuzmocTQPuMgrRAh0DaKn7abUOKQUA+bjM9PIdyDnllnvguv5kgOtLD
	 9k+yaP7WjFfTfkW9tGGkHtBfJOAzplz7PfWXyw62y1f/vWl6xICEbOW7LwsXo3mLZNjzP
	 8rrgwi33L7+k4TSWVfJU/xOhITPoalEibxo7VTfMvhqYnDfxs+ATMXLX8Tx2wrXpR8Qo9
	 N7pjdZDawhcufVNoR8h6cZmK7oVj7iTw+pkkMQ2BLglM/RZyFa715znSqhUTNydqSg7Gm
	 r7W8hdo5zSzfAUYm70MZDAzG/XoVsDD67b+yyE2xE1AiupHNbMp9Kovx2QcZe22ChMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AAE31F00897;
	Fri, 27 Nov 2026 03:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749530;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W2h6z05ldvbJRB2y7hGWXeNyUsuMpWcZfRnnTfqT0DzLpOHlzvhVptWOA7Ck4Wqc0
	 0LivA2Uq5FmZEyH0/QDJ3mZqMIcn/CAT/o64kQoo/WpSp80xdMR4zDCGtbTNpd3NSV
	 XhYUnNJVspM9IUN1aIveBEKc9i9urVfdUHfk2uHLhXy+PITYJ520JlBsomrY79hNor
	 wzdCPeA3+7yGsn/HNDC6NmfwPwmC6TEujONRrRfFNY7x2G8OHlyE7pbLSLsfHfSOXH
	 FGWepMVKWn9zkhsJ8hQ6jnDEaXisls7KCF7sUIl1Sr2e2aDJh+pFutRTN52X1smpH4
	 iIgqIEQz0JmbQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E877F4B52B;
	Fri, 27 Nov 2026 03:18:38 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 27 Nov 2026 03:11:12 +0000
Subject: [PATCH v4 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-a9-ir-v4-1-666dbffa76da@amlogic.com>
References: <20261127-a9-ir-v4-0-666dbffa76da@amlogic.com>
In-Reply-To: <20261127-a9-ir-v4-0-666dbffa76da@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749517; l=1145;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=rmPAoSNSZx5LMEoeF/b4E+Q1f6fRs3+ubaclp6Z1pc8=;
 b=5I1ELSaFehFyHsYdJeHLltTNRDgtVL2Xtw2/mhuC6l+AcAxjRlkP500vLWuobtWQP+GytdZCs
 jeoNvza+/WCBBzZxIjwq+aumAZDajvzWZVkwQcyBum5+7ElbrtmbQMD
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
Content-Transfer-Encoding: 7bit

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the Amlogic A9 IR controller compatible string. The A9 IR
controller shares the same implementation as the Meson S4 IR block,
so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 0f95fe8dd9ac..db9387e43eff 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -23,6 +23,10 @@ properties:
       - items:
           - const: amlogic,meson-gx-ir
           - const: amlogic,meson-gxbb-ir
+      - items:
+          - enum:
+              - amlogic,a9-ir
+          - const: amlogic,meson-s4-ir
 
   reg:
     maxItems: 1

-- 
2.52.0


