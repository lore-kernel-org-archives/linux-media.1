Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280255;
	b=rmnPI7Zpcp1V0opuFxCpcehm3TY1f0ErFitLA19KYHzgXXz/p/YOOntFHZLvd+biqjrV
	 8D9C5f7B2Ip3U02h2SP8FL4AWA5A0u+bfVKebyU7prFR7y1hiI//md570I9tzrAx1DXC3
	 XN7MrryXllOtOQkH01y4+siXY3hYFw5WLf/tVFFnIAcBVR6o0wFKRwcQtwF8OP/lPQtUT
	 7PaUc4mkztx9cMYMHkjqTeTGskUWNqcob38UVllcA5hwf75NDLLb/nMZKd2IvUd1snQbq
	 tFvZOe8Cq88yo4zpZ9OTI3m/r0Bjo+J8ix3ZUeZr5tRQZOJCp9dn54sKKBKJPYqlyEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280255;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VS06vSM4qtWUmBvMENtTVI0rKBtvKYghkg4SBYgLU6w=;
	b=l27TedCkteMP/Cz01AhmF07gWnM+is3Y02oQyi+pWgDM8Ho0GEsRWI9XNoEf9iS2kEvG
	 vw7CjpgpTwT01JiFn8eAeWoyvVfEm3VfO/qXi93dK93/2khkXQcKxrVtXL6Dus26iO+uD
	 vdBWnYDrof6aBx34wwQp4D61ZxFEf/60JcOpZ4ZaK1A+AAHAv2IxTrdHA1EDmv41JSdGP
	 or08L6wSlFoqlysi0MILVO631l9l7z2lXUdCMVcjoIjNssW/vxBROqmyj7QkBhEWhBiPt
	 X2pjL3YIUoJNMgI4GY+JYbKMBafrV+l8Scw3w4S0J9pJb93j0/ydm35ygdjKoLm6K+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF6C606A68E;
	Sat, 21 Nov 2026 16:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF6C606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUoP1-000000006J5-3KDm;
	Sat, 21 Nov 2026 16:57:27 +0000
Date: Sat, 21 Nov 2026 16:57:18 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Marc Zyngier <maz@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dang Huynh <dang.huynh@mainlining.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v6 5/5] arm64: dts: rockchip: rk356x: Clock the vdec at 400
 MHz
Message-ID: <11b23bbdd9b1e2e351978ed87ed87bfbb7a00076.1795279680.git.daniel@makrotopia.org>
References: <cover.1795279680.git.daniel@makrotopia.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795279680.git.daniel@makrotopia.org>

The decoder AXI, core and CABAC clocks are assigned 297 MHz, the rate
the vendor kernel derives as a quarter of its 1188 MHz GPLL. This dtsi
runs the GPLL at 1200 MHz, from which the closest rate below 297 MHz
is 240 MHz.

Assign 400 MHz, a third of the GPLL. The vendor kernel clocks the
decoder at a third of its GPLL for streams above 1920x1088 and lists
400 MHz at 900 mV as the highest decoder operating point. The rkvdec
driver scales neither the clocks nor the supply, so the rate applies
to every stream.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v6: no changes
v5: state that the rate applies to all streams; no changes to the dtsi
v4: new patch

---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 411c9ed62d4ac..6305a57258b4c 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -666,8 +666,8 @@ vdec: video-codec@fdf80100 {
 				  <&cru CLK_RKVDEC_CORE>,
 				  <&cru CLK_RKVDEC_CA>,
 				  <&cru CLK_RKVDEC_HEVC_CA>;
-		assigned-clock-rates = <297000000>, <297000000>,
-				       <297000000>, <600000000>;
+		assigned-clock-rates = <400000000>, <400000000>,
+				       <400000000>, <600000000>;
 		iommus = <&vdec_mmu>;
 		power-domains = <&power RK3568_PD_RKVDEC>;
 		resets = <&cru SRST_A_RKVDEC>, <&cru SRST_H_RKVDEC>,
-- 
2.56.1
