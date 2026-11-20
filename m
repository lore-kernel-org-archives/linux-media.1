Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196430;
	b=HIvbrAXMZ8wItRpfHXiNoMkVtEgG5SYL9DHAOP6u5WALrMyh8NN6/UExOuelKbtS4Q4B
	 XoTZiA+GyY9yOIvUqqIy+aKknIPiJGHw7plJmPpo59c5uaPAcwJUfL7OrsAco4zaunh0p
	 +EhuYlLWB0+4szyOtyX+jgTiiIElGJHVBMfl0kfRPMo3amCv/F9Ngvkx0Dam+KOM6M8Al
	 MULFFZOrGeCSJGRQihv0aFAO2CM74huYvsPts+hSSc8eGMgxSLPtKhsRl4aSl0Yxcvl68
	 CARyFq84PPzC8BMHUzwrxKDEZ4tK1ncxzgduxs2/iMELhcm5Hjv+uRqYfwVu8SstRMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196430;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Gruq8nQHIe+quQ7RML00zfULCCGlk6QoaFUMUsneJmU=;
	b=5Tm4xlivXA2wBBF8q3j4oqnZ6o3V9g8Zi5KivPZl8alNctCzTDErEgzRqwjlM6ZiIkOH
	 HrXWPYtd7zt2Msv5JRMIaine5mDbmzZILke3pZrZgXtCif5YCRm6dkxfuBMsEnVYc+ffh
	 Fly8RA3Af6tNJEUogE9+ywZrXSd6t7jVnqOpl8+FriqqhTDukxcxVwj4GlXIHdP0ovEiD
	 fqBgkuh1kEtaGHVrstAfe5Xcwx6WDbIuu3NPekwF1JyEcBovXFaUX/gacYSpe+wEWy5t9
	 r3pabRrHQHopGjVefkXSlBkg4CzJGxS/g8QP5HQFtqMAElVFfWySXTy/ILORmMXMg0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1584606A32A;
	Fri, 20 Nov 2026 17:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1584606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUSav-000000000J7-28k7;
	Fri, 20 Nov 2026 17:40:17 +0000
Date: Fri, 20 Nov 2026 17:40:07 +0000
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
Subject: [PATCH v5 1/5] media: dt-bindings: rockchip: Add RK3568 Video
 Decoder bindings
Message-ID: <70b950c4b4fefbe07fe081f780ff359ed697d37f.1795191822.git.daniel@makrotopia.org>
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

From: Christian Hewitt <christianshewitt@gmail.com>

The video decoder in RK356X (vdpu346) is described in the same way as
the one in RK3588 (vdpu381). A new compatible is added as the decoder
capabilities are a subset of the vdpu381 capabilities.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Diederik de Haas <diederik@cknow-tech.com> # PineTab2, Quartz64-A, NanoPi R5S
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5: no changes
v4: add Tested-by from Diederik de Haas

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
