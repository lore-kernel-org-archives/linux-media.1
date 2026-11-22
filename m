Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324409;
	b=GsnaiYPHtFJKR2L1FQWSsJdtJFAuwBSQUMozxz9+uGWO54Tf/PpDJZHG7dmOdvfSLEpt
	 JcwvapMWZ1SYt08EX8s9H4U7j5+gR/VcU54VeTJJwoY+PLgpYGT28tEjjlP3Z7EdGR25H
	 wLeIs3J0CNpeG8uLxdjJorp6k/IGvFtu5TV0JFNwVhznfeyIqkE0nQhMnYv+CbeMmq4Y2
	 iZN8BKUzRWcU3sZBuZ7tBVlMEVS1EXkER0xABxU+yEejuJKjXqN+yYO3K119lycb/8F1H
	 K6x+nKS6jgxWL2f9rR44p8Uu9LbSAnt4UdW35V7xUEKZuZwQi3wpVZklXF229lLd4Fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324409;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=C3jGhSkfDY/pORaPUJcs1Wqc3hDHzljAe9Kie45QYyI=;
	b=3oIbuVZY2BSiX/oY0EIOI58Du6ZcSYG7z2O6FNy0TjS20mhNe2VZxoUJGIEs72jIikUU
	 KEogob40MPwDQYCLxqV4zIuSvhb8RWZJibeOHl93nEkM6gawrM+mI4sSWyjDy6W7qnRsi
	 FX+qsFzmu54ZKkZ2sQqiHWVJ1UAV2rTr24hN2uGd9X4mJOpnWbUH8G/Sds+w/uSVteQm4
	 UYX2VrlcfqnpzY+Ejv1JsvJMksl2p+PYwi40YlJR3D141JdD3rqGagNXYalvQ82IUfeNy
	 6ZTKVuedkLaOtHjWfXatM84T44OiK+dZ9CtEIMIQCT4XzQ/KnieX+lAdTHA4hEriRvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HiKWrhU/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801D0606A68F;
	Sun, 22 Nov 2026 05:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HiKWrhU/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324409;
	b=MIuoa56ChQ50rM0guGsFp2rWJpjHvcltjrLrDvcwJqlRroMboea/vK1nUEeqNQ9FK29a
	 n03zvvslY4VihVS3OY+M3EPKQp7IstFa7i5Uzsojq9tcmpn2d2mcvLcvD8bizOdhq7m9T
	 geu/irY/LbF8UM1AY8QETNtWZ8lxnbgU8lwRGiO7Y/w2NIeBAwWz0kCNU/jIPP098MGLC
	 gVg2m2Ak2SUu6hXQHbbvRMA02u9wH/2bFOXd3Z2GLw/R1DS79ylSWCw2cREJA55jQd21e
	 JoaiJliohna1u/hzReH1/DtaaSokVqf0JmrFt2Uzf9xvNRydRgZW/I4XEeBDT4Joqqg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324409;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=C3jGhSkfDY/pORaPUJcs1Wqc3hDHzljAe9Kie45QYyI=;
	b=VoMv704Ro2KfuEKzd3IJHVyvZn7OM9hscBJ5AluxaTWxxbpcFnadfAYbeB2XMRx1dsCf
	 zwdUvRAZkK61CNq4DrzFwCaDvRbNwr1N24Hll6Qh3No7bRrcIPAEUq7nuN9X40MoUQres
	 tk7rI6GbrWYYKi9d4vUpJlNSLVzccO4hpyupLxYIhXPARzDcXDMLQqQH+R5Jr6kVSc2yR
	 ZwcY4a/TmPtuLSm14t1Amvau/tIvdV707jFIbCdGIdMZgiQttkDqSlowilIvTpMcymDYi
	 pNzRgZ7p0ZC+rrhIYpLIl8vOByD6HcwcW12fhdSPHQEoEbb+3WnBSiAX3YuE2QH0eSw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5643B1F000C0;
	Sun, 22 Nov 2026 05:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324409;
	bh=C3jGhSkfDY/pORaPUJcs1Wqc3hDHzljAe9Kie45QYyI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HiKWrhU/aldHdXd42RSlUWjv/sB1iJS16ph2KKoKtrY3u+Ey2nNViV6Ykpkw6S1Jl
	 gJGZA4LskTjWI0bKlNwN9qH3Y728jViyc5lfz5OmR3Ph3zfBVHHl7i5rO7YWxVU+xA
	 blgwlxyCLqxseL/MgQ4O24OOH/rtP0H6C04WZQ683uE9KRDRqTiBi2Rfk9iTxn/1jr
	 zTYtM0SN1Yq8KDTFmqJj+ISDagj8PhzS9shTtd7RHAf5IIdQPH2w48jGI9SD2V1LNW
	 FPJudKVDA5oJk2KA08XmXBU2r0b6r7MVr2tdSIwR+ppsZFGMGQEVzQ3Bk3xKr9V0hn
	 Jfw0H4FhsbH9A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D73A24BF4B;
	Sun, 22 Nov 2026 05:13:27 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Date: Sun, 22 Nov 2026 05:13:26 +0000
Subject: [PATCH 3/3] arm64: dts: qcom: sdm845: Add CAMSS interconnects
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
Message-Id: <20261122-b4-camss-sdm845-icc-v1-3-0671ef770fd0@enser.io>
References: <20261122-b4-camss-sdm845-icc-v1-0-0671ef770fd0@enser.io>
In-Reply-To: <20261122-b4-camss-sdm845-icc-v1-0-0671ef770fd0@enser.io>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324405; l=1474;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=vetqSv1oRjiySBze/nzqgzM3hC1OiU7h99VJ2Cazd+Q=;
 b=u1AUgAtlHUrvXG+9LsYER0zQrszSscsQaEe3WPlwJOB6wRkfpmH2XAU2iH0Nm2Zcy7u6fWyN6
 EsQWtvDccTTAmdVfWcpPiM2StViJusmu+NjH1EvCnFlcqbXR5xuPWEb
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io
Content-Transfer-Encoding: 7bit

From: EMCP333 <emcp@enser.io>

Give CAMSS its four interconnect paths: the AHB config path, and the two
camnoc HF ports plus the SF port into DDR. Without them CAMSS has no
bandwidth votes of its own, and capture stalls when the display is off.

Tested on a OnePlus 6T: with the display off, 10 of 10 1080p captures of
100 frames complete, with CAMSS voting on both HF ports while streaming.

The code and this changelog were prepared with the help of an AI coding
assistant. The submitter has reviewed both and takes responsibility for
them.

Signed-off-by: EMCP333 <emcp@enser.io>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 844b840bc5..4710556324 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4518,6 +4518,16 @@ camss: camss@acb3000 {
 				"vfe_lite_cphy_rx",
 				"vfe_lite_src";
 
+			interconnects = <&gladiator_noc MASTER_APPSS_PROC 0
+					 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF0 0 &mem_noc SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_CAMNOC_HF1 0 &mem_noc SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0 &mem_noc SLAVE_EBI1 0>;
+			interconnect-names = "ahb",
+					     "hf_0",
+					     "hf_1",
+					     "sf_mnoc";
+
 			iommus = <&apps_smmu 0x0808 0x0>,
 				 <&apps_smmu 0x0810 0x8>,
 				 <&apps_smmu 0x0c08 0x0>,

-- 
2.47.3


