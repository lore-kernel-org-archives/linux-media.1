Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854644B829E
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643299; cv=none; b=DiU5mxJwRJgUE2jO18fVZGpN2iXXt8mOPTNZwC/O09JuaPPqRTh/BYtxQFJWcQBUGtj3pCph/rwnB4tnRmFSd/dm0eb4nolAAUyeGdulZyEmajCZun8A4sHZPoJkkSrFEy9yQJycDeNtHVQKj/KHVfbd/XSNv+1ox8xyBk9vyFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643299; c=relaxed/simple;
	bh=jvWI5bCo2G0nPMiyIWWUCCvc8PV85ddqSgmXfNNkRqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJnqcTbLNx7Qz2OL1jaz2lJl2LeOs96d4ONCLg1ik27UCBzZ07GvkKMsLqfccXgfdEKVYb0TrmOKXA5JbQVdt1zz3agtQnlz68OHMxqERb4/HdVuyUPmL4/f6ytjjVRbj0e0q3XDmqN0PgsD04GIlr2r81N9vH6D4u7CrH9J/pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=amRZXAIM; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="amRZXAIM"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60590a85cso1486114a12.0
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 04:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789643286; x=1790248086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6nCQrtjn5sjZ36INdWU9AmImwt4exmEpBcYwRBKS5A=;
        b=amRZXAIM2HT6n1xYQ1g4xhnUXi9Nws/e3Mxr0J2muU6vHMAIT5rQyaKZcnM2Pa9j6r
         mOsNGj31vC+n1J8FTIXzknNGbzMBc4RSXa0Nn26p1WN/xBL1+E/BtpiVLPKGPRh532lR
         /0ZSEYNkiAczGgTazWsa0zYbA8b4QFf8CphcPBKsFAZJahyLOxg3H2qdxUq8+PTOY176
         AcWYhL51xDPg19RwbGE2e/3L18li3sEH6y3MKnbogNN9mtjhjwd58qTax++a+ZpDFplP
         RiF8YaMXlwYs6T4zEs55yx1Pk9brItPSm/igptA7fD/2qqACLpVHPFKx56Ty18YemiEx
         kcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789643286; x=1790248086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6nCQrtjn5sjZ36INdWU9AmImwt4exmEpBcYwRBKS5A=;
        b=VSKH1tzNFKC7aYOzWkHaz6lrXce5kIUNIQkU0aOYBI24T4doEjBl2RTo3qPqT4Bp+Z
         U8lcs+dfC9HfxAuADehpBy7nMtYTyIbjCo0JI0HjhC+awI9QbMj7CJMZ5WT/l0Cz1a1c
         VcJ8ZCrgsVjA3WVFF8zCEnLkstTkmy6G0/5Z5ryUYowOKUU9Gkw+IT2OeaNVeVQdvrwi
         cnyDKga5CW8BZuPmVtfIWg1W0R95UR2N/bqq8XTyI/+ABy33ZXMhMBMVmqc+bqu8DCpG
         aYMt6QZD36WCoWssqs8RJU7i/aUoDrH3KRWpU+Gjgzs5EUBdfAfktHMTy3uUqhA7cdu+
         FNdw==
X-Forwarded-Encrypted: i=1; AKwUvBwclzHkoiEW8M73Kr7iQQidRvjtmjvfcnH12czShcq0CKv/QB1bbca1Pl9vqPek9SOu943iu1ARVvSvdg==@vger.kernel.org
X-Gm-Message-State: AFuF++mYDMEAevusGx6jk41zE91c/oUvTphPltShClb+1/TTemDOuXjp
	k8lf8zvWNEj6GMqPR+RzDE9zJ5VezFb9IutnyuPl5O1vMxRADTZABWJKJtCzBIaPT+0=
