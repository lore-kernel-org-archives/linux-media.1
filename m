Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56FC72627
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784984608; cv=pass; b=HlLN09PTXmI5MeS1iJIuJ4q5FBsbJeERQEcVMnM3Qd9PBcwvmfmC9sbW7xpq/Kh24lr9NcKnNdN48as0oLZ+083LIPjEdiqrs/TZSGxXAFAxVeRINH0WuX7Ip3AuIAh9WzAMkS+VRgjLEKcNKKu9xQQC4z8HXYlR2FRHaQ2gDOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784984608; c=relaxed/simple;
	bh=dbu6UYmI3kvfiQA2rZZsMgSOUK8VMN5tArWIhMkxvRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoGs96Q8jnYvG+ThH4w932QwbnZADQbudMRbHgywFpmKNQqEv3tjfn+2p3en+vOTB3Uux+IVDGzVk2udsHdP1TQZwcHO6ajqW8h28jaj1yH+vpa/eQGOo75tohItfDwimhAnEvHdJGui288+yZveCJ7+MBFopoZz5W6uAGVDf7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=KRpMXh7t; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="KRpMXh7t"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1249203a91.1
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 06:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784984606; cv=none;
        d=google.com; s=arc-20260327;
        b=o3BoAFltgoG/fZJ6HyORVRdeWtEKePap5QPL1jrh/OwOQ6KlTtEGnCsoNQULSjoUCi
         lJn6j+Pg8J7DQDrAP5HIb3CZk+kcNZhjCy6AZSBBqgZji8ATkIS7ESlWfsVqPFHus5b0
         l+Bpwv1oQLROnTy7ZfxoRYQcwyrZjKSQT9LCnWmSmQS4LZc9RWLJ2qLOF0j+tw74ptsp
         4jXT1az87lgDYXAvg8ENjJ6NQJOzsoIUJrv2h/S0LC6buo7p+msKuIYJVhoX/yvZnAwF
         VSucKdL4MPJ7qlJbfYLuEPB5HL9isvWZD4YPBKtTVEWxdZl7wXNAu2aeO9F/4yPgBx3N
         m+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6s4tv0lqxlKjKfIg1m/4hOF+FjqSFcDxkpdQkfgs7fs=;
        fh=fzIJvFyGRFIn8PtFV8FqDQZCK8YCXxix/0Mj8oOZvnk=;
        b=Oa5Qd08prKtc7+rK1XoE9qmUQMswPsEvf8z7qBxK7ejMuzg8VUEzQJvlSFM+0HW3C7
         fKp0Meaj+7oTiWMD0K/aWstxFOwdCKUvujDwi9QuCtSGVEqvZ+xbOzHawvaEsKH6lFWC
         Viie6FPt9YWJqCyRTDpiA4DLqbrVZolKFS/OSB0E+hQqzNihePunlgoLtI1jq2evy0YC
         c+W8UnLXX8sZpe3b4QlZ/wkqnN5mA1i/diP3oV5GzeqBYGfE/p6/D2I+TZN2BXpKcHNA
         lhHeZEh1ueQywDBS9dPQsjBezV9aLr4mnNZAkr94fKARcP5Rxjw4zRjZ4frcIWd4Mg6c
         SgXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1784984606; x=1785589406; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6s4tv0lqxlKjKfIg1m/4hOF+FjqSFcDxkpdQkfgs7fs=;
        b=KRpMXh7th20yizvygWpJlFeu3UDDGc5ldEanRGSYzpNTV3yhIEZiVZE7AuGdmu6h7F
         M0/xZfNof1X81amviqBdzQ1htRxPIuqNIb+O/jWGWR7bajvPd20280O/Ca2AWREVkyEf
         0VDX9WbwROTNDwsSKj6258ih837ILc7vm6rOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784984606; x=1785589406;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6s4tv0lqxlKjKfIg1m/4hOF+FjqSFcDxkpdQkfgs7fs=;
        b=e3r4E6R46WTfhvQlxArAlG9nbQ9CbSp7bl2Q3e4HyKB9EYQ6niQLjDxIPlr4ZL9Xvy
         o4Qe8O2C9++e9rskptPyaEarYgbkjuWSxsGIdidMY8f1MCNmV64HdBZPq56Z/dZ5s//6
         G4RZnhb4rY+am+kj0XOqnQhPXlg92tOE04S90bVucHuM5IeeEKQXZjJiLi7Syfqq19YG
         W+dRVMorydcJ8hTASa34smOBlVhZnUHA7P4NV0Y9hXfZEU5rN1BsuY64kPidFH+vYMrS
         T9ScYmO96SIeTEj0txT3qiYXq8i9K988MeNaJVIAaeVUJDWeclEphGlZW8IT0pqB9AEj
         4OzA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4nfZ7Lj48ctCb3Ro/N7h1+hN+l8rDbt8ywKoOClGu0jOKg9gQhi0AXeaAsr6bpYWoRb4eZpFPgt08wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ41WA1FU91lppcxT413fJf9NisQFF4941jRxtS4yCqP3JVwLc
	X48J6WChtEOU09MSa0uElguDMXYzJUBeFHtwes9VfV7QqcvH934+i+vzJ6dCKXkDupXomeHbHVe
	VoEmiD1I40SZLfWEp7PNbSg8x/yeWU2P0tGoGAIauLZdLurbOJrhBS0MbKw==
X-Gm-Gg: AR+sD13avhxh8O2QvcAP+Ym611n9d90Z2c00cEbOsfPNvICCA5kBu4c3st+QNkRPy7j
	EfhbsZbrk0BaprfP71ELez2WOHZM8IIjjE5xstP3o3gguolUfKMDh0Dagpi17Oyycjk0WGdU6Sx
	VTbncD5IZP5DgldwDnFwioYm37oTWdazCVjzQRI0/i3fv7kFspIlcPdrJYJUeiPdVbjDZJGM7sB
	lD54sPBZMVYNyewgRXezqL1xe/63o6o2vYN3VpVJsqNZ3D9qKIj91ldqdLx21lJKQiXdKb/J1Bn
	eMxiIuTgCicoVnsiCLmCkS+tr5US2JZAdUQL8bQ2x/eXVDCs6S2NfnrBjPwFEjOOuHRbWtA6jFF
	VxJovgB2LHTirs/pcEHfRNZsByTbqb1DuvPbWW7b1K39JerZz/zT0YsPmnQ93RW1uvlr3RERA6M
	YpGDVr8172syyQxXimzzn0JNtg1aWaBVdG/+bVYAQt/vPsxK8OSg1H4ti9AKm5Tx6A1KpVPg==
X-Received: by 2002:a17:90b:224e:b0:38e:c232:9d2c with SMTP id
 98e67ed59e1d1-38f2a90f031mr1691512a91.2.1784984606019; Sat, 25 Jul 2026
 06:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
In-Reply-To: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sat, 25 Jul 2026 21:03:14 +0800
X-Gm-Features: AUfX_mz8NhtAru7ACt0Z-tRBKmj_hK1Y1jnq_iZl2mP2Qxsq6jEVKI3kIp6vQW0
Message-ID: <CAMVG2ssrwmWVApoYBKeWt=th1Pq7tj-t1jxCndsyZCmubS7cHg@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 07:39, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Vinod, Kishon what do you need to take this for 7.2 ?
>
> Key advantages of implementing this logic as drivers/phy:
>
>   a) Per-PHY power rails become declarable and enforceable on a per-PHY
>      basis.
>   b) With future adaptations of CAMSS routing the PHY output to something
>      other than the CSI Decoders becomes possible.
>   c) Standard framework contract. phy_configure(mipi_dphy opts) / power_on / of_xlate.
>   d) Introduction of CPHY in this driver will elaborate CPHY for Linux in
>      general as there is currently no mipi_cphy_opts structure.
[...]
> This driver is tested and working on x1e/Hamoa and has been tested as not
> breaking sc8280xp/Makena and sm8250/Kona.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Superb work Bryan! This works for me on 7.2.0-rc4 with 'qcam'. I
support integrating this dependency for 7.2-rc to reduce complexity
later.

Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100

Dan
-- 
Daniel J Blueman
