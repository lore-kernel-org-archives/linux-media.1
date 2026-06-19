Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FD733B6F9;
	Fri, 19 Jun 2026 05:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781846829; cv=none; b=qPAfirQ/UaK8zbczVXNdNaifWC6X0zE8VXzUGcrW8OKd8PI0FYvTbZJmpgO4uBc+OlrZMXSAFXHbMs1BoUDaigkvd+vbxykLez/nv+vVyVQPT5/K5JGHuMOk2bhM9fii7zetYgBCtyQ/BCZEJm7mHTla/g/i4padJvz3XDWaSJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781846829; c=relaxed/simple;
	bh=VmrlQL2ewOl0Oaj0OE/GsXfoUeFL3zFnMoITGcH5zcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOfLlTEKLzplfKHtk4fDjUWiGcrzYfbmK3GXcddVspzdeNA0ZxLa7DmZGn9f4Z7WPnMhxW6Le0TrRdp/9lQcGpPf2xP+wzmwnG4ZYolJzzc8po+vNtx3u1wf6spC5YT3PxpBO1w9Lih2qnp07YIFS1wrcXuwnF5ddqv3tufSQ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uSLul4gE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uSLul4gE"
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:327:f131:c148:b7f8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4F881E79;
	Fri, 19 Jun 2026 07:26:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781846791;
	bh=VmrlQL2ewOl0Oaj0OE/GsXfoUeFL3zFnMoITGcH5zcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uSLul4gEJ4GyrFBDapIUFwMMAiQLdQ9mbh7jW2hfjwD+Ad8uvT7S2jcaHdW1wadan
	 38cppBeEDl6VS5KaljCtKm4Pwp+EUO++7Ock4M29zsPlv16app8cpUo/Sxq8MXHURw
	 px9HmOJtv88s0FVf8V82YbfD8EqTo8SRzhtcqgYo=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	nicolas.dufresne@collabora.com,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [RFC PATCH 2/6] arm64: dts: rockchip: rk3588s-base: Connect vicap and isps
Date: Fri, 19 Jun 2026 14:26:29 +0900
Message-ID: <20260619052637.1110672-3-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a connection between VICAP and the two ISPs.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 55c5c603c1e3..f36267720910 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1493,10 +1493,16 @@ vicap_mipi5: port@6 {
 
 			vicap_toisp0: port@10 {
 				reg = <16>;
+				vicap_toisp0_ep: endpoint {
+					remote-endpoint = <&isp0_tovicap>;
+				};
 			};
 
 			vicap_toisp1: port@11 {
 				reg = <17>;
+				vicap_toisp1_ep: endpoint {
+					remote-endpoint = <&isp1_tovicap>;
+				};
 			};
 		};
 	};
@@ -3551,6 +3557,18 @@ isp0: isp@fdcb0000 {
 		power-domains = <&power RK3588_PD_VI>;
 		iommus = <&isp0_mmu>;
 		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				isp0_tovicap: endpoint {
+					remote-endpoint = <&vicap_toisp0_ep>;
+				};
+			};
+		};
 	};
 
 	isp0_mmu: iommu@fdcb7f00 {
@@ -3580,6 +3598,18 @@ isp1: isp@fdcc0000 {
 		power-domains = <&power RK3588_PD_ISP1>;
 		iommus = <&isp1_mmu>;
 		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				isp1_tovicap: endpoint {
+					remote-endpoint = <&vicap_toisp1_ep>;
+				};
+			};
+		};
 	};
 
 	isp1_mmu: iommu@fdcc7f00 {
-- 
2.47.2

