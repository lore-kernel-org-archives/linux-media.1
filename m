Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432105;
	b=exnJOQyNISWBfygUyNk+Fee/HIXMKK3ibaDW1ym+GL/+Vp5oszJKw1CCMWn0PwPpdUqN
	 SZ8Z9VtFf6zQNFvfmGtqtjDVJ4HD0HV4yubTwAxEvLVa4yl0nd0uQ39Cl43BALjKHYunt
	 e/t2So1P4864GgTXuh5lRBMVMeI4J00KocOjcQvN/RvkzTuEm2rMgoSlEA9ozgECyrP3P
	 7G6xhfVKap0hWE8eVJuYzjCryKJmff4FtfOlJIiHhWdSK99Xnt+aBBe/G7NY77NYcOVKz
	 uAxgKehoQoa4mkNb0KEvi8VEz8usQQo1upBwtGDHYpxxsNXgQyBYoBV0izyHDXY1U1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
	b=UhcWE+Fwy2BEFtoNxkjR8J51J1iS2L4oQvscAqVhNuXjMSXiKhKvechgdnHRSpMGsPap
	 KWemTVPK/7X2FE2Mq2ex3j9hYr6nrRCo8T5rY/of9P3NMnlrtfh/3qG8Em0bj287gIVPE
	 iEhuCKmEzDLHuXxvMPv2anacWAc01MIj6Y/fIjxdv++V7eZqeL2kWuHITD4VeM25lSYLA
	 7pscxxwOSui8wUjQDGujH/B26L+207pcCJhXwXMC6r1v4e9vuCfTU6H+KlwYk9DexjTYM
	 eEw98P5poLT1yJ8Ul8bnAuuyqY2iyLqjPSV0M4E7Bj9Co5tmeHPtvDcvyYpStc4gwxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwoqaWK4;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FCF606A333
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FCF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwoqaWK4
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b546061d58so7052284c88.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432105; x=1796036905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
        b=LwoqaWK45pNBukfs0hE3P8NcEWeez9hjX3QJpbuCkeFGZ3IRbS/bA9ob05/MNaPzF1
         /QWJCjhAdYFuw79LnEu3pC3MHACbTpz6SfAe9I6H6Zh0Rei8MSCiau0i7ZSfwrOLIwVi
         guBmrn8bKj3vJ0hAPEmQy1Olh0ayHDqLPb9z/w4jVbagtfpHnnazFx7chJnaeL3BK/wZ
         C8oF8qjWjHcBK7hid+eAD7FaUqsl3oUKhudGZgjUag2SB6mKGTeoZ3N2d1wxt8FUrIt3
         wrIKddjRTUt4e/zD17S9i9xmHSSFtp0lo3v2w92T1rJ9fXt7blLEIVGepbjOJgl8NqCv
         ZVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432105; x=1796036905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
        b=WINU0EJYQxH7vouJYwJfNj1uZuZhVeRmQrNhV8bwJCQQec5N1i8SxYVMcTbY5g1OSQ
         fP6bD7fLHD1oXnVPO8aam/06Iby6e+DGjwdcriH1wF+8AvlE7wh+q5PHPhE2kFphxW3s
         759Io9fUNqGx4Y84FFlzV1eDfr9iYiIDXJQpgFMsJe/ap5t5chzlj/9kN1MBjiCs1VXX
         +7Wb9iNS/3eFhY8FmpHrHuBeDqSoFqm3CDMtCmnaoZudv2o6dkf4KO+iI29cNd+F0yjq
         3pI7mrUE/RBVbZuwePR2TKoDuN1MHbMzz4Mez8nB+9pez6Sop1fKETBHuu3kakaXwKUH
         iFrg==
X-Forwarded-Encrypted: i=1; AL+hErE9bGkz34GGKtmgE3d2zr+FoAcnAGJHgdXmg8hcwaW2tZ4lEgRuX0nrcP+m+t1JiIhFMQdw1EvagaVdkQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/oHEIjxalLdDQMV+roojjbBorVB0NdUhUiJatYbYyxYEeb8bV8
	kCxBGXOfCFOyfx8CsbOfVdT3npuZnf4rVkW0D9K1fEoqk12Cv5I0GNV3
X-Gm-Gg: AZFdTZdtS4R3A/2XObifEq8/HrF8Te74DzUtblsIHUIqH07tez75qXU/6tUHomB02rE
	mOk5TuH3BiBv+pEce1jH8naVU9BszETf3gbb+R09RyOvliU/3kz0bCJJsM4JNaS2iglGynV4Om/
	95ZAf9v6+mfu9qQX+FOvJ+c7RjaW2jSk963OjiNo+o4EnW0YZ3KOHUca2i1etBw8oghqkP5f1Fu
	CuTpRPNGQ4YeLPxowWPVfVmabOMa56ZdWZeoBzn7yUMBlxJyQS01B5h0MhIUVwwKwCW2UFcxZ4X
	kVlr0dvLQX6SQI7gOAvJlk6SS3sljt4BBJPFsXeFmv4KcLCXws6awZvqHt6t+XTt75CKifrRus9
	1KRuum7Q2ATJkJvMDPBC/v+e8hiBSd6fMiLpQB3dLpAeDrWB5nZx9V65Sxca/tfNCxHkCBG+xqx
	Q3Wx/64FpM9bqVzKi0BYIMBjuGyXNjL2Uz2qembOYSBOndcRsomKseC1HW8ySnX0eoY12CPgJEc
	7Zu+a2zPW1ojwGxgEWMZCZEHpOyltT45aCwtv8JxbkHrwXwvOTOhfTtbsVkoQEN6RoJcEp5Bbxs
	KMyPx2qceYyjIFQRSC6bmouIU7tiLPq1Yrqtum2/iCS9lg==
X-Received: by 2002:a05:7022:1103:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b5568a15aamr10021894c88.9.1795432104625;
        Mon, 23 Nov 2026 03:08:24 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:24 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/6] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 18:08:00 +0700
Message-ID: <20261123110805.119610-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with
a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on
MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8 (800 MHz / 8 =
100 MHz), matching the 200 MHz and 266.67 MHz entries.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index c4ec9950ab68..3987cab327b4 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

