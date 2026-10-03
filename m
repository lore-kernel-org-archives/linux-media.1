Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B904344D91
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018554; cv=none; b=i2f91ydf5ZsH50Sn+/3NCa16N9Lt9HOmF/Ggujmaroekln8hk4w01qOSX+CaQOS0mYJ7BF9YP2tJXtlkj8AS8rTPpCrVwontUwYovc7/moGmKwOcrioFYxvb6CnA1U32ULsS4LCHTpt/GlUx1YerUfmHn/lcVAjk+/gk+FKGWC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018554; c=relaxed/simple;
	bh=kYIfDI3QBE3ClSciA+/48Hptd209qBRxGk3JWEtzUGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ga4ZKzR6WgYkvNhg++ulavE6XHNVPLVb2BscEm1yPyIzoOIKPOYnOSybsa63lj3rU/YJzCjnJun8vsewxbgbwz2KMV3VhP1NryiOXDXp0CyLCFWkID0C2DeBIb5gCHmkqJTVNQxVCpRp3QZn+1pnhAbpl+ChsglTuE7lcoF/pjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DIS+y5K7; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DIS+y5K7"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2a25dfbf5fso79013966b.1
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791018551; x=1791623351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aD42U9G+t3AA3eGszJykKagIq3I33nrg5HXNEK2wHFE=;
        b=DIS+y5K7aJB/YHs2o2NskzaCYs/OLfQL6i2dF72DW5eMpR2rcWe6kJaoo1n0zmFIUw
         NvIJo5m0f0L1fJ1V+2EysiRQ59m79UF3hrKQZ6bbpP0phZDu6nRIbB8++P1KGP6Lu624
         Kagj4dVL6rSoRK4BWlaw4yRIfckJVQQE4Zb6lYdPD0/x7yct57ap9fGuJYp8+fxM3PUZ
         8ZjscNDf8lOSgYVQozQTzzBzcQBg//fjT4/gSVwy8m2M70xm/LWUSoC1eRqiuyM0+Q/S
         2whApDjisXCfawzqInsvCzyRTtw3Zlpjm1VYtzwGq1rgmr9PYFZ2YSq1IXPXzsXRA6lE
         wWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018551; x=1791623351;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aD42U9G+t3AA3eGszJykKagIq3I33nrg5HXNEK2wHFE=;
        b=DGHfSkQozd6ZlRMDcT+g0PhBIN6VMJSbEMyTWh4pUQdpnrtLorrorEq5ixPbULsVVS
         GqstQFcrjbc6fL7QMLvtJPB7qxyMFDUEf1ltC/ieDQ4geGhQGELOcCgezW2mghsz+wq3
         QkT43y9yq3K2fDR+LZ7rlzpWiLbxWIRVPE6TA+bct0RVQWCsc6CMRkPLOOho+k4dgsM2
         bHDnasmnZ94uq366Vy1QQLfXe81ze1nAwiG1DjfKeQ2ECMD82Jo5sSjx44kMWmnhdnPI
         J84ipfqpPJ0ds43Mem0FmAilkzQyQ389ZJEUS6h6AAstvRdOWPusM2EE14QdKz5s+Rtn
         inig==
X-Forwarded-Encrypted: i=1; AKwUvBwQECkFxJEEkenN4tg6XCBPQS+O9HajdzpXRya1t6erDs9zIyP8/p3Dh8FuKPAR7hwD2eiLdypNG14Zkw==@vger.kernel.org
X-Gm-Message-State: AFuF++mI/q80SufDlsjAkunplzQFrUS0ttfNR953ZkS/ueFIno0HPhXw
	13OtA4h8Gdn+eZU/Qh0Hklcysu7D0Z3fmWi7XLu83toqfXWmCuUgTbYvU86GUVHBeiI=
X-Gm-Gg: AYBFou2ezwFC2AsZzdSMdpYFSORZHJwNEOxvOkax/Vx9WS7e9/pMoVpJYnrNg6mNUx9
	gk189rP8/0AqalbAV5oSZIXtOMMOqhEA2+mygK6kYL/dC/IyjphmjC5lH5dpIlPOcW/L7HaIdUS
	dLPi5U/t7dlbHk5D7cjq+4Mzxq0LwMGGux9spEBi+d43WJFrU23iQU+b1m45hn3bXPWOaUSNt4/
	0wfDyIIclaKwQ4Bz4MvoMev2Ly2xHsqQgWKwHe/4tj4J3eMpecRLi4Z4mT3csaQv9q0WioXXzkK
	vOLyURkjOm3V9xopGIepCAHj/3IdsUP2UKOGY2TP9S9hepiOcjWcNOgRuwwWUulE0SZe/vq0+ZW
	lUApySj0q0DBNqRklufG5BwnKraU8ClzgdteF2J/F5ZKUCsn6NOC17L2Ra2QBHbFXTa5idK/p3a
	Ttc/UXIqAjiZEJppWIYr38Cl9qGdyeouqEaFGpYrxudRInQSD+BXQBvEkMDn/k1B3+74OXGxk+t
	N18k7R5EjJm
X-Received: by 2002:a17:907:e155:b0:c2e:4d39:b5a1 with SMTP id a640c23a62f3a-c2e6ece5605mr88982166b.17.1791018551275;
        Sat, 03 Oct 2026 02:09:11 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd05446sm174814366b.19.2026.10.03.02.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 02:09:10 -0700 (PDT)
Message-ID: <fbc988c9-d701-4479-96d0-f18d92063f31@linaro.org>
Date: Sat, 3 Oct 2026 10:09:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-5-87ba4ebe0db1@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261003-kaanapali-camss-v18-5-87ba4ebe0db1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2026 10:02, Hangxiang Ma wrote:
> +			.hw_ops = &csiphy_ops_3ph_1_0,

There's no reason to continue to use the internal CSIPHY hack.

---
bod
