Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CC747252C
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366175; cv=none; b=DVGZ1gVNvYwkW/xCbezPqqAfpdO4KKi8ScH2yM06FdktJj/KN5UUSenN6BfXY6Ylgs9R14NkAVEUxOSJCBDw9O50XXzjBtah8SdyrpWnC0pvO5w2ou0jTerTg2i4pnUVsg+8KUTWwDnPQfW/AoUp834MEoPr24nJEnhLkC58qkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366175; c=relaxed/simple;
	bh=9EEW6wqK3vCcJrJXLIu9tx1ZDsToy82i3iCtIcTe7G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCWJk+FG9nUr8KpwV+S99zvSFxjcTrK8oNbx93UDSpI5/7hgDEg9QqumMTqKhQwW+juCJASa51CHQE/sf1K1+ckONNTa00QoV5uIty286rHrf2QZZZ2oUxUYQODOI7GkzwJijtU8PpPazg5Q4OUzDFZotq4TnoSbPi5W/i+yr+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BmvpaU0g; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BmvpaU0g"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so26676055e9.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791366165; x=1791970965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VC0vk1qF745ETaUgqPassgkX/eGjXH4AoTAhMiX0mjo=;
        b=BmvpaU0gPmIGWd5lsVmCmjLm+j6BMOK7yD70PIAlidjE7ESVm4uH0MjOBJiK08Sdxm
         aWF4SJtwcs1Xf2E7HLee2Tch1zexExXvf+65wScAFYdTywHaRDAlgbk9Axf/DOgh2ljk
         HY87sH6jbqg0yjH/T82TrLwlg9hMgNQT7G2jA9+ZNFYVy5e2NJtG5s+NDsR3XDIZIDG1
         +pU0Q5Sb9cQPhIPbkFwoSJpR0meqGkPJdMXgtGOYQeFu1z2XTXsbIMv73cmWwHL1S3gd
         20p9uBdpv9yHh5TrJ3FFPYLo/GvLf977bvx3tdGIbOmyXKHcn3wCL87wdWtXDZR+zCo5
         wRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366165; x=1791970965;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VC0vk1qF745ETaUgqPassgkX/eGjXH4AoTAhMiX0mjo=;
        b=BHGlZWxECkPfJvu3EWjqXcq/AbBYDk2icJg85/WN9K2GZ7i70T7NgNKjp5FjkdGKPG
         wzKm1Te6Xic0tOKNbzaCg6wBY5nz4AyF5OWMoxOzVf3Ipr10SyrRybeBmKp6FD6bFK7I
         WE+EqwfDNgasygrykxsWDU8XFU/g8zg+UE3cadSuK2ivC/WGro0TbXoxIgKOcqpKEFES
         JLumtewz+pjjbjKV/8dLWUUpu+HGxSIF67twBg4Q18eNU4TB3YLQVd92D0yyioqnXrK5
         jGZ0BEc41DrFNyXspeqrGDMSR6ccNBU3eyjiF0I3uMGDcTTF32zIUHnMRUe1dG0inM72
         Rdkw==
X-Forwarded-Encrypted: i=1; AKwUvBwbH5PtMocx0S9YXX9IMx09dV4aiaafQshZ9Vq1Gu7e2w4ClAT5yataB8bUElzpPuxLUwhcP4fnbRloOg==@vger.kernel.org
X-Gm-Message-State: AFuF++kD6CQ0GRqAYWH3IUocZEUrLQwm1TX77NEhPDmisrHfdF+xk1rX
	SraPfS18hXz6OeZh1zIVr4z2dPkQtKQfHzfNHX7ATchKDExCIRc6I/9fv4Lo2IXLd3c=
X-Gm-Gg: AYBFou0pwBooVbGFgaeBJT/DWP2PFMfDaiFwysQdffo04K2bqdZx3HSfDZDGOVejqf4
	gJzm+CKiFPwzo+remLh1pXJNjp6RB29p05YfbFOm10QewRKJLLm+frOpGY30S5WJtBbO2WnfdpW
	Tkr7XBgtY9uVKXj9oVd+14Jy5LBm2QfthVhAWvqROPz+M4Un3Q/45AyqqAm16qoHC3cqVjSfncs
	kw9iJXex9nYWoxRXN4oDlPQ8/TJKHnXJUddo5ehN/hjBUatitSt0ng3SMxBOfe9WZ5342rbLh7O
	CDW8izFjQ4KIIt4zkXOsUCyms5aYcEmWwmP9UrYpfLgD3LPaO3SK6ksvVKblwX+yh5Bzhyh4ljj
	WfdfaQOOQDFdChTN7TEL5QdcKpO1jVqpgQdTmNB/F94VL2s2khGOLp4NUwMLO/VAvlpacb3dOQP
	lzcS8jcMVOnykReI1aymsZUfqPGrUbkAZK/15Zie8DCGGswrVAUxkMFY6EIz/2yzf+6op7J7A0x
	+8SiaJ/vQqu
X-Received: by 2002:a05:600c:4693:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4a180084640mr23893555e9.0.1791366164625;
        Wed, 07 Oct 2026 02:42:44 -0700 (PDT)
Received: from [192.168.9.72] ([185.249.114.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f48ab77sm60127955e9.1.2026.10.07.02.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:42:43 -0700 (PDT)
Message-ID: <c1cd9e24-b1a2-4c30-aa99-7c0cf6f19077@linaro.org>
Date: Wed, 7 Oct 2026 11:42:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/45] media: qcom: camss: add common IFE subdevice core
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
 pshrotri@qti.qualcomm.com, Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-18-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261006223953.3382273-18-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 00:39, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Add the common IFE subdevice core. It manages routed streams and
> formats. It also handles buffers, hardware pipelines, and media
> entities.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile    |    1 +
>   drivers/media/platform/qcom/camss/camss-ife.c | 1617 +++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |   46 +
>   3 files changed, 1664 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-ife.c
So, having a new IFE along side the existing IFE is not the right direction.

Please see my series on IFE for sm8650 Lanai - which rearchitects the 
driver to stop pretending write-master index and RDI are the right thing 
to be passing about - instead reformatting the existing code around 
lines and outputs - which is what the hardware spec itself discusses.

I'm very enthusiastic about the hardware enablement piece of this drop 
but having a whole new driver inside the existing driver is a workaround 
for the technical debt.

In fact the first and most basic thing to do is address the technical 
debt and _then_ add in hardware enablement.

I'll reup that series to V1 status - and lets look then about how to 
stack your hardware stuff for 480 on top, should be 1-4 patches extra at 
most.

---
bod
