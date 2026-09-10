Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD4D475342
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052559; cv=none; b=Ef7A1ruQ6z2CIqdQhnRd5NxmjIWxVd6r7MDmyVHcwiUCG9P15Jm37wtTQWOZ6foZaMor3D+mWNxFstcZPTGVgiyGPvg079N9MUjopdg+1mBuR0xjspXgBc7WbLneZRlqSu3pGe4VpP03J4OxKQKcpyoazNomv0JraXG/hCBcbHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052559; c=relaxed/simple;
	bh=hoSswXVWLVu8GkcK34DAUODiccHHAek8ONdPjlGXrBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsedLTmPVTUARZFBu1CbVwPB13AByv3b0HiS8xPaHdlOpE9BFX+uHfk1bZ8pE3M7PBf0QiiM4ChzvGiCT1YC0l48FQbD77mtpKGljSiY0Rs5r8Eg1KkO/gFfvDn/7b81z02xeQSSAVGMLFaYAlky3ZWrxx2tOpQJgH46fRhop9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4psBFswk; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4psBFswk"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6249b76a8so2599786a12.2
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 08:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789052555; x=1789657355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/FP+/J1r8J6TVzr3mtFdJoEGOGhci033fWlcw7cdVw=;
        b=4psBFswk02XhtP/PYlzmRgAQF8EzZBose+n2ouRt+AUcwIndzz/zgCj12PBoJpWGHq
         Iu8PfmQfdzQOwA1jWLjpGeXy3WGJX0XZf1C1PZQ0/C0T9HctcEF7FYCj5y2dSMJE4xyb
         Y+zogHYtmLvyzYif+CtHafFQMdDLzPQABuOijQNLOtQZdVAGnXzz/6rL+yDnHpUgc9xG
         N/Av5/E+0+wrGhqJpCwR7mnmMqpFi3iCBoH0YiAjtBtWLzo+Ovo7hoSWKSJHnaERNVMH
         6YHn1atNFVpXk66KS2VSkpTpoUz6e89TBp35nlxbgwsOwoC1C1UqP1P1Z1b7/g7gfWL/
         Dsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052555; x=1789657355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/FP+/J1r8J6TVzr3mtFdJoEGOGhci033fWlcw7cdVw=;
        b=R11IbxFra4txFgah1pYwFvyFnJkD9QicIGrdYeHLDZ7qTZa0IjvJ5Rupd+Zpa6pKu0
         Cd3ACbnkbbWUBKrYCAOj0nmxa2vLrgeWMhYFz8yHC+LUroInQKwrm+/bqMsVsoTL9MTJ
         t9BO3/4prejNYnGOh0gCiD+sKenWsrgygyMQ+h7V9k4NYlzXFnuAU/8BUupg9cRvJjw4
         cUVE58e/nUHBkcltJPJhC+oGygN6Vcok4QKQuzHEVoK67ZQdvU/O0+uoETWfXXdOOUeS
         mFZaG6t795pv7IP5YhpELrXwVIs+i50d4Sesm6/wVzVAJOs0hT3/TCqGGNLmeRfrHA2L
         BcGw==
X-Gm-Message-State: AFuF++ms2oYXkvWnc4H3Nmuk4+1VKT66+LYVitt4UsDMF7opwC1Jwd+/
	pz5FIK/GZpjzR04c4MTG4/ymhsAOoA4NNQ2OckuTMv3KzdrGnnfIMNgG6secFIW4JVtJHWKKMmq
	Wm08k/JM=
X-Gm-Gg: AYBFou3mNTgHDpi/VgR5tfzFWJZ1fgLn6zPR+S7h4sGpAuMrgsHVt0stEOoOPXIX2Ld
	R+p+NExLR9wMOzJMA7P4/tKC1E6ojxze++MYA3cqnWqrwPuTDfWojMuUlFgtipuKBhZhNavCEoS
	z7xLe16OYmLGvMX16EaIL4d9vmj4/pncOPqORU3+qKP83R/NnvUKGNOEyw9+XbQwRTmQWWGSYJj
	VbQsDYDE2kVHK9cNE0a+3TRkisPWxNoUzJQW7OvNfM8oAVTzWz4kw1TU/YWBmU7sjbe+kH0cJLK
	IbeXTj7h/P30M4a5UF9uevGa06UBdPkNBVDWUTAIUGUhVccTEDNIG12NHZh7G5NE/9FfktmKaRw
	Bj2tPNe8mMQy8Wv4dBIIRI+V3CKYpOSSqcGRIWeA7Q/oZgX3o6MJVN5okY6anYuFr2mkeQmx4lE
	9pffzsLWctf4bqpIWguDMK0Yab5NtbGbDBBkBvn6MPBJbEnzWF332wqZsJ2IL14suaAhdajQ4FP
	lu/z453WG7Egkmf+Oa20VuLf/ItrD/ikS8HySbPyfTpGC9QIJoxlF5CRS5ec8tRBxo=
