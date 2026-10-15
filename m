Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9B6525A94
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073227; cv=none; b=m4v2Sjth4PFdZypoGu1vvUEE/IlQtfxVpRTh6KQHxHJTstcakriMkJUK9QsiqW0h5T9Gzupu2RHsJKXpHaV8eN56HJrTjrwBPf9vLskh9ETlzR3hLkGbEVnuVEiqiN/Qh6RWnZ0+R6fhCbMwsp6AGRFBWkAfLmgn1jZStqHGoII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073227; c=relaxed/simple;
	bh=G0H4oMfrqAtcIYgnag5JUtjm5ndYR/YiS93lKI2Ksy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCgpeLmyza6LEL0K6LxKxWO6mZsD24Tr91G6NQlhzULThwXwvv0avfUaSxXwN1MARR50Gt9zk0ATG+UX01DhB12TkgtYwqB2ElhDvlNUUA2Bfb0sCQzmvwmmszGolad/TGolfBPwviPXYaGcg0RcjcMgC/zDuYbW8GX84Z5Z0pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iPIwVGoQ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iPIwVGoQ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c31745ad205so598666b.0
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792073224; x=1792678024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x66qBww20CHtwfM8AwYvYnWu/nKW/hm6sMO9/8Mj+38=;
        b=iPIwVGoQnTm6kvV+jEuug+DpZKcEBRCmTiQnPweSYeAZnyhcpdHebmJUi+FK4913yk
         WxT15EP8paqBOK1xd/5CXcNfFppaCjEWcjc1GiNS5WKOzm/jtM2dmbK9hZhS2/PoP4X+
         BJ1ZyRtXBgLku/oWTfjvqOD6R62e9X2BcXRgJhTgF1NnDDZh1BlD2zMCNnzD5VcwAGfb
         9XlDnkFTB+f/GQRBktoezLuv/zO3xqR6z2RlyO4LH+ZsVcLMqzZK+nTm0D5KhRdigBhK
         doR3WiW0dw0mtwzfPAinBY/XBKPTwRQ3HxgTmhhk4cS9aufeVpk/f5NieK8FtbicNAz+
         gEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073224; x=1792678024;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x66qBww20CHtwfM8AwYvYnWu/nKW/hm6sMO9/8Mj+38=;
        b=QKmPwUW5jjZwR5XmHGGbx8sS9TCWaAV/qKbRXlFD3WYmzX0D5F8dP9KqbURmkKKJCM
         3heSX+LeJ1nWsl/qCVnGnQoF7agJfeeA5HFrbkE/A6SRYlCqJ8KNdj+hj9z5x33m0Qes
         CDa8cJB6cuZMeQ6QwANB6pJ3GEy/VVqnfXImNrW8c23ux4X3DmVoW27DLpYvoR181ZAj
         56QZHOT8oSQtnS5ks07KSQY/x65mLf7LyDO7UrmhrwplIAVV5RoLu8Al30+PuMyEHibv
         X47b8an392cDP1OXe9LtkiNmpXAzartZJv4TNCt2zrDmlHKGiKfjqyLRRHcCzJdC2deW
         m8jA==
X-Gm-Message-State: AFq9FYIOQRnnbM+jFKpwt/SBGaLESFB4Bar3XF6Nr67cWVXLi2PzY+Kk
	f8v2kqnYMCvAUTniaeYAGHhnEfe9zd8gE4GNgMQhFv2HQcPOPFQKfZEarI4srdpG/hk=
X-Gm-Gg: AYBFou0AQ6z9cQKY5uMXFinQCuO/PvQ86YG+6bN7Sixti4ePr50i2flJJWWLghG3/L8
	kxMBnOcC/QGCzY93PbQzzZ2eQAhRoLN4q5G3HKR1Dqnjvdr5Cwq6ArxshUbFL8iLCBv9dxQKRzL
	rdyJ0LNV/0yL93JPR2nQfK8rWkfokBB1Q0gNmXME8X4kkkTzzrY0aExKKk5OGrkPwGH4/tyfO05
	sepuAEKF2tTXKQ/nncjzIxzQLorEMGFvgbD5LuTE/qOFtH4++dmFWgYh8P4f4ENRMjlUuP9D13/
	mvyNADu3LSWvkqJOgyxMQZySL2dtMqaa1L4tmhCP1ZbffW3xKT8JZZqTTcS8S6rAa//zMSJb0Bf
	emdGW1Y6Ta6GSt9E51nD7hNqorbfctF5VKiTYk9WFHdr8SHVQUquCePHYDkyNHH+1AbrRr3HlW+
	knTYem0w1NH05o4lrnxHUEXJ/ax4Hsh9plIQDxBbSakDvyTLffQLwqWbsZ1tQxm5Beg5hw+E7Wn
	Ahs3NYMJA==
X-Received: by 2002:a17:907:9495:b0:c25:f7db:4be9 with SMTP id a640c23a62f3a-c40201117d7mr13564866b.15.1792073223392;
        Thu, 15 Oct 2026 07:07:03 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.7.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6bea942sm129303566b.11.2026.10.15.07.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:07:02 -0700 (PDT)
Message-ID: <1e1c3706-adff-4049-a14d-28bbeb3a6a01@linaro.org>
Date: Thu, 15 Oct 2026 15:07:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] media: qcom: camss: Add support for X1P42100 CAMSS
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
 <20261009-purwa_camss-v5-3-58c13dc7c4d2@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261009-purwa_camss-v5-3-58c13dc7c4d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2026 09:11, Wenmeng Liu wrote:
> Add CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.
> 
> The X1P42100 CAMSS is a cut-down variant of the X1E80100 (Hamoa)
> CAMSS. Compared to X1E80100 it has:
> - 2 x CSIPHY (CSIPHY0 and CSIPHY4) instead of 4
> - 1 x IFE instead of 2
> - only the ahb and hf_mnoc interconnect paths
> 
> The CSID, CSID Lite, IFE Lite and TPG blocks are the same as on
> X1E80100, so reuse the existing CSID/VFE 680 ops and the X1E80100
> TPG and CSID wrapper resources.
> 
> The CSIPHYs are handled through the PHY API, so no CSIPHY
> resources other than the lane format are needed.
> 
> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
