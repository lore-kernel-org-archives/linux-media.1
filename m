Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787132;
	b=v6VkGC4uAaLQ3AJetnQFAbFCNzVAe5khGleIwLIMw4R39Nr/rf9X9RZ9SXRGpBVadTcO
	 pv4kmFqOPOpa0PNO4475OuK6mOSN4saci0fe4gGBvRfUtVJGfqp5iUaAC/qpskt3GMwcs
	 j1oFc3NViG8WMZmV9rWcmcjW1z5I1ab9NG1/3KFmAvz1cSidTlAI/LonOmDfcdf2L4Ufe
	 jT4ktJPmqel+2SUW1AbHejlAwAHaXFRt3+AnpgLhQs6zUWTNXyhh6oyQSlPcd9pnhkhO8
	 q8/6uzGkx45DuaNY7HlzVrDWLpkg5KUgvTZL7areYBuMWj5hIMRxdODMUmVnPe6C5EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
	b=JJ2NZs/D5cxxyr8I+FDLScKcPRK1KDRNsoWGDTUh30+2hsQIWOPS1QwQy4OX+fpiUlDQ
	 z7dYVTlIjGpfcszjPCkSWUjQEMOMWg5IlXaqvDjy8XUQ6TbApgQGcbCKqJUNQJrGX+V2Q
	 LVT0ANNPjHNDkYUJQ5NrKv3uULnG9fHn1nNPUJzYA2JKR6WnUIc+p4BRLVduHM4lnU6VV
	 sJsJtia660ln49c/in8/+B9V6/nVUX4pJpdj4G+rU5WOhUylGzidzrxf3pO/KsDxFPtdw
	 Uy6B53l+I0tr18lmWHJRSMqw+EL9z5STK7Kbf2QZkVYPWoCTpSNlAffehKUpynQi/jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PivZWo8R;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96483606A335
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96483606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PivZWo8R
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f03920c477so68113625ad.2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787132; x=1796391932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=PivZWo8Rof7K6W9Vheb0qp0zThUzh9oIVDgxc6i3q6xWx/3NrfyXUY9IA3TQRrg1KS
         87/9gnEPwQJghnt4GOIQu1d/7nHtLh7YyK3tzfpCIGi4kfTjK0xSJhvP3i5MjA9i34K5
         5+9amcagsLV30MUbkjRVZFuaQaWkFGwV7DXBKQt46IDPdNi1ADSQrkTLEJ8yad+fMHSA
         SHxNYXroc3W87etzrXbTif1r5krOcCxjXTn0SOc65Z68yE28tlLl615HRgWjQyEJtXzh
         mfcaRJp5cLzkTZ0Culgxn0PvYL58NGjpyjt/p3lhM3ImtleycWA/Q7jXXRplaRa2jbRj
         CPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787132; x=1796391932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=kS/qw2NhRpBRGUkLe3nsj9JjdHlZojyMWE3EGCJrY55MqGeZ2QMXKHOCUX2Pl3OWQt
         UKKXd9K232fvSO6HrMTqs23K5/mzY+De3Cveffq8VBjdloYrCMl6zduGHkJVjSIpQPAL
         3Gm7O8NHee+zzxQLtBbMTQdEsQcZ5TT5yaMgmcO+i8Os4M2GlKdhg55BYmiw9yXf1riW
         CC0Oi+5zPWbKUFA7LCQkaL8JKS3nWhNofQh4ouIpdx4UO5uUozBBhzvz0VMcuLZi7Qzv
         284DptF3edSNRwyqPdi8p3INEdHaTo4dr1d98GkV4FSfX7eCAr1kjNVj/eyXLsRhYSiD
         p/Rw==
X-Gm-Message-State: APuU4Z9hLhpsaCA1ZXJSNnnpaUgxsJ9TNb5duTcVsdS40vfHLM8PQBaB
	/tjNnjJvtMX8IlvlAcnNXpiqcicd4x22FQ+SdqptHOSxNMf5t5y5+xju
X-Gm-Gg: AZFdTZeIE3FPtyFZmGtrbrZp0oIjH771CXxZzNLPzF1f8/UWnHSH7lxDBAmCIbHDEtb
	czk/4p5sQMJJHX/zVLKlifaZC+1VLaPyYNbSzpFI9U3XgueXPOO2rWQ4UIscyln+bA9p92TTG7r
	Dkci8YaMoK5VFh47AGYJTxfo0BgZ1T1A1Uc5t6XAxgZIYxJn23BLqGu4/qeyPuRAeHFTTq4waQn
	Ji86F6fbLabv6JrgwYv5heTvPVKsJcYD3ovzhskqQuR8KCzUxuW2bQetFtPUA5MdNb6uDPlqpkm
	gxNeCrc187BBPcONjHzDd+k+JZnI0O9K289BGjJhL/XKD6F7IBNNpMgUe25sOiRWARRbyIlNmfs
	+CC0hfZ2MaBV9Qk6vvbvYNl6wpAzX+mOK8hb8Pg0B8dwlEV66t0tt7cQl5LIMpeCjWJ41SsxAoj
	LtPB3cGhHX5dVgxriu9QcievY++NJtcQ/+KD4h8/mixQTD2ytdsvd37r78FmgMsx7P9EAKJyGCK
	2dScEVLKrYc3kwt1OBnWgjSom+L3A8cgDNQUevnYK48QNadeSXxTqt7SLREJvJZclcuK3eoYwa0
	xbtMr85+YqfwBn2ivHvt9q2LxVKwsbuQ47QdcLuA0iAjhQ==
X-Received: by 2002:a17:902:ce0b:b0:2ed:acb:aa96 with SMTP id d9443c01a7336-2f03f11c934mr272576205ad.24.1795787131876;
        Fri, 27 Nov 2026 05:45:31 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:31 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Fri, 27 Nov 2026 20:45:01 +0700
Message-ID: <20261127134507.125513-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2

with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on

MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8.

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
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

