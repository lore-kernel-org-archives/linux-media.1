Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102710;
	b=cO227qVCe0mSqBeYA3+AzPW5Q/Iesm3TiTUAaU83yl+O9ziP/oRpsyBmmqglC1tPL8AI
	 npQlbAT8Z/PATBJ/RTRva7CqsLIVyBnUoNzG09GjGDIxPey074rU71d+FxtShNkY5LH/7
	 FSQ378ZD0NCdVn9Xp0Jj3M1XuPpCLU4W8M6c92/ZwIaZMiEvuR7J3EZE6R7niuZxQXQW0
	 aaaALVceDrGQA6SzP+OBWXBekZ2YamSxy+LTjz30z1jeRjEmPLwa0M1s4LL7ZQwE4nODQ
	 /Jru0NmEBZ5RpZqrNi2YHLZqCy+AJY4rYKr4wyycJUHJm4Zttc0f+vuFQ9lDxmMJlbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102710;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FbNtF5FHv0WDrkyvzCRlU8lR54qdI/EjpcFZPVsY40I=;
	b=uP1fE/w8hZ2+1WN6Z8daVtPFlQWDmX9e70/eSj76NCKkomM1XvIbCTitrB0nh49K0Afk
	 GBpIhmmSSwhwBr1+nRLxyk6RrHvfGqyQOmh+8sA5iz5IzvGh7QfAD572tfP9w8YofB2nN
	 gP+eyPiXXc27Q2N1jh3pEsy04beZMa0Y/38PJJ5hfEIlEEO7M1U4KxuBzkAS2M4NMPYr+
	 mYJmTRP4fVsN7FCJIfe0nO2Fo6tY/+iMOH7vNT13zwg2sSZl+M8PFDw+Pe3eZ+FBPj0gk
	 +4NeYpVUfjSjnpbSmMdSde5mgRtRiQm4P267FoYXGteHMIhmoNRrq2EwvbmdatWHpzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AfsRJles;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66A960A3806;
	Thu, 19 Nov 2026 15:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B66A960A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AfsRJles
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 449A21C14;
	Thu, 19 Nov 2026 07:38:26 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE9EF3F882;
	Thu, 19 Nov 2026 07:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102709; bh=YMlizsyPF1bk+1wbvFmQX9WCN/mxHD2ZAOrHcc8o77A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AfsRJlesKpvbtyIDwYlbjIwmMu2rIriBk5WtmvbElG+2lVRKCuQ7tVL4UggJBhDN/
	 jYFLPLZhILu15KnOWCokFTgBSsnbNVt5u2Dz5Xnkb53qeqSiYZszsa1XsI0EmstlZI
	 NBZ7aMXE8QoRaz/h/ggoNI74bYpxIYXDO7u5xNeM=
From: Charvi Mehta <charvi.mehta@arm.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charvi Mehta <charvi.mehta@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: [RFC PATCH 01/28] dt-bindings: media: add Arm Mali-V76 VPU
Date: Thu, 19 Nov 2026 15:37:31 +0000
Message-ID: <20261119153758.1426673-2-charvi.mehta@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153758.1426673-1-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
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

Add devicetree binding for the Arm Mali-V76 video processing unit,
a hardware accelerator for video encoding and decoding.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../bindings/media/arm,mali-v76.yaml          | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/arm,mali-v76.yaml

diff --git a/Documentation/devicetree/bindings/media/arm,mali-v76.yaml b/Documentation/devicetree/bindings/media/arm,mali-v76.yaml
new file mode 100644
index 0000000000000..2ac4934ddaf4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/arm,mali-v76.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/arm,mali-v76.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali-V76 Video Processing Unit
+
+maintainers:
+  - Charvi Mehta <charvi.mehta@arm.com>
+
+description:
+  The ARM Mali-V76 VPU is a hardware accelerator for video encoding and
+  decoding present on ARM platforms.
+
+properties:
+  compatible:
+    const: arm,mali-v76
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: VPU core clock
+
+  clock-names:
+    items:
+      - const: core
+
+  resets:
+    description:
+      Optional VPU warm reset control. Platforms without this control must
+      ensure that the VPU is released from external reset before the driver
+      accesses it. The driver performs initialization and recovery resets
+      through the VPU's software reset register.
+    items:
+      - description: VPU warm reset
+
+  reset-names:
+    items:
+      - const: warm
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+dependencies:
+  resets: [ reset-names ]
+  reset-names: [ resets ]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mali_v76: video-codec@6f030000 {
+        compatible = "arm,mali-v76";
+        reg = <0x6f030000 0x300>;
+        interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock 0>;
+        clock-names = "core";
+    };
-- 
2.43.0

