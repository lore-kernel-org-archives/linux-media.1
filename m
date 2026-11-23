Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795396914;
	b=sCHBduKK14Kj/BdSIrMl7T0OJzM4YtcJZD0sS9yB/XELMRipbryZk1AJCnErTPA+tM6+
	 aB2MZ0anAHCPMveE090IDbeI+nKOCQBoZzOZPKfuVBPa1f1XR+i1XStK1DX7o87D/Scr6
	 TlpT5yA15KWXZSDOU/sZ64I3LwfNxpIE08/yfH1qbeVLW8Zpux4Xze3gZ/7qma9HPGuss
	 JYbTEAeVN/AjrttIQfXNmbhGg+9A0p7BEO82FwcM88wJA/3veuokqHo/+1OswYeZsNMMi
	 GEu67zAkhj9nW0z1NdXOg6duCZrujy0+8PvZd3qJda3MtBh2uxboj7itlRemxwj+4nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396914;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CWigIpPVsSLso/LPVQlnZ8yKOycJwVSRyTPiWiXdq8g=;
	b=rZB36vBCdA2c2ujxb0dXQF4IAxIpJZuXG5cnbtPh25QV+dMih6qxbzO9X8kWa6ObeXNg
	 s1+Rn0ycClepFalQl7K+YWq6VdyIbjACOQ9+mR3Y88uTMMqwtGOdQ0jIOlNhOQwyt0Kzr
	 LCZ1PvdObPUMf4ZX/VMvcsIdI9YBf3/Pb+wFRPHwViR1ceGBBsCRh6x4XNG9YQMcyfMA/
	 fF7nU+ST9gec/Xf+/T79+aR433Co/4dXzkK/GHRWqd5A4dN9V/X4Y9I0rt1Qmm5RQybRT
	 IEzGZJbZFxwBNx+6J82T28nI0arvgI/tmY+L1sEgKaRWvep/qwbBVCzmUsken4mnEHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T9zc+RpN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E46606A334;
	Mon, 23 Nov 2026 01:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T9zc+RpN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795396914;
	b=KHRW1GKKb9IK040vukuVyzi0y1yOL7v5NgKbeT7/z+i7ycH/K7Slc0+jCWZgyNHvGgpk
	 xFq6NyTaNY9Ou4oHgMlbt2SkZ39hR/OQAx0OZ2um3R4MqZFaiyXNs+bzIDLNwDLyHc+6s
	 eP9xlhaTZDOAVdOpz9uizKVbTHA/XBSctPCl6WXOnrJpsSL497VzE8eb3AIZBusaMpqvP
	 y6qMms6BLSlI7gpddivkRoNNLp5lj4dWzv0PCA9Cy0vKR1MQ9OM6WehChr8gMqk+gxQWx
	 6TGF5ie02JBsh4eeeW4DTW5WG22QbVnI4cw3gnXTKQXa5wyHsZEZkvWggld8/aYVw9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795396914;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CWigIpPVsSLso/LPVQlnZ8yKOycJwVSRyTPiWiXdq8g=;
	b=fGl84biGzCcuNphPd1dTVJWj5hCnMU8OYCnS8cY1ShY7h1mgiRIu7GrY/FxRDudZNrT+
	 dUj273QznqBztih060v9sIwz1uHHMGu1tVY2ZIvm67D+s18xd+KlPR4MP59U5uEQVo54o
	 37TheNNP/enZSR94cQK1fZ08XQxP+qLTu4I3nr4HGi2Rz5qU3EEqwaq9tDupbGLN/bI5R
	 eEoY09l9Ko5SV88ICKZyUkc2cGkLH3f3ugCyxToio4i0do+LbR3TIzDRfAvIaM/0s2Wnu
	 kdyyHpLXBGRPAT4cchhQnLiQgl0QrzaTALu34VyGoADF0oULPdl8Igi6HovbriPDsVw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C3C91F000C6;
	Mon, 23 Nov 2026 01:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396914;
	bh=CWigIpPVsSLso/LPVQlnZ8yKOycJwVSRyTPiWiXdq8g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=T9zc+RpNDrfCMyEjapWz8OvBuBnlBtbO8fzsblCq8Niugev6JsLgkw7BnSZ14Jyfz
	 u+YfeJyLMK8OdDhLPS+/6kdhuPUWaFRGRBCYDylW4bNHjFMi+od3XKJjwLv0FfqGT5
	 G/YWlEQzi++TKw2aHM/7n4A0/OhgrBrIvNzkSjZP22PiAtqa7dSL4JC/kNI8rJZZEK
	 Qy5IE0oxAYBg/vquxn2vAU6jTsL0JrBeZ3Ee+sDiLCm0EuYx/03twone2JelGlbM/1
	 SMMZ5EIao9i18dzSBRZsZY/Fn8PyuOybrJ6B1LZUSC4c5EA6OuT0i0OvRjfIdWUZbK
	 pA91HEjUM5JsA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ECFA44C2B8;
	Mon, 23 Nov 2026 01:21:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 23 Nov 2026 02:21:47 +0100
