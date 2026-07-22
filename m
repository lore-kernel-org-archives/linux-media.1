Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7A8435EF3
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 20:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751454; cv=none; b=MVWNhd5bBtUkul8z5svgBPNP5KntsrHXXlbfjpvV9ZtwJSUjGarYCDG1EeTeGPbj/LSw4UMOPqKN1YfnpH2yD19b32Glboz0vVP5Ndt0RkiSPdoo46pLMXgA2sjZvlvrKT/kRuoVsslSuL9qUVOFh7TQ+q8NcmsNzx/HSMTagDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751454; c=relaxed/simple;
	bh=p2luxpgausQjIcXu34TXu0p86I0tMOO4Cg1dU7QLAbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6FZolF4bxbOeDSFqgxfkn7ddqloOT1vnP3WgRQ2131Z1qOmkA3ASlKhPE1Zi1shT1cDMX+NfNgK2+8+Sk6qMoP40heVsFNsDogyrOlaZSpo14m4p7CtSx3h648mWqFZuYra61fmObEeXq1fK5hWwAeYnQWc/r3Dq3dF85OmkHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7E+UqeY; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7E+UqeY"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66843536f94so3339477d50.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 13:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751452; x=1785356252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=B7E+UqeYWrP81fmR5KS9qIL1tVRiiIT7N/yCo5blMnSo8WMJu4nrtMhrs/3cCeUqsO
         2Z+VN9NnzGHEFDhNG+wVGaj9tRekM98F8ZWBcz/9cd2PPQT50hpqProh5asglvh3ytJe
         1cjenywhn/5XCAGslbtl5XDRZNAr2srBqcvv8z4RAlyQRR3jid2QURq6oTZf80nNNhTK
         jkje2Tv7dpWougQT5cXHI62VzvaCn430xCTc4aXnCsyMU5QrtnLN7bVXwog+8QSNEdtk
         3hgHi0uLHoUwN1kADUqjVI+G7d45ipRhRx5Jvv8o+WGNZaGD5JfdVH+ZhgOBESqqzWLi
         r3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751452; x=1785356252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=a0K1UUKdJ8emipO4Fmceqx2g5QYKXjarXgjTJqLuPBqNo3QpLCV6d3ioVq3ECgUCc7
         bW401PYNCVRcO58e9u/sumG9cmZnkqhs0FV4wmPwRw3S1RI+HJtU2Vixgmb5PLAW7f6O
         TOgoF2AFdYseC0TKX/JeqPPqNLVKOymd8j/vWKje20paLS3H9poC4J6SZRa3oqguQOJ5
         1qqRUaH5xL74LaJ1jVRn1KuwKIPicMkNMGMdIdyRIeK6N3QGnz8oi0VI7RxFJGWqRg0x
         zfxVOg9W1IrwyBTpmI75uKZSIdoJSGu5HhV15MY/Pawhn4j8qQJBApO6lKQmlUZqtAZb
         kjxg==
X-Gm-Message-State: AOJu0YwobyQh9YR8fK3WMXVrCt5vqCzo36e58kwXNzVGZGkCHgjASdVr
	HSVi0rV1REkYuGVvR7rGJ6VfYL6B/B4sfpTmsYUnlKJ8+q0BFAr/NFvB
X-Gm-Gg: AR+sD10D8t73KGmB55jrYwTowGWezFtjcBbsm7s53gg6cQCZxIqdzoAH1KTCR88AL4i
	mms2TjiuNu9hxAG/ZlqdJzGOg+DbMO5CXTwwdwYzXMNAJAJ71uDTrI50xfjAsUSKjVdwOMj8g97
	YX/1zC/+KjyDTUR38zCiC09tyEHtNK3vaLG3b6PD8HBgBbJsUHpyVn1YglPVBOteW8H2FoYwsGR
	nZBjJaQspj0QFnQUgvn8Kn1AwqZTzijRrDHrP9ii38eJjUys5VmLZpewebqmBkmYFeiqEjRDIXk
	4S9sz8WgQ2D2k1yTwtNXJtIz8g+r9PecF/sjDvoYw6bkMUdDNN2KF57wHWqYce+A5DwqxNXjaLe
	c5f3c9cRmOBFU9jAlTKPL0d3mH+ijdejNvtaAQ2z12g0jQ3bVHHyo8B9pT/tG5u16qIysQdWHb+
	iL4fFm+usKZnXSJIQxvd+gM7tAfOfzvpEbzBfJ
X-Received: by 2002:a53:d987:0:b0:668:9230:e266 with SMTP id 956f58d0204a3-668a4cb0f6cmr27020d50.46.1784751451559;
        Wed, 22 Jul 2026 13:17:31 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:31 -0700 (PDT)
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
Subject: [PATCH v2 1/3] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Wed, 22 Jul 2026 16:17:15 -0400
Message-ID: <20260722201717.2205609-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
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

