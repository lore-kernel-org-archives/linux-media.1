Received: from mail-ed2-f30.google.com (mail-ed2-f30.google.com [74.125.228.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4490A5038F1
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739816; cv=none; b=S/zE1Au4VYkC5i9uLf02rRuI6GC2vuEN5CO/x4qKRlJvbPacLc/XAEmPHRkp7mHs2041bDT5fiy79/F3k0RSA9jEJBuD+8qiGgNBTseb08+JGBfhSsrhHskbZlupVMvInxdtGZ2D/ptsJrnEbF4v98vlNPOa8cQkRRvJcub1K1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739816; c=relaxed/simple;
	bh=U4KWrtkdrf8AbsEYFUaWO89GB+6jXI+2zX+mv1VyPB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1wess6rF7o/H2XGGob2PZe63R67k9MFlfYj6/MihSbwj0YMaK7XiGh0IHIEjtk6wxGbTXmzQWAz+OeFKsvP+U1kjraAXDryTktHBadMn7MhSP0ydyNV1IKbu6RYX+hY8LEkTB/afaDZO/hFqX8IxAh9z+LZht4OLcAj4RXdziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dg5BngLp; arc=none smtp.client-ip=74.125.228.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dg5BngLp"
Received: by mail-ed2-f30.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so1197947a12.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 06:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789739812; x=1790344612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWeQAK/2AvrW9g7LNaT13bKf+X/ruOu9J45YLkmVnXE=;
        b=Dg5BngLp0ASA7toWYgRMfl4l9MXdDljBotxXab7D+1r8zSRhNeHIlPyJ97O4FJT5mP
         1qIkAVZwW0s4qMJsw09ru/oBkHEF3NTxYzZhfiLlVqCKAxc/YPgTBM/g29h4kQFZEWuw
         /N0dHjiWG4zTTot7xiRl5Up7/h7ATL/v+8F8+kp53MrJj+GoqnnQsYTu0olyNZZYh4lk
         W75lM8xFrkBKyki2ZfNj1KsoNCJTNIRChgD8Nd3QGffN+BzU7E2558cmJELm2BUefQJz
         XHPsxR5bZZ8Oao+snX8U1GSyBB8CMvm85cKVW4i+6x+ZRlWMF3HxuU+5cX81rLVcDmNv
         p6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739812; x=1790344612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWeQAK/2AvrW9g7LNaT13bKf+X/ruOu9J45YLkmVnXE=;
        b=bJt5jFO/A/i0KGOTFYzRgi5BpYoH7aRB37emA7eS6qojfuVf5gNVLnrlEbUBWdAhvi
         so36G7v/AcKP6rw31fkYMjJKwaPncDEtUdsDhVHyNZC2LkOND4oaHX2A679Te80U1cUq
         1Lhw3NXev1/Tv+/wx5gcUja13Y1xHIb8VHLZJPpEdn7D7gEi+MX3GpVgpSN5N8mMy8Ma
         AQiGNbf6M8G5fEh3wXsPzKZ30Av/jjepeRDFYhjUG6iNq0+V9bKk19QIOZjWmb8Xfuo+
         IRCeyBnFtA3ZHgNxzxNQjNfpMmv/M8QEtDnjNh59Y22qI7ATE3x0Y4jguXpKz+UBK+kL
         aSGA==
X-Forwarded-Encrypted: i=1; AKwUvBwwxqgGitvmykIyxKODudRANPunVrhqT8EJ0SCzUqneox0S2vubw0QEzJHuS6h2PCcPww3+yFHuS7JsDw==@vger.kernel.org
X-Gm-Message-State: AFuF++l2fG6q74StpeL+Z6Qcy+JuMOu9LrW9J5oEQgxgVkeWEOvOKaO/
	9xe13DCFSlWtO3yDmW32nasZyD0Q6QvHlzD7ZF9NVzzKqhADcGZoPgCUcUVHHA8PPms=
X-Gm-Gg: AYBFou3vjWINFvM/uiaLgV+fYs91daR6TrJ7477zW1CLWgqze579slaiSrbSKKI1IPO
	2s4Gp70VteBmjcdse3c6WyhUP8rvxMoR8wrAYc8QFWvP1PyKaTmDq8NQ7eO+scTcCQUU+B71+/j
	tEvoru8adYU9V10S6UKqZOPJqSSJi2sakEbABhlK9lJKhY9ITVv+x+n1awsbcwQIygtrNPyJ6fz
	Y5iz4TlY0OCfj+d8qTLw5gRz88MtaLWzHkS73ySFe5r/kJX6+Oc1oqlwEbsWPrZ1iaFtX7O3odX
	m9MET9oehIKMvO+cjs9gBsMYSI0HlHy9pcT6lzAsXv+34pVTqpVqGNkcP+IkzqMeTVe9hGxUqkf
	/7DGSjXRvuUtdZLNGfaEzbnCGbaeyoJk74MvgO/GgEoVgZML2R+fhPgE/7Eq0vbY3Pqy+7dkEjv
	SatShXTRUWUSMCcEAKAZpPoAcEdCY/zX/fDhgDzAXQ+Pb1OzsCemn0Jk5n0mutLqf+MsGefqGi2
	1WXXHnm
X-Received: by 2002:a05:6402:400a:b0:6a9:98dd:afd0 with SMTP id 4fb4d7f45d1cf-6aa569a1e28mr1580636a12.40.1789739812287;
        Fri, 18 Sep 2026 06:56:52 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.4.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59730866sm915455a12.18.2026.09.18.06.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:56:51 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 18 Sep 2026 14:56:38 +0100
Subject: [PATCH v20 3/6] phy: core: Add devm_phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-3-dc244e124e71@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2762;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=U4KWrtkdrf8AbsEYFUaWO89GB+6jXI+2zX+mv1VyPB0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrUMbBOYe0XufQ2avNCa6HRHZdYcePixEgjEVe
 BC7k+oLBkGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaq1DGwAKCRAicTuzoY3I
 Ojl9D/9AF6qr6+l61lUY+alwJ7Ou48uJiDa9f9SlzB4K5AcldLfJoBLHv4ZhTqGV3/dKuyxA6ks
 rKbLJdY8uTzCZvbi3B+4p6NO4bPxWNyePGDeHU3UDX3LFogG/q7AwtWJqmEbYKeW+TfrWrSDeFg
 7BGdlal14Mnc9XfV81HB6tjy8NozxyfJwOT6mIUs+9ce6OGXmLIpUftSVh6xtRnVn1qxlVHK7+O
 RjFqQJ6w1AIscpGZnCZz30zoX4/mHFuCM3MSJ3bynV91746dtpbNOgmSCBIsuVq9aKi/iwWnKe+
 bYLj48GbnZdS+HRbjJ7bDqnEIQJuiG7n46sz7+41cMe3j3+fDV5NcBOzUWsG0+tSGXrh5vbO7w6
 qt/WT7knNXadlnm5wd/jMgGeESeuZaw6ysleq7sB8gg/iBUYHpd7mnXKhN0Yi6SJ6OW5LFeDi8M
 FKF5sNoDEqO0KbDGLM1EQFB+y7cdXdBNblny1zsMx6tenoN362XFlo/FHZG3LTAfno82VtYYDcI
 x7YrQxjELY5UWouIC7hXG3SY0PPP5Uj6V0IilF8FUGmM/NeZ3GU8SrYI8GH+eLNvvoQMHSJ/55K
 EMJkan7xGZWEGT0lpwx96IJaM0Qma/KroCyXzSp+ELdLmwehQMyv+bQp8R+Pv3zqHaR7ZyqVOEo
 CFEY2A3MGzWjBCw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a devm variant of phy_get_by_of_node() to allow for the familiar
pattern of having devres automatically release resources on the driver's
exit path.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  7 +++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 42c27a2b45159..f0d2b50d1c76b 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1048,6 +1048,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(phy_get_by_of_node);
 
+/**
+ * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
+ * @dev: device requesting the PHY
+ * @np: device_node of the PHY provider
+ *
+ * Returns: phy associated with the device_node or ERR_PTR. devres manages
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

