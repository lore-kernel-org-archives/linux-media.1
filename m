Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055017;
	b=Y+9y0ASpUUcmlF/Pp2NqxS+UwF8nx3MeyKNfLr7WtBQ18DkXqviKrJlsX9SnMKicp3+x
	 GIGsX10hF1gIHpAJbfQ0ff9F54w8lyWQDIOZ5odRY4NPW0uCMuBY3PklN44MNZHq+ky17
	 j7lXnV0XeLbXtIE3scLj7VCOLrnXvMR3CDXb+W+0zOM8itc+Hp8/aVAUZYXGBcbnFx0Cg
	 Gob1zUa9YcQbMhmdA7FdewuWxOCCHDgcicxiLkSk4zPnQhBL5gBdB72GfVRTfTcK1rf1C
	 O7kwBp1/2m7sl3GYU0PUJAeAMjJFCgg9WdkZUyhDxg7Q5ay+/POuauqCLnCWjdaP2Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055017;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=EVk+yjL8wX++W59cZlj03JU3r1mhQtWxs7tNqn9bqvI=;
	b=T2QBes+v8CJRrykz8hzXH8Z5DDn7nJgkz/LOI2GS+ML8Xf5FQlrMLCxSs0I76A3uOGF0
	 ysRr2wQoUUGBg9mpapfrfbrJlDvDcIDQOwufsgDSFMFdbn3dEZx7F+DjfmfcOBGezBAWb
	 ixM4C3p1TgQSMNqGFC1dm9Jx/VCvbtIXvX0Rf4I1Dl7uvCh0SCuJqfDq2NA0eqFyt5jF6
	 zkexyy8Cy3yjjWcKX/3cj5KhdfhAa7KwzI3Y+Qwqb1Yr7T8BdwLYErVxFG/J7mmvDZxRr
	 nWZDbJWQHKqPC9V4w7FEAG7SvMiFTV9f9N+x+UbKTlQMjoOyFzN61aFITJH0Tlm5fPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgHcbQI0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACB2606A31D;
	Mon, 26 Oct 2026 22:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgHcbQI0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04AD1F01828;
	Mon, 26 Oct 2026 22:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793055016;
	bh=EVk+yjL8wX++W59cZlj03JU3r1mhQtWxs7tNqn9bqvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jgHcbQI09A3d3M0g/KmmtEpTADbCvZC/tSH0rghK+sXC66YowBmkjj4kU47nQ2esu
	 I5bAe6PuHSTgGorvWHVYf0/Gw7cXB83ntq1USkuM6sq0T6JO55+t5UzaNkWDJjRCdu
	 1xokByT60JmhoChA/V3lAIiKCH6UZ8/1iYMdbAtCQSuNnodd9IYFQsrquAEYGOnYxo
	 RUQxuhM1JuBd7AWT8f30BGBfBICItYko+hOX9ZIMdI+sU5L9A1i1pPBy5+6n+G9GTv
	 ZaPextkgy1ow5F+QLR2iZ9wmCuOI8DxOPW6lOjqyckJnu5HE3ue2fe/aujQhJuPlsw
	 gxOtMdeHbaBHA==
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
Subject: [PATCH v2 3/7] media: qcom: camss: Allow CSI2 PHY devices without CSIPHY resources
Date: Tue, 27 Oct 2026 00:49:53 +0200
Message-ID: <20261026224957.1115370-4-vz@kernel.org>
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
2.51.0

