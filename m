Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B3F470426
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522797; cv=none; b=YtYF7hhaXUS4rxN4cFiJ8mdhanZ/yLys3ZfK3O0a1rHDLPKSbZAJMrSDhUFlClehMnewpJlo09nIFWAjg96oFWZv9nWCGeFuZv52Dh/up3xAJa/om91lK9jq73go6M1i7mF4wLJJwK1PvJ3ScQutZLe0NGzzNoEgfNDUgQClCKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522797; c=relaxed/simple;
	bh=ov6l6XYXYWQFGwdR6skU1nY1vxsBWDotX7Kg0ih6rxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRXF7BG7SytnhdbLCPBerW0Gw4uTXm67U+TunufBInMh7XQuYlmI0zLcb58LlJRctdkp5ZZJL+E1U8SEaaKXhd16Gjg4bW/gSjY41WD+IvnCW7WzsAIAkMDWlqfYb+U+RxWv2biNphzemxJ5SFsYAjEWealbPWQbnsCLmHFf58E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BYVr1ugP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYVr1ugP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso7953635e9.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 04:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788522788; x=1789127588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=BYVr1ugP76EaArfin5AIFoi/luiRR4VfChYm86kx3IPXJAiIaE4jWypYxZT0HaO8s2
         HCywPntQoktYFkgGyd2tuafSbNn27S0Dl3K+6rzmugy92HTo1uLPHNCaoW3FB062Jj8F
         eASHsRJ9B79N7YKkCDngm740W27VwsmKepLP4Ek/KxUj3FF2vuqQ/L1isd1nsZoxNBpg
         ZIrCHpCRkwWwwM5N711B8pmpAOS9V2/yAwGtfoW2E/pBmXPHkGLLXlSyrYGJatf22hxE
         9wEkaUoCSDiWt1pQfG53V8isEKIYSRjYfnPl8LnLaMGERIE6ZxVUA8KJ8iBAsdTDV9FL
         GEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522788; x=1789127588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=hbvBtpD50aj1FgwWbaCyn6mNUrnfEYnLNA7hTHKdC3MGZhPJoLDnxuRs9aUsqI1RY+
         3JRNm200Vsm/UZvKdaV+5L6YTxvU0t8KfRTiLAaoOdxCNsZQtA0iDNbTt981KxQb5Hzt
         /WQdZ0tVZZaDwDwyBWhLbVyeVlre8pB8ykaPvopMKKtu8K+atmAH1cSZX/Ewf+L5UBaS
         KFrDoDltfLjfd870+47RtSF+tvNnbVYFQW2xrS8fRfXUDBTAs70Xvv6jFlqCbWEAeklx
         jYW+uaD9Y2/hnXUhNNUsI7nsU9YuqkWBHJMLrzPdrDrbuTLExYNGibXkcP67zgXVNPaE
         xNow==
X-Forwarded-Encrypted: i=1; AKwUvBw33jLoUNGUQCJdvHFDmtlB68N5sLlnU6ZhbPXDyUgUt9muAmTHCSqcemNg1p4h/agbp44ttDTIHp/vkA==@vger.kernel.org
X-Gm-Message-State: AFuF++lPoSNkhYj6kN6opW4v7EjCPhXtqLQsv6jMIpt+iuASF3oP3ZBi
	si98csVkTvbjNtlwo34U1kauBQtzukdb5eyxJMV8V/X/heZARytwl2i15YhuHlSoqVUA14qeUTh
	VEIv7RtQ=
X-Gm-Gg: AYBFou3uCmqB/jb0YG2z7fBfNxXRZSyU8RyBzAzvGu62dZ+gB+dGtm7o5yUXmeNo4ty
	j+UJlA15AaxlkMF0Vj+spa1KLRKBwJlzjU2Ay4hG95Q4Q8zgaVY3g/WCdi9IuJVK2AgxTgwC+sb
	dfFdD9g+5FjP11ZHSPcygzctpI3CQwwkgepLh0v8JYBTObZ06M2S6O0xKqOOsY3nBfkxOuWUjWN
	cXEH/KIsm1PX4Gly/cK7bSeDcQTsNW5dezJErvXSy+uqyLaycCqUk+YIeYnRrzS7g1HteghWr2s
	z4eoJXg1VJpreBD8cPHbrZWzrnLWjPa1UO0Pplk3twDl0RRBk+LyVn/nDTbBlKdCdOxwB7vv6YG
	pi6l7xbRaFahGwffjSTfrQ1Iwrcu1PBddLVEI4LINeH3OOmP0AYLBsIKC3UEvbQZ/+OSchmBczM
	UOL32ttVp5iy7V6tZVL7onajmpupKsmtmAxKByw22LDYx5hOsHzDACrkCQliUE0whNAi8uI4P7H
	JbIUb8LrHMtM8XjOri/Jdw=
X-Received: by 2002:a05:600c:6819:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49cf81fb1acmr54922535e9.2.1788522788268;
        Fri, 04 Sep 2026 04:53:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm5474207f8f.36.2026.09.04.04.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:53:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 12:53:00 +0100
Subject: [PATCH v15 3/4] phy: core: Add devm_phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-3-68b7916e7a3f@linaro.org>
References: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org>
In-Reply-To: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org>
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
 bh=ov6l6XYXYWQFGwdR6skU1nY1vxsBWDotX7Kg0ih6rxA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmrEcsnrGBJeocLVI+O9+brnUFW6FqlooZlsl7
 ZQrlZxFXwiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqxHAAKCRAicTuzoY3I
 Oh1cD/4x23nTIQZWK3SoWzTz69RZm5zv2SQvYRXMjI/nTAsWspK6u3DZytcTIZvNrPbSfUX3IOh
 03tILSVIul2ljDB/mLHI5ISqXnWDwFSZrw5TPGhQAwuLk3eSb2shn7Rpy6+gyGH2gJJyYAamMrb
 S9wnHssvLy1A37Adohv7PxZNC0woy6kZrPzZWbsWw+xrc3tLoTAW6Nk7twCcbnYNdNurrBGaY8P
 EldjRAd+h7toDSC88y8Z/NsbepmHVPJIYt+B4QDcDeVZVzp4IWW98+SlokPKjDwK7aHGUQv55Vo
 0SmqSTbXfbej0xA1J3Ey7yJQyj0DyLaz4mEuvalyTzEFC7zrHGRuZLLkGiNOatAr91JRawxt7PE
 t5WYUNGg47apx/Usr6MBKDiFJcg2vOObOITZSgN3uyEIRlY1plfy1+TrlDchN3dnbLoS/cCxW4R
 ABtFaPiEfa8GpcUTRIX57wDOZ6ntwgxpWS4JqufJenxB4+08/7oXqv94mfwXT5LroFCQ/7kMVWB
 /yKwZqPHMA4d19ViDg10ZLSCIPRsx+dp64FfoHJwszTQxrIImNLphq0gKyQKc9rqPWM9468Wlvy
 1+Vg4ExvzOos48xua7GCdEegUfYaJag2LOU3kB2fY41GNScmAfODvW8m4HpCF0nFLN36sgLfLqf
 aF+qLSyR77k9s1A==
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
index 490a7cde6d40a..2e3581ecb42ee 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1050,6 +1050,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
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

