Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437368;
	b=ShowW1ZSxmTnfe5NtAlrV/B7AwbgqwlHTh+oJ/ITUZ6RSRSYdXh9Gj5pKtfpWjqJNacL
	 7N2trIuac/R75w8DKa02gBzx4UAmz53lfc1uRLO3D88hDFp8Sg3/Eo0qkOEmi8KHUKYQi
	 Xn/YRTB6jjnj3LGN/I8jNieo2fUOfmYUliyeiawbdVE9j9SrlTn5EaYmOdrOe4qr9HqTL
	 u4QXQ9Mma/6CKJkllBHbohE2SY9pftaG+hNRTS1R1XVyhVJmI+TpECBx5HScdYjN229vY
	 sI+1D5H4gVthv7n3nCePuXCEROg8Fa5hsFlqSnRzEaSTtcO649pkTquz7lKbo4VoSGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
	b=tuETlk4/iXXZeJMPMbHI83BC26Nqr+oZ1Lh5lOQuOrP11VZa3B9rPmjGPBC1+TGjy1L+
	 rY2RF6wYRtUSCdYWi6ECtZeF70R1UDCZdMZy4ro3W+4ncPLKj65a6o+7WMnboJ1dfsXMd
	 4ylKop3qGy+gQIDbkzjMame7YD/dciIJ/GephzTza55d7u7VMUEVKWOmL81oT7cOdKNcF
	 o2W51b3dg3TOj5r/C0MUOesRskfxtI6Q70IcQjTGQ55gS3EF7dWovDr9SeiY4/NS9sS8C
	 GgYr+voxKSLssbpd2JdnyBu9cJJ1g316unvaEGhbw72Mkdj4yTtPQBernEnpi1Kf/Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alq+xpW8;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7545A606A32D
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7545A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alq+xpW8
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-382f4710a17so5494951eec.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 04:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437368; x=1796042168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
        b=alq+xpW8lvIvn7LcJwzSvomTxbVuQXitCohB6cKUBQAR6jW9xKij72us30SL05FkMa
         H3Poy1cOtIZ4Sy0okJijmUSOBntFNr6/Oxa43vJbYWKncSm6Do4G1wHQS2tDipyPE/lJ
         fwQh+u8cNBxIiNdUK+P/pbNoutc9ywa4rJr/Geb/7NAHIHIGl+GlkvwtU8NaxtVNcE6x
         3vMPNKRFxg87rC0bZNZfq9UgV+4zlMY6+Jh9w7xb/LhDIVRk8EgnbFP9ID41wPMuZYrX
         e7Cx2HK0oF7JaWx+jgqk+gcKRJ38vpli8lP3FgvCI2JX8jt+O1Dj6VtscZ6JFVBd+4wg
         f64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437368; x=1796042168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
        b=YcMeVXkEIos+uXNqDxDRAnvRNtUsbOER78uFfb5kaTUHnk4l/p2wGyJvjEt+GrqUQM
         f6ts6WMWGCoO11P00rUn4fDCar2Jr9kf1SrK3ahFDkkQelrG5Zvn3YHJcHA4ri6Grs8V
         jIBGD3ONKzBpIvBcqd8yCOd0hW78lfrCqkDu+iSm+6vKzI0Of4cQq2/bhvBLEvu5Hm4j
         oDURvME7ro4W4QKN+PWRUGKty/IP5GsFonpHXcQppmpKjizU21DOgesX3gGUB8UIJI9/
         chD/fQ7/tzt/qJs6UGdnsJ1yOPjd3e8C2lFSdbjuKlgnP6ONRnat07FCnywdandOfQTy
         GcXQ==
X-Forwarded-Encrypted: i=1; AL+hErGLFu/BTwqVuSDVEj782voa59oVbUt+j1xCR5aoBU9UvrhcJhkCkXgLS9B145NWcbiKE5SuiOClnzE5xA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1OfBqyLfKzp/QQsT+pckNVABcwm9PFuWJXi7GXqK1OgGIQdVC
	6j+byIqaXrAsA/x94IqbDKTAZq2hXxp54ySiM9c9I2jKxR8tr8zmnh7f
X-Gm-Gg: AZFdTZfOaS7qXchPPw6U1/PHzavkCfELvoMhSUQf9M5VV1gQkqCD058vmFeRRWetoFh
	CgoZqnofXjTsKczxf1n6XMl11dMyGGmwzQOWHJZWaAz2j3EkSY9O2psPLhUV9/DaIS/QxVZ/F2T
	5YCKUkN9m+Ar1dYx0PlfVOS2eAg88ezScMo9ZFTfonAq6Pd+SPDb1gXa3MgUjGGnJV7+/j3g0RH
	BZjoE/MB/hVVmYWYyzkj+Rw2pW6JpbmqPTpFrBHBddtogKb+0qdU9j4eWXqfTpgU+r4YLyMjc+a
	j64bREel4Dc/z+TkYBeBvH6P7MCP278Y6ZC7ePpxW0XLONCoOgHODuuivH2s9HJJw93B6JsFT5G
	5iZU9Mi5NEaceg3N7vi77YL5+IRU+b4sw1QJMvXiIvGzAc6SRDLZTFXrvIzvUEm0d5piUeL3K0Q
	g9FXtk7C/g4soVKKGNUc90fdTqcouEJoiqL18IjNBQxzvS2xCb2sg1BcBp1RWzMTFaddRXHzgta
	oIKl6hlBo3XPtBRzdp2YruBTaZOSEZf2W5rhQS7QbWNDH2bHyz5hMJjxl/8GOfOj5biLIt0TdpQ
	m61oFAsXoAxh6OhdlYx13fvLDZS+nWABFXIlPzjHT7+tZQ==
X-Received: by 2002:a05:7300:e60c:b0:386:636f:c25e with SMTP id 5a478bee46e88-386636fc6f9mr13059014eec.12.1795437367601;
        Mon, 23 Nov 2026 04:36:07 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:07 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 19:35:40 +0700
Message-ID: <20261123123546.152162-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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
index 8fe1d3e42144..8aec5600e837 100644
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

