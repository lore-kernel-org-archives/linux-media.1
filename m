Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB4346E01C
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145191; cv=none; b=uYZlT1SQq9Qx4KF0iTJQ6hsEDcBDSYS2mTT90Q5u3wbl/KgTipBYVfEwI9RxTNLRtER7ruJe4TXyne6Y+soP5m3jgyjV7eN3Jsji6rqWRhOH5X0d3jQRHyf/OE0T1kEaOQ8VsFua1ait0xMD1lLTkmpm+yGCYQSMtK12PAGQ+YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145191; c=relaxed/simple;
	bh=YUMCWRzPD/GCJZY/NypdTrsAkUtkxHAtUWEfKJcLCxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tm0rXnHy25a6epXCW1L2pmShQw5sr6NWzERYvwIcFs5ztl/ir2SgDHfHpRefMtsRw6dsmtTD3j31P/seMkNwyG1y4fSCgDAQc3M8UQkUw8QJu4H9n5uIr+o0YFGeohD3YlmpDlNTcylWnzhMxvzNa/RbdOgvxJzhqJqK6Ur8/a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ny4vxMpH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ny4vxMpH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so53677755e9.2
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145186; x=1792749986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dzo/ODszSYxTk3F2wSXg0f3yesaVb/VOhamsMvYKREc=;
        b=ny4vxMpHQD7R7QEIzgDAWurX5WK3rMV2L1LbgLctLpoDIBJIzFHzyg+urJ2IRc5637
         JTiEY68bPTZcuGgv+4cApOQhmlZZvyGbLsm8yKhcZn+8caPqM6CC8Q3hDk+ovTPPfkTG
         66gClkLyqCh6iGf6M1LnzuRW5tgiILsT4Db9mEACXeIxMNNlBGAzOW6VTSjX6tOOsSjJ
         wDXQFJPh2zqF1MXNQOnD1nTu9sBzxyn5tANO0V1N/yGI3ZCS6s8cfipjAiQX2hmiOgLc
         NzZ8LqKEHMkdCDbmXFlre3HTzmogbIe/h8LglvBakxalI0uxe+3fhZuTJHAYGVnfwaf0
         HeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145186; x=1792749986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dzo/ODszSYxTk3F2wSXg0f3yesaVb/VOhamsMvYKREc=;
        b=tAWOES9GpfmREqmjcaYcxzvwCs/0ztHj95l4xYE7T9ZxRg8trGTRIYoReupfJP/ReT
         qN/fcUgCheTQa8++dSxU5a8dZHSxXUYq47nfbktUo4QV6LBZa0tEGaZo7M9GGxFiatOl
         Rl4BYMpD4nU301ISeDpdVdaPblot5payunm3xcwvA+68reW8lB0awz6WKg15qFJGOBTX
         mwgwKJ94ICCE/2kn/veomziQ/Hulj/Uzbqw22ngTkjOS7xWQoAzy+9qo4qy7j3jt/6Jd
         6SbTPGCK6aT9vQ+lGLR1G+KKTQy6hNsvP3Ac0IMTjwHk7v2NShnWjC+nMFrAOIjp2lIN
         7eNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOi5uSrP28eldWrC7Oeb7+uPH8sL/iZbPnhsV17g+V5C0sdyOJEDaUDGmUzGv6kjVXFQ8+UFdyVB3yCA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL1+jRmIss9zI0z06aFvo+0g6RXQY+JkuGnEsaC6QmcSNcEt5BJ
	DPvqFK11bucmYH5Wgg/brEPAygszE+JYbTlub1kJYq0zi5liVuNXrhzX
X-Gm-Gg: AYBFou1P+IEhVPy1KFzlMgt3eGSgqEETGqLps3jQvmr25nS32/8BHrbyMhbXysa2bz1
	I6Qi6N1hsA/yR6RFSwixJQXMMM34NQmZ+tAVMEeE4fPmSBmClDuRL7JFZT6/ce/YdztpVJ+46D+
	HuXHe+bGASaS7DTSpuXslhY0rB8eA//Gq0zoy05KllikPyKAzgj7DGFYEquaKA7Zobhu4YCjkl9
	TxOczJ1vKeaAx8C2eFeQyWre5sDstsU2MtYXEzAB8K0/ICguBP4e9xYM7td9ZS+EeKH69xVzOpR
	oW/BaXCRzkjfOIcoO9MrgHRlWDQF8I0g0bN2G4/u8t8Sb71zUnQEo8kS32o5YXumsz0J+ZPkema
	6fcS7p70HcgBxx1uoi7MG33O3EW9gkOH9wBjIecVqQ0olaExNBtA9gQMsGrncEVZZ8uAEPKD47s
	etxTI7rOZFeA1SaNxMqQCfVKtk1E805WFPRsh81lwB/cRU8V/xFX1rt/IySOdRLNNpLfm7moDIt
	+yF9Ufj5QKHA5TuDapOlXJ+51WOdpwTKMyuLJ88XlO8y7sZTPtncarqYUnT/KlPOIKw3Wvx
X-Received: by 2002:a05:600c:1d11:b0:4a1:d307:b52a with SMTP id 5b1f17b1804b1-4a1d307b62fmr7356695e9.19.1792145185802;
        Fri, 16 Oct 2026 03:06:25 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm4404889f8f.6.2026.10.16.03.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:06:25 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	tjose@qti.qualcomm.com
Subject: Re: [PATCH RFC 2/4] phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
Date: Fri, 16 Oct 2026 11:06:23 +0100
Message-ID: <20261016100623.427688-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <bd13910e-ddcd-45a5-a7ce-7e6e74290955@oss.qualcomm.com>
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-2-1f3fa9af940a@gmail.com> <bd13910e-ddcd-45a5-a7ce-7e6e74290955@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Nihal,

On 16/10/2026 15:29, Nihal Kumar Gupta wrote:
> Thanks for working on this. I also have local C-PHY enablement patches, so it
> is good to see this being discussed upstream.

Thanks for the review. If your patches cover more SoCs or data rates, I am
happy to fold them in or to rebase on top of them, whichever is easier for
you. I can test anything on the Surface Pro 11 (X1E80100, IMX681 on
CSIPHY2, one trio).

> Could we add blank lines between the repeated per-trio register blocks here?

Yes, will do in v2.

>> +	{.reg_addr = 0x1000, .reg_data = 0x0e, .delay_us = 3048,
> Any specific reason for this much delay?

It is copied from the downstream reset exit entry,
{0x1000, 0x0E, 0xBE8, CSIPHY_3PH_REGS}, and I have not tried anything
shorter. If you know the real requirement I will use it. Either way, a
delay this long should be a sleep rather than udelay(), which v2 will fix.

> For this C-PHY table, I do not see a CSIPHY_SETTLE_CNT_LOWER_BYTE entry.
> Is the settle timing already encoded in one of the fixed register values in
> lane_regs_x1e80100_cphy[]?

Yes: 0x020c/0x0208 per trio (0x060c/0x0608, 0x0a0c/0x0a08 for the other
two) are the settle count low and high bytes. Downstream marks them
CSIPHY_SETTLE_CNT_LOWER_BYTE/HIGHER_BYTE and overwrites them with the
count derived from the sensor settle time. The RFC writes the table's
default, 0x22/0x00, as fixed values. That works for the IMX681 at
2.4 Gsym/s, but you are right that it is rate dependent. In v2 these
entries will use the settle count parameter types and the count will be
computed from the symbol rate, as for D-PHY.

> Could we avoid carrying a separate parsed `bus_type` and derive the PHY type
> from the PHY layer state instead?

Agreed. The bus type is still needed at parse time for the lane count and
polarity checks, but the runtime paths will use phy_mode.

> The C-PHY and D-PHY lane-mask calculation could be combined into a helper to
> avoid open-coding the C-PHY path separately.

Thanks, I will take your helper. Together with Bryan's request, this also
removes the goto.

> This gives us a single C-PHY register sequence for the SoC. Do we expect this
> to be enough long term?

Not long term, no. I only have one C-PHY sensor running at one rate, so I
would prefer to keep v2 to the single table with the settle count fixed,
and add selection by symbol rate as a follow-up, unless Bryan would rather
have the structure in place now.

Thanks,
George
