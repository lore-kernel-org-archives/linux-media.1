Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795749804;
	b=M9P10i8e4PbHL1lUAsOLnMbNSwI5fKSjEnbtFTY1c0qNnT0HC8/Hf5sjrMK37BocJDIO
	 l0JCrkyQ5sri5PWuYsQsbakxIHEiXqVB3zsfArbDRwct6GXj6vwkcXNZZekueTlZrOW8I
	 ENMf1JwWu9rf4NJedOd6rPZEeOlNgvM/1GsE6uVThCDKhaRyy2hbPqmy2OQOdCmQ+EHmg
	 /8ALCvFa60/aA42yVHCr8Bxyyl3N4m4swKvfqd5Z9pkJRjOi0AkRFDmUOBOLfKOiAN2+F
	 PLn67+KNKOAOrqVawosSKz282DdJ5jHGB5SkVGqFs4lq8YGVEbsOcfxzvBNNkN5gnlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749804;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=VUJ/fAr6VNMby11/vpzUa83loyeR1QjtR4arNWqG7FM=;
	b=tBs75fNeUCr3S7t6Qc2t1ClORuSCH5Z9naLsY8x4RuoOKs0XvdXoc8xit0a/wy84vK9G
	 F9LmPgEjTDfn9Xwd28k4Lum6DcoDNlxwidNvDPJAduVsbEZyX2N+bDmxaJWjGHflWhSUM
	 rr5XiQXwhdh6cfNUTgbp8qUMSBjmsb0Iks6hQ8LjJUthk1e7viJJnIjX/z6dgurWQyuwj
	 WdmSc8VWw8KyT4Ul2LWOEpj+yVeUbXnSAgWoGpv4XECR6MbHcaGxcDB+1Gkvskc5WpAeP
	 KrDn5Pxn4lqvyHqWocmXjUd9p3pcfpyVREmsD5fWZJfVy7e+jxBnYxYd3Ttv+sJQJQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gLfM3rQ0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8340E606A31E;
	Fri, 27 Nov 2026 03:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gLfM3rQ0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795749804;
	b=VIGBSejMOevpkGaFQpjjYNu9MYdLd0lZE07tsSDDywg3UseSkqK958AGXR9uxOB7slgt
	 fjc3wuIY6nK9r6HZOgRWrkNMwSHf7xSAg0jeEmwzNn1U7ARMLqoBpH8EgSatEOEwiY1Nc
	 Ze+HaTMO1mme9/GQigovYudC7Re7QzYWW3Xgm/JLcDVzaZkQusbL5uH7bjHLK8Q/o9Enh
	 VWr/sJIMpJOwn6eSVGPKDmkwp8F1G/POfJiwOz7D+gNRglImTYq8XZwMy/NQtUU29U1RC
	 r2ZHY6kNERCmEOMM4tq4eI2X4hLBMC9MnwfKp0I+xAv5R0vzUf2lTrnFinppEhDyJYQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795749804;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=VUJ/fAr6VNMby11/vpzUa83loyeR1QjtR4arNWqG7FM=;
	b=3S8bpreFaxUY/rRoEad0G5k8oh7923uVtQeqSsS0cUdvrGinrNwgq/HHlI4rXSrIvyM5
	 W4AKmsvJK5eLfB/l26g77n03r4SbwXYHF4hTUaZODbAKM3BKomJRfAxgAmj5aodmJX59V
	 3FS9zgnNes/hD8uqk1d905Gn4YxBZpQePbeInSajCZXATAZOSWPR5ZwpxjnvbES4MjdJp
	 nXQWgAoGCENKJqTT4FfneUbXI2Xa0U7LL8b8uyPkxbJPS1ELG+gPwczeYgtVZC3iKG9LA
	 Hl5oNSCe20Z+VPPfOK96heN6bzLTsjFLtWOKX8i7vWb+fHrox+lvF/hird8tyaJOv/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 805171F000C1;
	Fri, 27 Nov 2026 03:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749804;
	bh=VUJ/fAr6VNMby11/vpzUa83loyeR1QjtR4arNWqG7FM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=gLfM3rQ0Gt2B+gCgKaBZifRjqJ6/IuRAAZKZVVN5JQuJYgAdcxy6wW56j8eHtiCsT
	 hmzvrHcfGEb1UwJp0oHVp97FBoDeose7gXk/m7FThL2EAWziSCDeAuIMBvbehDkG6M
	 ZPqzumIR5JkzoMDXwpRpHmPf2LHtsSFoGdyZycnODW+npGTjBV7pWN4HogKsUotKl9
	 kBlV5UzJPpNOwHzq2P+axgwPmAdGKQU7ln6jY0EbVwzQiWeOtQxi6Mi/KsRRuHG8ah
	 VTBw2MXGavPB/z6cvxfM+LYKdpFgjurqogK84tx/vsHk/yOfdxWiWsty4WYmIK+NCH
	 dxpoS5BGhqgmg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F088D4B526;
	Fri, 27 Nov 2026 03:23:21 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/2] ir: support IR for Amlogic A9 SoC
Date: Fri, 27 Nov 2026 03:21:53 +0000
Message-Id: <20261127-a9-ir-v4-0-820209515755@amlogic.com>
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
X-B4-Tracking: v=1; b=H4sIAFH3CGsC/2XMSw7CIBSF4a00jMXwKhRH7sM4wFtoSWwxYIim6
 d6lTRpfw3Nzv39CyUZvEzpUE4o2++TDWIbYVQh6M3YW+7ZsxAiTRBGJjcY+Yl4Ld2FaWUUlKr+
 3aJ1/rJ3Tuezep3uIzzWb6XL9LWSKCRaONAxMY4yjRzNcQ+dhD2FASyOzT6c3xxbHgNFWGekc/
 Dv+dprwzfHioBWKgpQKaP3t5nl+AV/U+8EMAQAA
X-Change-ID: 20260706-a9-ir-354fb297e716
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749801; l=1248;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=lP8dWaYvlkNxblzfl6GBLSnU86I9FtR51w4nRbCwyHs=;
 b=7O/Thlf1yZqCmYAoCt8dVr+68VqOGpwmlPoslKIKPvqmHSD2PQ9Ks05h/iy7RTv+nLPhZ8fmm
 JrsbGrZIV5mDopbKbGX8jXDRwcuDuzfSeUlkq3hctZsuAD13vT9KfQa
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Document the Amlogic A9 IR controller compatible string and
add the IR controller node for the Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v4:
- Add Neil Armstrong's Reviewed-by tag.
- Link to v3: https://lore.kernel.org/r/20260903-a9-ir-v3-0-cd471c667c15@amlogic.com

Changes in v3:
- Align the node of group-remote-input-ao-pins.
- Link to v2: https://lore.kernel.org/r/20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com

Changes in v2:
- Rename the IR input pinctrl group and its phandle from remote_pins to remote_input_ao_pins.
- Link to v1: https://lore.kernel.org/r/20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: media: meson6-ir: Add Amlogic A9 IR compatible
      arm64: dts: amlogic: a9: Add IR controller support

 .../devicetree/bindings/media/amlogic,meson6-ir.yaml       |  4 ++++
 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts    |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi                | 14 ++++++++++++++
 3 files changed, 24 insertions(+)
---
base-commit: 807a34cf91c1d91f2beb3cacef9eaa98bd56d172
change-id: 20260706-a9-ir-354fb297e716

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


