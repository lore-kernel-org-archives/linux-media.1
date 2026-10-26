Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055034;
	b=JEuWar9j0tBCbzixlwxHNuy/0cQr0vjcEod7+czJWW4CLnwhIbP/XSJCHjytLyOyYXko
	 r5iSlYZgjXNyUjUWcgzHD8xfFfzvWMN756l17M9jTno1a8kdW/sc3otxKU4Ie2IwnwnM0
	 Xh2Heatn4N09AKcj4dqAO4dWQSjK33SuhBPcZuK+Sone2GWaTTtk/JOE4yN4/LhYa+ylI
	 6R3MIZ6SnsCvE6eBKDJtIfqvpbn2jzvo9j+V3RorUF0MRmQ/Vfv3o5Vpoykpa8A7jJr73
	 CtqPHZ64hjbtOnQzbMzhe7Ty/Pliid/R5AdPpZauvQT+qdJyu5pu7SFHXPgkPFF9vgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055034;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3bdtNEp42571APEj35U1oavSEcPp9Du+9f+sh1xWMBU=;
	b=ZQ7uxKQLC+zYSMS8qXI7FYNO+76mLSt4RaOXvXZW32eHgIrbH2xat+mR7sDrVa7VJ6sb
	 wTyoqH041p/tWVGNFNo0h1QirpfbvvC8Q7WdnXBtWiDngnshO6w+zWIkkXsh8iTwFno/6
	 Y7+zMGpQX0Qe0hHgf4Pv3Hw7BEH6Dlemm6Wmhk3G7Fz1Oz+reVTleMCnV7O4ZyTPaFp78
	 hrnCBWhoKe3hopwIjX/BshuEDumqzqOLlPt4A1dvN1ymPVA3ZcwfU9v5tBs/q+W2CUgNl
	 jpbt4icWY5nNFfataicmVCwgGQDlHYEBJoNBDio97RZX//v5QSWok0xyOm57qx8rjfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W913DyTI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A50F606A31A;
	Mon, 26 Oct 2026 22:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W913DyTI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CC51F01825;
	Mon, 26 Oct 2026 22:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793055034;
	bh=3bdtNEp42571APEj35U1oavSEcPp9Du+9f+sh1xWMBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W913DyTISHFqsIeOv8PPYYewH/5SmTAHmggUXp8BVT4wg4z72Ea/JMJV8lL52fMPg
	 BfAoLJMJfZm8Zd4mGeO3KxmFlqzEX2jtg/CcVF63jF0JRIHkZSlaW4ldXy8SolPV78
	 YGgVeHCzMOowi2NV2Mn6buoUZ6OWRyAAwCZSwn2i4EUd3OG/Y+iILLDMpVgZEgI/si
	 e/+EwSBbnvJK05sK2HeZ7EVNt+zmACULdc+HRKyO0Cf8TuKK99Pt0D48cTCnrM8apZ
	 GS0u+s/3EtI/HPpUcjZy3L211UvhGp3AxaGLOn+/YGhyyLw/5jXXE4uig5R99DYtzG
	 uvhq6QyMhiXGQ==
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm8450: Add description of pins with MCLK function
Date: Tue, 27 Oct 2026 00:49:57 +0200
Message-ID: <20261026224957.1115370-8-vz@kernel.org>
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

Qualcomm SM8450 SoC provides up to 8 MCLK signals on GPIOs 100 to 107,
add the correspondent default and sleep pin configurations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 112 +++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b4f7672cec94..c8e9af8eb66d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4292,6 +4292,118 @@ data-pins {
 				};
 			};
 
+			cam0_default: cam0-default-state {
+				pins = "gpio100";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam0_sleep: cam0-sleep-state {
+				pins = "gpio100";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio101";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_sleep: cam1-sleep-state {
+				pins = "gpio101";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio102";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_sleep: cam2-sleep-state {
+				pins = "gpio102";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio103";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_sleep: cam3-sleep-state {
+				pins = "gpio103";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio104";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_sleep: cam4-sleep-state {
+				pins = "gpio104";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio105";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_sleep: cam5-sleep-state {
+				pins = "gpio105";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio106";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_sleep: cam6-sleep-state {
+				pins = "gpio106";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio107";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_sleep: cam7-sleep-state {
+				pins = "gpio107";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			cci0_default: cci0-default-state {
 				/* SDA, SCL */
 				pins = "gpio110", "gpio111";
-- 
2.51.0

