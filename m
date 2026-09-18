Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B045503919
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739819; cv=none; b=SYgFH3cFT1sX44hDBY9uteJeeCmn7FzzKidQ7eANj/yYvDk1CAnLhLkL4T6gFNPUnhDSfiJNRRY1kc+6zPQkYaai5oJm9M0PaSo+vBBdQj3M2PENkpenn5n08UJXRocu/yrtbJlyxmmdb0rbKhA0bjsO/onak14aedYuHQ1N0Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739819; c=relaxed/simple;
	bh=cyFgC+qXLx7TbLlb087AjFkU/0sOlZUcyZhxSpOGPTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knzdKsQplTwERNg87bCzKBpHjR4FbL8W7kg2yVvoBvOWPwTjXlEBAEm1aZJ76eJYZFa04szGYK9F38F0EcvZCrKsnv+t57V+mW6xvwawKxwlW2M7p2/Pxq76efnytvRoWZFr5UmW/O9uH12+DPnRMNM1SgAnHyzIQEev+Sgqk1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZlvai9l; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZlvai9l"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso1207930a12.3
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789739813; x=1790344613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrzoJsyfGQAwVoj4rnXSLGvbnlKoCkPzZFVe6L0WIsM=;
        b=TZlvai9l0KmM93xXYcdnSEXUh+7IdfHCLcvzVtSXzPTIM4MzZGIEOzHqRsDqbLBSGs
         lSEKnwjWLfhtfqezjv7OlfFfq/vUOQiYiQdPn20RQO/+Gww5MfUeNhD1BpSBTNHZagrE
         ExvubaOvZfPX2v0lpR9JKPCmQEjsmBmvZq0dqswmC7hNNybSs1R0pcmGwpKEnPqKO8qJ
         YqsMp0u+OeVJ3L5/boOY62m2XoMnYtjVQyr/2V0xtcgOJw+f8u05Nkofhtic92UZxDlD
         6viF9h8uKFqdGoy1hivJICwJ3EwVrIBHOl6EFgMl02hxA6G2R7XRwPZ/yC32jB8hniOL
         +u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739813; x=1790344613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrzoJsyfGQAwVoj4rnXSLGvbnlKoCkPzZFVe6L0WIsM=;
        b=KtYBqmrnfHE1YL/F/nBNWCcmWd4g+puSt+FIBg7KKjZLMYdgjx00uQnlHWEujRgmXp
         REVY2gAENXnnMU8DfmXA2t1NiBr0+qhKO8d+zyUFUQ64FFFD2qGA2Bg1u6yrnuM2Cuz8
         SXyYb/ZKd/5e++IJI8qizbCnKBPRLqJFV5uNNqUTM8Uw//i4Gyl49K/skJfKgUcE6+z7
         WIa9WX4ejWseZuHg08ilvoXYZYv1LkFeMkg2QP9RpGTjFR3s1eo5g0GyWz5CyyATWdhI
         CHtZb4vQKZBio8UNZzes5+KdC5X+2oPFBZx3y1BO3SpH8B3K4jzYo3xFQCSKFyZlxT/q
         X/Cg==
X-Forwarded-Encrypted: i=1; AKwUvBznRE77+RcAVzBgYpi1JraIfIVeMhMKTtknkOJDCpN3OdMRxaK5bg9lP9VXi34g7nmC27MYn9QZir3rSw==@vger.kernel.org
X-Gm-Message-State: AFuF++knKitbQXaTiNbnHzNAQOdrwEAatBGkEeAuQwrDyJc0g0znpToG
	6rIcxScjv8YBm0JfMJWsM7MwOCiRrhoktgiX2YAIKKq0IxSgqWISa1ry0Cg4x5yJIzY=
X-Gm-Gg: AYBFou0f0xculguuOrx1ugtFkOnhOYMW1DD4PgI/I6YFMB6+8tSFZFARd+Tr5ED1gXC
	1Kpf67FGLnV70ah4p6hfCgaL8RE5TFwMnGFSb4NTS28rciGLfsXcbAb64fJEMdSrx8/C/mnYXwP
	gJBNwQEPiIqRi4eTmLm9pOF6wFAXkTZwlKw36qN2nTcrSUpu9Oipzy/q6jYgrIwwLN1gmXCE018
	ixAtZEEzVYHZQ9qodisY9j+nXTJuMiskW9TQgH6RHTRIwGjzpqfLHWeDT4+LGGQ2DuDqM3DlYt3
	RfE/ed0mtfowZAu76mLve496JgM/MgFo/Rm7Po55R9D4915V3u74h7ZSy1rfQkRdpfm1GiPqNDT
	3hKtUAMhNriQnWm2Rp7cqoCsZ0+cM2x1SDoKxaV0JTL//G1C8110m3f2LsY+E25s8h00qKf5FR+
	Vbo6hN1aSM19x2Z+HWfRS6e9AfuXQSYbFsI79Fb1AA2RqkfEjyQPFeEBrQaKKEfnHF3lKgY9QHp
	jJpj0v4
