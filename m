Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84E83A2540
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476375; cv=none; b=OCNiB/i3hfF70UnuNfyPlVPw4texnfQqBAKtWP9QpQmbazzTD8B93AyOFWwkF3RrCWPuO5ZN1kTWzUnbQwJIctHWAChgq/r1FexyTUh9/keEsO2EDu9hthHlPOh6/yGudZzyjH4LYVo7Nd4qW5pHbtsV5MMCiYh8+HquFFt8MJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476375; c=relaxed/simple;
	bh=ndolWswy+O9/qD9RL4QroF6XcipBnK/74bun1DICPsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VzASf2O0+2QKrPVfeh2nGIvM8wMza57trdX5MN52MlzqCu1JD2TAOrOtrVegWQY27ws0BntCH5kDQGBdbIk/XrhOc2QiqfUq6WKkcE+YU92Xnpzdl/Cz+kEvfULmU6ElUxIhYog5kzyn1xO2VMG3vdZnpJ2aT9Y5xjGDQkNDzXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcByGhJW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcByGhJW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so265804f8f.1
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 15:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788476369; x=1789081169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQWYI1cx6ETxdXekq16SnwguXhi4xWpGMHf6wEC16d0=;
        b=YcByGhJWzcT+qZdrTLStYyzTfS+qZVL+fW1gpQwAFsXZeGqwFadWMfYW1gJ6jmFDUB
         7MKuzOXUpkdwE3guJMEzjnBw+qEkHQ5vzlpISURYb1TlmLeZ28mglA1nSJD8ydaQ+SvB
         /R6NfzW+swI9I4MRiIugwLyDjj8EdiG5Ivvu+9KIepfgDzuyHY2/MEwQAqUsNdUGXQkH
         s9JXnyY8xzCNXoj6ApUg8ZrkMcIvYDhA6wTDXM6y/SrTsbgQz8hO7ocwQaFedJ8gKydh
         eOtjtt42imUmDBsC5ilb0F2mQjAbiuRlcGlcy5eiFyymsVT7cjvk7c1PPhSWniSvJajM
         w3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476369; x=1789081169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQWYI1cx6ETxdXekq16SnwguXhi4xWpGMHf6wEC16d0=;
        b=Ne09+/DKesJ/AW1KrgKKJu1O0/QEJR1ae7qcygn4eY9Vi+MuADzxdqzfjk25iPUcvJ
         uzLEigKdGrJFcBpPl+tmd4KHfbTipZsD73DP6Kwevutu4VSOUBacVL6xVjZT/TcvsQ6T
         TzDwZfyCHQf0XGQifP/AnDUry0Y6qCrrNr7sJss9Uh4s/nip5P8k0H1r8wEpt+gITdvS
         FpL/T0+7XOqCrdpkYZmJM6UBMlt8qJ5fHffehyw0K8OpwrsXJPDJnVDF7ba/oqwOamTu
         McEX3dJvxSx/I7IakZnfjY6633dZQ4MF0PhshZ9NSLhemsVYdjayJHsLtWJHjqr9Vymi
         GIUg==
X-Forwarded-Encrypted: i=1; AKwUvBy+aO2tpKDq5S9C2J0ZgHuZOKQJZfLxBcahzByqQpxM1eFkCEWsvevVJ1V8XoW93yohKnIwB8noA7EOfQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nHBCk5X2sM5VqM+d+TgfSN+PQJ9jJnjteHmgk93XOQiEjoTEKJ
	lXrnnVxUBYo3UQJipMdE1Ij+BX1suvnGVlxlN9+YNRvb/6bwWaCiWujrQDESEbGAE74=
X-Gm-Gg: AYBFou26QwtlwHELah68tH/lLFOvCWmxPgoQgwrfbMhxYwaGyRAL7rihrahDZ66uBuQ
	sNbdxIAVTgu5PV8oYw6sVL6gqenMslP2G4TwVOnYk8JJdEFclZ/bhfPk9IFa0YyfOlsaLHsby3q
	kUEQZp+s1v3SAvKoteyQhMY4MN2ZhqumwEfPjPBbfEm8C4L6TUJSvQAjLgirQ5SNZOz9jx89XdD
	bqpqmfNrMiOc9sYZHdb7Za9tSOClq4jtm30bbeO0iGE1h/IzpAg6f2+uSI59M+71timUCz+w8EJ
	2e5f6trrNhcgq21zQILmZinEDoqRG3v3EhTkBq6TlpNX9RBoA0EnIhmry6xWAlzocDG5iE7AmWo
	xbC5YBTJ16jYIahvwjnZkjKOmFuL5cDnGRSo6mqxQEXKX+N9tKrSLh970m3/ySMTF8U2qjRm0Xu
	sA8R+SnkWVHPK/Hcxyaluo5jggNfzi0f/kAVoBpDuNLXP08vQNNmhP8JNdLpkGM6bFB1Dp
