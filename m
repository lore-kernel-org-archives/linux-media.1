Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797229;
	b=sazDd3notyq0txo4H7XZAPxFTTlh/7ztvWRYnZp1P5GGxzfwxvlHI4lvjZSnPf3l550t
	 XwquqP7PYWiyAls9RJBzQiWMIj9W5jqrx9bMCW/XNiInv4b3T9KGYt9qWbbqmNFD+pztA
	 tSOnC3+AzNu+FI9eIpt1XFypz9gqDcfl+9KScuP5zy6kR+iinJ9qS3Nk92jNv9v5M2R1d
	 DS78RU3iYkibbZypzq48lLZ3WoZdNzgEbezxUB0oMoya6nLl/BtblOe3mlCHqJk+AnPCL
	 dD9/93tVLx2lmP1DMdDQtUh8EeacFu4bYi0TGuJCkFtzYhdAfzkwa8JDfTyT3AdCU/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IgRJMvkMbufLA4hYRamTMgpsDzcIpVPimViHdBYnCW4=;
	b=PS5TT09HNY9htGRwzHy30W69KgpFuDu7um4RxUVypUNZDiG/T4b4QoYWnaZqAIcX6kMD
	 L0Yv8BWe7v6vilEz1nkQ85ssG0VbhfEocW5BpoK7+cEPenrHzsJg3DL8fO41dve2F5bud
	 cTM+gilxwQ012GVB/0UH/diMrueMXuQzccIxOqGAWCwbzc97mrCazCAG5KnSvDKlRmp/L
	 1DEHHjSqTseUGbY3DwOe9Yka1+XAr/+bMqPxCcS8/5XxKvLHee8ayMl/g6BGkEIPTSGOI
	 FTC0N654taN91HNgi2esxyxy/9C8yQq9XePBUw7+0mvC1EFtisuuPX69ak+Y0f0guNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JWX1OApr;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0275606A326
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 13:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0275606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JWX1OApr
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4716d76fso133169e87.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 05:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793797227; x=1794402027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgRJMvkMbufLA4hYRamTMgpsDzcIpVPimViHdBYnCW4=;
        b=JWX1OAprnVOLO6VQ0sv5Nf4pRSy6czws29BzVZ4JiHbyKdMJrNtr2wPYTJrVOVALZK
         8Mv855CJLze2XCpsopAl1kNQ+6wxyg7NT7hs/xJI2zmXEjs2Fthf4/64iqdlAkjgWUlv
         prGcMjbpWw04L30GGSMCQG35YI30J3p0cSj9gRyd4AybQVKlRsYcjmnDXedM6PKuY16+
         s90Dv1jhSPTtnmsNjJUvBmhxb9DitJc5RXCNk4BXDeeXZ7npou1hpSneqvn7jiSr+dkN
         TupmKTDEQWZ7MgQ0b4RrNh0nRAi2R6BvZYF7cpB5jCn1nJmmAPYmXPyPTEK3xZXHT3fe
         qk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793797227; x=1794402027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgRJMvkMbufLA4hYRamTMgpsDzcIpVPimViHdBYnCW4=;
        b=CUUiB109eX4f+1URlemxZVFCfmHcllFxzv3MEhoWXcKNeXBLHOvQ0NoDHWfJLYtWgK
         nW9f7C8BX/rP+2bxiMwkbWjUBGsichitBcaDiHsilKyAkjY4JjuhEdvREtnC+uCmnLSA
         p1TpnkM5Z2bVjBOKgoPdlrC5yeQuQ4hjs62j0zmN4oJ3HJbdIYBeF5oBgLnGXmOTcTHe
         /8dJj2Ya3KDUK+2AKScUeQxxaowm2W5NKGGbFAz3OKhfeWWptlahuEqq6tdJ65AIrDYB
         iMTPJ0sbz2jmmwcEmfHfe3TYK1aX7iQVBDJKRHeSDJBHKvOhc/qTnaxh0Oos1cSOR1sJ
         KZhw==
X-Forwarded-Encrypted: i=1; AKwUvBwET7P3HiCs08Qfk9SwomWleoNrfAKhuwSq4JeyZ9ywlrFFxeacyICORwhKdCQrOESbx225WJUr1aPXKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9OZXbdQq8Bfj77CJ6J3BOWgPunP7ndc9G+TjTMvZvBtnUSzpMU
	YQIwnurXI7/ujeedt39/90y04cqO8JKiiYyu6JELNougNgRXJ+GyIjzz21eOKZdRvUg=
X-Gm-Gg: AYBFou1TMo9+G7uMxzQtXCoBxLH5g7cueiYr7f+W6AkgzKCCdq+TYsPGuB7myfE2hAY
	doiD0Pr8XhU7Ib+kqoJL0Zj1YWTInA1xK/+MJBlqZ9VVhNBpN+7r+8yPcslAqZSr7s2+OFSHNc4
	p07Qq6DhzU7LbKcy0yeJs/zhqPG7KMHdwgtq4WCbnZwylQp/Mt+rgxfkbdxBeDo/4CFw/jxllWH
	bYEOMgrYU/x4VFCS3xfGHuiEUNYaZ+AgEf6qp6o9u60T6UFkMyFNe1IRcixe6nuZVKW9hwzK7le
	Gk83mrPFGMDEowZ6ofBxfE7dc8lDPS6t5W6arOtgspUsq3/VZjDnchcYHRBL0C8OugEOZpNYUZl
	mOZlnMXU861lo0Uh+3oz2WDSLhkwwtbFJSCNpbKAUU8ZsKs3CxSM3/5aFtq6C4tr6edwbeVfS/H
	rvluIxEXk+E8ce2rLWECgi2EauY5v5kUJItVSm1ngx41ZcX4t7/G9TY71YBMDBcyD0AHUVQcIrS
	QK6VzBeec7Gxac8tR9hSe1ZzcL48NJpVGdZOLBY9Q12sCrBPr0kHyydk4oeTiy5N7Yqeh7KB1OM
	gpP9iFoa71CvXZWv0kv5BrFaUCBhyfZ6jvgaS5uCEUoOZe93TsD7Ar1VWAxX8NCWNe5t1Lk=
X-Received: by 2002:a05:6512:220d:b0:5bf:b8f1:80ce with SMTP id 2adb3069b0e04-5bfd9578721mr5782338e87.5.1793797226857;
        Wed, 04 Nov 2026 05:00:26 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff384c93fsm375948e87.10.2026.11.04.05.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:00:25 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: qcom: camss: Change CSIPHY device name from "csiX" to "csiphyX"
Date: Wed,  4 Nov 2026 15:00:14 +0200
Message-ID: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
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

In the CSI2 PHY mode CSIPHY devices are named as csiX instead of csiphyX,
which is inconsistent with the legacy CSIPHY mode and CSIPHY media entity
names, and it may be confused with CSI decoder names.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f99eea2ef228..dcc005674d8a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 	csiphy->id = res->csiphy.id;
 	csiphy->res = &res->csiphy;
 
-	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
+	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", csiphy->id);
 
 	return 0;
 
-- 
2.53.0

