Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025516;
	b=pPJrOnlx4veXeofKL+KBywkp3E5No2j2RuqaDmOMBEwANYHuoegbp3kKlGvBindjZ9l5
	 /+pw3M4eNVIKIltmuP/Sf0iwpvWWKUaek2aPfNCjwGHjJODVqbELNHGBc66FgiSOLKoPq
	 wG6lj5jPGDr8hFnm8eqq7lk9SrjjbHIEB4PAhnOiF6yLnRuWZWtU7cKhvrRMunb0Lj3kQ
	 0jOQpw8Ncccg8AL7tjAAwq9Wzgl+ckz1+KBaFTvjCaBszRlQHvlPxlIcDoHIArbDJ/A1P
	 e+ZErIdnKujPemvYjVzwgifKAa6F/cuWN7aPXNaZ0xAO62cz4Y6975sBJPx0VVhllKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1M86rViJTscv2Hqb6GQf4GI3sO2/N2byXiLqjAgB39k=;
	b=4QyDINklD080jqhEt0iCADg/59s3OThXDXpJmfPZaj78NGWAozhaBbfgpkswOUmoSr4l
	 b+Ho3Pnl+HKOo9hX8lHkJjayl2T7bjM9T2am9YOZf8BC2/zzdAvf+Xk8bUhm8M0AESazD
	 U8iPkCzorNjCsfXhTMkIkmKjhs1Ll4NmEJC0tjboVugKltOOH7+mRTq5pfZxL/LhVDf9V
	 Sr8gg2dKKC+fbLojwjjy73pJhjJEqhxUMvK/X/+kISVlvb3yVblqvpUuP847cwPa2clph
	 Dc98JqzDX1Et9asfgho4ebGH2C5Eijep1KAx4ZVVgRA0rHntCdmb+ZZhlaxgvYzhDxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gbttxd0P;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67421606A31A
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67421606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gbttxd0P
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1376475f8f.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 07:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793025515; x=1793630315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1M86rViJTscv2Hqb6GQf4GI3sO2/N2byXiLqjAgB39k=;
        b=gbttxd0PE7ohK81EuMWEF3BAJ9lsS8RDFMVL0T0QOka24HA+GVQ+BpzQV6EOgcmCTm
         NflAoR45waG96fLmJgdjvqhACzNAfs20EQ/Qnqj9RxjJsE9lBKSfzI4tlNX8XnuZLg7L
         j09iD9HTiY3F7SCIshIcAe4dhqJlYjBup9EJ2maVJD7sOY8XSUOH5AebO51XyhP3K1cr
         DtrSVw+f77Wv+fBwzNZvD/47CeDpGqBn7Cdpeg3LNGPvkcrBmVXOG+5Tsqkq6ELdQDtK
         HkMMbxesQuKMaasI7Wj4v/Jt831d4XGMfvkORp+NLGg2KQB3vYZdiNoSvPnLG3qIVAp3
         N0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025515; x=1793630315;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1M86rViJTscv2Hqb6GQf4GI3sO2/N2byXiLqjAgB39k=;
        b=r4ZAPchGQw1q+6Ud9vKG9Ba7G7EKmv2aBjgD4Seut2ezQlHEyrfr6zdnveVBsWfcEE
         ayZFo9EkiQJ7JD4N62VLo2SmSMb/NRE52820FgVBeV/A6/rPlHaP+lu5uw413fN26aOK
         LhlBTxi9lTq+x/yjtK9nr0FEr0lpRQnRKkoLfvDvBRrmnG8q83Za0iv6fwC3O7chNx8a
         XvN51Dy1uq4kvQHpNnjl3nYTKomHM/IL9e+AbQMD/tKr4sOmr3Fj4hItgyYAg/R9ug1L
         Jo+OrSKLc9eSeCkQAKSmXH3+roaHGZcUfFbmVbMwMe6WVGVAP79TSQVxTkakEE0GXuUy
         N6bA==
X-Forwarded-Encrypted: i=1; AKwUvByKl1Szi93/swwX73g+Xkgue0VAOeu0j82NLqazWa9liONqKiowe/T5f4EwfJM7J6bFNFgJLT8hs5MXcg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjn/gnXFNV8ylZHGhOMC08IniCbBSElVdGJUVqqbUs87993g47
	CeXzK5KBeZ6tRwMy8zHsR5zvRxFYMbVr2fL0y/VldTA2IUGRLJp1U0mjhGTaNv7XQ0o=
X-Gm-Gg: AYBFou2L5shuV7oTfODW8JL4pYh3oe6+qcamxHIX7fHxy94d7UF27dbMPnvbA7rf/xZ
	lkQzmO1yZ65DV19ZoOp59Raak8r6NRJHn92e0dSFsBwnVQfkRqMe7ZW0JyBqUk9H+YM1v9LKBQm
	nj071DN3N2ZgeHiiRRyOXjncn92TVE5rnExfVVdR8K3u6vAM6TS05xQ2APvkxsrqAptTIj0VBxK
	6LLTa7hM6cTFrx0chYDHDhz6NT2QPdsPZVylzy4vf1OKZQUrqxDGzJ+1TUnDOmqY7E2hjB/W3/c
	0jXpZMbwuaRR768m4OdUtuEYf6yyrU/AmXM3p9rams5xVNpCWEHr+fyoMlx5EgeL1Ln32zNsE6k
	uK16XF4Aji/P8FSXRv/FO4P1quTdu7nAhRMFPl8E43B24GBqMdkB1+t71zkhXL3edHrClYMejTK
	L8mjecfiy7EHriMw8Pbjv8pKxJPQK9AM2NO2SjUERbMQN35fJlLJ0cBLKJc2QmVDUtoXYUOYdrv
	Of7wxSl+vuxMofqeiXo8xBWH9Tq0tid2r2AfjJUzjc8cIyrpNmKDyoYEXfrrSTvx4o=
X-Received: by 2002:a05:6000:250d:b0:48c:7143:610c with SMTP id ffacd0b85a97d-48e3eb8bcb6mr13216874f8f.36.1793025514695;
        Mon, 26 Oct 2026 07:38:34 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.151.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm17390775f8f.10.2026.10.26.07.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:38:34 -0700 (PDT)
Message-ID: <bdd89ef0-9cb5-4926-a8ec-92d8a4d78738@linaro.org>
Date: Mon, 26 Oct 2026 14:38:33 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] media: qcom: camss: share VFE clock sources by the
 highest rate
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
 <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-29k2AoJq1+Rv8a3GE8Da1sZ4E9-RUd4ez-EwOajx0RTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/2026 14:35, Loic Poulain wrote:
>> Rate ranges are enabled through the vfe_clock_ranges resource flag, so
>> far only on SM8250.
> Why? I think it would make sense to use it unconditionally.

Yeah, my intention suggesting this wasn't to have it booled off into sm8250.

Also would be grateful if you'd add Suggested-by:
