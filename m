Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447683;
	b=01sVsCK3E4XykBZtAHryFAWtQOMNluLK1x8ZbSNoW1N0iczR3XICeb8jdHt16pTOlhV3
	 rj5p3vxErWj59x7RLkxhSUXXQdfxYej0DZ8xXCJ5rPkRA6JiwSnTxDPqQsdwX/PVWyq0u
	 adHJNQbNygjiHij6lbIHHVBhK4joMhrtIR6qrpXdjEPLtQBI1KEMBww2gjcRt3PNeOrha
	 kDz0EAVboQW6S7C0+lZeDUyWc/jKG5PuyhFNRaFCmB2QArx37IukrC152+XU7TuY4TAyM
	 P9OaeUzOPp1tjp1iPOmIMLmAgBkxOebWpuUEWpebi37ZU+xN6Pqf+HvKtMxQloIfADg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
	b=4Dm5AhEiyNIN8fq1QKICvW4b6BFmUYuSk2HyZ8GJSlZAx2ck0lTz/11KjV3Jem4/LpNI
	 mkpjjXAGPlEeqZMAi3QgHXhBKcw6nzaOXfcARHXLD6amvRCKwNA3S1DcOlm72EnNHDgLz
	 X9x0I8NrTD3h6QuOTOPtdI09yrD1+CCY4ODzkQaXe8WLdJrEKmb3K392ixB1CDujHN75R
	 Mp441LtSiTPwLJ5p5biSJWD3XKf6qZLEjOU/10DNj+BwxbLzRnGCDswkA3cdRozsHEjcW
	 THiJ07MJtULkOwCH6DzBuVZXfU3Qoxx6qHw4byDp52YrFuQUcHA/FiFV10tOnL1mC+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tM7/Lb4o";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1CC606A335
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC1CC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tM7/Lb4o
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so10247100eec.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447682; x=1796052482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
        b=tM7/Lb4ohN1rjBmrP/p4jsqauMxS8DlnR9uOt5WOXDONuj9gtBL24ThKjhYyUJ1osr
         DzqANDmyaqyQRIj9/WtIAT/2YNLsDbukMTF8CsLrlVLEEj1u79LxziKXkIVO0kuI3yvd
         ilvhELHyvShgLq2T3GfJ2xb3ebiLdSzv8fG/1WUouEulxQ2bjODdAQn++ALn6A5oRrdP
         gp7+Nu5zsnypVzDnLckDqxN6joBc14yqFTXBNPePxokmg2P15CstxQ+L4Hii3L+lJDFp
         UW9V1QtAegU0c2Ex964UbGyqVPZzoLvvZqPc/2zQWmZhYNNwMxGusYtW/O0GQnjuA8yN
         3YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447682; x=1796052482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1EzffyQMBPdxbIZVJGcUzqBXPK2cayxcVlx4GrPO7w=;
        b=wdcHSgfQ3hw+K1albD1UxWFop7FhJpHUckVuiBT6P6DzGmnBHDaOvweRcZxFhdMCBc
         KvkrqBzr4lwZfpLZaoT45wa7VVPUz4AEvC4pLMrr2uS+KI8JANYoouFnC54KoQ8ibVVn
         GUJINnySOwG9TjAOnMrt6O1l0LWvgR+wKtsEbEsWrkPNOdwfOoK6jDW7Snaqmtdcdoec
         OKL3eIKqILVzRuNreQS8VNfGepZ+Fg1ovWQ3nMy/ZaiN1EnEPZDVoxw1m1V38qXhu2vB
         r1HU42Ek+5Q2V8uFlY+0jMGMUtjp+E+d++hDGKSocR0/6ndSMtiMnk+jvuC1Btaiv5N7
         RNIA==
X-Forwarded-Encrypted: i=1; AL+hErFx6pgFn+/oSI9Bcn3KCn+2shH9qOgOGGBy0kfmkUdIHFQN0moNZXwT33RG4aSIJDv+VT3PaAKPKvqauQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+thfazHjKAjFar3MpiRSSRuamKAqA2hPvoaucQSPUozHlrLq9o
	FnHPi7QIFhKN1QlGgsZn0ks9sI0lH3x4T38ugPm3NfQBdZv873JkGy+I
X-Gm-Gg: AZFdTZeu4oP7GtY9F1VhW2Jjd7CpnvqG0Pb6fTMq8iQ4HABaRS2X3yBwBWbJArTCl8Z
	gCN9pAaRqBWq2xm1gOZ+CfUdp9zRKQYDGrJLZQCxw0H7xKCtz2Z8ds+a/fCpUf+XwCY0+UQhzL4
	EAfiw1QgsW3uITXbAOKZeyR0ciNbGvdb0+1BQqjYULsLCc/fAgY90UJIn4prF6KGYbjZp/4VSmC
	TLIqw5IT3ELAfDho8mns4vzOjECVItpFIbCBgYFkA0IJnAGdckixsLehAg9Ta8cE0FGJgfvTRtC
	62RednkcgKdnXXYb9aDCq3ec+a6lvGV3YOSUzVtoCB4wHtIrs0bhJ/AAc+m0espCvF7PEDToJLi
	UToAzQ1uYPLvD4yhPnPI8OaC6r7Ev14hXnK8aRp1RcwgpLjegsz5PpNt2x+XskWP8erO6ZAFx03
	WyxIDPwtFe19oGOP9w7UOXVn7R8cdInZlVsgDxOvblbSSgakP0n3Wb5/d581csr4nRmR+3AIvQl
	1nLAJ8CPzFvF+/DTx5Cx5plOht95d40wnbjGlfQBheskQda5/cVCj4xCosU7h1NYHtuViHYaE3+
	6vEVd3MIFuI/fXYjwEJT8EtlNa4NAq8AKCpFaqAtCEGVOQ==
X-Received: by 2002:a05:693c:8801:10b0:386:b070:6f2b with SMTP id 5a478bee46e88-386b0707075mr3467857eec.36.1795447681882;
        Mon, 23 Nov 2026 07:28:01 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:00 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 22:27:16 +0700
Message-ID: <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on MSM8953 platforms such as Xiaomi Mi A1 (tissot).

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