X-Received: by 2002:a05:6402:4020:b0:6a9:f88d:b6e3 with SMTP id 4fb4d7f45d1cf-6aa52444ccdmr1676118a12.0.1789739813547;
        Fri, 18 Sep 2026 06:56:53 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59730866sm915455a12.18.2026.09.18.06.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:56:53 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 18 Sep 2026 14:56:39 +0100
Subject: [PATCH v20 4/6] phy: core: Add missing kerneldoc colon in two
 locations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-4-dc244e124e71@linaro.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=cyFgC+qXLx7TbLlb087AjFkU/0sOlZUcyZhxSpOGPTs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrUMcInVhLdyaudbJKlI64/7xCw8tGs/f8+uvK
 Tr4ZbtYz7WJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaq1DHAAKCRAicTuzoY3I
 OujtEACYXwO198w8CrWRRdGcXNTIysDMDcAUvp1WCuv3mvY6fVpCxXIGF4CSCrfzLcFQr60bX2t
 //L21gFXW3rClTVpHxDa2/I7cBBZ9g1+k3k3lVMayQxOHFcOHCuFFlIrm9ZmaGln631MVSTJ0ws
 c9MrCNLCHA2sxIeBiTh/SaCsCDWRe6nAYIwCUSS7HZgKn+eqMhzh96iVZIlznfWdg8DPmoC+gD8
 lMQEaw+I8SAnAgVtSVER8Q/iyhdRjEgTGH++Iqpo0M8aQXkDewl9gaSAOQz/p1G4sPKUl+c3beu
 VRWWObQfVqlJKSdbAz8IDjKHbtkKiF61eQ2LE5DZiI2DUmXHrbQ8DgaGmFLKMct8E1/0wU6zjKW
 eS2TOdAdvifqQfbtrsNxiNrTYd+aVaUaAHFlsYBBwX+gfDaQnyUIFPlsaeW/ON2EyFu9xwT+3P/
 ltyfZ4TGmNVuhIKSBWMpabAjMkcpHbKtljsofWQsNJF5NJzwOxBYJ7rrrYQlbBwaixoUsZN0RPr
 pxsDiBOBPN5smxSysqmFNF+xPBA7GfEZr9SUAtdH13binQpUeNhdhHHKLZjKkUu2QQRwXpOXepT
 B8Qx7cu2Gy4pdLGzyQCLcWSLeA5Pi/mUNiliWh7A8mwInyO3VqPrbACzMIPZSNqT6W2ee8/8XUt
 Eoa+OjmpJX6fM+Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Correct missing colon after Return in kernel doc.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index f0d2b50d1c76b..597e6b234f5ef 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -643,7 +643,7 @@ static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
  * @np: device_node for which to get the phy
  * @index: the index of the phy
  *
- * Returns the phy associated with the given phandle value,
+ * Returns: the phy associated with the given phandle value,
  * after getting a refcount to it or -ENODEV if there is no such phy or
  * -EPROBE_DEFER if there is a phandle to the phy, but the device is
  * not yet loaded. This function uses of_xlate call back function provided
@@ -681,7 +681,7 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
  * @np: device_node for which to get the phy
  * @con_id: name of the phy from device's point of view
  *
- * Returns the phy driver, after getting a refcount to it; or
+ * Returns: the phy driver, after getting a refcount to it; or
  * -ENODEV if there is no such phy. The caller is responsible for
  * calling of_phy_put() to release that count.
  */
@@ -797,7 +797,7 @@ EXPORT_SYMBOL_GPL(of_phy_simple_xlate);
  * @string: the phy name as given in the dt data or the name of the controller
  * port for non-dt case
  *
- * Returns the phy driver, after getting a refcount to it; or
+ * Returns: the phy driver, after getting a refcount to it; or
  * -ENODEV if there is no such phy.  The caller is responsible for
  * calling phy_put() to release that count.
  */

-- 
2.55.0

