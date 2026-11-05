Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874547;
	b=Z7NRhDf3jWiXuGAyZvQSnj4EJsGNkvBHez531gfr3ixfB80EE4CsYEDMVqpY80rGELg+
	 bJRovt6jhaqaRWttSmjlooGM9JugyRRWblXq0UlLzyyUuuNaPzPA39S+xi5OGPjRtf4Lv
	 k+jAfPI6YamlGtWPRSCCVkrMFMxnUTO0Ya3vr6jaYtSCBRfmAWyzrgohRT8E7X/rO7ytk
	 53oQjZ+DYympkvKtj+iwv+ePTWz1BE2gR5UATRcvWR7gB1ENPyVmPXVx0Uns4ztBEy/jG
	 DgY8EV4Flv/dFisAGKjawnIZ9P8ZKkoevTGPoEnj2pLRR1yBnktCJ88JQ1LG8IoM0lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
	b=pUoHNUG8qWMuTHIkCvSrkXwrEy7mxDCPqU2nLixbXeJQ5+PaWd8NDE5spZrX2V1kGzJ+
	 FJA3XZVZ5tNcuO5b5yNdywhiLS/hO3Y6HU3ekiuCBSjPr6icF+2OKPHnyrV6FSv+c2Kr3
	 tnPImcOZyeKA89JGCwOosCOEEbpAuID92pdQj6MVv/Cja6/EMqSevIXi6WD6PGUaef+V7
	 O1LZc5sGeD6h2ihfvn6mBAxkcKa67Z8y+Aoj22ztCgwoZ3yGLpreq71G1BTIX+g3ib6T6
	 9J3LDkrzqaBe2v5+DjsU7fazeK/X7G+QC2umNfGwumNTqhap6R7o1flfZfDk2WJLU9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="a/6um+d0";
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA60A606EE8F
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 10:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA60A606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=a/6um+d0
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2540173a12.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 02:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1793874545; x=1794479345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=a/6um+d0uQTISqAYWjTSS9HtqKug8rg9E2rLH1wkEJ1y4a735hhrmhCOCiwFHxJ3nq
         A6zcqbb/g9Cvv42ERK/gzGNhSpFHNnP3IaxS8FusHfvgiVP5qUxfyDvsmsyN2dl8Wefu
         VckCYwBXoSy9paRds05qrzde8Csv1gyyZSxsRpcSxK9cAn0AAWc2SNpBRxBIuckufczm
         UqU4cZODqkx7b33OgQ6E/1hs7Blozqhb7/xi3/1GtZ9I8dS4qe8Z7m2EHgUxSLW4O6xA
         iqTHsyrS3gW5/HJxkGiV8JwkUV46y1WBvhA4S3tjiqgwztJPNW39oEQZKY0s7NRUH+rn
         Gs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874545; x=1794479345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=ng4uiCAVCKRtc8850Ebo0emlFk9oPDJYNztY2mbVfGReu5lc2776SxNHFxbdLPhmQB
         ogicspnJyPzP5MPLPeEI2ePRR6h1s/qVq4snf6pRY0R1gmDRL5+vwdrb+cuC49lLnJ33
         DwxqkNgVIUcdx0Y4JLVYew0E9gKJQMqYG3GXxxMyII/f2ut5VtrKTs0d1n1+chxJ9Rrb
         gKDFmEFHCOh9rH4LvopEMKE75W6q0ReBbfuibzUE/MlZN+52i7FHtBIne0ZLD0LXDGv0
         yAvhQyfar2rXoKMIWOW4DG/7hAo7Qio+gP/lw1nzOQXI7c/cakbhMQRqK3fT6bHs51yw
         bMDg==
X-Gm-Message-State: APuU4Z8QAjjL76t0eMcx7Qbp3gzHZ4FGygNSWhPkCcqnuRRQBxePu1LH
	Wv8kUX8nooRRPV0Os6iRAiW8hkJAebwxO0yAtOs6fj8pnEg37WBFCBns+i19zuteHyY=
X-Gm-Gg: AYBFou3lDYXF76OJAdqe7lsQAPvDVQ7Ubc2h3JxW1KXrISRzTx4LyQNSL78mNeENp5P
	xeToA2Ai11bHZJC08kwsZaffpp7opJfyy6Z5ypmYD2YLzqPBE2r6aeizqDv0w/XclBezeLxcDAZ
	LXF9euehbS76CzZIpuw7yys8UalsRKrbJsgWFaXX2oigMDETUdi80JTg0kX64iynDc+HdI9+/Ho
	4ImLE5rvEo54MxUfbWCAQz594ul7NQn/7NRPlGytWXl7thHgwVaxR25Zb0cWPxTr04gITOG7N6f
	YI2OpCmKXg+mHyR5pjWFMH1NV7YODMaLkSVBI3dhZ4OUbpaP+wTNE7uuz5U/QezZeNpASCxF4tg
	mT+LcB4cipX//bgPM3lvW4SmcmbliQdf43EN+qiJfagCCC7qfSfDrKOqX1NX16ezRNVT92AdGwZ
	ERobKAO6y7VeCdF+gEZHUGYQ9HGW3+NVdOGh226mlSPF1A+DZ3D9kbvcwfnPzZ5KTwJ95n8DjnW
	pKHdlejGrrzIL3F3xQnWaGYTlNf59Srk4PnQqfoB1PyjnAK61swjKge43UlYOdFCLQm6vIce7Xq
	HHIskKKDesTLpmVOtnymE4TrE8Ch4hpxp0pWXH78nDYxF1LKrvCLEKJu27/h82bDjeq73XIRnRh
	GoMiNiMM7Vzk=
X-Received: by 2002:a05:6402:2b96:b0:6b3:bca6:b480 with SMTP id 4fb4d7f45d1cf-6b4d65a8fb5mr13928684a12.44.1793874543883;
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5864a87c1sm278665a12.2.2026.11.05.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 05 Nov 2026 11:29:02 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-dw9800k_cleanup-v3-3-6850ee6a5a5a@fairphone.com>
References: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
In-Reply-To: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793874541; l=1266;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mcLSV3KKUJrX2Vt1xs2+yh4YAv9r2QOuUzb8TrvhqBU=;
 b=ijW9VPm7EHX86RDK200oj2lBmSMCAHlv42lvi+mFyiDqBGXFEZsOlxeuP2TZN1evalrtRLzuc
 zQ50VXLhpNbBVipwIcRAQN4VF/7J7Tb8Z9rXnYHls9BF6UrdAHwp2sx
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Update the node for the DW9800K for correctness.

Now we correctly select SAC3 mode and enable timing-control with the newly
updated device tree bindings.

This is a breaking change for a part that was previously functioning,
but only due to manual register writes in the driver. Now that we have
the correct documentation we are able to update everything to ensure
functionality with other devices using this part.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e2308abaea68a6b31a7e387881bf2..a657a5dcba9cdf750fab2478ca319f3a592ea295 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -665,8 +665,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,vcm-prescale = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	/* IMX858 @ 29 */

-- 
2.43.0

