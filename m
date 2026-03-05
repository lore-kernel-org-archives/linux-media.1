Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A059439526B
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713800; cv=none; b=mzWHF922ASzKr823S3O26uI5U2Vs4ITGmdI5oaJ4iz2d9wm2BlrQa9kSVfxnkIA3cc8ICbN/6rZNZhnzPBIhWNz/n/mjSd7wF6kmEwOzFQpImJA1xxQ6OCDubzORpsMMe4shEZcZBE5AJHWz0okNsDzSgUJm/Atn+eEO1jQlWgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713800; c=relaxed/simple;
	bh=4D2Q39ZrE8YmvazKvKW3aF1/g5Cpv43ee/MaVGKVTBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjHBZpvc041oeFnbeJcbtD7FVgzFw7BTtj2KF9pCH1ZJ1aJQs6q36XdxJhg9OhbcVnKzfULM7aEHjRnA13X4UqKt2YXRcUgQb0atUfZv2kRaH1b1XLtfFb6n4IIdZAW73s0quD5ZvDsaFSEtpwRNH462UWQuK/LykB1D78+IUW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c737d3a51bdso662102a12.3
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 04:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772713799; x=1773318599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrCqdrr01xMGx/SCx6YPhCapPZnumyW3whTx771nk9I=;
        b=bGTCEgsraFC99+Trsz+zEdiHeKvT13LRWLH97QFc0S061lonRmH+J329/ONJ/sH9LL
         b6eee7EuiFOViDWpFsCwzow6bkp6pbAg7ZKpm9LfasoPNxezIIyfpQn5/KRvGSlyheco
         VJQ56y3B6LmABmLHRChXt2NKY1YiaDptos29LQFiErLa7AnwJI0RtYJpud/RXAQ+E47a
         fPKvx7q9eOJ6Aag9wxiA3EdeDd7Elytqvy1k3DTlXleW3JXaQ3APtUM3QKu6PY/pikOi
         5wP+ix1QGH2Xs9XHYV7MNCopbGj5RueiZaIAUdpF/mHVLRfhOcbDJjEoq1KoFwnq9jHZ
         8IyA==
X-Forwarded-Encrypted: i=1; AJvYcCUR+BP5Is/6Cdqkz6iQT3vZOHJm/V8jiTuV3GaCcWsZ94cyWfsZWnk2gu2Y/OsX2wTNQJ5iXUK+sz4JIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK244j6pYcVhbB/3gAIT/GxQCAz24ASz+uIWWdDsA6o9dBarC4
	HzES4O5aCJ8tg5TOQbssW7BESgxWBN7RxE0Qa5/qpmIXE1rUDIG+vh7K
X-Gm-Gg: ATEYQzzBTjlXXcxHVGmWc5S2MxfrJ1Dgm9lWQw3g1gPv6J5SEGiEEe+XErLba19D7/Q
	KRJcm7djfcBQeI733Cuknwu5tKTWfBri4OhK+NoLJW/7g0DlATXSUrlKnUkMgGn2jFSWP/ZEk9e
	u/qHwX+MyEwEi2+2/pGoM8XbVVeWM7Dw78qjWyIhDhecbybzQj4y2ZBZZ1IT0ar741Fs9JpNoN8
	8L0/s8uFeAe2x+EisHaUi31vwjvwEsu3GDyPE4nsWDoqV38MHsw+OeqVChGy7fozxOgZ25SE+2k
	iU8C+Zj5undVWk2tEIPzEfDo8yjdm98ESsBqXjS3HQTPOZxNF9JNlcpv/I2tZSUUFOMAAAiZieZ
	J/4yJDEX6EoOOp965EHzqX5EpA/NRaizsmjX4YuDzoMRX0osN3vzEzj5J4HuH7fmG3ZTFqKp7lK
	nLwfeDTJRMELkeWMT/q9xMYiMlzOdIgEnfODmhnOu1HNKtXbNLkjaoRmKc77am0EjKbVDfdznEP
	mCRN72Z72m6r5rHYyJSDEGU2VkM/5pVUdM/6Z4WCuPHPfxlU2g=
X-Received: by 2002:a17:903:1a43:b0:2ae:4701:3c31 with SMTP id d9443c01a7336-2ae6a9cc1c0mr59976385ad.11.1772713799017;
        Thu, 05 Mar 2026 04:29:59 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa43sm225561035ad.46.2026.03.05.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:29:58 -0800 (PST)
Date: Thu, 5 Mar 2026 21:29:57 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305122957.GA1652563@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305121532.GA1649635@rocinante>

On 26-03-05 21:15:32, Krzysztof Wilczyński wrote:
> Hello,
> 
> > K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> > K:	\bphy_(?:create|remove)_lookup\b
> > K:	\bphy_(?:get|set)?_drvdata\b
> > K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> > K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> > K:	\bphy_(?:init|exit|power_(?:on|off))\b
> > K:	\bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> > K:	\bphy_(?:reset|configure|validate|calibrate)\b
> > K:	\bphy_notify_(?:connect|disconnect|state)\b
> > K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> > K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> 
> What about
> 
>   F:	drivers/*/*phy*
> 
> or something along these lines.

For content match, it could also be:

  K:	phy

I believe this would match everything of interest?  Perhaps there is no
need to have any of these complex regular expressions, would be my way of
thinking here.  Makes it easier to maintain, too.

Just thinking out loud, really...

	Krzysztof
