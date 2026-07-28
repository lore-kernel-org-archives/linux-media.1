Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9206C2F7EF1
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 02:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206963; cv=none; b=pW0K7QzarZYrA/gz2J+xx7+Kb+K3SYccVFOPrnwj8xjAV9wpA1r4kEirlnoGiqEaBh2M8T56k0tcKd2YNbjR794HO+YdN0ThEgjRfD0h1D2kuL/xZ2ZgTPdBajAlRIAuqxrztcv3juNIqUuAYJxLCSKxymwANvNzeHMaIPpCg6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206963; c=relaxed/simple;
	bh=ecX7vvzvXUD/N+RKjcW5yLA/Y13cFZUMxRQHQDuG8VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0xXgCXx+Dh3LZweeadfWqLBcPSYn+NS6p339fl+N7LdKzp4oIgn6kNCEDGr9pjiEhqs7g3IzX3MPlcY9Ye3q7rQKzFcG/ikudx95yeDCUA6HL944F4O7pLLniHQC7fb8r3bu2pVnva054eIsWQJztQtr7hl5SaeyzGHBknwCWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7fM6Lbo; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7fM6Lbo"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81e6f0b4610so35300417b3.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 19:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206960; x=1785811760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJiZXFpLnQ5pvNr1ABpUZxXJqDyWZjVowkdMMOv9maw=;
        b=c7fM6LboGUDKgnynFpONaAIfK4qIFtaXaPeNOaLl+LvFuhQ4A9zLcLBA6xEZb1BLm9
         qCYhc2mktNMAMVF33tix3rGxM63WVerwFgTjWjMxOIX7jqzPX479hwIuy9LHXB/YHhBo
         njVlsZh+Rsv4JuwAj+HyKIzLTEs924jice9Z2s2xjyF6yZfsSbiOyiS2b/WNfnfkbMrb
         Fz3u5PE0TWxX7Oo36Zy8pzXYv2zpP4Mk1q/thNpEVFfppotMIiCUbpSeYsnFNMO6q/Bx
         7JBnMfyrPQG69DtmTXwC5bOFrVPyQChMCngSiLtDWu64OxaoupP9cjBn82nMFQg6QfNd
         8LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206960; x=1785811760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJiZXFpLnQ5pvNr1ABpUZxXJqDyWZjVowkdMMOv9maw=;
        b=EPaonIzXeeD0jE+2DD488GjlTLwEgTmhmGRtPTJ+gx1e+ayy5mMqMYLctd0KWPyAP/
         TcKd8ls3TJk2hKPINXaNUlMHypxn+xolaQlHebXk93LTiJvhEXy2+KTK7pEDkfEsRFZU
         GMlKQ4kK0a56KGSjOkHzoJ93lo+iMz4r5xTi9qxPrVfFN24TrMfVHoSA4owzL8YtWgJT
         4Lx7/sdACR9iD684UyClvE1y+IJAMZKCIAgprbRg9IFSLp88BSkccc5E5bGuFkETnZwY
         FO+6rnnhLHrm6ajKPDEmaF4OIg7TxBjRz8vSEhqb6rdDRIyg4F6npyqmhWmpOzfQ4HId
         4YBQ==
X-Gm-Message-State: AOJu0Yy8/a4Za9dKwQwb7uuka6RdLq8I/i2VA7wifFV+nV22Ema3rRYS
	qiqnzC3rBFYg1cZYsuvZH0w2yrUyKRiBWZ8yL8p3OSXYfouc0kw2Ji3s
X-Gm-Gg: AR+sD125KRjjaKDETlLjvXO25Koun0xgUDWY8PM5i2qnq1lEWFFCcFEIevQ9CvOnNYa
	9JMISHlZa2kxDtE1Sz68bdj56hBopbDnYMBsOJzv0OIguAUl+dOFYjzCDoq7LeIzR2YhxECZNM7
	xIpthrnxFTTx596ilT0dyacnr5sqCNixGCYE665rv9jWvtpFQe08IUmyMVaDz/WZYIQj3Dxv5bG
	eDTh/DmoQ88KcFD+k1JfhubTPuKTDP7np3ZmHbtnqzHGnOoaEjcIk7euxsi3pAkDJ/AtRIfZa3I
	8CWHB1ciyZSo/xYkN+DcVfqBqk3opnkxfiU8ARUyVVUF3mA4NqPpBXap9SLm7CN+yShEaR8JW0t
	FdhsxzSNSPR9ISYQ252qgiKjbChAawtjSCgr/KY9GHBVIqQj8T4DaUJopozilMkQ9EBTLdYwv9V
	ydm0gGw/DTHbiVz3pITkPegYh/lU9hoCpioB9B
X-Received: by 2002:a05:690c:350a:b0:7ff:1a93:be35 with SMTP id 00721157ae682-81f99106fd3mr1842047b3.16.1785206960474;
        Mon, 27 Jul 2026 19:49:20 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:20 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Mon, 27 Jul 2026 22:49:13 -0400
Message-ID: <20260728024916.993224-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
The reset defaults match the fixed behaviour of the older IP, so the
device works fine when driven as an A31 CIR receiver.

Add the A523 compatible, with allwinner,sun6i-a31-ir as the fallback.

While at it, merge the standalone compatible entries into a single
enum.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..18b28feacf83 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -16,9 +16,10 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: allwinner,sun4i-a10-ir
-      - const: allwinner,sun5i-a13-ir
-      - const: allwinner,sun6i-a31-ir
+      - enum:
+          - allwinner,sun4i-a10-ir
+          - allwinner,sun5i-a13-ir
+          - allwinner,sun6i-a31-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
@@ -27,6 +28,7 @@ properties:
               - allwinner,sun50i-a64-ir
               - allwinner,sun50i-h6-ir
               - allwinner,sun50i-h616-ir
+              - allwinner,sun55i-a523-ir
           - const: allwinner,sun6i-a31-ir
 
   reg:
-- 
2.54.0

