Received: from mail-ej2-f39.google.com (mail-ej2-f39.google.com [74.125.228.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257554CDDDD
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658724; cv=none; b=ixQVij/e7ur+Utek1dIzOxr1xkMSOtOFJOyl0Ci58GyJktyzHlQkBFi8b8ZRmb9goVMEwSYRI6JfExnf9KHdLTCB4q7sCp/BpVn5GJVp/AYe20ipF8cRe5TvPCPmpirCAURwkqznvveMuwxe9M/W8z/fqeTjE1wIS6vJTbmf5Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658724; c=relaxed/simple;
	bh=mbGaKzht6FTlTs32snTkWI2to5iPenkW5iUX9UmH+is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S9+m/GcnwoWfcBeH9Nvxlf8Gats69q6S9BBCs+GAoBJpL97Byz15lIRhUF9WIxbRjNWlvcU1HAGNyfqdCToeAOu9w3QuU2EyYnbkEosIiQLsYtTUeYztJlJj4TE11DWVVuHoY4LdELfMOUe1WYr3Qj4pMGco98gozcTqXrY+l4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ULjjQo5X; arc=none smtp.client-ip=74.125.228.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ULjjQo5X"
Received: by mail-ej2-f39.google.com with SMTP id a640c23a62f3a-c2940ef15c1so125294966b.1
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789658715; x=1790263515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o60JRFM5WA2Unn1KPhBnuEVA9Bwozt76P6e95xSEIP4=;
        b=ULjjQo5Xt443U9I89OmdGQbdI6jjRVfjTL+H3mDlu8P+YudDQTh5uJM1ds7ZI8GJgU
         kkHsW4aLrXm95wHTVBIfpcoHYhizUiGGNGhPRddndM5NkyRDkm0+yE1pcPL/zFi6x7J6
         5wWVnGRuXryOFUlWDat/m9EiPMAJch8J1WHknqCzKFdLtraVdbVOwN5DCknWfB6iLqTy
         WW93Fcmugw/ZLFXf1vBcaOZgBSNA7xQOvuK4nsOq7zeR1R7jsV9x/JxpEZg2x5q0EA9e
         A83RvO+7IKP2oqVD2VyGMkW3xoXKaJyo1wucLlP+7vJrxGqoLJj8VUtMZAUoA53W7rts
         NPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658715; x=1790263515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o60JRFM5WA2Unn1KPhBnuEVA9Bwozt76P6e95xSEIP4=;
        b=xRECA1CH9Fekn5h4BfM9wtk+QD+dRrapJzyI+i1TybNMo7p5R+QP3VaE8UjMk/p/do
         kNnxfW57llcXd57SxJhfVJRRNFPJaoKpAb3OYkmBxArF2sWuu0CIoiQUHSRT/jSgHAtC
         tnlKi0dCSVcfQAYKxMHoF1nEku3pnyPgNDKS4Zy1GSBk90cjpxnpR5eP3S2rk+swQbnk
         6/QvyvdSI0FUF7xQSqhMd/7ZHPU9TWLCmCHwboU6bu5ztuneEUBo0Ym0xGs+LSPfeasQ
         E/f+WMfh4mW4IszWhEBi8rTZElRzra1BEFdHGNvi1D5ynKgLh6pACsGs6u8JI9TZVAAH
         K99Q==
X-Forwarded-Encrypted: i=1; AKwUvBy2Nkma1vjhCWwoh/Hi/nDdpFfAZ5zepSxCtnsO/W6zUrOAWSP5cxgkbtQZDCh/hQrQU0iDMFwro7sNIg==@vger.kernel.org
X-Gm-Message-State: AFuF++lQJN1UzNfhyGwACCsIeGY7ayrshovfk34yUs5EuQZr3rxwusPf
	tbIbgUmOYstMc0esiGZcKlZ9gLsO9B84PCibXWCPhPmGjKMSEKcyKyEn/RCDOWEEFLg=
X-Gm-Gg: AYBFou3yB4jio2oC4WeQrleHAUrL5UMVDn/OddHjw6yOXdyG4DVpBZwaWFZms88EfdJ
	Fweaxff+5DgfBpm/1d2cqggkN9NtYbRu8xiBUHFxLJh6S0+oqlLiHPNe48kZpnTpwAmkn39Tf2+
	I0H/sGjcpotL5Ii2xX7W/K8CW5Ncsyimva522Rn4yvmK6OLEsUOqrfw5whBNAjP4/YpeFpGRx7P
	pIXNFaKQ1Qoyf6Dv18HGHSXvDiRq80vBFGDIOt5YOe9frBReVd/if2gqYgFVqW0n/DjMhp/cN8J
	RUX73k0K3FwUlcq/o2VU0eq/UvQyFTZ9+UNkQrPkdXk9AmJN/knoaIyzXTtNTik+7vdHoB2IEG4
	c8oG5AmXR7JAOulEyZ/L/EUOTmcUEUX7xRMfmrPAEwvoOrukseCVjnz7yFtoYuEgS9xlQXw8jtV
	rIdbaoqsuJqfYKxuLIBvqaeVrHqJDLgPRmiylli07vxfZlGG9biqDZg+8T2OP5VBl/bgBq6wzT/
	TE+vr1Eiw==
X-Received: by 2002:a17:907:9710:b0:c29:5021:f6f8 with SMTP id a640c23a62f3a-c29e53242afmr538141166b.36.1789658714541;
        Thu, 17 Sep 2026 08:25:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48755asm310587366b.24.2026.09.17.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:25:14 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 16:25:07 +0100
Subject: [PATCH v19 2/5] phy: core: Add phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-2-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
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
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4777;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=mbGaKzht6FTlTs32snTkWI2to5iPenkW5iUX9UmH+is=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrAZUHU+EUBv2jfs/6uvx3XSpJcXQOAF2wkNhp
 4xPSk+jVhmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqwGVAAKCRAicTuzoY3I
 Oj/JD/0cpegEhQJY+utxEKWKYDFyWdT/4jJLzXhcgV6CvyR3ZjDIylxCRO7VLw1hbn3ZNUBqTeQ
 RvlFIPUkPiwHrwxKcQ9IV72nAvFge9vf4EOfwOG4m+35E2LoSKyJDcQpl72qnizIBHpDw1b7pom
 pRyy63h3OTJqnNk1H9yW/2Iy/ngUemQLZNnght68QnFCowIjufu6y4ZgMT6/q2vqpSFe4NS2+9Z
 hWA8mJtFxiG5WHF2maX5EONgaQ+7edW8wWKcUVHBynIJiBNE2j+am9P/7I4xVhnQwqQNUV52F4C
 YlPz4hDIfD493XC7Ofufes2KwGNqimwi1IRnrT5cDfuQtF6vy6cdm0UUWsCuHwI5y6sggZybpnG
 IF3Q3E3zxQ20LeABfZrPdOx4MH7cyEeDsAmDzbvnc+39VXwbDpyeffztcpQCqxdEJnSQdUWD89U
 IjztmonFiLmRbJM1dx1URij3pdGi3PVSARx6A1LozuJzxvgLiZ5d3K197MRQJFMpt39L75Hipda
 WtenBqsGgQGtuOM1ijIW4X1yWjmAL4IJiCIjGYhjSz/5n4Z8er/nsQEu8Optsy5cj2K64qNWO/R
 ZeLkRjGYUKCT8yTBBqH0H05rUwW8/oZ3PYi4HsKytb9VVzxr643QhzzBzp3qyk8CrQGtTxUMQdn
 A5lPsQBjVKU33+A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 87 +++++++++++++++++++++++++++++++++++++++----------
 include/linux/phy/phy.h |  6 ++++
 2 files changed, 75 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 89addd732bff3..4a8e1d3cdfe75 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,6 +606,38 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
+ * @args: of_phandle_args to the phy
+ *
+ * Returns the phy from the provider's of_xlate, -ENODEV if disabled,
+ * -EPROBE_DEFER if the provider is not yet registered.
+ */
+static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
+{
+	struct phy *phy;
+	struct phy_provider *phy_provider;
+
+	lockdep_assert_held(&phy_provider_mutex);
+
+	phy_provider = of_phy_provider_lookup(args->np);
+	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (!of_device_is_available(args->np)) {
+		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
+		phy = ERR_PTR(-ENODEV);
+		goto out_put_module;
+	}
+
+	phy = phy_provider->of_xlate(phy_provider->dev, args);
+
+out_put_module:
+	module_put(phy_provider->owner);
+
+	return phy;
+}
+
 /**
  * _of_phy_get() - lookup and obtain a reference to a phy by phandle
  * @np: device_node for which to get the phy
@@ -620,8 +652,7 @@ EXPORT_SYMBOL_GPL(phy_validate);
 static struct phy *_of_phy_get(struct device_node *np, int index)
 {
 	int ret;
-	struct phy_provider *phy_provider;
-	struct phy *phy = NULL;
+	struct phy *phy;
 	struct of_phandle_args args;
 
 	lockdep_assert_held(&phy_provider_mutex);
@@ -637,22 +668,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 		goto out_put_node;
 	}
 
-	phy_provider = of_phy_provider_lookup(args.np);
-	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner)) {
-		phy = ERR_PTR(-EPROBE_DEFER);
-		goto out_put_node;
-	}
-
-	if (!of_device_is_available(args.np)) {
-		dev_warn(phy_provider->dev, "Requested PHY is disabled\n");
-		phy = ERR_PTR(-ENODEV);
-		goto out_put_module;
-	}
-
-	phy = phy_provider->of_xlate(phy_provider->dev, &args);
-
-out_put_module:
-	module_put(phy_provider->owner);
+	phy = _of_phy_get_with_args(&args);
 
 out_put_node:
 	of_node_put(args.np);
@@ -1001,6 +1017,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
 
+/**
+ * phy_get_by_of_node() - lookup and obtain a reference to a phy by device_node
+ * @np: node containing the phy
+ *
+ * Returns the phy associated with the device node or ERR_PTR.
+ */
+struct phy *phy_get_by_of_node(struct device_node *np)
+{
+	struct of_phandle_args args = { .np = np, .args_count = 0 };
+	struct phy *phy;
+
+	if (!np)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&phy_provider_mutex);
+
+	phy = _of_phy_get_with_args(&args);
+
+	if (IS_ERR(phy))
+		goto out_unlock;
+
+	if (!try_module_get(phy->ops->owner)) {
+		phy = ERR_PTR(-EPROBE_DEFER);
+		goto out_unlock;
+	}
+
+	get_device(&phy->dev);
+
+out_unlock:
+	mutex_unlock(&phy_provider_mutex);
+
+	return phy;
+}
+EXPORT_SYMBOL_GPL(phy_get_by_of_node);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288ae..71c2e16397130 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -284,6 +284,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
 				     const char *con_id);
 struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index);
+struct phy *phy_get_by_of_node(struct device_node *np);
 void of_phy_put(struct phy *phy);
 void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
@@ -493,6 +494,11 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct phy *phy_get_by_of_node(struct device_node *np)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }

-- 
2.55.0

