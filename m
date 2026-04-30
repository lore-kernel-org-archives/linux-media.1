Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5883EDAAE
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543786; cv=none; b=AvBq6tuYtExmfES4gHSZ8GFgjEGxFRAK5KytUlMDwn+TqjqFKEOUy45WG1XGMb3Rz4leNsAIG1BvrmJU+PIbuXFqyDaJRzUbpB6JLP/I5+Lj62RH9ysItPmgD23er97wuYPomZ0GdB1tCbZ30Vtr0bv7mazSG6+6fkATQE3Gk64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543786; c=relaxed/simple;
	bh=4Uow7JtwP8wIC6uXE5DiKRkf4rLthpWrcREBxzAuo5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEPGMklmM2LvBVIDEwnmt7F98K2w0jb7TY30O49SSttR9nMZlT3M7rPRoudSqQEoX93rI6ehUdo1WpvwOwJ+sea8TRmFJc+oeKdfCg3xNtnR1vFjdXjFJzx9eYwqfvbnAmq8eyAZbLUh3f5O8Ps06b6hw96LrS70mmm3BusfQR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDEY+1D2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDEY+1D2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so12319545e9.2
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543783; x=1778148583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4y5kIb0htxIVCSVgKsNlWw6RNkql9GPVnfbTeqYcIWw=;
        b=IDEY+1D2f6YKldIHmLbyUgLSnKh6js/+Zw8dnnsIgFETpb+fqpPE2a4ltGfMAef4cL
         GEuRrwM0qS1Fmlx1kBhHgYnrX+jfGhgbGPQQ70Wg79/nrBJXOP17Kiw23iZ7bjoNJ9bh
         qGT+Dj2vMj2IDF1KjLeKhsP2rnvds1FPSOWb/P23mCn/0/WZF4jvST16l0u1w6Jq/zW1
         4tDdBo14KZ46rMYha4KePLTd7vW5fx96Bj6pS5WOqpYZWfTx4ZH8Gmo9bCszrvyjqrSV
         V+TNZv2LHqmCk2mRkFiXOmulILQPaqtAkeMrm9nsWuAmv2EYabwdZeS3BsS0wevYfjJZ
         wO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543783; x=1778148583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4y5kIb0htxIVCSVgKsNlWw6RNkql9GPVnfbTeqYcIWw=;
        b=Wtd/oLmfZMzBcdPPLkqemxKYAOA740DevBlD9I0+C9oQcuumC1GL2x2VdrH103XBqv
         Uc4KiylYJKpoS0iNM0qIw6b2YMDlZf1CL9qpZtF4oZ0ktyRex9lZVMcQcJRS5QQ9YZt6
         9xw/rr/gJ/JxwAp7xbxNFTF9ryLQnFq61VwjuPUovSyltRIaYatVo6tJ0UviCg4Qw4fs
         0JOQTc++iCsFl1W8L8SQrDe8EBRy0USNubq5/BBQxNy1OViumMBmaWhqQ6Ovcp2pnqZB
         3Y5gZG9lrz6rKmS57HGbGY3uCPImRdKAAkfDS8ph0isWNKfMBaX4bU+R5uXrKZ0lM6Ph
         6gpw==
X-Gm-Message-State: AOJu0YyGrUYM2nn5+sGCrKSN6Rjzkv1PhPl4tNJZwHl7tCeV8L/wl2eB
	SwCQGFESKbVLI2hoQALIEEKi1n7fV0sSSWrL7jUWkZuiWyB5b3PCRkTU
X-Gm-Gg: AeBDiet7QKf/Ga/sDEXqFPb7B0He2VaOS7MGraADS3Z4fdmL8bElk4fi4PhZ/kAC+/J
	3LhzCPosgETIAppp6xIeybyGnlKfxltvXXr/oykZFb9WxTMkYTG1poLytC82zi4iwcQnXAcAabo
	xW466bij+kkPxZ8BtkrttJoGfXPpmryAkoCLOl9ptIed8obwoBMlQnyBksx4o+K0d/2PYrfI7U3
	kxjp1ZOoxpA11eb+IdxX5242o3gyH3kv91qQXdbrH6/p55bDkUqhm4kJmxlz9FCnXpC5Spr6J9g
	sPHfCCxiVa5xICZH32VX+SsxnVAoHQXocnw+LPIC8RSnlmooov0pR7U3E1r2tTrMfNQLhB5OyBt
	OElK3egvVlg0iotgBcs8PQk0cWZRANz2SdUGU6Vq9V/UdQfqEma94ARzomZVoP6qn+KSaziitAv
	er6mmxJGNELcr2n1tGHVJbxqmF/cmD9SLukylf6RQMiMqpS6SpFNUGWSfIAgfrSzZjq58YE179e
	nCjbt2HzwdWvB/G0m9HVWMPR7Qr4aiyOa0yrcWpgfuMAv5qNc6true9uEsGIfAxT+7W
X-Received: by 2002:a05:600c:8010:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48a8446d8a4mr36742495e9.13.1777543782926;
        Thu, 30 Apr 2026 03:09:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:182e:1592:d4cf:18a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b9313c9sm40252315e9.11.2026.04.30.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:09:42 -0700 (PDT)
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
Subject: [PATCH 2/3] media: dt-bindings: media: renesas,vsp1: Document RZ/T2H and RZ/N2H SoCs
Date: Thu, 30 Apr 2026 11:09:28 +0100
Message-ID: <20260430100929.1088281-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Document the VSP2 blocks present on the RZ/T2H and RZ/N2H SoCs.

The VSP2 implementation on these SoCs is identical to that on the
RZ/G2L SoC.

Update the schema to disallow the "resets" property for these SoCs to
reflect the hardware integration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/media/renesas,vsp1.yaml | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 803358780f01..a28632165804 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -29,6 +29,8 @@ properties:
               - renesas,r9a09g047-vsp2    # RZ/G3E
               - renesas,r9a09g056-vsp2    # RZ/V2N
               - renesas,r9a09g057-vsp2    # RZ/V2H(P)
+              - renesas,r9a09g077-vsp2    # RZ/T2H
+              - renesas,r9a09g087-vsp2    # RZ/N2H
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
 
   reg:
@@ -67,7 +69,6 @@ required:
   - interrupts
   - clocks
   - power-domains
-  - resets
 
 additionalProperties: false
 
@@ -101,6 +102,20 @@ allOf:
           maxItems: 1
         clock-names: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g077-vsp2
+              - renesas,r9a09g087-vsp2
+    then:
+      properties:
+        resets: false
+    else:
+      required:
+        - resets
+
 examples:
   # R8A7790 (R-Car H2) VSP1-S
   - |
-- 
2.54.0

