Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF8C41DE08
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231351; cv=none; b=XAe5i3woyH7C/4R+brn/e0yQPtU7lzHc0znC26GfMmpE6zADLISdQakOt1XCj0rpOSB/cbaGTuxScc6Kw2XxPOBTEBr22lpOCAonlNl6i4vga6Mz+04Btsve2kz47J8SCILovI0JpqJvQf/JWKM/k3GO3ScJab4RdiMPngq4MIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231351; c=relaxed/simple;
	bh=zxAwJ5BKNj20YMBukuuz7APJgs/aDnAycQAxPRHOCD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8FwvE5EXHEPOfbtLb+ozKrgNmamoOHrKjfH07jPL+FzbJUk741OzbrZmJtm3yXpg17wyFnX3atUX7ZZhpkvWtuBLb+Ifa2kIZX3ndtc5d7UsoDg0S3oFMt/QU8kiEPJ56mqVq5qrm2qwEBQLvu2pGevlNvoXI/SfbXMqKYBhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ialas1RB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ialas1RB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso23747525e9.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 02:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231347; x=1785836147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+TX93WEDHS2lleBHb2XNYNRf0KeRjovIXFDjs6QHpI=;
        b=Ialas1RB/HAf7UEBFIjsDq/px0keFqTlh/Bq/6TIcYX3PT5A92t3rdeuzD4mqDlzof
         TTykf42/IM0E0w85xncRcwHa7c/IaTiArK6WMzOhKCmHUMS0Hk4E3PGYsV8B8r8pZJrk
         akHIGa03RxuqWe3khkTGlL5Abt+8wzYrxHe8TStllLMCsTHONSR1x7EezH/kb9Gh93WU
         zG7/hDVE3nr3OziQjzUfdVDgQthcWjN6qTugDmanqOcspnef1pR4vmMFPeODuAieJA+P
         b9ni3VBbrD14X7p4Gnevi3JtvR+/jJB2N1Ib77NkLqtMFNFEYOcI/M1nLLtpAloWC+s3
         CRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231347; x=1785836147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+TX93WEDHS2lleBHb2XNYNRf0KeRjovIXFDjs6QHpI=;
        b=PjfG2GY70t9921vAmGBa5bufseMOviB38kx1/vV6yDUz71o2XrhHvM1haFjvhbVCYO
         yjc+MsM/ZioTTLlsnET2pZxQ/oQUtKMNp3dNyUCj/S6ETj8nRM7jexAbWcvHj7nAz7bM
         2mfXiBhD8WUgkggIqfH/O86I/YSWqCfSgOtAuBXmT2jEckpq4GkzCVap/5QtNB1RW0fA
         VyVvxgrIgqd/ZmhNlmb6pXyQJDY/OkrD/Vu7Xo43zyUiz1O6UjMXVVkJxzVbWMfpAa1x
         YTdQSACd+DoChfG2O7WbIqKwvuJnPMpGNH/KGXOH7wNOBxpS1fDJMYAaEJ7egEN3NWUl
         2Qog==
X-Forwarded-Encrypted: i=1; AHgh+Rp9B+Std4ABD9seesZyoyzbY7tdNuGtGHVFIoy9ni+lbck39pjkZasWu2feBOy0pml+m6CyP64IHap9Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YweA+5KvShXii28Rm1MXmqeSayBpXm82aEE+OZ8ha71axTla7Z9
	a9RtpALLXzjvVHfKapizXieia3dTNYIu6yuFdrEMVpRCTkXsnAxapg/tIR/gWlOST5o=
X-Gm-Gg: AR+sD10t0SItZvj0rgzrmZjukbkF6nsyTF/c1Xef1WqNFFJKPBld6nOL5ffZzoaAg74
	C1htvtE8p5x1PFEAUlbwbAJasX+w/+gUQNe+gupdE9cvc3VIqjDo1GKTiZ3m+vcYnsxNLK5T3Ah
	v5H4Vfv+Yp5WGde6tGJp2PEI4UsVn2JVYlr7SL6E4Xotc0Fa1z88WWPVCf5JngsCD6xSshcxnwE
	GSYaMDcj4rjgJTZPjuS4Py9rrC51+hPtb+TZNFHlLaqiH+8SUaVDTgJw1I7f1uUaH5kXjWvmUkn
	mCB5MCt7vPIPLwZifanbjXPQwmNaDXsR0OrbtWmJaEwrvZaQ/XsXlKqONjxIJ/yyzDWyKIR/x5e
	D05EvwjEKmEQV1Gsf7pk6AyjWgeo2EmQrTSBhmITfKLOrntSmeQUeCnlkW10TOk04rPoNle0w70
	yw6RjF7Bm7WQVK
X-Received: by 2002:a05:600c:4452:b0:493:e79e:da98 with SMTP id 5b1f17b1804b1-496c65c6d3amr14751025e9.39.1785231346764;
        Tue, 28 Jul 2026 02:35:46 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm68190825e9.15.2026.07.28.02.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:35:46 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 28 Jul 2026 10:35:33 +0100
Subject: [PATCH v13 2/5] phy: core: Add devm_phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-2-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=zxAwJ5BKNj20YMBukuuz7APJgs/aDnAycQAxPRHOCD4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqaHfsgZ/sfKxwu0P8Z3nCvMBe13bWPbaLQ9Hwi
 4GAaaykGqyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCamh37AAKCRAicTuzoY3I
 OmcPEACVEghltbYllYcdr5YBOZHE5gkNgEEv5m5p5/qD4pleuM8kKNvDktLHWcIq4n1UIw0FMn9
 wX+usHjylCBH2yTkCLv3LbMssHGgnQHb+9fwiA02wRwAJnGKRvlPb0sa1MlFL4sSdF5cjeI9XFZ
 82Pv7Zp+QCenq/BLlioa7FAbPh+6+tLyEzeLJvggTnCyFcx2YLkIt0+O3+n5r73o7WaVj2xyemh
 EbYOTy7c/+v32gf7m7dtw8sqobxIDkY3I1nyWznhZNix6roA1nOMBEj1YhqF8Nj2/wi4lsyCsd5
 kIPzVit7LyLCTLbt6GxABjW2FMrfLWYYmIDrrUVSoovjomYqQeOTPwgohZYc93RTaCKDX0A+osT
 6X8UEMvr0JWn/ycTmbicOqmrORBV6cxYo+dg0J0qoy+zsgJodQ2JbZPCNaXTa63I9POgocYfeo3
 oQD5HTeAq9/+m5XL2J8wXQlAaCE8Ef5FH1ty/Hd0+xTNqq0p18ljDn9pUGL3KFdWPiInWnZpqv8
 ka6TNa34caucHeFEpwf9a9bGjZ/TY8ktyWf9ngo3Rn2BUyvOMLC6RTt7sMsJpb6Sh22hawTrYDb
 iuTpDldUbZ0EBI/ttMGiFRFnY+ZLCRhfv1cFgoZnNKmYMW0AlpbFuwDdY5xrdvE6OoYEfa6Xx2M
 xaDatUjBg6PqA/w==
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
index ebfad5325072e..7af24f2f4120f 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1029,6 +1029,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
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
2.54.0

