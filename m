Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773107;
	b=4HoBuJCbE9Gbltn3jSh8DdKCp/gYXALHAfQrmaoguE2k/XPprAUm7LrWP2/9VuzRDYLH
	 IeAmQtvmNbjkYPkf/CzJPArfH6TWU6RyWPYds7+8HqZ0tjsvThld1awyh62Rb4KxjLDRK
	 acV0UzhTzkCwNY0hiuLytMpk1m+1nInD0GPtK1Au8be/G2ZrhOROjoZqJaPeGH8S07APw
	 oyQU1HPYGsfdgToGtFID5Q711I/RsKWaWpZ9u27XBXKQYsR0Zp700S/yHIsTpcY6c+cwc
	 wyzMasTpeKpXlvwoEggXcwXzvRLr2hYKfo3hO5jCSTcBUSfltaHeW6WLw8MttU8NfmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773107;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=x9Ej0I3HKJbOHvwgi0DwH1uFOp+8+h0bcaC7FbBnEvs=;
	b=4YMWpZs7nG8b1Jvt1fbnKHmJsTqaevJa5+NTYzZM9sW9glr0ltfy75dFIijd/16x4Xty
	 ktWqcZey5MJV8wNNu1Y0gdZmIp9cHbIn5HFVErxX5Vsn2M3EW22sUJmcdYAEfacrUPASO
	 FuEJqv2R75jnINRUwg5pLC1/N+GBxPFP/NnI38gRnravtQwSAGOqrBIjI52/k9s6boaLm
	 ZnulqfW2EVh5pHEAf/2/ciHThRUuR4ljQvBkgSajTqufQUK7kUtRp2XHVs2zo5twR3VXl
	 mdV/MuXpZZDDKC5J8BI3S2rXmtj1zlc8xX2JwE2dDnO1xsql6OkOwHwj4s1rsDDGh1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eos8OYYU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396A1606A323;
	Fri, 23 Oct 2026 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eos8OYYU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358531F01828;
	Fri, 23 Oct 2026 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792773106;
	bh=x9Ej0I3HKJbOHvwgi0DwH1uFOp+8+h0bcaC7FbBnEvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eos8OYYUglGq9ULoNeFaMunbICe6yaHFuuJOzML+myaBv6Uug1QLoXsAgt1+ergDd
	 qsYlaCDWDFHXZPXozTyc2UFDE/0eMcmCG5EkbdaSuTLed8yGh9HnbjxUrGlOyUaBnF
	 E51lHxH7U9Y1QFnnmz/1dTuQaaeJAcfvXMERXUH/KFq60D4PTdAigsjl5x2ySYN1Qw
	 /Zymn5zT6m70Aw3Dj4rS3+mm+OeqMNFQsFvQrpooPcpIkPgKCHkqa6R3zM4dXhNDHZ
	 DtjhqKMX9PrFn99Buwp6l7S9cHnF+/dd0wZsKcuvizi7JkJJ2JQ/QTh+fnyCj/OIXQ
	 +FTLqbjcGLdjg==
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
Subject: [PATCH 6/7] media: qcom: camss: Allow CSI2 PHY devices without CSIPHY resources
Date: Fri, 23 Oct 2026 19:30:56 +0300
Message-ID: <20261023163057.775917-7-vz@kernel.org>
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

If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
there is no need to provide description of legacy CSIPHY resources in
the CAMSS driver, therefore if CSIPHY resources are not given for some
supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
 drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f99eea2ef228..8ecd514451d2 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -799,6 +799,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
 	return ret;
 }
 
+/* Fallback to generic SDM845 compatible formats for non-legacy CSIPHYs */
+static const struct csiphy_subdev_resources csiphy_res_phy = {
+	.formats = &csiphy_formats_sdm845,
+};
+
 /*
  * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
  * @camss: CAMSS structure
@@ -808,7 +813,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
  */
 int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 {
-	const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
+	const struct camss_subdev_resources *res = camss->res->csiphy_res;
 	struct csiphy_device *csiphy = &camss->csiphy[port];
 	struct device *dev = camss->dev;
 	struct device_node *ep, *remote;
@@ -836,8 +841,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 	}
 
 	csiphy->camss = camss;
-	csiphy->id = res->csiphy.id;
-	csiphy->res = &res->csiphy;
+	if (res) {
+		csiphy->id = res[port].csiphy.id;
+		csiphy->res = &res[port].csiphy;
+	} else {
+		csiphy->id = port;
+		csiphy->res = &csiphy_res_phy;
+	}
 
 	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..b0d60e70e4bb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4796,7 +4796,10 @@ static void camss_detect_legacy_phy(struct camss *camss)
 	struct device_node *remote;
 	struct device_node *ep;
 
-	camss->legacy_phy = true;
+	/* Legacy CSIPHY description implies the provided CSIPHY resources */
+	camss->legacy_phy = !!camss->res->csiphy_res;
+	if (!camss->legacy_phy)
+		goto done;
 
 	/* Find first remote-endpoint and determine if its a PHY */
 	for_each_endpoint_of_node(camss->dev->of_node, ep) {
@@ -4810,6 +4813,7 @@ static void camss_detect_legacy_phy(struct camss *camss)
 		break;
 	}
 
+done:
 	dev_dbg(camss->dev, "legacy phy mode %s\n",
 		camss->legacy_phy ? "true" : "false");
 }
@@ -4841,7 +4845,7 @@ static int camss_init_subdevices(struct camss *camss)
 
 		if (ret < 0) {
 			dev_err(camss->dev, "csiphy %d init fail\n",
-				res->csiphy_res[i].csiphy.id);
+				res->csiphy_res ? res->csiphy_res[i].csiphy.id : i);
 			return ret;
 		}
 	}
-- 
2.53.0

