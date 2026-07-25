Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D355837F326
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017167; cv=pass; b=sEMhoTHrEuMCzdBa1su7HHNG+VIUjuQBlpuzb6TYP6BS8WJ94xXRD87r3MREjVILi3+7kU2wCUjdjuIQNrteO7hwOSkF3L/6MfmH17HTMoQUvSRpUdk1uB6z6r4TntWNbcxqUht+SRMhli2i0WSwWqUaDsYtTTUDgpdN/RIevpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017167; c=relaxed/simple;
	bh=PuJxkWbxxjGwAHNUh1rcqgo6iNIRPAowfqugEAiHDOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1kzN8xICcVcej/xo3cdpmOLryQ24Qg4pYfQf2lreUdJZtdEH4i7Wltv/UHtMTLTFKxmC+Hh/xKZi4AvNnsUCTAlCHbInDqUDTygyxF3o4920xnz6mLUfI0XbwQCS9+A6ACp+a1zuQQC28/derDzPdDS5Xkgi1UzY3CQNj8wiOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=qzwpqnwu; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="qzwpqnwu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf27856f9cso19938785ad.2
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 15:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785017159; cv=none;
        d=google.com; s=arc-20260327;
        b=bI06YUx7L3zDg6C7MLJiXzIXcp1freNP4vK3VGSYAxxccZfaNENw5lI0WQ07vh7doA
         cw4jKrJvWAxdGI4kI4OJr1t+wTyvg6j1AgWhMKFEugjAaXwF+Edhz2zfHMe0SAuIIPKq
         FVPGZ5lDyWKxq9ZKQa1RjllUhQeggYv6bymyXIezUp4DVEuYC6qQ5OZPMSVgfcU5cDcQ
         cNlqJ+2RIhpvnVDZZwvWlDGxqW+bqK4erNf7tH0qi+TgKxl4VKo8bwl6dBKdQaz1iE3t
         5kvHfgHwxxGezpB2vpFvNL5OTgXWZUF4hjNqG6BZn50RglQqUUL041YsX07nnNDY8KoF
         ZiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        fh=I9lVp4oydXmwHD8LGic7lJUmOUv3SiImUpb4NsSYhw8=;
        b=mYOBQpVkMJLUwyink4H3P8CZeO0kpMj25YIu9G44R8qu0jVvEtkfpkT/JHAkLFiFpQ
         D1oIEIgJ/rBGk44slNSIx2aOMUZ4q/jzogL55Aeqwr9tXCGHQCsKVLoWquUW2Ukdxxqh
         ulwAHUF4Pu+ZPA5w7TnKwRGOpoMuuNTsrsB7jUVw3suUatJwRMtX+Yjfyk8mp+fML9Sj
         bhhLNI/AIlblf+6B6vA2V65Q+ktQwswtfINXC8/ykjGgVuo9vZyyiCGNoxqtvZHST4o5
         C+yw/AsM9JUeG4m7aMaWU+BRZkvBcSlmenW/BZ0aPmSSVvTEG7XCALWlLEPpp363rKO9
         R8Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1785017159; x=1785621959; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        b=qzwpqnwu9BV3OhHOqDlLIsbmurMYPVqzAgOy/8gSMts1FKVlMRVz3xH8qRjezm5kCM
         8EL6CfaKxyBoX3wmLyfJVT9t9ov29OOtIYlCal79RNrbkRxslakqdpqkzMXDWb41uvHQ
         FONox5h1KSTnoLoFadk2M+aBCaoUKhVAclqV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785017159; x=1785621959;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        b=g7SMNuRoXn8DlSd8/bCoS36ktM4smPp2cNwgRGS7y9FYz6o2lu3jPaO2SE5m+dJzEO
         o3DcZBasgd0uIGOguXl+fcwx83Rfeuc7pxBurxFUjfnhjxUjC0RMIwSkatHee1k8jH+s
         KHAseIz7B2g9AL8Qez4ROC+BO+ygV/sjUPML0/vZSJa4tNTKOaoD20OodzzPmX+Ucs/e
         TxGhTgAPylF9gcmHLqKkzMr3vbekjWpA7Mbl+P1/SCaa422NvIhiG8XoGr4ylyYWLO5v
         StDVkt2uUnejcID2IEVQbZD9ys3WVJL6fTbGQhQ52xJSII6S3U1YniZhmb7Lwmc1gsI8
         bRSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqc7iA3L5pzjm7wvb1Ng69JssxqHXbmWic0VNB9nJ5lq1DX6zxECQE6hpUPyixzzRVoLxIQRPMEmHqajA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydEe4vAKln7pPJ6vh9wLc8V9TeDH8Y0n1adg/GA3cZylhuyZv3
	7wjThlP2ZsTe6zhu10Pqrlgpx8BKoGUOiC3/tCZU+t7Icbw7bap5D7gvEUM8bZkZbN/6VOWI2nk
	YA4rZmnPU+c0Eo1sKzewNUY+ZijBTW+5cc7P/QF+qkA==
