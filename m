Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773103;
	b=0h06fgpIAaFqfpaGfu2JY1BmwYeMLA7aejMZy+u63fHoW72psgkA9Ka15uLUbUyhiqp2
	 dXwB6NzBkeYCn1Hya1pJEphaZn1AHJLQOqY/Ft1VGbZQV7ayl5/xwpQ6VR4OnSH3ewOxv
	 7vPx5nr8KJtIZ5hVZL6JPjMr7PHz5EEUZ8cXE5m1jYEAA6IKgdLwMCfveiMqmgEnecbCC
	 gfdqkWvVLxiElX/7nqgRgNyFPSvzUvJlSpTYys1h4iMNkXrqBBybKH59yTrY8ubHEcOJd
	 9XxxOFxufhCoS9SINGFwp44xGpDJV0C+58SVsWrnhur6dIAlgJytWCFB8QsepffE4Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773103;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=swxZPfAE+XKiBGgPkPSSVz6+hoNK2qNoB11MCd8pTdY=;
	b=5lcibs3qxInLvz+DsTqy/A5i8GZnTFUTcAjxGIaEieahfSYiI9CYEQaLDQfs9tizcL9E
	 1B+hUZdXjxy7EwwKmftGWbfCpjGa94J76v2/D+h6C0mkYIBH+l2fWOGjxSu1KQZT9NWLQ
	 MOF4RlnZF1kEdO/UwHMf/ReOA6u57a5IMrUsu5ZPwpjgod3TGGxiY2X8n+3TYgZEf9F7i
	 X4p2IagpdhyrJL/+vOn7dtwFwv41yJh+Y1IuHVochG6HmBM/3kMn7EtS6P7K4wZjYmu4u
	 p5pkgNzW0MOkPlxuHxfMOhQUmfwe8F9P2xkGFLN9ePg9T7/Iyp1NqMKKixKu0SDfkaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MDJlbwMV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E32606A328;
	Fri, 23 Oct 2026 16:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MDJlbwMV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234C01F031E0;
	Fri, 23 Oct 2026 16:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773102;
	bh=swxZPfAE+XKiBGgPkPSSVz6+hoNK2qNoB11MCd8pTdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MDJlbwMVM3bS8PDsx6IUGuqN8Rsr4Dlp1CJLy5FnjyEsP4AFyYIFQMs5XAyhimVRX
	 YAeFKQff5uBw5VYoQXG7+Db3s8XY7WeIH7iw1pUUJlPvjDWAWuYjkLdIql2hwJiMiX
	 2Mj1ZwhXPtefCGk699n/VErivyiqIpJf0BSe5rcOJNa01sRmheVOVZxtOHvGfbC7gf
	 EEDnfK6Q3rH2yGfXWyWB6K5aXEEYG25mSPxLUwC9/HBrlFEQBopNydyKJZVnAD72mt
	 8hfWTJbreYdO63OmpXPs7tPyJFQ9xm0yzrwuGmx4KvfApUl99FxA4RmZgjqhe+mA2s
	 XawH6klOfATyg==
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
Subject: [PATCH 5/7] arm64: dts: qcom: sm8450: Add description of pins with MCLK function
Date: Fri, 23 Oct 2026 19:30:55 +0300
Message-ID: <20261023163057.775917-6-vz@kernel.org>
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

Qualcomm Waipio SoC provides up to 8 MCLK signals on GPIOs 100 to 107,
add the correspondent default and sleep pin configurations.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 112 +++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 7f5b0501a23e..ae9e23f78cfd 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4286,6 +4286,118 @@ data-pins {
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
2.53.0

