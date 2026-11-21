Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280187;
	b=PRiUxzE2XL9NApaFzVh/aUdcEXFcadY7A1dpVWiJOSyZMYExIYXGRJaGjyf80vJtFllp
	 ARwzj++q8oqgo4pknXSREKZkqK1gLJ/fhoJ77j+PnMUNUkUlrEYJML1EcqrVSKigDpfMD
	 uv2IdtmHh3H2b1HVbgZMfjc/YzNc1CdNSrnskM1Uy/jhZRTpzLTsoK9ygoeC9Er3PdE7n
	 9+JJfJHmlhokVXr3tKfsLWGM4vaSKcTanASluZzXm9AW/vUfUaZVu2/BDhrAKPfYU9NNF
	 vxcnS91uPAUZba74wBHYkUpqVrmrXLeMNysWJkG3x7eSHf3sBUlDC96g0wEjfceuxZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280187;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9wJs9Oy9WrL+BKRD+VS13Tim5g6ImOHvmbnn7ayQk94=;
	b=dFuZpxHi6C4YbskcCbbZOfqHETZA5x+cjc6dYtdBiZUtTyQYbvZ9D4tj3O4AX391pfUO
	 g9iHQnsxTnP1YoneAA//nmcXp3wsyPidMvHKXwG/Znw1eeRT2SCy5k0vgQAboRuQhShDY
	 hpU77v/yO9K/doK9QiRlHKGbhKVZXFKjOfz78e/tH6Vxx/KrVuLIwrOvXtuPoQF65pJB3
	 sZRsYeHDSofaD3r6h/bpSk4P0GQQn6tleffymPxsDUcSQAlUGOobFzORWCBoo1ZU53mGu
	 OUrt/Ydwze7PvYWn3MDP2BGMeTzbjumEb8Ay3J+UKkcU7o4c5Y1mJ1t6wF0pvb7Rcgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0F606A330;
	Sat, 21 Nov 2026 16:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F0F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUoNv-000000006I3-1LqL;
	Sat, 21 Nov 2026 16:56:19 +0000
Date: Sat, 21 Nov 2026 16:56:09 +0000
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
Subject: [PATCH v6 1/5] media: dt-bindings: rockchip: Add RK3568 Video
 Decoder bindings
Message-ID: <b63e1b3cd0f46988b16c2f535c364e1f4dfcedc2.1795279680.git.daniel@makrotopia.org>
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

From: Christian Hewitt <christianshewitt@gmail.com>

The video decoder in RK356X (vdpu346) is described in the same way as
the one in RK3588 (vdpu381). A new compatible is added as the decoder
capabilities are a subset of the vdpu381 capabilities.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v6: drop Tested-by
v5: no changes
v4: add Tested-by from Diederik de Haas
v3: no changes
v2: add Acked-by from Rob Herring

---
 Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 4f38a0ef29d84..ea5386e84f17e 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - const: rockchip,rk3288-vdec
       - const: rockchip,rk3399-vdec
+      - const: rockchip,rk3568-vdec
       - const: rockchip,rk3576-vdec
       - const: rockchip,rk3588-vdec
       - items:
@@ -110,6 +111,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3568-vdec
               - rockchip,rk3576-vdec
               - rockchip,rk3588-vdec
     then:
-- 
2.56.1