X-Received: by 2002:a05:6402:4496:b0:6a6:c4b:c92f with SMTP id 4fb4d7f45d1cf-6a99caa4ab3mr3245892a12.9.1789052059555;
        Thu, 10 Sep 2026 07:54:19 -0700 (PDT)
Received: from [172.16.240.55] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm8849715a12.30.2026.09.10.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:54:19 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 10 Sep 2026 16:54:16 +0200
Subject: [PATCH 1/3] dt-bindings: media: i2c: dw9800: Redocument DW9800K
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-dw9800k_cleanup-v1-1-608255ea61ab@fairphone.com>
References: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
In-Reply-To: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789052058; l=4019;
 i=griffin.kroah@fairphone.com; s=20260910; h=from:subject:message-id;
 bh=hoSswXVWLVu8GkcK34DAUODiccHHAek8ONdPjlGXrBw=;
 b=mK9NBTDF9vNQff5ArJEJnZs0qmDIcE1+GHUJCkp4/mfoWcQARvlLym2h7RHwXkoU/KN+/hI0Q
 E+U5wCvToxDBDd8BKydh9zjhrjYkWkbWhsx77cn7VwX68fvfo8vz1PZ
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

The DW9800K's properties are too different to justify sharing the same
bindings file as the dw9719, Create a separate bindings documentation
for the Dongwoon Anatech DW9800K with it's updated properties.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 8e8d62436e0d..38db0764c0f7 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -21,7 +21,6 @@ properties:
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
-      - dongwoon,dw9800k
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
new file mode 100644
index 000000000000..046c0a88bcef
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9800k.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9800K Bi-Direction Voice Coil Motor (Bi-VCM) Controller
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+  - Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+
+description:
+  The Dongwoon DW9800K is a single 10-bit digital-to-analog converter with
+  +-130 mA output current sink capability, designed for linear control of
+  bi-directional voice coil motors (Bi-VCM) in camera lenses. This chip
+  provides a Smart Actuator Control (SAC) mode intended for minimizing
+  mechanical vibration.
+
+properties:
+  compatible:
+    enum:
+      - dongwoon,dw9800k
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: VDD power supply, can range from 2.3V to 4.8V
+
+  dongwoon,sac-mode:
+    description: >
+      Slew Rate Control mode to use: direct, LSC (Linear Slope Control) or
+      SAC2-SAC5 (Smart Actuator Control).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # Direct mode
+      - 1 # LSC mode
+      - 2 # SAC2 mode (operation time# 0.48 x Tvib)
+      - 3 # SAC3 mode (operation time# 0.72 x Tvib)
+      - 4 # SAC4 mode (operation time# 1.20 x Tvib)
+      - 5 # SAC5 mode (operation time# 1.64 x Tvib)
+    default: 3
+
+  dongwoon,clock-presc:
+    description:
+      Indication of VCM internal clock dividing rate select, as one multiple
+      factor to calculate VCM ring periodic time Tvib.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 #  Dividing Rate -  2
+      - 1 #  Dividing Rate -  1
+      - 2 #  Dividing Rate -  1/2
+      - 3 #  Dividing Rate -  1/4
+      - 4 #  Dividing Rate -  8
+      - 5 #  Dividing Rate -  4
+    default: 1
+
+  dongwoon,timing-control:
+    description:
+      In LSC mode (252 + value * 4) * divider value in microseconds
+      In SAC mode (6.3 + value * 0.1) * divider value in milliseconds
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x00
+    maximum: 0x3f
+    default: 0x20
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        actuator@c {
+            compatible = "dongwoon,dw9800k";
+            reg = <0x0c>;
+
+            vdd-supply = <&pm8937_l17>;
+
+            dongwoon,sac-mode = <4>;
+            dongwoon,clock-presc = <0>;
+            dongwoon,timing-control = <16>;
+        };
+    };

-- 
2.55.0

