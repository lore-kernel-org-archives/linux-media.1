Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672336;
	b=IWUVSbDaOMxs1TL0opH4++h23UsLb+RazgGcUrbgx2m2yoQO6R8Rpk9mgKZ2tkJQKvSx
	 gxF85/yyTbxDm1CFCXfRHuFYo8FpRcckbk5B0eLiPz2Y9xzwlGX5DjJGX/dJYApWztB04
	 o4woRfZsycAyDgmDU2YLXA4AWhVo7HjsVVpDe1ieO0GDxon5uoUfJ2i3ZEqDhUcqyLOMx
	 zUaWhO0AR11l6idbDBGreC7B1ebsBBmZBs4yaMA6bj48/2fgrAPVDaspjdroaRmktPZSh
	 TBgpX88FC+TeBNb8FBquqN/VrVRYbrnGDBunyvu47UDcjEfmU1Q4o7JtCq57l4IzX1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
	b=HXhUfMXxOzbFdLDYsOVIdDqF1T8xfY3nH+qv8pfDfDyLTeOMldg72clnZz1fZuguuXmV
	 WFIrn4L+RjJFEb2vdUr8NnX6cACb2Gs/nnuMEC1l+82DcJ/6xzIdoJUvqZ4UlzCYzKEkz
	 uYlBZuK1UFzle2VbNbaveFjWhReVYnOvT4ApKdsW1MH40CPCiR+w7sL47htts60dk3rUW
	 ByJ0nftl3hgAPA8O1BVSetpZTflQIqncGUMH6NdLjo0E7FLCsuNzxzYC8js6BsPLDYbPU
	 rNr08CB02d49yfoebdfClQuuxUZOyx3x6gtJCwEmZilDzaZoFYsOnOLTwjK9uUEOeMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vp6h4G7h;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0FC606A323
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD0FC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vp6h4G7h
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c00c727a21so542506e87.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 21:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672334; x=1796277134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
        b=Vp6h4G7hpleX+FTb7fdJNRAUYd9jz4lCrh33wMt0Ysn5Nb2Xo1Zb1+kzJAUVK7M5YB
         tzwbvxW6rKNBTKwTsrFX6mUrY9wdUCBJPrDzpBluNzFfe+x0SzxpDd7g2z+1OUc7Osxz
         uEIu5Xt+UxUDEqs5lNqsReLPF3kyI+cUNMjCtVEpEL3TvMV5sjx43V662aDloiIrM26H
         TxMW/fWmkaBqAlyrH0tDhiQQ6TXOAv0/7qWniaGnVMQPuWrv2jbIZ1+opl8j3/zzSJ7d
         R+f8ajGcN4IcmH5VH5PoeMz8OGFMF3xInqI+yNfUC/EWj2pL7DZx/tLkPlZXPn23Ic/6
         qjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672334; x=1796277134;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
        b=YsZ8Q7ZARpqCuAWIEWyD2F2voYfL4B9yPT1UoJ4IQVNE7G+mVMK+aobXEy1u5o9w4X
         lyAyA/ftVyBbEbGYA/i/uq7SbAiNTsierViYmKtNsR9NkK1tk8exnmxc5uDe9cl95Ukh
         lSvhluUFXQN/wJMtszD8WuX8xDjzAvqaUb3JdZk53RqhLak8CWAOedlIHAaAEK2NPmW3
         h5gPGeO0Bx8ccUbLO21GRMm/wqFt10R9NTF0HEOzIldehVFiAcL/VhS4k37VAyOd1E4E
         EX0yGbL4JE/8GykWijQ7a7bld+0dy7T+ZFo0NDDwuN3xhu51P1ZgULNR+VXuJOnNVmXU
         TVUQ==
X-Forwarded-Encrypted: i=1; AL+hErFS6vIbhNxFMaYJJ+vfhoI93d1nlv4QKHiykSqFHX+tJ/+HjhbkJzCaR9MZTOyt93zRs5A46mZKXzZ55g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jrjz3nuArUrWT01IK2na1LPo1mQJ9MQpXMCWq2rJ8yHpkoJDF
	/Cmm9KJVQoLUx8aq65fWHyXOfZJTEEFgA75Y0MV5iHq5edv+22yxSVW5ia/3JFxSEco=
X-Gm-Gg: AZFdTZdz+ip/yY0xpi3ib9hQSvsYIHH/GcDJIHbxDhwx368Ty9DXjLCjOJmNYxTxO1l
	d98BxOAKKWvG3H3o3uBpjVw1K+EQcnwqtckLLMpyR8iYU+WknEjA8jC6xEGXFYu/xagtXNtc/ZS
	HPL+qmD0H9hyto8pEZpXs6dF/mJSiSjB9BPWBlsAuOM51N8jHUh/vwALiJ5Ec+pq+TvF3QYFt9q
	tq0KxbMNqVsthdrqrufO1PWhf2s+Byy0e1+KOxRAwKvymovpplfc8LSUlAOKae5p3MzrKsdyQ7l
	wXywESeZG0yCx+mUrVQUEx5cWgdOLveqgXsatUQ53TYCAUK+kYTO5N+FUYwqdrRuxEkPnWiyY4l
	NMi/vVO8QGQgr+GLB1meqdNkK8TgVJuMbokCrG+jtAyDP48hG/nMDdwfVQgml8XcEA8RtfCtYMi
	D/MCBZXVSY4VnozlJCHAaoKcCOWenIgaf4CC2aHNrwrZh53fAp0/jngSJTaA+F3/OmgJ/o8E6SC
	HEM2Z5B62QBCJpmHtR/W5++YuEtRc2kI1whwhv+A0VxYEcrqYRZROF4lf9LcLY+mEfFwhQf5yVt
	qopPWfYPxoiBlp4Omu6TrLTwJVENlD/npD/a1ASWDv6yAqMbT55LwXkUpsPeBs2QPlbajPSqtoU
	C3lu3piQ=
X-Received: by 2002:a05:6512:12c7:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1bc6bf385mr6657518e87.2.1795672333627;
        Wed, 25 Nov 2026 21:52:13 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33a96sm5147700e87.11.2026.11.25.21.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:52:13 -0800 (PST)
Message-ID: <044783f4-29f2-4a73-8b2f-d06fe4a5ebbd@linaro.org>
Date: Thu, 26 Nov 2026 07:52:12 +0200
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, bod@kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
 <179561294019.462348.12092000419789488599.b4-reply@b4>
 <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 07:41, Nihal Kumar Gupta wrote:
> Hi Bryan, Vladimir,
> 
> On 25-11-2026 18:52, bod@kernel.org wrote:
>>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> @@ -16,7 +16,11 @@ description:
>>>   
>>>   properties:
>>>     compatible:
>>> -    const: qcom,x1e80100-csi2-phy
>>> +    oneOf:
>>> +      - const: qcom,x1e80100-csi2-phy
>>> +      - items:
>>> +          - const: qcom,glymur-csi2-phy
>>> +          - const: qcom,x1e80100-csi2-phy
>>>   
>>>     reg:
>>>       maxItems: 1
>>>
>>> -- 
>>> 2.34.1
>>>
>>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> This series is already present in the mainline tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml

Likely I've picked up an old series for my review.

> I am not sure why it appeared in your review queue again.
> Can you please review the follow-up changes instead?
> 
> https://lore.kernel.org/all/20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com/

Sure, will do.

-- 
Best wishes,
Vladimir