X-Gm-Gg: AYBFou3x2FDpd2KNoqfP8CexhMwvKLxd8J2UzVWpgRrFBP+lBTGrjJiIRKpc7xiZYjN
	tYUkrnSm6wk655oXONWR+wpGpi63oXKBzheTwpZiBcBqZqyZSAoSt+AFPN9ro89TZsBuUJC+yTy
	wsIjjzpAeBj5hScetbr3qR0LgGFWsvZO/YjunUz5/VwP1OBLah19auxw/e/9m3qd91X88faJQYQ
	KOIlWzJ7oUn6pCw8bABS47rB6lWw97SchAovVDqIMmIWG1N4IIEd+f4ez98PU5jwXInMN4nyxgc
	1axdw1r5wcIwihjY+CWOFymnICuX+H44N6rk+4hnyzY5/I3hXQOiOC3KA/9OZu56XvVrafSXFdo
	i7wHZIgxUiGr3VOEFrokzwRyZU8I60WLu2FnsEgGsug7xdPkVccyFQtMfV9zH5+tfuJfiN0FODO
	/SSVsMCe/MRSXrAZLDdxoEUwwateiirKXBJ3DqtIyJdOeNZCORR2ock8VL2DcH0Vl16y3YAXjdY
	l0AsbiMjOUoY04IrknD
X-Received: by 2002:a05:6402:4613:b0:6a9:8d5e:66a6 with SMTP id 4fb4d7f45d1cf-6aa22250e8emr3965332a12.11.1789643285855;
        Thu, 17 Sep 2026 04:08:05 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d27ad36sm3175656a12.21.2026.09.17.04.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:08:05 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 12:07:55 +0100
Subject: [PATCH v18 2/5] phy: core: Add phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-2-f85c9103177e@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5277;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=jvWI5bCo2G0nPMiyIWWUCCvc8PV85ddqSgmXfNNkRqI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq8oNQFwYjOrE5sJSPDVGnBsCu7pHv0Xs4Nip5
 +q6A5L2XnSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvKDQAKCRAicTuzoY3I
 OoN/D/9/ujwtfypWaiH4Z1lIQEe5mE67i5ps3oTGkIyMPMGUlL1YT4d1xW65q1Hb8qHoTMqKOIY
 7MB/6mlluGLLvEqx0lKoFOMUI6eklV7KSqaJbzQU071gtGJCXyxQ71IfPienvv2DovfDawKIQGV
 E5cWLUjeH1d/Jz7GwXQ7aXduTbbE6AvhJMFkLJ4IBJpMjspjPFgVzy08wnje3bdEzgpud0WvQah
 HZ05ort2X2ceV34Xq/ohdulHB2ePbsw0K/WGSw0XBjkwJJGrxIux31pJJezuqhJv3stLntTIgdi
 oVi0FSUTiHWtJqVeLZBJBpAS+uZUaYE04bO0tzluUFDG1Cl5OFmmjHYpBA4hIVYTJB0BNGB8eQr
 CCNps0y9bDpFf0ICj6O1Zg+whA1H7QTYlpP01ZBuxJg6Uvr+u78uol404/zLUU52PHL1Rgm1np1
 P13peA4UH49/RzipVuUqda09koVEKMzn+MNt/U4JRZlYyfaqc082baNNyUErJrQVLfpZcLcDe/D
 G8XhN/sg9hZWojTgel2EECFFHQOuZMP3/IKT6d8vlrHP/M+sHe33x8ZV6tf74tPCrJS62A3wBe7
 MDow1qYEbg6bd9QBTH1gXDyacLiZ2DaYS5EXTamnnWfZ+2bPCZ53K7lfrF8GUvQcvhNHzQrnJz6
 fXC5li+1i8oILnA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 95 +++++++++++++++++++++++++++++++++++++------------
 include/linux/phy/phy.h |  6 ++++
 2 files changed, 78 insertions(+), 23 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 89addd732bff3..490a7cde6d40a 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,22 +606,51 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
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
  * @index: the index of the phy
  *
- * Returns the phy associated with the given phandle value,
- * after getting a refcount to it or -ENODEV if there is no such phy or
- * -EPROBE_DEFER if there is a phandle to the phy, but the device is
- * not yet loaded. This function uses of_xlate call back function provided
- * while registering the phy_provider to find the phy instance.
+ * Returns the phy associated with the given phandle value after getting
+ * a refcount to it; -ENODEV if there is no such phy or the phy is
+ * disabled; -EPROBE_DEFER if the phy provider is not yet available.
  */
 static struct phy *_of_phy_get(struct device_node *np, int index)
 {
 	int ret;
-	struct phy_provider *phy_provider;
-	struct phy *phy = NULL;
+	struct phy *phy;
 	struct of_phandle_args args;
 
 	lockdep_assert_held(&phy_provider_mutex);
@@ -637,22 +666,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
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
@@ -1001,6 +1015,41 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
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