Subject: [PATCH 2/3] media: dt-bindings: mipi-ccs: Support IMX371 and
 IMX376K
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
Message-Id: <20261123-op6-upstream-cameras-v1-2-234fb3b7bb18@ixit.cz>
References: <20261123-op6-upstream-cameras-v1-0-234fb3b7bb18@ixit.cz>
In-Reply-To: <20261123-op6-upstream-cameras-v1-0-234fb3b7bb18@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=WONKLUZwZONG/1eyGGSAmyn63j+1WD61eX0aPYZ8HQ8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrA5UvO124MmbWZgkQIqSWbuKBfOconQnBGfhXU
 ZTwfcG+M0SJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawOVLwAKCRBgAj/E00kg
 cu5hEAC1mEhErZKfCsK25+A4L7ozBWptF2uhmM9e7vVEplZi7u4q7P5z+YwlKgdqJheZ2DmvVJt
 c3ojF+bKgNZjGaO+1KC7JrG8J6w72Fph2hMXxEcS6CxABoeGoF01joildOyOSbI9i0tHhDIpj3j
 lPupEmXQJmBUmM70WgWGMLd+/LYTWWRou7rItmr/T6Jpqn8DqwWvuKRDM9ygDSs1EoeDYVx0JYZ
 tFz74UvE5m1ZWgmODZ4VV7cZiCjhhGuzKJg9VASZgxoZkUpIe0HdbysxAxzizBuLjkBUCalhdzy
 OaPy90Z6ksC63xNfLnhar3NuqZkznvPIJ5Z8t8h6VfgBuan+8kuBoPnGXQhI/jWYMr8l4vVdbOn
 HlGTtfqHlNmHm5EYwQsKqAQsNBNo8t0tV/xTk+7jHs4qMeAAnXHs7V7p0lnUJ8VxId241auGCQM
 7seQd2ShCtlXY7pXa0ioCPbUNp+hZ5nCq47ovdNbj3Lim5EPJPG37/GuQBeSbzmnmbLYkzEo5R1
 wvLg0LbU1e4/GCxnnDIfG9eX0SYzmlGSRRoE2coEevfw7ojbgU8C/iwVOmBiQRnCkYZxli1xr8L
 gLZakxtdZVlKqCpizAo5BB9CglYyxkfeG9dFLFkAlpE5P93j8P9z31p4xlgvgYxfcySvHujVpC1
 77O1SsLbIqVi7fg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Extend compatible list with these now supported sensors.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index 44faa2f613f37..049eaee31175a 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -31,16 +31,22 @@ properties:
     oneOf:
       - items:
           - const: mipi-ccs-1.1
           - const: mipi-ccs
       - items:
           - const: mipi-ccs-1.0
           - const: mipi-ccs
       - const: nokia,smia
+      - items:
+          - const: sony,imx371
+          - const: mipi-ccs
+      - items:
+          - const: sony,imx376k
+          - const: mipi-ccs
 
   reg:
     maxItems: 1
 
   vana-supply:
     description: Analogue voltage supply (VANA), sensor dependent.
 
   vcore-supply:

-- 
2.55.0