X-Gm-Gg: AR+sD11GSpAHPZ51z47AaYm2brLqmbwgUzMUSoH4Z4EHqVLpg5TeciJBH/Y1Zw7KY7y
	0eYZvaweWw2+zRS4VAHy8PeLEYXbSLzJcFZjySlWMK5hKedKGBWGNc7rsu0crAlBJweR6/zh2L9
	YpJJzlx6GDoPd2l+IJy5JnpFKTDUV9kp7k5smRR2gyLWeJ+F5lf8aHFTG3JoPyNZ3j48Ru5Wpgk
	YLhma82AvxDK050u8FAr2AERcp8y7v+APgzsc/PXTAc5Di6CcMLi/gJ6r5FlH6ZzFwowFuTlJ8t
	aoH4vuI+tA0cPe721DwuCZ4roxSLTlt/NoUszjfcnDAgN7E+kEyU1jFAd/PQcmRhUJPQqkWlQfP
	/J46igxZ7jNKcXUhWSS5BsLJFl05HOdG359WhqrfIvuBZbzJuBvF2P2qO2jFyvc3fHJrM31RYEc
	oNxpebLz52l5SWhR67Ounf5yrSaEWwpdps2WGgBD6JxeJM4FQQaOnkaNkReCnk
X-Received: by 2002:a17:903:22c9:b0:2cc:864b:539 with SMTP id
 d9443c01a7336-2cfde687914mr33554325ad.6.1785017159017; Sat, 25 Jul 2026
 15:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <CAMVG2stKmNxe-mdqbqO4MDLDrJCiNXw9kt8SA8egYAmByf9fKw@mail.gmail.com> <0eca3486-57c9-469f-b846-8c10ec07ffba@kernel.org>
In-Reply-To: <0eca3486-57c9-469f-b846-8c10ec07ffba@kernel.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 26 Jul 2026 06:05:47 +0800
X-Gm-Features: AUfX_myiHAoB9UrW4Ep9Nn6HkjmTDkhFOjfKf8GaUMMaVbSg4cGPO6RekbYQPSY
Message-ID: <CAMVG2suGdLUcA1gCjNq4xi_wq8QJhx3LeLcNqDJpgBUZLZ-2uA@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Add dt-bindings and PHY updates for CAMSS on
 x1e80100 silicon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 25 Jul 2026 at 22:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 25/07/2026 14:47, Daniel J Blueman wrote:
> > On Wed, 8 Jul 2026 at 08:06, Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> wrote:
> >> Changes in v12:
> >> - Updates camss sensor find method to find the sensor in the CSIPHY port. -
> >>   Neil, Vlad, Bryan
> >> - Drops dependency on passing polarities and positions. Moved into CSIPHY
> >>   port as agreed. Neil, Vlad, Bryan
> >> - Omitted mux to CSID as discussed this will be done when splitting CSID
> >>   out as its own individual node. Neil, Bryan
> >> - Updated Reviewed-by: - Loic
> >> - Link to v11: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
> > [...]
> >> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Works for me on 7.2.0-rc4 with 'qcam'.
> >
> > Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
> >
>
> You cannot test bindings and I doubt that you actually tested even the
> driver code without DTS.

This series was tested as a dependent of and together with
https://lore.kernel.org/lkml/20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org/
and other dependents on my X1E setup.

Thanks,
  Dan
-- 
Daniel J Blueman