X-Received: by 2002:a05:6000:4615:b0:484:479f:4152 with SMTP id ffacd0b85a97d-485872b733cmr4421178f8f.23.1788476368674;
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
Received: from [192.168.0.35] ([93.107.91.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9a56sm1448006f8f.15.2026.09.03.15.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 03 Sep 2026 23:59:09 +0100
Subject: [PATCH v14 3/4] phy: core: Add devm_phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-3-01ef1eced075@linaro.org>
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
In-Reply-To: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ndolWswy+O9/qD9RL4QroF6XcipBnK/74bun1DICPsM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmfvGWyClLrdFQNWcv0QQnA07Bt2KOuowzZmB2
 QuGP82VKdqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapn7xgAKCRAicTuzoY3I
 OvyVD/9SDtQyPstNp2SadMUM9Lrp+mM80IIacCZhr157303laM3+5XcJEr7DME3YJc9+DEN/z/C
 J/ZrYoJ1DZ+6CN8qccn8t8MAcGY/M4xFKFgsb1cttGsHg+X6BqlC3QIadHAvhgllUuosmAscHX+
 3BjI1KAGYHOBQjmOO0zMXaUdQX80n39TWFAx0Xa9+MH7rGsdb2Y7n8rd/B2bJi5UGMclpWExlfa
 5Bk1KYfUuW3KuPqAF0uXdkOdPIE2HhRsQJGtSypbfSaQsUDibke6O5v3V32TaQ+eztHURT2T6d/
 JjzAkNxO1W+y+XIwDnalY+kD9LWlo5wwi9C9kWJ1zuC8oinGquh/FYDHhLPuvO4xUTT0EyEJPLr
 X8wPezPU+N2CB/CaZpFHimk+ghjft5hZPE8JQfCME0JDVcStTojJxOaYy2G2xS65c837JPZOQ3B
 AIdPBOFq/njP3nxB6tJCojW/BigqZBCuS6TojC0emXnN/YoNgFs3KxRcGSPXS0IiwGjmC5F2daR
 IXc2k2n2eN54Ng7lioUdQPJdzn0qpmsTfciRSRYPDeVEWjJvYikhM+g3z3E1JL4mRT/Zo4PZvqU
 DIeZEVuS1k/fX0dm6rPIxzXu8FtFN4HzXv1trrX+6lyloHtfs/xzXkjWpncQv6YggcSlgLjnQz4
 kYREh4zrnFtRYmA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a devm variant of phy_get_by_of_node() to allow for the familiar
pattern of having devres automatically release resources on the driver's
exit path.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  7 +++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 1d060bc22d02c..1316cd477bcba 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1044,6 +1044,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(phy_get_by_of_node);
 
+/**
+ * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
+ * @dev: device requesting the PHY
+ * @np: device_node of the PHY provider
+ *
+ * Returns phy associated with the device_node or ERR_PTR. devres manages
+ * releasing resources.
+ */
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
+{
+	struct phy **ptr, *phy;
+	struct device_link *link;
+
+	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	phy = phy_get_by_of_node(np);
+	if (IS_ERR(phy)) {
+		devres_free(ptr);
+		return phy;
+	}
+
+	*ptr = phy;
+	devres_add(dev, ptr);
+	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
+	if (!link)
+		dev_dbg(dev, "failed to create device link to %s\n",
+			dev_name(phy->dev.parent));
+
+	return phy;
+}
+EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 71c2e16397130..14b924a88411f 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -285,6 +285,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
 struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index);
 struct phy *phy_get_by_of_node(struct device_node *np);
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np);
 void of_phy_put(struct phy *phy);
 void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
@@ -499,6 +500,12 @@ static inline struct phy *phy_get_by_of_node(struct device_node *np)
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct phy *devm_phy_get_by_of_node(struct device *dev,
+						  struct device_node *np)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }

-- 
2.55.0

