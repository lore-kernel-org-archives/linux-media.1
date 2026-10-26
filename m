Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055008;
	b=q0VUgu8tt1U6VtEsrydzUELuVhipYacGLA+mluTPoEDNoWPKL9rIGRr33g+vwxYGj9Rg
	 DLhSQmYx47/Rt9HpVHcKzTAfYAen4T9tbWCSDR4NxNJNcFo21Nqpj7pP9z9l0gGiPIDsu
	 NELCozEXJsaEY7/pMPsiWbT4Fyvk0PnjpiLfUmMecDKxzvoQG3plUF14OVxnKj8gQt+F7
	 hiiCNt7CKqWr8nWa+K94r+9zkzdVN4fjyn8xlmwJzivWZ0wR2VL/Wq1sS11PERc5iOyXy
	 q5n+w6YFw+a3UxzOe+490VYy47T+8HqoYUq3YGwyqzOUbPDMyvWSIbV7p229YqoPstg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055008;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FuPl67ATWNuBxw9NLlKvBfFi5R/Tx8sEmX5gUZY6BF8=;
	b=PNzLIsRjwIlk9yjFEbOuQlhkCDTeVHqx+sttinR6cZWKFG76f6Yf+uG6fivKLrjshLq9
	 HDA+qTGpXAoNMVlW67KfSYW8n1vRhBljDAqH3jGZ3iiXOw0/NDDJNSfnLjoOVtJ3BpWIN
	 zKLq/G1jYORHZOWw+tSPUu3sr2z60uOrPDoIN4yRR4uEfPzmE2y0qq84bWqlY7K90D/nC
	 4dP2w2crwlY75X0A+pxHqs7OlE84MZTwJS1uTMpHKdAj7VeTPv83B56ZnXgbCV/9HRJEp
	 uXcdrPEwsbvSrLy0BMXIYPvYNYFZUu+0m7FBjqlX/EgF8qbh06awXMec+Nkz9mlBGxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtjPIvzc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938DD606A320;
	Mon, 26 Oct 2026 22:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtjPIvzc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A361F01828;
	Mon, 26 Oct 2026 22:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793055008;
	bh=FuPl67ATWNuBxw9NLlKvBfFi5R/Tx8sEmX5gUZY6BF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CtjPIvzch+/Rq5EWkM6mtFmmUwDKWTUURiesrmzrWTzXSNlw4bbfyL+C30M6VtUxo
	 SyusC+83+cveMgU10tggNW2jzKmGuy0K/h/QToF1knmxodYkT9q3KA6hGCPzNyghdS
	 1QPKn9Bkhrnco/iT/j+en1KB/g4oSWsyynOh3/+CsZ+wiesPoq+IEL5kwkcknK75St
	 9ym2KgtRCAA3tZGuE3/9bjAwCUjFCMKT+jtgtmkv3De89WXzLI7sStil39fAQZKFH7
	 YQGg152oiLq8jgglExpY1adWGarm1M8txCFAzTYyCVAGK4IP1BJIYv1WDgpcJ+0DIL
	 b/m5r59rwxzUw==
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
	devicetree@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add SM8450 compatible
Date: Tue, 27 Oct 2026 00:49:51 +0200
Message-ID: <20261026224957.1115370-2-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261026224957.1115370-1-vz@kernel.org>
References: <20261026224957.1115370-1-vz@kernel.org>
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

Qualcomm SM8450 SoC has six CSIPHY IPs, which are compatible with Hamoa
ones:

    qcom-mipi-csi2-phy acec000.phy: CSIPHY 3PH HW Version = 0x40010000

Hardware supports up to three different 0.9v level power supplies for
CSIPHY0/1, CSIPHY2/3 and CSIPHY4/5, but there is just a single 1.2v
power line VDD_A_CSI_1P2, which supplies all CSIPHY devices.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..7c9015a019f4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -19,7 +19,9 @@ properties:
     oneOf:
       - const: qcom,x1e80100-csi2-phy
       - items:
-          - const: qcom,glymur-csi2-phy
+          - enum:
+              - qcom,glymur-csi2-phy
+              - qcom,sm8450-csi2-phy
           - const: qcom,x1e80100-csi2-phy
 
   reg:
-- 
2.51.0

