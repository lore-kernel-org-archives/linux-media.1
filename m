Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32823A5438
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792234139; cv=none; b=sBXcnBfr3j0Dp2QfzIA9lUe5zBraiDNkSHU+IpKzawXOJ/7AZrF77qO2w5Vpj7O/rV67Baems+T/Qa2Xet/1g+yDkk6t3GxaxofjVw1UMDlkRI/7xfgZDPDKZ0tmVtcJT6iM9ydy8vnnwz+c1cc9vwhRVwW6wFCy5VxlW/iPhcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792234139; c=relaxed/simple;
	bh=A20xBO7QgEsrNOrczTNQE5uRJSnt+znmLpzvUhIEckI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+AYEQvKg8cEyvjUbObbXhqZLBSk6kQCYKUmDMi+K+uxCr5rNR/tqNrSjXeEkybte85YKfxOHbAMHggzLCV4rpH5soOxivXmTKkusnqCCsClIRvmE6H0+Uku5LP7M2hZ9ZPJgH7SWi9VfQPNXXyFQsR+o1uR4TjdYfDTqr49mzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJsUYk97; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJsUYk97"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso4043475e9.2
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234136; x=1792838936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ceNAXnEsJQILkHO89D/yuhjMt2LxJXSg5m/0dNM+wvE=;
        b=lJsUYk97DqZJ8K/VOGGIolhyxLmRFg0LGhqFDmUsnjynV7QC8picgWfwjfy1oOjXs2
         0OlZNTg3tQXg9nRF/MIdKq4KYThvBW0XQqXkAM1DQNbPYN5JbyOuErPCgvM9rnnIBnX8
         zpwRMV4Nbqj2l3nWrC4A6XsEFUpnIsRztd2ar2xTXc+R++U563LZXl+wA/Wdx3YJjLBt
         X6sBWmvjpMnFL4+1e+wqcbigadKj1FVdaTNjh1P+4oQHBRVg6S6zlaw9xjYSeGBV0Dkq
         l4zIQRrZS+cPOJ5zR+acwpyujp7x22W9TTI2mJfaZeQGM++fThYnOgGggXNGwWpKRddf
         r2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234136; x=1792838936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ceNAXnEsJQILkHO89D/yuhjMt2LxJXSg5m/0dNM+wvE=;
        b=ss6mRCnrNpoQ1JOf/EJmM+RZUVNFGXM3y/4n4w+bCSMHJY12n64nRZ/k9xn94d0QdN
         tGD27h5vs5iT2VfwR5mSe1/80FbAVoUsF4edzSoj93DJ3ivSknmAqIJvApiK3PL5SfbL
         iLI0qMiOHMjrp8Az7UdvceQl6PTXQtvh/6+T4zouZA7iN/PUmfa0tQvlMknUhOrRqKqg
         cKTRHHCutYtUuK4VFFxqZc1+aZri62XaM30Tsq6zPNMYcSTisN2LInL2h/Kj/zb2Px6B
         H6JP/e3z1JP56cXnHXphQ6399ydzWJfGEByAgpNTbLeUfM5sseOzUE2X118HSXtXfueW
         lC+g==
X-Forwarded-Encrypted: i=1; AKwUvBy1K2e6UKTlNuBs3LH6TayIXcH5XbAFyx8y3jx3AWAssVEAtWE8La/SKnfJ0ym/R7dbCiP66VF+WrKfBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI2MlyDpkxAxl8Mvx9Dyo+QIkfMhglR1a4m1Vu7znpEl6MmpDJm
	ugmt3619RlvtTr9+M3adDUMaYU7UzyQdf7EP+fvOGB/F4dU2b43KzkP1
X-Gm-Gg: AYBFou3Judvb92xqCmuYHZAfmOYsYIwpBxsAYcmnBxRqd7J4J4GvVRGmmICuktREeuC
	lEZWABoJniWdse6dbe3WuwTBNC5iOY1MT4UxWXeiDs5XS5pJkbuB6sOAVFsuThAGZ06cH9g1014
	MOEni5tvW1RdhKVubbIHeD/7fgoP7u6gXHmbjhtn+oYyu5ad+kCZIVMlxByhCIZ9tYXCDNaxmIo
	+4JtixvdwMRy/fJL1H1GpS83rULrmKV5lOGPHRuvA31T94ZFl8b/VSle4n8cMSKVf9CpMQ+VnZY
	fq88Ipl/TqgLDR8fsIOvI/5L/8/ujOZLLZZatHbxq1aAAci4hdRsoTy0t+gQ7mSSmU6DY+u32Dg
	3JPzj/yjnxemVfERfGfyN+iw8XQ96xUZuZ8iJZ/+Nj0d2QDcKWWh+meyxpumD1f1tIBdZu+brdQ
	W7HT09BnoCgbGs5ud1NuIOV0JyK8s1UUkb/r4oOQn+Z3NdG8mauTW6Bq7RKr53kd7KbYrC0kcWO
	5rfml9tJ0pjYU3crwnIPI0SfuXQUWYoJ9YoWvtm7SHiW3Gac4A4NQ6waaCEr3yY88AdidhA
X-Received: by 2002:a05:600c:a4e:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4a1d75e39b9mr45674975e9.6.1792234135774;
        Sat, 17 Oct 2026 03:48:55 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4fe9d9sm10039464f8f.40.2026.10.17.03.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:48:55 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gjorgji.rosikopulos@oss.qualcomm.com,
	jigarkumar.zala@oss.qualcomm.com,
	hariram.purushothaman@oss.qualcomm.com,
	akapatra@quicinc.com,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	daniel@quora.org,
	konrad.dybcio@oss.qualcomm.com,
	alex.vinarskis@gmail.com
Subject: Re: [PATCH] media: qcom: camss: configure C-PHY in the new csiphy_stream_on()
Date: Sat, 17 Oct 2026 11:48:53 +0100
Message-ID: <20261017104853.148839-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
References: <20261017040529.3832120-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Anusha,

One units issue showed up while testing this on X1E80100.

camss_get_link_freq(..., cphy=true) returns the V4L2 C-PHY link
frequency. The media documentation defines link frequency as the bus
frequency, explicitly not the symbol rate; its C-PHY pixel-rate formula
also has the factor of two that makes the C-PHY symbol rate twice the
V4L2 link frequency.

For the SP11 IMX681, the exact Windows/QTI sensor mode programs PLL2
for a 2.400 Gsym/s C-PHY rate (19.2 MHz * 375 / 3). The same 68-write
mode programming was also observed live under KD on this machine.
camss_get_link_freq() returns the corresponding 1.200 GHz V4L2 link
frequency.

phy_mipi_cphy_get_default_config_for_hsclk() takes the high-speed symbol
rate, so passing link_freq directly here fills hs_clk_rate with
1.2 Gsym/s rather than 2.4 Gsym/s. I think this wants:

    phy_mipi_cphy_get_default_config_for_hsclk((u64)link_freq * 2,
                                                num_lanes, cphy_cfg);

I instrumented that path on X1E and get link=1200000000 Hz and
symbol=2400000000 sym/s. Capture succeeds with those values.

The qcom provider then needs to keep those units distinct too; I have a
separate comment on that patch.

Thanks,
George
