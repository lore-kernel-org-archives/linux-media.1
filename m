Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52FE440A0A
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788695540; cv=none; b=WNW7cXiQG9cooycUhk2fq4h36omDmsGcMbBOfxRVy32/naiPiwBkh5Cc/aHxUNKLeozRUaQ26ocZmQ8wezH/DapMkT73Aus/IoMS/tMYnJVHXSv42mvGCWUhVwLo9Ck8Ha0V8L/x3b7MYM3oIVLnKO05rQgxEhnVxMmdpjjPqI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788695540; c=relaxed/simple;
	bh=vw3X+c53CUkT8miKrkdFIh6bJI27fiNryef+k/oCD1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hmZCPWr5Zq8Eif/RtaYCcWAdaVgXXMLbiWbzN8lvuV8/jIIAZ8jhzCqHiA+33ZV9bE3eTr6owJZ00SShfwAxdiuw2FSUKfDOGgjHY+rOJb/YLqHOsa/8X18egTvVgd8NaU4AZxNFS+w5T18L4LBlBEA6x8NwVWIEib9G6GR+rRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vLd1z52c; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLd1z52c"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1658550f8f.0
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788695536; x=1789300336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfe6v37XEfqVF54o6+6rBHCGP0kTxzOn5cAUGy6eP4k=;
        b=vLd1z52cllkn8e3Cf8H8yrTOkqe6Ws78vlKj3P+1qoqKdsGLj2WDYVLqC2XUdAMLya
         4B9LgnPrTFLG/LZzOcFQnCqyzirNEFzWr61gQ5txFmlbQrDg+KXL/YXdxb+zPWiTYAoN
         IoHt60I4ovyS33ZEGulPpcF1n6PIoG8fJxnLR+2ePMSxXneWxgcoIj7jOgKL3EOuNaNc
         lG2YEikUrqev7UeAxHKEQVrrvBr1XHS3N83nmg5ribr3nM0uhOOkHizgJ6cAtMKihFUN
         GTMR66/SObHnJ88D8ha+Z6soJ8Ce5iu0xi7LFCKYNomUAjBwW3qMn9SaoZfRuq9o7v6M
         qplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788695536; x=1789300336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfe6v37XEfqVF54o6+6rBHCGP0kTxzOn5cAUGy6eP4k=;
        b=rsbdOKPATbxMxcF7YjPLsyE6N4XO4HxuUFN9pyuUMwY9rFsbPXojJrnhrjNt5vnGHd
         ggn+Rn3pP4GgsgOj7zlV2fb/xlm749Fvjw5k8x4e4jCdcY3aLR+qKgnaJuTbv7qckJ/i
         1LYLkby66YOILoI7GPMbF3yuCg9KBHZREbC1P/7a8Hxcl37pY7iZKt6Tv2c91/P+wXFB
         NikWUuag5UzmaiPVXib5DjD17509V428LCUQk4gwiyLZrpen5wN81hqqCvQxlf6h9iW8
         5Fn3n0aIIMtctPxT7GJqC+cxJkCPEyhqVPG7X8fLGWALupRXFeSmpmpjF0d9ukfaYPN2
         Sz9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzOuRZFIpyx6ZPkrEF4zr7zVUxgud0l0W46vDP5xF0eqR8QB7JNTtln4abx9w8WqEnvt29gP57HBB7aBA==@vger.kernel.org
X-Gm-Message-State: AFuF++kL75leTE6Bo8ZA8ANf4tfNHfAhuJtzkF3UFECmbFAyFwFPY0rJ
	Wll31AHGcdadTXpF4yJsFXtzeQ4OYfPySTeBPwQcHyU27t7QE4CmVwM98mHi0+bUZgE=
X-Gm-Gg: AYBFou0PGvRA+nd+RaLRFej57yZOwX83hSueIfGgmmEPoedLHUaEf4OL8ew4hJxtDyh
	Bm7T2WLsxEfSd6cL7ONoySQlQBOgbRe/KNs1/rDAV7Q8KmRMUBSvBfAjy5FLarPMamUWbfH8jZt
	qxGdMgYt75FYXh3ZQO5A4WuyeYWuElT/gdgOt4QnQ+f5z3Hx5YSpbM1DeL/GQ+ljkFtjCMpJzP7
	xBlRxG/xLZ9urqrnldUoBubJDp3S35793CeXq1BJvKaHLIPwjyCLxLqM1dCflyFCTEy3bizuTk5
	n+Q/tK1zH69zN8tSWVnCxNOOgqsYPpmYVhFGKnMyxJG6k84h9ZBe/+s7i0phiu2GtynyZdnXxoq
	/VtryRs/Jn59qYu2PRBBo5svL9JAYdcauFSFxUlZxyFk0qdQoJEmZI4n5uTf6+NYISV1Zpcnl/N
	lHDPSlgdUUEreDvdaZjfUeheoTGVUDAqIZ/AL7YEvlL0+szbMI0TqlsuXrNzhGYdfS1DXKHHboB
	TLa71L19XU=
