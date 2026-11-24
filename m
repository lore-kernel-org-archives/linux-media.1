Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532889;
	b=5auszfXyl1kRYeQLTML+G26mqNTO4FjwEQYMbvLS6Be39AWuLUGSw34cLzx5TwYHdCXn
	 4s+Egcqdl+tDEyiOd7OFHYLUe1lbvrmjQX0mWYwyyot5tOvBeUMciDduZgoupVC6g+YmV
	 G44pw+ZcMYLotIT8Y+7SNS7gLruIB1oIj9pkAHNE6n6x3wNE8ckSLKz9LktNEmognu/tp
	 8WpeUJ/Klk6IfdrHbgqqTM38UWatoOhs1uCfUMw6Szp+4Z/Emz5RqjDk3XhBI7Y3HTfJY
	 nk1MGup9B9lN/IdnnyzOHAQMreGjJDdmEU0VLpdX8u2a8UrCy8Vx/o4OPlaI2G25qAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dS/zEZFm3CMfKIKMDJSYDk1UoNYMbw50K9+WVASna88=;
	b=jknoGG7WcfQ/BIuhRxFenyMc2RC7whPOKZoDcAR4YHHxEh8F7GbzcZHsAXtbrw72OTvo
	 3MDfwRKTCVN5e4FcJ9F2Pm9hUgY+FSqzyLvjHvu6duBb0Vsjbhk9Jrz+xTCSy0LzosheK
	 D4EqlRAbC7ZdEwehr1lghslMU64hk7NFRtvr90YUaoJdZHQ/ULSIiefpbiH2px5UBEF2j
	 +AkiGTza+FdfulOorFxsTQ789F/VuskQvHdDQc04UcgO0DrINmBvnjv/8JMrK7ZYj76IR
	 UOuGnMyyZjv2H31WyzBQxawnC9l4RxFbmsFV8g8oCt8iroaLF3d0gX0DtiOgou8UfcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=huF2aXSt;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B608F606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 15:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B608F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=huF2aXSt
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c0ace36e8eso413391e87.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 07:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795532887; x=1796137687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dS/zEZFm3CMfKIKMDJSYDk1UoNYMbw50K9+WVASna88=;
        b=huF2aXStSJ3iFxCXkTKtIQdWRau9f3KhaHfnoWm4LkxmLu66ckgjoilV4M4Lc2sg/J
         7QEuaTuHprhXTIgZDJSpnbhXdV2MrKITuGdzJC33e8RCX3gVQXSGcsJ49Wc6Qi9y52ry
         EhdFJmEc5Nndcg0ajGWZQFBvSe5ZpVTnb20fIThl7g2NTFytiJ2lvBAHILrIYk0CfNsD
         EsMDhlz3clKlw4YsvjB6m/rWYTvp+KFGcbov/w8BfduICgSy8Njc2EUhItghetpN/fcp
         4C3MmiQO+2QWSXHPKsOctRpKDSM34GUkfKHgSXcCEcIMM/gOAAjHDobcPyUHpFEBp/oq
         h/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532887; x=1796137687;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dS/zEZFm3CMfKIKMDJSYDk1UoNYMbw50K9+WVASna88=;
        b=TKFAqOdbNoQTZ6Jz1jBgVe3C9HxhHo00iQFQgIXK334vZ1N7FONF22bfWvkM9NKWtU
         XA07nhEWO4qlSQL66O9Gb7FqjmIvFaPDp7dzqudCwPY9ktnhcarTjKJXd8Ve6BRrOKAm
         eYS0LK0C33yoFrs7B/9cGmd7cIFkv8PVEffEnG5q2xwlOyhYgvWjEeNleATmsQ78yam6
         ZpztFvAidlbWph0oVdZuhfnhEYCqQYBnxU45dAYStm9lnxTz849k6WrYkHzPzWkB66I9
         UcmYofM7XH8fONCQZbIFWC7ScjoBkp7IpKK7DAnea3E4DCkGgQf/XN0LBqAwOVDDMT3N
         Bmdw==
X-Gm-Message-State: APuU4Z/ZljxYIzbw0zmdeoxvDWx4fLH96r486VINxKEYe0tvBNec+zdl
	m/52nHWefVc2BSEQzwbpFgsQQ3+3QKQLwRvwiHjqhVuH6pHzPxNqhTv0+CI7ll8VRxA=
X-Gm-Gg: AZFdTZfWyHncNwAA3z7P6B+0tmb507qm9YmhGaFa3NwpZ2aX1iKaRMKB9M+PTLW0dV/
	nkZs3UPef2Wp4qhCEMz/uf0WKANzqeBTWApdk0ejDfwRrv1B4Ikhtl4dE8jHj90N2D6FukyaBV6
	2HF4n9MHm2A6duOSmp+tzgbt4RindSQ6s8kOrcuryVk4zlFx0bfo59qLRWznyr+aKAAFqkg+RvD
	Q8MgVsVmb8QSVY7zFWtyNQXEcFUceWF72Zp0tnwxxoSqK0T4d7lremmpDtE3qc3MxZJrjMd0bNW
	FJ3uXShTcb1yNa1/uCzJSb/icezwHtZwg1xU65Dm0BGB4dGiFdgAW2fkaAp8lCt3VoAtZcRHiM2
	R7PFyogYWFwD4LrOzT554IzKFXXRlUSASRApuamP69b4GmdBb0YuHxRveORyRXk7ay60UXdEQqx
	an9qDS+yqFKiyVOraFzaqV9+D8xU+hGQt2YDnrsROD3JYIYttJxk7kykjbqhQ/qw4CbY6gstFKh
	dxSFftbOpYO0hlvbmVsPaDbbXtw1D7JXTCg1X/HDcf45DQa1LmrjZQXMceAlakwc5XKnOOk4Kit
	cqV7GiipfkFD18HUXbGSC25xjVf8So598HsFLq5r0XWK7I0bPXk4MOzhooAmi/LAStD5rf4sHkk
	Fii2k7xZGwvwN4SzdngvHGrKC37sY
X-Received: by 2002:ac2:4c4d:0:b0:5c1:5703:46ed with SMTP id 2adb3069b0e04-5c308ed81f9mr3280060e87.6.1795532886937;
        Tue, 24 Nov 2026 07:08:06 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff6e32sm3854033e87.17.2026.11.24.07.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:08:06 -0800 (PST)
Message-ID: <725d024b-ac3b-404e-80e1-5e3d6f43ac65@linaro.org>
Date: Tue, 24 Nov 2026 17:08:03 +0200
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
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe: Eliminate ever expanding
 src_pad_code switch logic
To: bryan.odonoghue@linaro.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/26 04:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Every time we add a SoC the src_pad_code switch statement is expanded. This
> expansion has continued to the point where there are more SoCs listed for
> what used to be the exceptional state, than the reverse.
> 
> Invert the logic. The exception to the rule is the old SoC set there's no
> purpose in expanding this switch continuously.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
