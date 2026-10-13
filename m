Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C5A5275BC
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904672; cv=none; b=ZMW32JLc4tKtWyODnUA2Q17FFpQvnki9+dSZ1rIMTBHBk3GNBiGJImxUbq2FQirDSfgBNu56mD3silXTWE0+a+XMXg7a+7bdijBMVKRKOFeeXLVIXEgEgD3JgTCY8tH01OOet+cUrpNuoUQsPzQ5jh+zyLGRusiZHnCzb4LSIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904672; c=relaxed/simple;
	bh=0tWuVn0M/rJf1SgDZY6aPd7ienFVDqKzCJFXKqoyc8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rD2ac8t6uOgdwgpnt5Ty+osQ+DNtiVBG7xiwQ2RuZpjAdgOzBT6EPBWqfSfdgsrfw4xIZXSQ9imSIAy30vFKq9uEzfu7G1m6x3NCjtr9TcOjejfoWb0DQ/PzUNMINzXRGa2dAzevjQznipB9bX75VXkDW9Ghng1Et0hKjTDrX6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JUAcR9uJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JUAcR9uJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1af482519so6106795e9.1
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904668; x=1792509468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SV/TZTxHXAVVqpMUNaJzALRF5ycwSqiFP4BGozRT4Y=;
        b=JUAcR9uJmijUOnaWmlKC3ApaOc3YjqjDLlg1MIrngEt6jD5C5kW2bLNxArnbw6BdTU
         TBhMgoYjqnbFlCSN7+udzkmTFSFjyXwETWxs/fuMg7c5zaGxXXeffkIFYwxR7J3pIl3R
         841p9P4rnEScPhzjMA1KHhNUWkRfgdVu1pSaISri5A0q/P4FYcbQEKFb//ZbHkORRLF0
         xtmsDGu6OgtaMALE2a+g1ZcolKCr1q/U+qH7kUJw4dfzf6G0UrP9bRzqYZw39HFdnl0M
         pUvgV+TltyYhkUbchB67kE+wah42PI2hpJe144SbVLo3967EtHbV9hbVEfTiKJHqMn7F
         ikJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904668; x=1792509468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/SV/TZTxHXAVVqpMUNaJzALRF5ycwSqiFP4BGozRT4Y=;
        b=RD3+pP6CDN8uH5l8JmmjKAwwhq53cnLMoS8j2+Wc8G5o52c+cfJCXgF7NBGvEuMJns
         NQar7YuRzBeKaL6Y/f+4hNL/VVvSIebFfH9MFCur+F8S1rB/tNYoKFXgP5tpuasnrvIx
         igXjdDYij8Q+PVtkCFSHSie6E92eqc/uIsCNrQoRureYlhV1tOfateEPRlMAlsNXoeKr
         mJUlX7TdyHfnCCw8l7Jg76XszINa8IhMnVF8VRxGTj31ZJiF9PV1YPeRHTTPvaRI02V/
         6qVcHXLLjTbgchoQqAsKTFJNcYRzX4fp+fDMj7Ry6HeMUaMx+sCK8eAlo0YcPrvMgKIW
         nIJg==
X-Forwarded-Encrypted: i=1; AKwUvBy++6pIuEA82oJtkmc8mRYR4zc2825UgvKXXwjFu/IdSucvB1K/lLNwnMdleDYZTW7Z0AP3oZQWIPQjaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKRQhR7/SkbOnavJrvlt4tTGTJSJdDZGO6QgZibevwf+IEArMYs
	MKrh7PVjJiFEPHf6jRYwifz2vV34sTLrWRy6NOHCrGlDFma9T0LtXpU81sT4nhpi85IGLYUhXE3
	Qcu9+OYg=
X-Gm-Gg: AYBFou1ohSiQKVHUAyFa1WuR0O9SSm1Itlqy93vgvqgEBHOVVBaIRvBRlCfknV2py3A
	YkzvtADvBzH52rx885jrsFhpauLR/7OHJS61vqYQdA4cSS/Jt3m8q4RBhV+BShixRQaZoQWgzwb
	gtRqpDeJzNVLevMFr//vzOSMJvFi2qPsp4XMfU2sop7ckiq4eQf+SnwOhjLHW4gsSmFKKQBsj+s
	7zM0MwGbFPwUrLtPumWGFC/AQMnQednEygrj4BCO5ppwFijfVRlbsqRA8C7klib10eOOqDH8+uj
	5SDN6AkePBdwuKEf0H7ouxnS5HcIQhau9F6KH3Wn4uHOy/qgX3ZjAELHCU0U7220NX3KaTq7Bfc
	UBKiWIxgstWYSffLTF66QYtkYJxzlIgws0AEqq1et/IpWg0JLq7L2RPhg65EnM39z1PVNFNv9xI
	f/XWFgMQ8UCp7X47G6/dgVSyIaat8zUfzIfrx1jT6XHBoXMIWZFjkASrBVYMuU8CCq5LfvlCFNh
	v3KxQIxA5giXMq2zG1t/Dd3zCvaUAc7wsuiL560TCvU0ZdAgg==
X-Received: by 2002:a05:600c:a40a:b0:4a1:8eb4:46e2 with SMTP id 5b1f17b1804b1-4a18eb4483bmr266434315e9.2.1791904668231;
        Tue, 13 Oct 2026 08:17:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:07 +0100
Subject: [PATCH v2 08/13] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-8-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

There are multiple members of the Sony Starvis 2 image sensor family
that have the same hardware requirements as imx678.
Add them as options to the imx678 binding, rather than duplicating it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 098f72544216..7c4a7a980084 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -5,7 +5,7 @@
 $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony IMX678 Sensor
+title: Sony IMX678 and Starvis 2 Sensors
 
 maintainers:
   - Jai Luthra <jai.luthra@ideasonboard.com>
@@ -13,21 +13,47 @@ maintainers:
 description:
   Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
   image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+  It is part of the Starvis 2 family of sensors.
+  Other members of the Starvis 2 have the same hardware requirements, and
+  therefore share this binding.
 
 allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sony,imx678-aamr
-          - sony,imx678-aaqr
-      - const: sony,imx678
+    oneOf:
+      - items:
+          - enum:
+              - sony,imx678-aamr
+              - sony,imx678-aaqr
+          - const: sony,imx678
+      - items:
+          - enum:
+              - sony,imx585-aamj
+              - sony,imx585-aaqj
+          - const: sony,imx585
+      - items:
+          - enum:
+              - sony,imx675-aamr
+              - sony,imx675-aaqr
+          - const: sony,imx675
+      - items:
+          - enum:
+              - sony,imx662-aamr
+              - sony,imx662-aaqr
+          - const: sony,imx662
+      - items:
+          - enum:
+              - sony,imx832-amr
+              - sony,imx832-aqr
+          - const: sony,imx832
+
     description:
       The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
       variant (IMX678-AAMR). The variant-specific compatible describes the
       exact sensor variant, with the generic IMX678 compatible as a fallback.
+      The same applies for the other sensors in the family.
 
   reg:
     maxItems: 1

-- 
2.34.1

