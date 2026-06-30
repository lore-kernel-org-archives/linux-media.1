Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806AB40D56E
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 00:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782779172; cv=none; b=i+esMsRnWtIXqVxiQ0mGVoLJwKt1MqQNYKg61sO9WH7sIrDn3O/HhC1EfviaJn6CVN9JAx4VhsvlIwodz8axuT3CtaYfagHZijdz8FS0qLfVPffXnLTPWabd6GW0r8ECxPmW0XUuAdxTAplGJC6PVJn4yGAvoHqLOY2X1RaE+ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782779172; c=relaxed/simple;
	bh=Wk+a9pcvM19EvRBYMhdO3ko2i6Yv5kLFb6ARfExIN+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uw677tjypTIhF7NlvThO0rciEpjrDZ4/qaWIPGoa9f4WO1NdxC3gZu7g/HHgl9MCjqQQai/k5CCH7HIi0kFaPZdmGElfyMTWLw6VvcnDPW+TPqVoFj7kiubQ+uNlIOe2GIawv3OqhegXZx5cXhZs19P/PayNwjrE1maqjc8pQtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y48b1OZl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y48b1OZl"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b20882a71so170051fa.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 17:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782779169; x=1783383969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y0oAFgkw9SE+FBo2E3HP2A2RxRZQl+adWkFDLjCm+5U=;
        b=Y48b1OZlLnl6E0B7DrHaghmlcPSJTcJ3PZDrd6QHY1wA++39GvvjJZuvHW45q3LviV
         OwCEVbHVEABo1N7eSwZFyH9dBEb9ao+nBRfzkZ8y8A9RHfFWW+7D2k2BylqceJSlisj5
         QYsZe9zMVDS+uFhTvDB2lfpD/BDDbBdsKw+IVHEFhUVgW6qFTGqAZI/i0EPepfCa/ivk
         kKdPNqKA58c2mnTjGoaWQIPhehIRJXeKLM5YwFRB8ukx0KLg0Ryv+BEhi9wh6rkDPTOg
         vbcM5IHZvG0iD2+nfXkD3QLBwOvPziBfiDI1vXEEsQcN0YT8t7lf0rO++25Ez1B1AQJD
         6Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782779169; x=1783383969;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0oAFgkw9SE+FBo2E3HP2A2RxRZQl+adWkFDLjCm+5U=;
        b=ijNKcL8ub8I/lyddauYGknGYeoCwtijlmn/uqkoO1fIY7jmRD7IC3QxAzklBOnSrZ7
         1e5dT7D6rVo+fJg0LrlKANX8Un8Hq9onYEZYqMDl6bSqYUhvoKrIeJSn7XznRY3KR/Pw
         xv6LwBNMeIJ7/HBi0DSsvty8TnmvtdkJpnpy93HIfQSSjG+ADPCoBhv3ihAFMAYAGles
         fAfacI0PDrX9DVGre9ElFuLImjP+ahmljnuvcZ7jqpZPQNVJGKfHyfGA+vA0Qlw+a3Fg
         m3rxq6TVrwKFdtnW4P9+y6kPbmG5tHipi3Zbda6M4k18uxP3/Ew2mfVfeDmrrVRalL4H
         2qww==
X-Forwarded-Encrypted: i=1; AHgh+RrNQBlyEe1kiIplq+ERvNJ/EZrhMvB74+Fgmye/lqPEXBH+bKkuDaQaess5MmOhYeMn3TTXF5wKcRIu1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIx0b3cRqleROrBAmOYXzlahpC6MEmkDKCo4YlQ3WhGntWOBy1
	YoaR3GWh2LIl5roXeed+L3QoCGfuIXzlQ2Pfj+o9rn+WZ32U0iVTUNMeNbYtm+Bi9X3/p+07iek
	rtSuXUAw=
X-Gm-Gg: AfdE7cmDA4QYtNQpfKpzIl0CKV3wTTy6P1MUKTmL6GDVh8onmhFpHtWjr8/WUExN/Rr
	JkWT6z7l369cGzR52LkFCUSgUkk3mj7VJ8Vo/CdAg9W99sjqSsACKhlIJ+AboTuEmC2vBupFG2x
	dwDtLu1MeE58HUwE8pD5E1pVHMz7W0F0qh2mia8Q0FSgz+BOpEQPWx2BGzybhvc3XG7lOwCH1MF
	jOtzkXfJBup18dfukd5+Cb3RsCMVb4WEg9TcpcjA/9F/APPJcdNkm4DLlejg/FtMqxGnAYdCG66
	oZ/RSDasc+l3RTSEDNQ4L3dUUIU+hdUQw5Q43CsAcIVu4u/7yxG8aEmsLNwRz5MZ7vmj/Qa+fcM
	BTB3QrEdgca+tKji/uUe8xaaC5QihH7nXdM2BfDRClIAErqDJVaD1TW6s/RVIpol5OYRYL2BP4V
	vppAe8NeDAkmfDJ6j69FWbaDAYHKkW+mmDKwoYFRCDqCk4ArVDvT5VAzsNy//fOE47zvg=
X-Received: by 2002:a05:651c:906:b0:393:9d8c:73d2 with SMTP id 38308e7fff4ca-39b1e004454mr1641271fa.7.1782779168740;
        Mon, 29 Jun 2026 17:26:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1da1d279sm1997631fa.21.2026.06.29.17.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 17:26:08 -0700 (PDT)
Message-ID: <d079ecfa-cb0c-41d1-a6a5-620d67e365d1@linaro.org>
Date: Tue, 30 Jun 2026 03:26:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: qcom: camss: Add Frank Li as reviewer
To: Frank.Li@oss.nxp.com, bod@kernel.org, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org,
 laurent.pinchart@ideasonboard.com
Cc: Frank Li <Frank.Li@nxp.com>
References: <20260629214618.2523099-1-Frank.Li@oss.nxp.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260629214618.2523099-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/26 00:46, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> During the 2026 Media Summit in Nice, a discussion highlighted the lack of
> cross-reviewing between maintainers and contributors from different
> subsystems. Laurent suggested encouraging collaboration between the NXP
> and Qualcomm media communities through cross-reviewing.
> 

That's a very nice idea! To reciprocate I may find free time to review
changes in NXP media drivers.

> Add Frank Li as a reviewer for the Qualcomm CAMSS driver to foster broader
> review coverage and knowledge sharing across platforms.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
