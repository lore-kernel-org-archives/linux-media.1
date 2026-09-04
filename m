Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368D948F82C
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519410; cv=none; b=Q+dY2KtEE9i87soGt0XO8SiotRLXTQukyJ+F8con4xcdh2KauJ6WvTceUHOsFvjrY0DIw6gQ40x1WjC5tvWPYEASrX/vXkjt7y4MR9km+wU9TJnQx+cfhiU+S0/fdfPJIYWjjgj82ME/Pt/kXRTStMuwQLkbTvHmrUfQX31Pwpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519410; c=relaxed/simple;
	bh=YIHQ8bdlgjCWtdVge+nC3WQMRQ7b+PI2QP9xU/aHDok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQHlRw9U8m//B5uJNDxmhxEWoqAmAFRuKJS7EoF/FduWrtfKj12hyRWp2e5X/tIVcQ5d8cTs0HjhAj/nY43kqmBRR48k5neThwIb3uPuyEwYl1MzlNuOfQVCgWpfo/+WByJd0XameHNYWk+7EbTCbL/C1cKEmt8DALJR9I4CerI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eir1scMd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eir1scMd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso9546075e9.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519406; x=1789124206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofKngm+I/M34aU+twd5ZTUQtVapU3M8PXngwPLd065A=;
        b=eir1scMdyfjpdbHEfP+v7x2Si7kGyhbHvRVE/aQTN/JjCGT9A93C63pxduur9YveGQ
         DUToEOz+5SW16oRqNUaQ3/M11IGnuOeqDMfUW5jt88BalQNCVGWFcIFowt8LEYfVu8Rn
         aH8oM0fh0XKKtk/y+8jynZ7oBQRMVSvM6ekcZRVGwYmpXrm+AkybRv6hgzEUZ+US1znE
         W5mpTG3T0267fbbJ2SgaEhMJD5BDBMlEC4Q5kX4KbSIPmiT7tds8kQzNt3zQuDGEVsbd
         n6V9q/j6ukFmMxL7rvu3/Y/5ftRkyeSW9xiPrkSWnE68+mOi5TYVMm1C2kEIA1ZiYzQf
         fuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519406; x=1789124206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofKngm+I/M34aU+twd5ZTUQtVapU3M8PXngwPLd065A=;
        b=mKZ05AW2JCsI6EnoxgigwVUFiJWsSvjMXiAJJgOzMew+Ah1cUQCQt9Vq+wKhV8rS+R
         yYP19OtvngW8m1xKp7yX+DeO3KUr4Tpx4wXrfoHGvgk/vC+z+OIsfcQq1fZv17cg4enZ
         CSL8nwPvhqtyBOlzUZ8G2vPi5OhtxN64Gt8eJJ3JF+SpBGNq0G1naORXB7akIntXNLFH
         dxsfI/weRqSFzBbwtL4LENPocoN+vZ7L4400MbnNnTqN7sMxT37CcJDk55NsJw85Z28U
         SOJpXZ8O5oYqnh7l6lNtNttCCOkuiPxwpuzEtMfXAcIh9f7Fjhgz0BqRPKX9eD+nkzoE
         EFOA==
X-Forwarded-Encrypted: i=1; AKwUvBz/NXQeWTCCwAYKih54I0kArTpMxD8JL+81WmPMJpymaY5wLJ4ybtOpv+t4eVSDgqJDZaxI0oIsZ1CqgQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nrEzGc5Z8+u94Zq09pZR9jo9ShQ2UvJfsvJ4bdLMMgTqELS1Ht
	aDajE9HdBxCzGZVgCv55scr1elBFbMPPckSJMGlaChiyC3qT/CwCHsW9zRZWsF22XEk=
X-Gm-Gg: AYBFou3QkPO7xpfsUDM88kCLb83lxth6AHcxkLLnH8tu4Vvujz4MNFRW1gJYcqIjXfF
	dbsfYA7eb1VHmHM0sQKX4CHLZaRFBCDMm0j2gZXS2Yfh6JqMW/F+hzwferhfbgTJq46LhaXiy1T
	KpCJ54A6Ojwj+X5MA5AEqD6evbHl5ZqQiQcTI7JxRcqHORW3LeSGgl8CF5fDB2jFfP52VlT5/Ui
	NvkmGp3GinyfjIAx4H/4CxCpXCICwf1TC6sea2yoCggkKHkN8G/dtRRFfsK0PQ8Gp9RBnolm0Hp
	iunLpDistuE2mV0d9uJMKCkjm4mr7U2Xi7HyDpXJEQWKQX0W0W78lsrHjgJZDiyP4NqRGovRuae
	BQ/RPSj+mZEbH8zsB/RupD582kA3Qo14VwnF4EwEC/Bxyw9ezznEPE1O87lUCAw1+xU/pWJEmSp
	PHGJ2gfmAGLUNrYhzYqMXazD8AT/XEqX/FYEohFVoTNLm6qVhP+cbY6eNNkCRzqqbHyQ/KqXNO
X-Received: by 2002:a05:600d:864f:20b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49cfc6e8ed8mr18400195e9.33.1788519406434;
        Fri, 04 Sep 2026 03:56:46 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:45 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:34 +0100
Subject: [PATCH v5 02/13] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-2-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=YIHQ8bdlgjCWtdVge+nC3WQMRQ7b+PI2QP9xU/aHDok=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPlOtXpttnNErtShLSZ5xP+Ea4r+NoviUQf8
 54zxnoQoMuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5QAKCRAicTuzoY3I
 OpAaD/9IXuoeQWQ27TY+20jjKe//oTJboY9pJ1YDiWzZE7fVyiQf4kE8B3jUE3XbhOZdeWCpJd6
 ujq7uLyTMj1P5rQILzAVDaIbb8irEHvZnDhZZanKb8vMCC3q0JBs8Upg6Ny7WBLv0AUGEeCmeJp
 ZuFAqBW/6pTLcTfirlkjNz50n/DHpG6jUgWTO7DNRkhAsMe5Pu0NuRqfVd2KP/FVSE2DO9C/86B
 xH0aPVugONmLfa9XhOqctfFPJ0fPm2mMZMYCOHDtJAWX4BWS2akSCKdIC6jwmNMpkRA2nPgfe8Y
 0NLW92Cg3xWlBC/FYvb7expYra3zVZkGxhOU59Nn1uFtsa1AkYNaGlgRAwoh9vD7t5wgOLnLYKV
 FA2YE/wcsBNsRj4IuGF0eRqKsAqkFK2CfRqMnXQz+XRAGKCpGyJJSlVwDcqNg4DKKEcMPMC5U5C
 cyQTPtRte/64uoUXFReiOc23+FN3OSybMlL75Zue1iG6kziu9Ag1Rtelyo/0sO0QdEeH7o15RcI
 6++eJVfSFy2xADjoJS9IX8yRdHMnAUDsAkofOcy+YgBK1JidvjHDeNiKiNiic+1MSZXZ8kU+DQk
 mfFY8JpcyACBWPO3vHX2zeYlf693cfxDUoRhQtAGSrP2jddg3Mw0mUXAxew80axHGRxlORAYZBG
 EqyArHubt1Vge1w==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The vdd-csiphy supplies power the CSIPHY blocks. CSIPHYs may be
described as standalone phy nodes carrying their own supplies, in which
case the CAMSS node has none. Make the supplies optional; existing DTS
remain valid.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 126400772d028..57a838fe2d229 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -186,8 +186,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false

-- 
2.55.0

