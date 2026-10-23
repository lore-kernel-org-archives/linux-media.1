Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773087;
	b=3ldS+2V+7waBZbIvFY+O8kdduy9omjuMKRG/8k2yVqqFzL4QEulBDirnMf3XjIsEan6x
	 YqG+TnLqL9PQ3jhYXiTQoUiibgEL8tRL0bdGHknOSUzw7RgEhOBDIN1suQh5V8eRp06mv
	 8NYKUCr1m1fOgInevNeh1pJGBgA9DU/xgd37uFT3KPVuBB1Yn9UfncZxs4SiKvBBwxgUy
	 x7ENoI7gwhgWknearPsq2a/7E8c7hOyyPXX9fFgTKuvryCyW0jS+f0vardADZTS6Eq6My
	 PBaYRdR/wXmbFrvYL+I/k5tS1RmVpA/7/+DQ0XXAMIxcKUjAMhKAygqxVHBosbMwCdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773087;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bhmNBL//ohDUQBiVwCH8dmQtob2Z0T5Nr5g00Vds0tw=;
	b=f3POksohnC/jFPbgIyBxxkkj9UHUZbVob/ttfmnaY4SFQOdeRp6MmfY0n1l8AosD3S+T
	 Rk76nik9tm74h1zjj7aiQ/vFWf2GZhkd+ZEH/BJOvraBbhxhREJoboOWa8xS9wcMROGRN
	 R30AcwbW4uA1CoMK+LMtPHPVLoFks+ECHM81QoSSwMlIeW4zSctUTlFlbVomh9Bs3z/X0
	 WfUjbRU42YfZYJsbcgN8yVuzLKXloWl+B5IaOc6Wf/wUJrthTmx3v2Gkhfam9JCKAU/hG
	 cMGyUS7ZPOPVDuX6gFGxfQmwntF8pVGv3bLxf4AZnd0LjNs257/pApFmIyMsLHwkVUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJ1Kbwac;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7795606A32A;
	Fri, 23 Oct 2026 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJ1Kbwac
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6BB1F01828;
	Fri, 23 Oct 2026 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773086;
	bh=bhmNBL//ohDUQBiVwCH8dmQtob2Z0T5Nr5g00Vds0tw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lJ1Kbwacpb4HGQQwXOhT+rGg1iXmG8VEcZPcbAeDy+w1898qcnreF53dCOOU7n8a+
	 S0tLZpLTXvlwjn9vsyrdsy+DORZHT85f21HxOaDsLXOuQ2Q+n2WO5W9JDwSIiHT3uU
	 jhxPrZvMqmgZDTosjRLRftjM2dkzrQohToK+ODoLdpCCoCx3gehvHYIVqntBgr6cN0
	 IX9/OZrMBxzry6E7muh4T07aw578CFC2xPDJU7zppytlPo19VPqD9XrP8tU0m+a4R0
	 yaCqFrQykQThzEi6HjGqgBiNcd4k4min7fsnFjo1q/8sx8l/wrSRNR2aeK4qt/7KHm
	 uQseWexrsVV6w==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Waipio compatible
Date: Fri, 23 Oct 2026 19:30:51 +0300
Message-ID: <20261023163057.775917-2-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261023163057.775917-1-vz@kernel.org>
References: <20261023163057.775917-1-vz@kernel.org>
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

Qualcomm Waipio SoC has six CSIPHY IPs, which are compatible with Hamoa
ones:

    qcom-mipi-csi2-phy acec000.phy: CSIPHY 3PH HW Version = 0x40010000

Hardware supports up to three different 0.9v level power supplies for
CSIPHY0/1, CSIPHY2/3 and CSIPHY4/5, but there is just a single 1.2v
power line VDD_A_CSI_1P2, which supplies all CSIPHY devices.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..2a11ca7c7d11 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -19,7 +19,9 @@ properties:
     oneOf:
       - const: qcom,x1e80100-csi2-phy
       - items:
-          - const: qcom,glymur-csi2-phy
+          - enum:
+              - qcom,glymur-csi2-phy
+              - qcom,waipio-csi2-phy
           - const: qcom,x1e80100-csi2-phy
 
   reg:
-- 
2.53.0

