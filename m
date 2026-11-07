Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060222;
	b=XMokWAkWHuVEdYutnz214EaF7m7VULbDzuLTUDfVUy3R3yQzcUdCn63nHksusdsrcBq4
	 vl4qozi9MkggKjRXGY43r9/8aC7naklO2N3zZm87Drii5TAUG+r5f0hQb40XVK63zfgYE
	 ED5gdKTvDI3nRoYXJyYPpF2mhpm95XH2GVUpF4FU9Np7REUKJtCdSNoFkKLVct57WXbrl
	 JuY6yM7e9uUomvfDBqlrYkmxr35qmLtpUp979G14ab/GNhnAy7dgkfrOpWftZBjozOW8E
	 NedHf8vDkyWX7URmeOej/8ZQGnth7/1Pc1UA7ry/36Es7BxUGQR0ryw65b2R4e5jRaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
	b=WHzOChttrSCY8hoDOOwMihPu75l2cOMfhx0IaMHyQlyxpCJui1LZ+egioYAHW9gqSDYd
	 mxJ1GvI83Wx5DxyfIX5StdH4rkOH8H6dQ8vQ/+uVnpmfDVGhYqrQfKHHlWPIWSYK1jz7i
	 bMI8ktZgnL0Ly9wc2mpNdDcXpwXFyFHGlIeoAAg/iIPtOlFF6QsRqRTQDacyvyXr0OokS
	 gKAEGQ2Uiw04cldfl9uT95n3Ms7OnmCXFUbDyA0OFSbO4ggqNrnC1RcoYhq/urkJFfh7i
	 CptXM2xfpJ0tnYPiB4ANcV8oApNuzI2Kj2VoYPrPGoojrwJ5U+hFE7Q+KTYsTOEquZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aP3Lr9ih;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11BE606A32F
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 14:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E11BE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aP3Lr9ih
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so14237795e9.1
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 06:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794060220; x=1794665020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
        b=aP3Lr9ihnVE3AAdM9kPgIOvbXrlJiwClq0X74LQv3Wyb/Z9cppqMs2SyBmMxald4yu
         C7kE8oF6MlLS8Rjc84Pwv5t5NU5WSCXq0krYgU0fcGlOjUC+5jVUjdNcpsbspEjjl9wW
         KaVnSY8HVH3kwuZmvaalyNY9bp6d4g01KFtA6dYmG0sJMS0yVIMMoHhHZvdMld0yGyAm
         3XeXSmAfDvym7JVJkOKRByr8hhBdEnA1vTCsa2TEf/dXLc817ZRkiyMQfWgLXfK1+BG0
         qYVUL/yCfx8SnnmCchwCAoJsqVz9UC9Hsf9I7YOUzO5RHkQuJOZlXW7ydqVg7bdAoSjG
         5gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060220; x=1794665020;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n4RQKom85jkQdizG8jERqXd4viPHC+189UpuJ/BwOhc=;
        b=MkGn7SV2eOwbh4HUhD7bMF5F0/3wwi+KpJp7gAVmVcW52TxTwV4NFdtOJWVADExSNu
         4zNJ2gL+gGv9V3rr0FM8JPyoAo6IrH5BwpYKde/ocEVrFcys97b9BpEgcINHwVdp0m10
         DBqc1+h+vIEz44DiBPFGIZXiNRfjchYvIjH9p3l3iC7QUYdvpqhjocRBjMpIBkhTnPqR
         2AONbI59T1CGwJel5/TONerVsg1Qi9LLKQsqpgR9eraB271VqDrsV8KKuY8r7puRUvAH
         8LQD4OcCyHiTSd8ePGohOpj32qaHqvKN4w0cQBrpwO0snkzSNYgwUSP+eeOCxZz1HOaF
         onkw==
X-Forwarded-Encrypted: i=1; AKwUvBwu1C/OybE+yNQsz7+Eb2Xkarbsf2oZxcHGUsMEUnbECjEW9ZzavSY8TikxKMc85BhdLamVRTK8mcWSxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9I92Iz3R3WiJ1EZIk0ux9e9HmWKo9SJOgz8H6EKNipCEogKqx7
	M3TS/MVr20Tpb66T9DlMT4OUm7lMDS6oR69+yJCj+XcCbG8YaOGc2uII9vgwR0vlZoI=
