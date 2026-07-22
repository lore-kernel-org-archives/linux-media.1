Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8C945BD4B
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 23:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763378; cv=none; b=GOyi7LbK++x6NJnpbXFAnAX3Ey3wRTI+rBUEOfbzRBdkuJYYhfATp6AxTIaphO/+iyTgijJgGE85or4yj+YKEW8Lm+ACdw47RlCCw4of1cF8bOpfL7Me2uZFebz5E9pTdy30aHuJls9baMlhX1wTmbtn4QA6b4BSm1Rt7o9miZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763378; c=relaxed/simple;
	bh=p2luxpgausQjIcXu34TXu0p86I0tMOO4Cg1dU7QLAbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XidHkJdQHt8b5MIpoP4Jj83z5OWVgGyTOjzBs+u6cwO4lKXXcjPuxrG22yvCxXHrX/Pgr8zOAumjWTiIqe+esOGsNUq7dKifcrFiUoWaJd3iqqxz0cnp1wzxpwJwd2QUnUcxZtLnaWGVvGMPCq26eLgEIGOHP8+109vi1OPgp38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfI261vI; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfI261vI"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81eaf3709b4so706287b3.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763376; x=1785368176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=MfI261vICAM/inpXeTAEG2WraI+AYskeKW11DEOI9mOMM+1iEV7SIuAf8Go99bMOUu
         FsXAhHIxND9/LWPntsiJexLfq8B0Mr6C02oVQ8CkcC/I+99G/xMWIVLMZKrRIKD/hn5D
         2n7wvTKtJMqN44VypA0uCTybB728vvgV7So6iNABSa/h8BfizqtEhhY5ejfhqcdFej2V
         zNQpG4vEVwa9Jpq9HhYbg7hVW+cExUHhpzDHre8cFa7PDDaanu6Rj/WFfhQBbfNKmcfD
         8uS2oACja7TAN8ypAGnnhRvU4EgmGYOnIh8zUuTiTTZ1nxcdy/awSdWD/C/+kMEIeHQK
         TgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763376; x=1785368176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=laAHkXAWi3kVevXv71cYbZf6YxCLniAIky90XUtplWN1mGjKwnmruRjgm+sGpRPSkM
         gOwSVUFqSrWH++h/YEaiawshyJUEDekHmzj7/8UdE2X+kUyHFBo3eyigmD+jx2TN14yx
         kY7XT5q8UHcJAdcgPmUWqXt3XaopRaPNlItkH2HXkHTmWm5oremz2y6a3/96pJxedS06
         o1dy4rUsWt9ngvzOuTclCdzneciRWwxqH/kfCiSsAuLjKnntkpHUgCAaT1SlLoQz2HLw
         spkAE/WghTEMBGJp3IgjEsJ/LUAwuLqfxWsIS+4eDz9YwuzEGj8Gsib4vgn/Ifq3Amu2
         8jdw==
X-Gm-Message-State: AOJu0YwdHshglJPJfgrU+bwA7GDqRdDq8RXhUGMrsop2qBtK7CCtlbGD
	63rHqAqcjiHhyPueGTw1ZSOKJ6IEfhFwTpW/JhvCEshMOghq3bZKvRH+
X-Gm-Gg: AR+sD10psj/QG6bznRxd5cH7mJs41E+C6PtWVSpYzPiGQuSAvddS3EYYba3A88F+RZi
	CIbfWld/SFgzgYhMvwmAdALWsN77/UM1R647WSJaBphYpgN5x/ER9Pnt7idg77HD/ndsAacZN2i
	mXUMKm8aesU41k/YLwStMVwmtGSKhT61YXAPUO6D6g92/nt0mutlX58GhYmpaCw6nJgTyuc9APo
	zdONM3NVGd4HKAaIEeLPZq+DCr0P1w0qN+jY3jeSA2JNSmb/iccrBqi1COpBlV5AXaj3AH22D++
	U/DzuaRH8ys2cCsMf4HHHJhSKevzNcVpjuf7aX/PglnDTFw2QDO7W1lAVRRFSQHcRyb+IThhXOK
	jqq5aSMMnsupp8yeLAlbp3q2WNsOCSaby/Hqpmjtk5f/50DIPY6RLMUQWti/OqVoca5Miq3hG0Z
	0pReeh+q7xTTgEa1blcG0p0f2t1p2M7Xs7ndmOuJ5sp2JCaIU=
X-Received: by 2002:a05:690c:6b81:b0:80d:e214:c2bc with SMTP id 00721157ae682-81f4c2a96bfmr2265757b3.35.1784763376007;
        Wed, 22 Jul 2026 16:36:16 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:15 -0700 (PDT)
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
Subject: [PATCH v3 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Wed, 22 Jul 2026 19:36:01 -0400
Message-ID: <20260722233604.3001063-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
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

