Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196540;
	b=FUBRaL2I2/w/7+joB7ANsKy95C150MGsMDhoeFIhOZwzoZ7Pfvg0W7ix0T+275J1/NgG
	 yFa1iMFfIT565drAbmALseSdV5WdIpsgRBto6IaPn/Z4zBYmPqDmRN0tVwVr/tc0LVX+K
	 uyIHn1354sZSmrhaocptoeLQlbVdijYRQUNU45Sb36QaXp0FLpYnrxzGUy0DrkN4Dw8JM
	 S/Gj8TFDhyn0/dp1VHEkEMXT60H33x8qqEHFE0ONFmSDCwB1tIDmTTLy/O4bFYlmmGy2x
	 H3lvhVcEQFJapQqZDpHulqWIzio/preS2BXJDoPy7IdjJ4NPtCG4q6PVwtneXf1QmgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196540;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=51HZiqJ55wkpOiYW/zwhGJ++u+ZTIbnP4YwHpryh1Ho=;
	b=kCk4IqVJWWZ1z0xV2FRyLYCK4zoJjG2m3dE8Ps4pODsJ5J/9EJ/9HBtzXgtWC6bj/D/W
	 yL8EabKYyXhHAEwrwtPKiWQMPMbAHSEFnVTJXDwvFL3P9BcczIKsDKji7fXKGb/dtBzyG
	 MPBAN/10XrlUE/3LK2OVYWaL7ghECwbvsrEWOe128kLJzg4u8cItzz2dftAIS2tl7ZXyR
	 twQqBe28H7tewY7YKwamOaUgbtDC1d4omJN+gfdRBsR7p2K5jXRPSXne6wHUokwKGXIAJ
	 igP4xSNZt+O44a4tRXdr/5iovXCwBborXoZVdvjGTqC0D4HQCuCGNuyGjWmnB23Kbyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918CA606A331;
	Fri, 20 Nov 2026 17:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 918CA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUScl-000000000KR-0ClV;
	Fri, 20 Nov 2026 17:42:11 +0000
Date: Fri, 20 Nov 2026 17:42:02 +0000
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
Subject: [PATCH v5 5/5] arm64: dts: rockchip: rk356x: Clock the vdec at 400
 MHz
Message-ID: <225a87d038ac323040a28cd3a68656c7e5a969a0.1795191823.git.daniel@makrotopia.org>
References: <cover.1795191822.git.daniel@makrotopia.org>
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
In-Reply-To: <cover.1795191822.git.daniel@makrotopia.org>

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
