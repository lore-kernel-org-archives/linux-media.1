Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2C43DD507
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543785; cv=none; b=PlzstK1UrQ/10axmuHfIPSErx88ceuPpaGZi/xWFUfgh7Qhx7udSeZBSeXlB32FfYl/QQg3QS9bAck9xnnHcTZeU5dQA0st/dveEGP/YJ7oIgffKMBWeK4VV0bqwseBNm4SXZmUUsVrCW14anzzXsmlCT5tLI56mQkWT9ypZZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543785; c=relaxed/simple;
	bh=R2mGUgVgDOXquc18MO2nFUnPiIUFtzW2JSwhhXHeA20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwAjbUIhUBZ/iHv7X7u/jWW4JjXQQ2nHopYyEH9QdhE2v3B/j2NOSL3D9i65NvTfhgGwcyv/zZgynL2n2lpsTLzUWx1lGu06LAtZ8obo8Xg2NKTFkc/SQyfyz1K/MnL6yVqgfCGoonYgR2lxLPjqt6RAIEtprSyNZiLAzZqBHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ER2bVgf3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ER2bVgf3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488d2079582so7053835e9.2
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543782; x=1778148582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lH8TTJLFLbOhiTHR6lIN5pwq1nU1A3T8wtyLnEmupU=;
        b=ER2bVgf3syhUBnYlj6eIo34Mc3DUsBW1uXi5EyuXGpvw5CQpkSuw3/fZCWZHzadJzS
         4uh3U8XHpboAyl5LM3JaK59VJ/XB1Lf66TndL38xWpyDkD6ND+9R+Zo+mXy3F10JYB0V
         VEZjldXZcN8g3avG9lbVLCaWIXpaWnYZpZcoT3VUOQgjlXQXDLcwCRDuUUnwuX9GuhDl
         dJcYRkwGNEjJw5889AdhDzrk2ubCx/u//t098iz9/dhNwFvMWoMyVimKT7s8qzHlKHHr
         n09+ZSXVO5V9M+yZToYfLULHvHpFEJGOmOfiYQxwiRBRVum5dHc8QCTzxVG0er32ufRr
         +0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543782; x=1778148582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1lH8TTJLFLbOhiTHR6lIN5pwq1nU1A3T8wtyLnEmupU=;
        b=N47oyAHMUEeKZSZrWwRS7GJyyew3rKGQXusvYuYp6lbqsh8IJw5N+Ft+gxkKtQsuKJ
         GiRvgVJtWXRliSrMsoAgNZu3FFNu40U0MJpTHtoocZhqjSMTiq7EroixNJ46NtF1wzAf
         LW8u97J1zCco6+Oe1Cb8tqUWCgtsjCN7xWhVmTgNBWiosz+jBCAjihOsVNE4Md/4F6RN
         Ld3Y2i0mx7Y62WrSYw35fWVkvFptybUej4/SkIN2uud6AUR5LqqZ4ASBGmYN8TYxfoAo
         4wNt7PGlLxmUc5vb63GJ31EZM8GZe4AahzwxQOqAVaJ3ezsOrIewMqnzffwLFPVr9BFs
         NelQ==
X-Gm-Message-State: AOJu0YwaEbvB3+TuYCJDkMqxDqdMQAAs9CtLXSQZIMzj3fdZs1L7Vm+E
	TwSrPZ6Tl/hfXMSTt4ejeMyg/7J129xqMR3M+fo2UG6t1FnDBEQru6N2
X-Gm-Gg: AeBDiet8C5ljvcyFy5l82saXuQDcaq2SXBuk2MeC0nzMGkWVUx1QjQ3CL6c4lL+hCe3
	S9/yVlJJlBwbIL4zbmsHlwrqsG51h7zIgca4OZftKdeFBAnrqkLvwd+RHODJzMcr/+1hfvZLyzT
	nMeZbhwGw6QPVL8oespK+6DZosWgrI02yf2aGdx+JRx4z8wn+wRn2xcfV1ZbWq3Rp9lg4RwEllk
	SGSPIkgfNUlTeZquMg8BokpKX1fQMRWwoLtTq0bcLiX12J3vQKfDBIhvpHmFEGj/Rd69nVdWADd
	TtaF87FQCIyjSaUg8ta94rckuO9xHnAg7jqLXrBwUUuOFPWfRFKGT8l8iOeE6fQGClvQxZCobtl
	cUgRepJCe/qf85TMUtO5LjyxOTISqWWNX3laUxteYfIZ5jeW/1glQPSxsluiT3fLR1QFqYx44d8
	Um3zlDvbWY2ME9DtJz8c/dRH3r7RFogHao5ulokAsR+SW8uucSOrlfmuehtDVJLSEeN6Ry9YfqH
	xm60WRuA9C+aWfhw43A+UDs/pEgMeOUxeE9gXK//ehRZvuSjybHq+xf0A==
X-Received: by 2002:a05:600c:4fc5:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48a8445dda3mr41087235e9.27.1777543782165;
        Thu, 30 Apr 2026 03:09:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:182e:1592:d4cf:18a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b9313c9sm40252315e9.11.2026.04.30.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:09:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] media: dt-bindings: media: renesas,fcp: Document RZ/T2H and RZ/N2H SoCs
Date: Thu, 30 Apr 2026 11:09:27 +0100
Message-ID: <20260430100929.1088281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the FCPVD blocks present on the RZ/T2H and RZ/N2H SoCs.

The FCPVD implementation on these SoCs is identical to that found on the
RZ/G2L family.

Update the schema to disallow the "resets" property for these SoCs,
reflecting the absence of a reset control for the FCPVD instance.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/media/renesas,fcp.yaml | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index 5e11ae0ee456..cbb16a7a5481 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -34,6 +34,8 @@ properties:
               - renesas,r9a09g047-fcpvd # RZ/G3E
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
+              - renesas,r9a09g077-fcpvd # RZ/T2H
+              - renesas,r9a09g087-fcpvd # RZ/N2H
           - const: renesas,fcpv         # Generic FCP for VSP fallback
 
   reg:
@@ -66,7 +68,6 @@ required:
   - reg
   - clocks
   - power-domains
-  - resets
 
 additionalProperties: false
 
@@ -83,6 +84,8 @@ allOf:
               - renesas,r9a09g047-fcpvd
               - renesas,r9a09g056-fcpvd
               - renesas,r9a09g057-fcpvd
+              - renesas,r9a09g077-fcpvd
+              - renesas,r9a09g087-fcpvd
     then:
       properties:
         clocks:
@@ -94,6 +97,19 @@ allOf:
         clocks:
           maxItems: 1
         clock-names: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g077-fcpvd
+              - renesas,r9a09g087-fcpvd
+    then:
+      properties:
+        resets: false
+    else:
+      required:
+        - resets
 
 examples:
   # R8A7795 (R-Car H3) FCP for VSP-D1
-- 
2.54.0

