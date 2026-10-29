Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266664;
	b=aYbQt0f8afGYcs//CcFgnFoQsKtWOYfpj0m8gsy2lnEX/qXt458ohCdZ/0lo8GkiA2Ek
	 B/oY/N3wKEn/HLmuJ8Zpgx1qZfVX6w4IwhAzOtXy4JqhiwFnjdh9Jt6IotXtpJjQ6GTKL
	 mbATvM49oXzabM5tAvH61GrAlFusGChu5W3eNR/Yz8DbJ2iluO7i2Oe0Srkqz9M2IncpH
	 OIyfmK0jSKWXIZ1UWtoe8G5rrVUXY0RhMYVQQVUUMDnxxAMRWKxsbpz9qCFegs3qKqGWo
	 VKYGvWDVwrA2tn2r+ar1ewF0fOlwR0AiSViU+GqYJh+w7KlmdpKWNDN0JrwauGlfKNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
	b=HiDIfRiyloNsB+cSPFTVISufiBARgMx0iklRTjV5hziy8pjoPVXkfuBqqQW/rVewazKM
	 OrGmIxjiVH2kL0eWa3lk8EvnwXILCJg964hSVe2j52SfJCFm418yQiS2e5+VkwvgTedL4
	 gJ/pH4dtkoILyGOGUPreGnEo2/8lAOchBg8FPwUhSl6XgwE74SHTUD8TEjDVpRPMi8MHd
	 WRW1pzo1uT236ikdBt9PlTZid5+nXylulLiod4ofrGXVByRuxlqPg6mYPuWn3/9SgxsBQ
	 3gRQ1TeiWRGZeeIYBJrpWVq5bC8UgmBdLY8r7sJaHtvRZ4F/x0PBKHEt4ky1+pQia+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tvlfi9kk;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F3606A320
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 249F3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tvlfi9kk
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so16894305e9.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793266662; x=1793871462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
        b=Tvlfi9kkVZdSPhIzlLydhHuDpvCbtkpigMXcPJSx/VgUJ3csemwFPH3EtWdV6Etp+P
         NbA66dOQOQlfNFxvQLgA9rBK2HoBeYyqhpjO0SbDlVPDOrALYrUSrno76UJXo9pW1MtN
         GXMHERCWzFSHDCvPpVUfyp11hY5p9q9zI8gWDawSaayo1Q6ztGlGglgWXUN6gbuF2xa4
         Bfh8q3hoAvJ8jPs7HKaplnHqDmF5d+EdmhP0mzlcJdQ+/ddbPkZoNoxdb28lC7EeIBoU
         /xjeUhZnu9Sq8QYLDi9HwKGYgp7EqJfa8ogCGSD01XRIv1RxASB9WH2WSeJht6btVfxT
         TPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266662; x=1793871462;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
        b=El33b4UMQPU7xRB//2S4HxiIkz0Fsxd5GqDNwIxXhb4uUMVTAdI+uL6kdkS7cEvcPn
         o0kQ8a87jS1J31kZBWVrpeS7ENrSCXO/k3PH/HE2qFb1+GZ6+NaIez9aW0EaWiykHfFY
         /9PSQkThx7VIpBTRGe6yFocZKo1uTe5jgse3DtWJ9V5U5tlLTiSN0o+S74JW+KkxcAuZ
         5dIq5S9FS/oxxtUnnzK4VhJWrYfX+F276lflIp6CC7OPHSNTuVjk4faGDVABdWaLVXZh
         FumASrKCriAg+72P7x2NuXlw3XUJjLlhDEi0JtYSrGylvTZBCySJr4AJgR3jDr4YeB/c
         LpKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoKgRvVMEZ9V8m9RPCi4Sg2WzFh9EA3KZ9w3xsDevmtXVC0SZunh8QXodDRrpnYR4xNfE9vOviIUakiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJPvTe4S6r16FoZTMdL4JCOhCur5yaHgQag12A3yWqehoVf/Tfk
	8ss1TNTcIClBtt4BPPcOYtY9xv3ZWplhc31WHGgGkQkHaPHMgGWbi16nYRuoB7RDbHs=
X-Gm-Gg: AYBFou0lyc9YJ0D9cwD2LOhRVL0mUsoAo2VatNgo6B0OgY1Lt/MzMRSGtS+lK8iUDMU
	8YxHMH7K/DTUIs7iATFmrzJVGOXr/2ZwH5SaU5wYI5uMQnbqgLuNpSSxb4JvwfHyIZ75EhvAyCv
	EmdqyYeKNVOmXC/mYmGZiItVpJhn8V53ptQbzDh8TcQE1GJX5BdRG62vw+JSAKvB0cLQ6lt5XqM
	dsQ9VmVoLI65SJndbRxt7secIRtxRhreRPwy0tosdgBjiSSa1nKNP64mKtFOSH1O3KwEJ18EM4z
	L6AC7AAFfNqI8O8PscVFDy/u1S1OjPw6ByiUW3aX4dQCGmLNB6oy33TUTpywuWpW37B72mh04Il
	hGFwDjrR6sGCwhBPoqPrPTrf9qQQ1hpohhqarVsqm7US5L2YN0rP8k7vOjGxWSddlKqRztf2sqH
	z0qz5D2dMQ+bhMzNwPxuqwLTzZXsXXk9KXOfqz/53gdVesHLu/MO6zhnjCndkbJPISDiDpFu8H9
	DvjMg+NJO9dM4+B4xlWKRVMN4w/fl4wSpXbM4uC5e5+pNy33fuSHFowxtcJF9DxCoOh+/9A/uR3
	6kBEEaaQp0bDqN8/Q9Ik23bvzuHth4PiV9hHE1gi
X-Received: by 2002:a05:600c:4455:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4a965ec950amr104208525e9.6.1793266662424;
        Thu, 29 Oct 2026 02:37:42 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f4cdbsm59460365e9.7.2026.10.29.02.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:37:41 -0700 (PDT)
Message-ID: <f3a1ad00-5c74-4922-9c65-dd7a56c72582@linaro.org>
Date: Thu, 29 Oct 2026 09:37:40 +0000
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
Subject: Re: [PATCH 0/9] media: camss: add SM8750 support
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi.

Thanks for your series but, I'd like to proceed with Hanxiang's 
contribution.

If there are further fixes you'd like to submit on top of that enabling 
series, please feel free to do so.

---
bod
