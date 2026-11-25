Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609960;
	b=HgEgSNe3axRZnkNwL5sshqnRBMCIRn3kCFO652I5GEySAxra5xl3TWwQU1wC4ZSX49Jz
	 BNcdgYj6/clxE/0lSrXQecGCLU5/g8N4meKPfzLanaDB70PYIxmr3hUs07pgSFOcrF/l1
	 r+bAzABvZ9vjWErimKu+kG+RNLnKeEutnxzd+5EMRReb2YTTrYvrGdTZb7RDGS2PkHwDc
	 WARxR3dCNttd0QD85ahtc/99ipnoblEGvOWcDRqs6FcfEx9A+42BYQPXbSKTzV5b+Cqvx
	 o2B9zhZMZmfnu/rJNiiuLWhqYSPpcjfIiP4nQERGbzGiPdIKXB+w0PZfJPlWbQ9XQPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
	b=PCWsxzMpXKsuDDHhTPGV4iv9j0LP1XW53j38ZVr937znktAo44ZvMppO7SQhsC6M6FcG
	 1624F5QYv5vTZa/Gb5+9Hnl4UBUaB/Gd/gk04LleQkk+XsEa5gT5qMa5BKfQDTDqYwaLQ
	 0TaQ6KyzW2SYWYxoHsI+ssbYVRcCzqYzmtPNFQqC7YswaQVqP5f9+F4+UZAgXPF6PAVEn
	 f3k7TiFDeqNq6IPVJLFtebTuWhhVByNEJSU5E+mKzzzkCcvlWzU8BoVy57LOd3MUVmUV8
	 7NGKOUYFBQfat94Ux476vRba+1IoxOV7wZaCOk3JIgmXSCGofIxLaIdqIFvxfXGzv5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjf6U04c;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A75606A333
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A75606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjf6U04c
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso2939120a91.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 04:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609959; x=1796214759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=Jjf6U04cQWZ+NII3vRDrhW3MUWdwXMhKSfRtwwd4R59UmStgmNqb3pePkQ09dJ740D
         TUMwlPxIinVGwhEx8pJ8X+RA/1hyWgQDRpxDjxGw4Sr1zUpME9ezWVIkmfHwzJoOuML1
         FLZE9/m+gFmnXvzsCd3guNsf8vTsYWfT8C4PAPM8HUpa0emGH7QSieVXXqdCwWyPdkXy
         JcGGcvFlDvV31c/4jSf880N+bvOzvW64ZCO4EWUmBf0AmL/fMxzJQTptnZsJf7TESfg4
         tEKX28SXJHswIQCWJl6QTyV0qs22hIrsZdFtQiLj/zpKAGnpu7MlYGSMPWIq9HMLgYFI
         5ABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609959; x=1796214759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=W4ahT8XYT3h8zlpsd/mfHf0Hg+reDfC5apOQQ0uPwT6F6YGbOiiwR+DX3CsqtO10jU
         0a5o5hvHuklzVvx2kZ2rp//aYPZdXo90nxynsMT20aAOKGIz/41x0+CTazKdQG5pA3y/
         JU+MzD1nGfjw5ObIF6CuRv4QIS9AEACHEYru5EoBPq33juui9YrxCtv+rEFQkEf97NtU
         zVNphbl9R7DQ/vTa/DtaCEDB/dJTIE/fwR8wihDJNa9iXYbHpfRENahFpdR+5aFtuerW
         xFwO3hG1zyXU6OKfpOyvgitcfA8/D/eMcUDrq0fUXgfbkVs4VHa9+VWcwGjFxMHjW2qe
         ovPw==
X-Gm-Message-State: APuU4Z+rhY+2U//iyFsMCMnuu+R9q1ES48E/Ur2z6qQJPpDz37YCrDVq
	JWGxFOgWQIvG+nHZaxfQgd5jeHB+3T5UMrB9yit1h9roI7IasgOJG4U7
X-Gm-Gg: AZFdTZdQVUF3d1Kex/ImegdAf/dPXGByTKu9C1LcAE5/M+SybxMA5TcFDHV1lmjp0tN
	ahwkH9JWpti8f9XXkRyxmYb3N3Wq2l2MTVV7+I73+6bpMe01nfJpUmPjznEdLjgNTOoZr4HqO/U
	ywsoO7XoH0N6a4mVMFCoL7eI/8xFnEA9zCkY/KjFI5M8x4O01J4isWDY7B3WhrFwlqhKSoKqwE7
	7x0r8J5lVjfmM4FP/WS3cRSargN5Zcqji62p48WE9ONMr9bwQ10A37G33YReqQhBA1HZ7qXvdlg
	jY8vujCLt3tF8C2jM9kg0XivTEXk2yBZgY3RmpSxarlZCL3AcNL5pkqLObkefBWEOVSWLBv+Tpd
	Au1MBs19eI348vH2h3MYMq8/70wKYSbEu3EYqLgV5MkUW9rRoUZ9zJNTC8BoD+aDN2n7w5BTIeV
	FOElkhGcwRZIuTo5ON2+FppnnzMVyfPvGm6v/uIaSWrokYT3h4dmaJsqzmXMIq4U7GOrHNeVYQa
	dsGRydJaOfhT/wtM8d6gnVAbx2gfsJpx3kBZGmMAA6eG9UPLatuAPOYz/jA7dFaT4nqq4Z1mmlb
	ZdhUivnWupvQhCt5TLr7EIrvkHOLSoy7HGOaAhAMElH+8V8h
X-Received: by 2002:a17:90b:1641:b0:3b4:fcba:8c57 with SMTP id 98e67ed59e1d1-3b4fcba964fmr1130708a91.20.1795609959126;
        Wed, 25 Nov 2026 04:32:39 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:38 -0800 (PST)
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
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Wed, 25 Nov 2026 19:31:40 +0700
Message-ID: <20261125123146.379057-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

