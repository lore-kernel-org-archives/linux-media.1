Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DCD417355
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 06:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616094; cv=none; b=phrRr9ueoa4VYcQY/cMoQ4KYZpWRCnKJ5QbDvUc5GWGdl9WpxGElY22p3G7VGmtLj5/lzIxScLlXrmIqNth2JgBDSREtjVOXAPmZgDTrCcGPZZ0Ztg/KuO+q0dGUfx587ghD/3GcvZcowmSvBS5pyI94yiKQuYQMnZjBL579ms4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616094; c=relaxed/simple;
	bh=RAHefaXglt+Txkz0duK6/2S/HGE7LcBt0LhyGHHFfkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnVtd+kXEod4JisFn0QQNlVraQzJqtLKxTKcBJsWBLkW3OZC7HbvZT6AWjuj5hZSxp8MIZiv38hQ3etUTxT4JYzKnqQdIN2FkxpV+HzmHzPMkLq+86nozjQ5WggXsjezB50vqqLyG1C2ExHlospWraKNM2aZLQtvz9W7Lj1tKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyIfiwIB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyIfiwIB"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f611b3af9so289683f8f.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784616090; x=1785220890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6arKxt/pKAK4HvJvMnbtdBhQ+d77oJa3U99lYSiiAM=;
        b=AyIfiwIB3wU1RvzGOwsF+81XhK5MKiiCIWUJOhlvcsfHX2mNVKqhGPl9X7JZ72cugw
         MDIFJxE+QTDoRoZ551fyes6b4ag6mlbf9xMYdUVWv7iPhpoiSh/XI2+QhsmbShZwFq+J
         H+5CgGwQe+LTBjcUdb/V8h+T26xEev7cnxFGDtXo2vaH6cE3LoaehiNp0qoWa277SAjX
         6PjgxnP2+puWFgwJ/tBBTsIj9CIm7Y3Elf0gygWrcwMJgRRM8Onr5CzB6TjFOHKbot5N
         cqNd7OULhei7hs1IT3lNTQ1Ncht6Rw18/HKSYL9pE0xlaGZa4JiB7Wwsu4EFQaj/jRqn
         K08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616090; x=1785220890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A6arKxt/pKAK4HvJvMnbtdBhQ+d77oJa3U99lYSiiAM=;
        b=LJGM1tNoMkzdVBIbsU4XsU1P6NsrA+gGQLu4boVgskLKMm/TDsybwXNFj8UybMxOdI
         rbXZ6DAtZ1azTg7Qs7RNIsfGSVBSIczeR+Ez0D/FN8zC5tDWc4BpuGTf11r5qpvm4Wik
         5DyP3awtnbqyZHtdlft1tqnC3rbridzcruqtnTBoXtT+x2QQMMT9VoR5nDJl01F6hpJf
         whxxBPZv0gQP0t96X10Xk5O0oX62PGI5P9zyYNxwFHhCRKKPVb6BqfGjoXZaSP0aQXHF
         QN599yyhvuGyIAG0QiBfb4JyDT96JDnWgy+JdFfnqZBI/u+Ku7tPfZfqZKuY2DRWJbu+
         Qh+A==
X-Forwarded-Encrypted: i=1; AHgh+RqV/1Gpc8pOePBkn4XZFB6P4hv8PVAd9JDbN2Jp/3xSdu43CGsm/Toe2XH2m855Uwcu8jaEe1ggGb6uhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKcIR141DorgSVlPK5gNdmlU5UKQuMp/MJGIE5gigVyMatg0x/
	FODGH9WBntetwJfwomYZmljWBoMzWyRFJHit7zNBezcJQYeP/DoTU00c
X-Gm-Gg: AR+sD10wu3I7w0TgR2GLv+XVux5+AciHLQoCrgUxlPrE9UMDHUfBSjK3QNDgQorR/Lr
	CkH0qOcE4bXY6C27rm/SzY+I/mU2K8r+igrcAAjgLAQ6Adm/3p/KORzWyMWEQtwTWZNBrMJWvKq
	AikyCWC/UQV1hAtiTjhkI2iMFkQSwE43B1C40bmWHPm+vmsE5gJflT0HG0MCGL20Ug2hfTGnWCg
	22pPc+MzwNDdfjiSXC/XVCs1+LNRSAJAdR0fC5op1PmJLZB5T6uqMBhf/Q/R2wqsefyzcI522n/
	ILXGVFaJU9AfMC0wo7itY/mIJ0fC0RbuY306BcEu72uja0O2Hhf2dITkIy6WDqzWlSzbyDpKlpN
	4pG0bX7eWZ0hdVGH2xsRdJh2E6nU4z92CtCGNosCyAGJF2a70h4gELNI2JkNZsco3vpuh2fNvxA
	hB45tsVePHF6ZKTCJHp3BNXYabEMuAgF+f8G+YR73M9qahzpiLl2GL0A0re9cQCUm6e1qJiZLf3
	0lzHIPW+A8Hd0BFwR9Kyw==
X-Received: by 2002:a05:6000:238a:b0:475:3a97:8e2a with SMTP id ffacd0b85a97d-47f6233d4ecmr10721512f8f.7.1784616089904;
        Mon, 20 Jul 2026 23:41:29 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B88AD00DA0BF9DB4519DBD6.dsl.pool.telekom.hu. [2001:4c4e:1b88:ad00:da0b:f9db:4519:dbd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm38837951f8f.22.2026.07.20.23.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:41:29 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
Date: Tue, 21 Jul 2026 08:41:12 +0200
Message-ID: <20260721064115.64809-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI RX controller can expose the audio embedded in the incoming
HDMI stream as an ALSA capture device. Document the #sound-dai-cells
property so that a sound card can reference the HDMI RX audio DAI.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v4 (both suggested by Krzysztof Kozlowski):
- reference dai-common.yaml and switch additionalProperties to
  unevaluatedProperties: false
- drop the consumer comment from the binding example

Changes in v3:
- no changes

Changes in v2 (all suggested by Sebastian Reichel):
- reworded the commit message to describe the hardware
- property description now documents the DAI indexes (0 = I2S,
  1 = S/PDIF)
- moved the consumer reference into the binding example
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml  | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index b7f6c87..b80660d 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -78,6 +78,13 @@ properties:
       The phandle of the syscon node for the Video Output GRF register
       to enable EDID transfer through SDAIN and SCLIN.
 
+  "#sound-dai-cells":
+    const: 1
+    description:
+      The HDMI RX controller has two digital audio interfaces, one for
+      I2S and one for S/PDIF. The DAI cell selects the interface, 0 for
+      I2S and 1 for S/PDIF.
+
 required:
   - compatible
   - reg
@@ -90,7 +97,10 @@ required:
   - pinctrl-0
   - hpd-gpios
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -129,4 +139,5 @@ examples:
       pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
       pinctrl-names = "default";
       hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
+      #sound-dai-cells = <1>;
     };
-- 
2.53.0