X-Gm-Gg: AYBFou2NhphooSo5/DBlIQnqLQ+ioH5A0vNzCKuzTyZqVD55DZ7WgJY+AIDMfrl5qt2
	SHBaEto8pNgMRooAVG/TuOHt7eu1C3/5yIZ+k6tvAVuAk8GInK/22boSG3UgSPetFOWmxCOj0z8
	X9buSSs971maNlQ3BgaPTVolHOSOj1vAqs/5RD5n0ip3hQBpkviyaN8BYRYU5lM7nhFi12O/JYR
	KogCAdPDiS9SLGWPj3lWNUZtU2qQ7KLS/1Uy+G37P52ekONY6KEXk8d8VLwjIWSDJ0I4/donoHW
	VuOQ1/lvwx3PeQrsSVuPog34dNg8+RwYZg5xhftYeopAzIDXIc3SS/MrtHBTrV0nFvz6sLtgyDW
	rTEO0on8ObVljGO4Na8C1xuODGm1UHUIteUeeclcXQfQQGVOcRpbQfwKaoGDOxtoTYniQx5aQRK
	WewTRxTyhQXi+EDBcmZisosTxwtcCVVHUvrZy+wuqAwveq+5+nEchQB1S14zHNNmQWzwH9NbV6L
	aGBoDdf4r/uZtbbr1a3Kpm6qB35g2vXS2qPemSWtPZNUZW8IrYvJ0wcgMLlRnu/r8MgnOsrQ4eU
	7KZBvT6T/mRrLe/gghOqRz3uS1MPUYRzl/h+CLMG3JFYXNxVvT8rVV09u3JpxA==
X-Received: by 2002:a05:600c:4e0e:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4b6e054920fmr98235845e9.35.1794060220092;
        Sat, 07 Nov 2026 06:03:40 -0800 (PST)
Received: from [192.168.0.167] ([109.77.86.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7a0e1f298sm49309125e9.4.2026.11.07.06.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 06:03:38 -0800 (PST)
Message-ID: <83c6281f-1887-4481-8c63-957b4bc856b9@linaro.org>
Date: Sat, 7 Nov 2026 14:03:36 +0000
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
Subject: Re: [PATCH v3 6/7] phy: qcom-mipi-csi2: Add SM8150 CSI2 DPHY support
To: Bryan O'Donoghue <bod@kernel.org>, mail@andrewgigena.dev,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <C4VI5PNThYmwD0VGOO9DvvHRRydBUz2k5DOLjkianYgYaz4G3-El6cDpnQh2siR4mMwjeiL4_Yp2xEAYeJDJ2Q==@protonmail.internalid>
 <20261106-sm8150-v7.4-rc1-camss-v3-6-0103e8a0bbcd@andrewgigena.dev>
 <88407f72-0c6e-4e46-b97b-7031c237dac7@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <88407f72-0c6e-4e46-b97b-7031c237dac7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/11/2026 22:29, Bryan O'Donoghue wrote:
>>
>> +    /*
>> +     * platform_probe() auto-attaches a single power domain during 
>> probe.
>> +     * Detach it first so devm_pm_domain_attach_list() can attach all
>> +     * domains by name (otherwise it returns -EEXIST for single-domain
>> +     * SoCs such as SM8150).
>> +     */
>> +    if (csi2phy->dev->pm_domain)
>> +        dev_pm_domain_detach(csi2phy->dev, false);
>> +
> 
> No, there's something in the CPHY series for this already. You'll either 
> have to absorb that patch or apply those changes to your tree and base 
> your stuff off of that, and orchestrate landing this series on top of 
> that series.

What you could do to unblock your series and not have a dependency on 
another series is cherry-pick the necessary patch.

https://patchwork.linuxtv.org/project/linux-media/patch/20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com/

If you do that you can drop the above change and resend your series with 
indicated changes.

---
bod
