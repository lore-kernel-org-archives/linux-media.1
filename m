Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586735;
	b=JJoeCeI34cW0aNn8E2Z4rax1tsFfTGoOY4NTANd0v9i44R4oE/JdFFu1c/ZeeEhmcxa5
	 Uz+TF+VT8nx1kBt8ll5okbam6u7MQTU7xONiO50E2meFOLXwHZ+Hy0hVAshZUyhtNR95Y
	 +xZ56aSBgrQSnpylVpDf4EVXWBaQVggmjq+04FW5j4U9pKOaqwDxRuMVIrmyAkE7konvM
	 YmSoYXagM0qCfp9slYt0ad9HizDQxd+JxwpS6nYRt8eACb+mqPkJzH9lhHbDyxHenbuPl
	 EoXCW+54qA0Owpj4EE+IiGd2wTAzmoaU1AGn2xxqAAuGzbFDVYDOipysIPv6sTFNk6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
	b=mgZ6CvK/qKA4r/zxMLkqp7vBMw6lx3Y73a+78pMYVDFq8naeF8zyAhpRlyFl76WtL79r
	 RdFQNdVeJjnbDct14S0RUDlrq5qRWry6VF0dF07GvyV8D8l8FiE3OqS6273jqdPHEN5Me
	 lgwM/fjIDS50h1+5gcDbra6ZQSac+umAQquzCT0YD1PSbYDsBss2ene0lAjVOmpSUjZbK
	 vxCDvrLecHBZEbsCMR9ZLZeiTS5Mg0gNji4Vt6ps50TBhIHg1QXk2p1xVaaIqyKLX+Dss
	 /wjfngeY9YhSGgYYhd+7XZDO/Rx/HdzfU49Xd0Z7ZfhQRIh2/vuiSpDULT2U9TuYzvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8ApHqub;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD4060A2619
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 16:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD4060A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8ApHqub
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c445c95d553so218645966b.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586734; x=1795191534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
        b=P8ApHqub6qGp7W+FFebdVrJ+X5iLbPmacffloHi9fTC0HsJXY7rSMdfof50ekS7ma5
         n0CDtUxTa0CC4Q4nNOGSpnUl0HfOeZHPKL0SXehFLng+heyqaRIn2Mz7ZAw/6ZVcE7ZP
         iNFnqariIlA6DrC4gcyGg/2D1pBSshzYTdQ1bWvEHsHedrWACgysTbNUuVTYyXtLbmqc
         92vsk1zDxV/C7SAT8Nd1NZtnJn8rbJa5wLroVgvVrmlYuhfpGuO+Aq2CHOsopwMjAyZ0
         OKHNz0mtuFA/3TwthJNbgyRMxZ/oK3bMMORNrMcRu1AP2qITEXEM8WsMI5E+PkuLgfBe
         7q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586734; x=1795191534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvB29j5CecJ6jZKtZEMGpW6S1Git4SOKTeuMF3fwTjM=;
        b=MpvEwdvtZrI/SOv0sKh6MdLJdxTrvGD05MOqfoqMWWo6/Ylb70zECP55Cjj3ou/10f
         c2xAp4tbev3towAkZY85hqG0gBS3YD9fDZ7OhE6RiikYH5Dhg3HCmZ++eWcSY9RmUi9U
         TLIU7kGTeBE+xGr7d3q5TL7cDCOOWgoPbueQiHW3POlpMtJaFVTU69dkGgLHlOtxujz4
         LBnVwMbZZLmXHFh24DO4xE9nC30Bik3L2CKaiMNS0RljA3IsMbPiuPHEbhxKsFCWNRQz
         Fax1GEJRjCbgnt3AzjdUT1MYu4b+pQwUvL37VaxL7HGu+/teQrYFSkWODm+B4kDY3nD+
         wwSA==
X-Gm-Message-State: APuU4Z85L7Z5zVGHi05bFS2XLtaMA3es9rjQCQRoe2VZO4x1a9wfJ8bE
	eLHlNrkFz0k1SQqTI8kWLMuoDPVKxyDvnNiKF/Pb54XYQwjHUrP1m1bP
X-Gm-Gg: AYBFou1ahRLn08wEEepD4VeFyVBHHLogS/WKOUW0Hmn0SXK5yLg3Z4FPKmD3HEZywF1
	i28UucjegmAAonve92A+/HKE/BfjkasLb7vzJcvGLK7Kog2QKxy/i7Ayf+O7Ih/E210hOBceIyq
	voELdfTWnIHQ9grONQwOgAPqt3axrG8TXh74hZxEsyVbOWVTWDQpBFwDxhMsZwLyOTSpSrUNGOS
	xNgjEWZEEYXnhUzaYZVreyWc3bDIZvy87dMNU2zdKA4P4mmpVn+jGaD+zH3M6fYAy3+uk/lDTSu
	WO7B6dWG9rYNexHLvBXNlNGOemHPRxvqSdM+9pptI8BAfIFtlQFLeUSCDvHbE0F6EE8ugmrxhcR
	+oLKmnz3b2rljjRr7ynk2sNYWGcMYsldVTVgOGPzketuBbwyD/YWlC0q6iEQgPzwuTR4ybtIRWT
	RJImhoBtMQ+64BCXEuibaRwUCecfLWMj6LxP5JZRmD8DbUuccfdyfrYfkYwff9rJjIQt+WdtC14
	7gG8IlHxTwRigVCxDBlCRwUptPJusDKxg5ToVBIZASDHJq7xX5jBQtkeYsYP90+TgDN5kyh88ze
	9HUn3u5yltvqRJ4a6ySvPA1g5RNgRuXIuCuQ8hCqxmf1VWYM7kV67cO4GSAlKfj3HvofvW9hOlf
	2ik0qOCibvg==
X-Received: by 2002:a17:907:3e9d:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c5096396e4fmr271748466b.28.1794586733814;
        Fri, 13 Nov 2026 08:18:53 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:53 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 07/10] dt-bindings: display: tegra: Document Tegra114 CSI
Date: Fri, 13 Nov 2026 18:18:16 +0200
Message-ID: <20261113161819.36847-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a separate compatible string for the Tegra114 CSI, as it has a
different programming model, uses three additional clocks, and does not
contain MIPI calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
index a1aea9590769f..0c18ac81c6d6f 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - nvidia,tegra20-csi
       - nvidia,tegra30-csi
+      - nvidia,tegra114-csi
 
   reg:
     maxItems: 1
@@ -24,12 +25,18 @@ properties:
       - description: module clock
       - description: PAD A clock
       - description: PAD B clock
+      - description: A/B lanes clock
+      - description: C/D lanes clock
+      - description: E lane clock
 
   clock-names:
     items:
       - const: csi
       - const: csia-pad
       - const: csib-pad
+      - const: cilab
+      - const: cilcd
+      - const: cile
 
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
@@ -125,6 +132,22 @@ allOf:
         clock-names:
           minItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-csi
+    then:
+      properties:
+        "#nvidia,mipi-calibrate-cells": false
+
+        clocks:
+          minItems: 6
+
+        clock-names:
+          minItems: 6
+
 additionalProperties: false
 
 required:
-- 
2.53.0