X-Received: by 2002:a05:6000:2c09:b0:484:3621:6341 with SMTP id ffacd0b85a97d-4858729b772mr18779546f8f.15.1788695535665;
        Sun, 06 Sep 2026 04:52:15 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm19337821f8f.3.2026.09.06.04.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:52:15 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 12:52:06 +0100
Subject: [PATCH v16 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-5-f7bd68b5369f@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2514;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=vw3X+c53CUkT8miKrkdFIh6bJI27fiNryef+k/oCD1M=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnVPlTxwbVbuAhh1qf9XNxhb5EZKW1nacY10O/
 CUPOuQqRd2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap1T5QAKCRAicTuzoY3I
 OpDSD/414qRMqOhoAHiZjQ6lw3TJsUKLlE9mo0ZHC+WePHuCBqEPLbkr9OAWWXuhFnuttqil2uz
 DDA/pFBCS1uyY+lwA20HSegLL9nVZVCf2zUB+UT0p93RB3/NW5/3Z0wsaWUoczZ+1ek2oB+3C0I
 0/mubBecrUgfaSxWQQP3No6r0HaSO5tTj9mhPNbFY2qvDLj0txVmSMs88wy95pJ6pMmN9bOAZ2A
 cv3sdMe80S5eh/+lDY2aw7MNmoOfztpskg55zeRGqeVUfluXPPJGlCZ/glaWCg98ZfSGgPyXtrU
 JgK0taM4gvoC7X3Xamn9kYvfHXCQZFzih4mC/aDnhflzYIx08GQSA3+Jv8qFnxLSDLWtMk73j7n
 CeGp5Ght75xVbZW0C8UxNZFe9ghjVZkqk6Q13rQNGNA2puGB+pQB7d1mokm8fGHBZbB2JY+nzSb
 5nYQpWWfQVnzmY/Rxbtzd6VGRKRMlzF4uZQoQA6BvXobGvianomi4OZLG4vx8BdPY6wdCQjYdKg
 y/js5oFmtuiMXk2IX4+Z/6xEtje/TSXtt+NMZDv1Qd6zG7HTubjfyvh4Vbj6OKk6FSt3lUJaKY2
 V82ZoymVn7rbILKEuf7xoXBYzEzy97vhWDCe0AaJhvv6y/O0GovVBiAaAvc6VY5kjp2Q3GGduVr
 mOr933r4FoY4heA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Introducing a dedicated CSIPHY driver community feedback was both to move
to data-lanes starting at index 1 on the PHY side and also to match that
indexing scheme in the CSI decoder - CSID.

CSID consumes the data-lanes property to determine which CSID lanes to
switch on. For indexes starting at 1 we need to amend the logic somewhere.
The PHY side code normalises the input data to register level meanings so,
replicate that logic on the CSID side.

Introduce a simple flag to differentiate between legacy indexing @ 0 and
new indexing @ 1.

Existing bindings are not affected.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 84097d82d99c9..8a4d8a206cf0d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
  */
 static int camss_parse_endpoint_node(struct device *dev,
 				     struct fwnode_handle *ep,
-				     struct camss_async_subdev *csd)
+				     struct camss_async_subdev *csd,
+				     u8 lane_base)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
@@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device *dev,
 		return -ENOMEM;
 
 	for (i = 0; i < lncfg->num_data; i++) {
-		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
+		u8 lane = mipi_csi2->data_lanes[i];
+
+		if (lane < lane_base || lane - lane_base >= CSI2_MAX_DATA_LANES) {
+			dev_err(dev, "invalid data-lane %u\n", lane);
+			return -EINVAL;
+		}
+
+		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - lane_base;
 		lncfg->data[i].pol = mipi_csi2->lane_polarities[i + 1];
 	}
 
@@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
 	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	u8 lane_base = camss->legacy_phy ? 0 : 1;
 	int ret;
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
@@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
 			goto err_cleanup;
 		}
 
-		ret = camss_parse_endpoint_node(dev, ep, csd);
+		ret = camss_parse_endpoint_node(dev, ep, csd, lane_base);
 		if (ret < 0)
 			goto err_cleanup;
 	}

-- 
2.55.0

