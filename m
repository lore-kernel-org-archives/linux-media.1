Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216862;
	b=3LoQDK1cox9vVWXsjYD0SETOT7X0fu9bTRDbvhdi4TMHmsXPeBx0kNWIJPWosptLiwdN
	 IGBDMkyfrQ3aQEvBAPwNfEdp4zenJ5KtjwYtdGXDaqzzXxhT7BquPFPx+zh236Xgv4G7b
	 /2r+/+6w2uREDZIKEPeKdExO0xTPC07KCVk1A2/C91wnLoH0oxIBqrNmoj5y7vXEWgpkD
	 LmKv4ZgXDvhKTGEnF8La3uUa3hRs3GU8aIvQ8PNCleuvRZUgPIxlyOkYBmUnwtzAFX+im
	 wSypZWeKzWtpkHqfdNmBXglRmsuKIQO1usuDUXatLwQrqbufrwkHPUkeZ75F9c4r6Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216862;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=xeMlt+fdaFXivMcUgjZofIOwMLyBbYyKlTO94M07cTY=;
	b=AMxtgjkRqQ9JTvbN4KO5zOV9cCRVBJ498FZ0f328etzKy6w7LOtbF8ByJmkZoRGLegNj
	 gIVk6oRV+caX0BpOTUgWwbvZKLihYwG/DLoe9z0lJxufcqIQ9oMaMzbGaS7JkKA5dJsel
	 iuGZW6fWVErG5HyI8RZgoSx/UyqgM/wK1ATLwY2hxxIJ7KOFjoIj7efRY1qKWXt1Bv5FH
	 4gtfbUJtJpb1HJoBE/kq32WHvRJJj8kpgYf+wU6xJTYvMfkyZrxi41cJSVlbvHywTr5yz
	 OfdwKXRGWVWOQm1Jsj12n9XJUUzJ2k5ctH9iIeHHLguBIYOskjMVPsnw9L209LNp1yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nZKup4eW;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018EB606D809
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 09:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 018EB606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=nZKup4eW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794216860; x=1794476060;
	bh=xeMlt+fdaFXivMcUgjZofIOwMLyBbYyKlTO94M07cTY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nZKup4eWxq2KV6gtNBbuNCzCZzw6MNVkRfFd5ZXqFYodnNdyGeRuBnWE2Qx3OpSWF
	 v8u27vTMFHBuK8Fd+T0LqZixDlYO2/F8/nwF92SHQwNpaRZQkpTF/7F7YpTOmL9tte
	 GRblP03VAGaDW0VCacgCV/NSo2rdzEZld7AS+n8+Lw7/DNcGRbSeINtY3j3Ja6U8xm
	 /w0RYLKnQwWEctBdqebBvWB3uhg42vH2/f+JSH6GWYTeehSwqD9+aUk+JTSRegHPv4
	 T8ys2xUm0w3cHEtsBw0NQavbwjMkStTmb3IvXKbbFbWkQJii0MApSqrtMQEn2AqqpH
	 HHDnYMwDCUYZw==
Date: Mon, 09 Nov 2026 09:34:14 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
Message-ID: <20261109093353.3757-2-lsa.uz@pm.me>
In-Reply-To: <20261109093353.3757-1-lsa.uz@pm.me>
References: <20261109093353.3757-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 47293fc304fffcdf94f8cc74879257aff72d445e
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The VD55G0 is a monochrome global shutter sensor with a 644x604 active
array, sending over a single MIPI CSI-2 lane, with the same supplies,
reset and strobe GPIOs as the VD55G1. Its MIPI rate runs from 750 to
1200 Mbps (UM2829, 13.1), so its link frequency starts at 375 MHz, and
its I2C address is set in its NVM rather than fixed.

allOf moves below required to carry the if/then for that minimum.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v3: no change.

v2: the VD55G0 joins this file instead of a st,vd55g0.yaml of its own,
with allOf below required for the if/then, as Krzysztof pointed to. It
is Peter Marshall's 01/11 and 02/11 of his vd55g1 v2 squashed, as
Krzysztof asked there, with the VD55G0's description added:
https://lore.kernel.org/all/20260918221705.323510-3-pm@petermarshall.ca/

 .../bindings/media/i2c/st,vd55g1.yaml         | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/D=
ocumentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
index dfd87beba06..0245673d105 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -16,21 +16,23 @@ description: |-
  array size of 804H x 704V. It is programmable through I2C interface. The =
I2C
  address is fixed to 0x10.
=20
+ The VD55G0 is a monochrome global shutter image sensor with an active arr=
ay
+ size of 644H x 604V, programmable through I2C at an address set in its NV=
M.
+
  Image data is sent through MIPI CSI-2, which is configured as only 1 data
  lane. The sensor provides 4 GPIOS that can be used for external LED signa=
l
  (synchronized with sensor integration periods).
=20
-allOf:
-  - $ref: /schemas/media/video-interface-devices.yaml#
-
 properties:
   compatible:
     enum:
+      - st,vd55g0
       - st,vd55g1
       - st,vd55g4
       - st,vd65g4
     description:
-      VD55G1 and VD55G4 are monochrome variants, while VD65G4 is a color o=
ne.
+      VD55G0, VD55G1 and VD55G4 are monochrome variants, while VD65G4 is a
+      color one.
=20
   reg:
     maxItems: 1
@@ -101,6 +103,23 @@ required:
   - reset-gpios
   - port
=20
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,vd55g0
+    then:
+      properties:
+        port:
+          properties:
+            endpoint:
+              properties:
+                link-frequencies:
+                  items:
+                    minimum: 375000000
+
 unevaluatedProperties: false
=20
 examples:
--=20
2.54.0


